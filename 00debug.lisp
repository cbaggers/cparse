;;;; debug.lisp --- various forms usefull when doing debugging.

(defparameter *uffi* (nth 2 '(dist |1.5.5| |1.5.15| cl-home)))

(case *uffi*
  (cl-home (load "../../cl-home/cl-uffi/uffi.asd")
	   (asdf:operate 'asdf:load-op :uffi))
  (|1.4.29| (load "../cl-uffi-1.4.29/uffi.asd")
	    (asdf:operate 'asdf:load-op :uffi))
  (|1.4.30| (load "../cl-uffi-1.4.30/uffi.asd")
	    (asdf:operate 'asdf:load-op :uffi))
  (|1.5.5| (load "../cl-uffi-1.5.5/uffi.asd")
	    (asdf:operate 'asdf:load-op :uffi))
  (|1.5.15| (load "../cl-uffi-1.5.15/uffi.asd")
	    (asdf:operate 'asdf:load-op :uffi))
  (dist (clc:clc-require :uffi)))

;(load "/usr/share/common-lisp/source/defsystem/defsystem.lisp")

(load "cparse.system")

#+nil
(mk:clean-system :cparse)

#+nil
(progn
  (mk:compile-system :cparse) (mk:load-system :cparse))

(asdf:operate 'asdf:load-op :cparse)

(defun dotest (&rest files)
  (flet ((test-1 (file)
	   (let ((ffi (uffi-alien:make-alien-defs file)))
	     (mapc (lambda (form)
		     (typecase form
		       (symbol)
		       (list (format t "=== Form: ~S~%" form)
			     (format t "--> Eval: ~S~%" (eval form)))))
		   ffi))))
    (mapc #'test-1 files)))

#|

(setq cparse::*cparse-debug* nil)
(setq cparse::*cparse-debug* t)
(setq cparse::*cparse-debug* 'much)

(UFFI:DEF-FOREIGN-TYPE OBEX-EVENT-T
                       (*
                        (FUNCTION :VOID (HANDLE (* :POINTER-VOID))
                         (OBJ (* :POINTER-VOID)) (MODE :INT) (EVENT :INT)
                         (OBEX-CMD :INT) (OBEX-RSP :INT))))

(uffi:def-foreign-type int-func (* (function :int :int)))
(uffi:def-foreign-type void-func (* (function :void :int)))

(alien:def-alien-type ipointer (* (alien:signed 32)))
(alien:def-alien-type lpointer (* (alien:signed 64)))
(alien:def-alien-type vpointer (* t))
(alien:def-alien-type int-func (* (function (alien:signed 32) (alien:signed 32))))
(alien:def-alien-type void-func (* (function t (alien:signed 32))))


(uffi-alien:make-alien-defs "test1.h")
(uffi-alien:make-alien-defs "test2.h")
(uffi-alien:make-alien-defs "test3.h")
(uffi-alien:make-alien-defs "/usr/include/string.h")
(uffi-alien:make-alien-defs "/usr/include/bits/sigset.h")

(progn (uffi-alien:make-alien-defs "/usr/include/sys/types.h")
       (uffi-alien:make-alien-defs "/usr/include/dirent.h"))

(dotest "test1.h")
(dotest "test2.h")
(dotest "test3.h")
(dotest "/usr/include/string.h")
(dotest "/usr/include/openobex/obex.h")
(dotest "/usr/include/bits/sigset.h")
(dotest "/usr/include/sys/types.h" "/usr/include/dirent.h")

(defpackage :obex (:use :cl) (:shadow :listen))
(uffi-alien:make-alien-defs "/usr/include/openobex/obex.h")
(uffi-alien:make-alien-defs "/usr/include/openobex/obex.h"
			    :file "obex.lisp" :package :obex
			    :compile t :load t)

(uffi:def-struct x1 (a1 :int) (a2 (:array :int 10)))

(uffi:def-foreign-type x2 (:struct (a3 :int) (a4 (:array :int 10))))


(defun obex-test ()
  (with-open-file (f "test3.lisp"
		     :direction :output
		     :if-exists :supersede
		     :if-does-not-exist :create)
    (format f "~S~%~%"
	    '(unless (find-package :obex) (defpackage :obex (:shadow t))))
    (format f "(IN-PACKAGE :OBEX)~%~%")
    (format f "~S~%"
	    (uffi-alien:make-alien-defs "/usr/include/openobex/obex.h"))))


(defun dir-test-0 ()
  (uffi:def-foreign-type DIR :pointer-void)
  (uffi:def-struct dirent (d_ino :long)
    (d_off :long)
    (d_reclen :unsigned-short)
    (d_type :unsigned-char)
    (d_name (:array :char 256)))
  (uffi:def-function "opendir" ((name (* :char))) :returning (* DIR))
  (uffi:def-function "closedir" ((dirp (* DIR))) :returning :int)
  (uffi:def-function "readdir" ((dirp (* DIR))) :returning (* dirent))
  )

(defun dir-test-1 ()
  (with-open-file (f "test4.lisp"
		     :direction :output
		     :if-exists :supersede
		     :if-does-not-exist :create)
    (format f "~S~%~%"
	    '(UNLESS (FIND-PACKAGE :DIR-TEST)
	      (DEFPACKAGE :DIR-TEST (:SHADOW t))))
    (format f "(IN-PACKAGE :DIR-TEST)~%~%")
    (format f "~S~%"
	    (uffi-alien:make-alien-defs "/usr/include/sys/types.h"))
        (format f "~S~%"
	    (uffi-alien:make-alien-defs "/usr/include/dirent.h")))
  (load "test4.lisp")
  )

|#

;;;; debug.lisp ends here.
