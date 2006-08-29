;;; 
;;; Copyright (c) 2001 Timothy Moore
;;; All rights reserved.
;;;
;;; Modified 2004-2006 by Christian Lynbech.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;; 1. Redistributions of source code must retain the above copyright
;;;    notice, this list of conditions and the following disclaimer.
;;; 2. Redistributions in binary form must reproduce the above copyright
;;;    notice, this list of conditions and the following disclaimer in the
;;;    documentation and/or other materials provided with the distribution.
;;; 3. The name of the author may not be used to endorse or promote products
;;;    derived from this software without specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
;;; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
;;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
;;; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;;; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
;;; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;;; SUCH DAMAGE.

(in-package :uffi-alien)

(defvar *cpp-args-defaults* '("-D__restrict="
			      "-D__extension__="
			      "-D__attribute__(x)="
			      "-D__const=")
  "Default arguments given to 'cpp' when preprocessing the supplied file.
Can be used both to define specific features that are relevant to the file
being processed and to get rid of stuff that CPARSE does not know how
to handle such as GCC extensions like __restrict.

Implementation note: 'long long' is not supported by UFFI, so we use backend
specific translations when they are known.
One particular troublesome Linux header file is \"pthreadtypes\" which may
be turned off by adding \"-D_BITS_PTHREADTYPES_H\" to the cpp argument list.")

