(load "00debug.lisp")

(defun dir-test-0 ()
  (format t "~%~%============~%")
  (uffi-alien:make-alien-defs '("/usr/include/sys/types.h"
				"/usr/include/dirent.h")
			      :file "dir-test-ffi.lisp"
			      :compile t :load t))

(defun dir-test-1 ()
  (let* ((name (uffi:convert-to-foreign-string "/home/tedchly"))
	 (handle (opendir name)))
    (uffi:with-foreign-object (entry '(* (:struct dirent)))
      (setq entry (readdir handle)))
    (format t "Entry: ~S~%" entry)
    
    ))