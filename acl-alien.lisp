;;; 
;;; Copyright (c) 2001 Timothy Moore
;;; All rights reserved.
;;;
;;; Modified 2003 by Christian Lynbech.
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

(defpackage :acl-alien
  (:use :common-lisp :ff "CPARSE")
  (:shadowing-import-from "CPARSE" :char)
  (:export :make-alien-defs :*enum-table*
	   :create-alien :alien-get :alien-ref :alien-decode :alien :alienp))

(in-package :acl-alien)

(defmacro with-temp-file ((file-name &optional (extension ""))
			  &body body)
  "Creates a temporary file and binds the name to FILE-NAME.  
EXTENSION is appended to the generated name."
  `(let ((,file-name (concatenate 'string 
		       (sys:make-temp-file-name) ,extension)))
     (unwind-protect
	  (progn
	    ,@body)
       (delete-file ,file-name))))

(eval-when (compile load eval)
(defun c-name-to-lisp-name (str)
  (let ((lisp-name str))
    (nsubstitute #\- #\_ lisp-name)))

(defgeneric intern-as-lisp (csym &optional package))

(defmethod intern-as-lisp ((csym symbol) &optional (package *package*))
  (intern (c-name-to-lisp-name (symbol-name csym)) package))

(defmethod intern-as-lisp ((csym string) &optional (package *package*))
  (intern (c-name-to-lisp-name csym) package))
)

(define-condition alien-not-implemented (cparse-error) ())

(defvar *enum-table* (make-hash-table :test #'eq))
(defvar *struct-tags*)

(defun make-alien-defs (files &key cpp-args extra-cpp-lines)
  "Returns a form that declares, via def-foreign-type, def-foreign-call
and def-foreign-variable the types, functions and variables found in
FILES.

:CPP-ARGS is a list of command-line arguments for the C
preprocessor (for example, '(\"-I/usr/X11R6/include\").

:EXTRA-CPP-LINES are added to the file passed to the C preprocessor
and can be used for extra macro definitions, #includes, etc."
  (with-temp-file (cpp-file ".c")
    (let ((cpp-file-stream (open cpp-file
				 :direction :output
				 :if-does-not-exist :create
				 :if-exists :overwrite))
	  (default-dir (namestring (excl:current-directory)))
	  (files (if (listp files)
		     files
		     (list files))))
      (dolist (line extra-cpp-lines)
	(write-line line cpp-file-stream))
      (dolist (file files)
	(format cpp-file-stream
		"#include \"~A\"~%"
		(if (eql (cl:char file 0) #\/)
		    file
		    (concatenate 'string default-dir file))))
      (close cpp-file-stream))
    (with-open-stream
	(cpp-stream (excl:run-shell-command 
		     (format nil "gcc ~{~A ~} -E ~A" cpp-args cpp-file)
		     :output :stream :input nil :wait nil))
      (let ((defs nil)
	    (enums nil)
	    (*struct-tags* (make-hash-table)))
	(flet ((stmt-fun (decls scope stream)
		 (declare (ignore scope stream))
		 (handler-case (setf defs (nconc (do-decls decls) defs))
		   (alien-not-implemented (condition)
		     (format *error-output* "~A~%Ignoring and moving on.~%"
			     condition)))))
	  (cparse-stream cpp-stream :stmt-fun #'stmt-fun)
	  (maphash #'(lambda (k v) 
		       (push (list 'defvar k v "alien enum") enums)) 
		   *enum-table*)
	  `(progn ,@(nreverse enums)
		  ,@(nreverse defs)))))))

(defun record-enum (name value)
  (when (and (gethash name *enum-table*)
	     (not (eql (gethash name *enum-table*) value)))
    (format t "Warning: overriding enum value for `~A' (~A -> ~A)~%"
	    name (gethash name *enum-table*) value))
  (setf (gethash name *enum-table*) value))

(defun do-decls (decls)
  (loop
   for (type-decl name) in decls
   collect (do-decl type-decl name)))

(defgeneric do-decl (type-decl name))

(defmethod do-decl ((type-decl t) name)
  (declare (ignore name))
  (error 'alien-not-implemented
	 :format-string "acl-alien can't handle ~S yet (if ever)"
	 :format-arguments (list type-decl)))

(defmethod do-decl ((type-decl typedef-type) name)
  (let ((def-type (do-type-declarator (defined-type type-decl))))
    (unless (eq def-type :void)
      `(def-foreign-type ,(intern-as-lisp name) ,def-type))))

(defgeneric do-type-declarator (type-decl))

(defmethod do-type-declarator ((type-decl t))
  (error 'alien-not-implemented
	 :format-string "acl-alien can't handle ~S yet (if ever)"
	 :format-arguments (list type-decl)))

(defmethod do-type-declarator ((type-decl enum-type))
  (let ((tag (intern-as-lisp (tag type-decl))))
    (declare (ignore tag))
    (dolist (decl (enumerators type-decl))
      (record-enum (intern-as-lisp (car decl)) (cdr decl)))
    (values :unsigned-int)))

(macrolet ((frob-prim-type
	       (cparse-type
		&optional (c-call-type (intern-as-lisp
					(symbol-name cparse-type)
					(find-package :keyword))))
	     `(defmethod do-type-declarator ((type-decl ,cparse-type))
		',c-call-type)))
  (frob-prim-type void)
  (frob-prim-type char)
  (frob-prim-type unsigned-char)
  (frob-prim-type signed-char :char)
  (frob-prim-type short)
  (frob-prim-type unsigned-short)
  (frob-prim-type int)
  (frob-prim-type unsigned-int)
  (frob-prim-type long)
  (frob-prim-type unsigned-long)
  (frob-prim-type cfloat :float)
  (frob-prim-type double))

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
	 (def-foreign-call ,lisp-name
	     ,result
	   ,@fun-args)))))

;;; func-type when seen in typedefs, pointers and stuff
(defmethod do-type-declarator ((type-decl func-type))
  (multiple-value-bind (fun-args result)
      (do-func-args-result type-decl)
    `(function ,result ,@fun-args)))


(defmethod do-type-declarator ((type-decl pointer-type))
  (let ((to-type (do-type-declarator (to type-decl))))
    (if (eq to-type :void)
	'(* t)
	`(* ,to-type))))

(defmethod do-decl ((type-decl compound-type) name)
  (unless name
    `(def-foreign-type nil ,(do-type-declarator type-decl))))

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
	finally (return `(,kind ,@struct-members)))))

;;; Anything other than a function declaration, structure or union or
;;; enum, or typedef is a variable declaration.

(defmethod do-decl ((type-decl c-type) name)
  `(def-foreign-variable ,(intern-as-lisp name) ,(do-type-declarator type-decl)))

(defmethod do-type-declarator ((type-decl array-type))
  `(:array ,(do-type-declarator (of type-decl)) ,(value (len type-decl))))

;;; simplified struct lookup

(defmacro alien-decode (obj type slot1 &rest slotn)
  `(ff:fslot-value-typed ',type :lisp ,obj ',slot1 ,@slotn))

(defstruct (alien) type buffer)

(defmacro create-alien (type buf &optional (start 0) end)
  `(make-alien :type ',type :buffer (subseq (copy-seq ,buf) ,start ,end)))

(defmacro alien-get (obj slot)
  `(ff:fslot-value-typed (alien-type ,obj) :lisp (alien-buffer ,obj) 
    ',slot))

(defmacro alien-ref (obj slot index1 &rest indexn)
  `(ff:fslot-value-typed (alien-type ,obj) :lisp (alien-buffer ,obj) 
    ',slot ,index1 ,@indexn))