(defmacro with-temp-file ((file-name
			   &optional
			   #+ALLEGRO (extension "")
			   #+CMU (base "/tmp/tmp~D~C"))
			  &body body)
  "Creates a temporary file and binds the name to FILE-NAME.  
EXTENSION is appended to the generated name."
   `(let ((,file-name
	  #+ALLEGRO (concatenate 'string (sys:make-temp-file-name) ,extension)
	  #+CMU (system::pick-temporary-file-name ,base)))
     (unwind-protect
	  (progn
	    ,@body)
       (delete-file ,file-name))))

(eval-when (compile load eval)
  (defun c-name-to-lisp-name (str)
    (let ((lisp-name #+ALLEGRO str #+CMU (string-upcase str)))
      (nsubstitute #\- #\_ lisp-name)))

  (defgeneric intern-as-lisp (csym &optional package))

  (defmethod intern-as-lisp ((csym symbol) &optional (package *package*))
    (intern (c-name-to-lisp-name (symbol-name csym)) package))

  (defmethod intern-as-lisp ((csym string) &optional (package *package*))
    (intern (c-name-to-lisp-name csym) package)))

(define-condition alien-not-implemented (cparse-error)
  (format-string &rest format-args))

(defvar *struct-tags*)

(defun make-alien-defs (files
			&key
			file package compile load
			cpp-args extra-cpp-lines no-cpp-defaults)
  "Returns a form that declares, via def-foreign-type, def-foreign-call
and def-foreign-variable the types, functions and variables found in
FILES.

:FILE is a file name in which to save the generated definitions. If not
defined, the defintions are returned wrapped in a PROGN.

:PACKAGE is the package in which the definitions should be made
in. This option is only active if :FILE is non-nil.

:COMPILE, if non-nil, says to compile the generated FILE. This option
is only active if :FILE is non-nil.

:LOAD, if non-nil, says to load the generated file. The extension is
stripped such if FILE is compiled, the compiled version is
loaded. This option is only active if :FILE is non-nil.

:CPP-ARGS is a list of command-line arguments for the C
preprocessor (for example, '\(\"-I/usr/X11R6/include\"\)\).

:CPP-ARGS is a list of arguments to be given as arguments to the
CPP call.  Also added as arguments are those of *cpp-args-defaults*
unless :NO-CPP-DEFAULTS is non-nil.

:EXTRA-CPP-LINES are added to the file passed to the C preprocessor
and can be used for extra macro definitions, #includes, etc."
  (with-temp-file (cpp-file #+CMU "/tmp/tmp~D~C.c" #+ALLEGRO ".c")
    (let ((cpp-file-stream (open cpp-file
				 :direction :output
				 :if-does-not-exist :create
				 :if-exists :overwrite))
	  (default-dir (namestring #+ALLEGRO (excl:current-directory)
				   #+CMU (ext:default-directory)))
	  (files (if (listp files)
		     files
		     (list files))))
      (dolist (line extra-cpp-lines)
	(write-line line cpp-file-stream))
      (dolist (file files)
	(format cpp-file-stream
		"#include \"~A\"~%"
		(if (eql (cl:schar file 0) #\/)
		    file
		    (concatenate 'string default-dir file))))
      (close cpp-file-stream))
    (with-open-stream
	(cpp-stream #+ALLEGRO
		    (excl:run-shell-command 
		     (format nil "gcc ~{~A ~}~{~A ~} -E ~A"
			     (and (not no-cpp-defaults) *cpp-args-defaults*)
			     cpp-args
			     cpp-file)
		     :output :stream :input nil :wait nil)
		    #+CMU
		    (ext:process-output
		     (ext:run-program "gcc"
				      (append
				       (and (not no-cpp-defaults)
					    *cpp-args-defaults*)
				       cpp-args
				       (list "-E" cpp-file))
				      :output :stream
				      :input t :wait nil)))
      (let ((defs nil)
	    (*struct-tags* (make-hash-table)))
	(flet ((stmt-fun (decls scope stream)
		 (declare (ignore scope stream))
		 (handler-case (setf defs (nconc (do-decls decls) defs))
		   (alien-not-implemented (condition)
		     (format *error-output* "~A~%Ignoring and moving on.~%"
			     condition)))))
	  (cparse-stream cpp-stream :stmt-fun #'stmt-fun)
	  (if file
	      (progn
		(with-open-file (f file
				 :direction :output
				 :if-exists :supersede
				 :if-does-not-exist :create)
		  (when package
		    (print `(in-package ,package) f))
		  (mapc #'(lambda (d) (print d f)) (nreverse defs)))
		(when compile
		  (compile-file file))
		(when load
		  (let ((x (parse-namestring file)))
		    (setf (slot-value x 'type) nil)
		    (load x)))
		t)
	      `(progn ,@(nreverse defs))))))))

(defun do-decls (decls)
  (loop
   for (type-decl name) in decls
   collect (do-decl type-decl name)))

(defgeneric do-decl (type-decl name))

(defmethod do-decl ((type-decl t) name)
  (declare (ignore name))
  (error 'alien-not-implemented
	 :format-string "uffi-alien can't handle declaration ~S yet (if ever)"
	 :format-arguments (list type-decl)))

(defmethod do-decl ((type-decl typedef-type) name)
  (let ((def-type (do-type-declarator (defined-type type-decl))))
    (unless (eq def-type :void)
      `(uffi:def-foreign-type ,(intern-as-lisp name) ,def-type))))

(defgeneric do-type-declarator (type-decl))

(defmethod do-type-declarator ((type-decl t))
  (error 'alien-not-implemented
	 :format-string "uffi-alien can't handle type declaration ~S yet (if ever)"
	 :format-arguments (list type-decl)))

(defmethod do-type-declarator ((type-decl enum-type))
  (let ((key-package (find-package "KEYWORD"))
	(tag (intern-as-lisp (tag type-decl))))
    (loop
     for (id . val) in (enumerators type-decl)
     collect (list (intern-as-lisp id key-package)
		   val)
     into enums
     finally (return `(uffi:def-enum ,(or tag 'enum) ,enums)))))

(macrolet ((frob-prim-type
	       (cparse-type
		&optional (c-call-type (intern-as-lisp
					(symbol-name cparse-type)
					(find-package :keyword))))
	     `(defmethod do-type-declarator ((type-decl ,cparse-type))
		',c-call-type)))
  (frob-prim-type char)
  (frob-prim-type unsigned-char)
  (frob-prim-type signed-char :char)
  (frob-prim-type byte)
  ;(frob-prim-type unsigned-byte)
  (frob-prim-type short)
  (frob-prim-type unsigned-short)
  (frob-prim-type int)
  (frob-prim-type unsigned-int)
  (frob-prim-type long)
  (frob-prim-type unsigned-long)
  (frob-prim-type long-long)
  (frob-prim-type unsigned-long-long)
  (frob-prim-type float)
  (frob-prim-type double)
  (frob-prim-type cfloat :float)
  ;(frob-prim-type cstring)
  (frob-prim-type void)
  ;(frob-prim-type void-pointer)
  )

(defun do-func-args-result (func-decl)
  (values (loop for (type arg) in (args func-decl)
		collect (list (intern-as-lisp arg)
			      (do-type-declarator type)))
	  (do-type-declarator (return-type func-decl))))

(defmethod do-decl ((type-decl func-type) name)
  (let ((lisp-name (intern-as-lisp name)))
    (multiple-value-bind (fun-args result)
	(do-func-args-result type-decl)
      `(progn
	 (declaim (inline ,lisp-name))
	 (uffi:def-function ,(string name) ,fun-args
	   :returning ,result)))))

;;; func-type when seen in typedefs, pointers and stuff
(defmethod do-type-declarator ((type-decl func-type))
  (multiple-value-bind (fun-args result)
      (do-func-args-result type-decl)
    `(function ,result ,@fun-args)))


(defmethod do-type-declarator ((type-decl pointer-type))
  (let ((to-type (do-type-declarator (to type-decl))))
    (if (eq to-type :void)
	:pointer-void
	`(* ,to-type))))

(defmethod do-decl ((type-decl compound-type) name)
  (unless name
    `(uffi:def-foreign-type nil ,(do-type-declarator type-decl))))

(defgeneric compound-kind (type-decl))
(defmethod compound-kind ((type-decl struct-type))
  :struct)
(defmethod compound-kind ((type-decl union-type))
  :union)

(defmethod do-type-declarator ((type-decl compound-type))
  (let ((tag (intern-as-lisp (tag type-decl)))
	(kind (compound-kind type-decl)))
    (setf (gethash tag *struct-tags*) t)
    (loop for mem in (and (slot-boundp type-decl 'members)
			  (members type-decl))
	collect (list (intern-as-lisp (cadr mem))
		      (do-type-declarator (car mem)))
	into struct-members
	finally (return `(,kind ,tag ,@struct-members)))))

(defmethod do-decl ((type-decl enum-type) name)
  (when name
    (warn "enum-type name ~S is not nil" name))
  (do-type-declarator type-decl))

;;; Anything other than a function declaration, structure or union or
;;; enum, or typedef is a variable declaration.

;;Need to find out what the module argument should be, at least on lispworks
(defmethod do-decl ((type-decl c-type) name)
  `(uffi:def-foreign-var ,(string name) ,(do-type-declarator type-decl) "no_such_module_like_this"))

(defmethod do-type-declarator ((type-decl array-type))
  (let ((l (or (len type-decl) (make-instance 'cparse::int-const :value 0))))
    `(:array ,(do-type-declarator (of type-decl)) ,(value l))))

;;; simplified struct lookup

(defmacro alien-decode (obj type slot1 &rest slotn)
  `(uffi_fslot-value-typed ',type :lisp ,obj ',slot1 ,@slotn))

(defstruct (alien) type buffer)

(defmacro create-alien (type buf &optional (start 0) end)
  `(make-alien :type ',type :buffer (subseq (copy-seq ,buf) ,start ,end)))

(defmacro alien-get (obj slot)
  `(uffi_fslot-value-typed (alien-type ,obj) :lisp (alien-buffer ,obj) 
    ',slot))

(defmacro alien-ref (obj slot index1 &rest indexn)
  `(uffi_fslot-value-typed (alien-type ,obj) :lisp (alien-buffer ,obj) 
    ',slot ,index1 ,@indexn))

