
#|
(clc:require :uffi)
(load "00debug.lisp")
|#

(defmacro my-convert-to-foreign-string (obj)
  (let ((size (gensym))
	(storage (gensym))
	(i (gensym))
	(char-type '(alien:signed 8)))
    `(etypecase ,obj
       (null 
	(alien:sap-alien (system:int-sap 0) (* ,char-type)))
       (string
	(let* ((,size (length ,obj))
	       (,storage (alien:make-alien ,char-type (1+ ,size))))
	  (setq ,storage (alien:cast ,storage (* ,char-type)))
	  (locally
	      (declare (optimize (speed 3) (safety 0)))
	    (dotimes (,i ,size)
	      (declare (fixnum ,i))
	      (setf (alien:deref ,storage ,i) (char-code (char ,obj ,i))))
	    (setf (alien:deref ,storage ,size) 0))
	  ,storage)))))

(defmacro my-convert-from-foreign-string (obj &key
					   length
					   (locale :default)
					   (null-terminated-p t))
  `(if (uffi:null-pointer-p ,obj)
    nil
    (uffi::cmucl-naturalize-cstring (alien:alien-sap ,obj)
     :length ,length
     :null-terminated-p ,null-terminated-p)))


(uffi:def-foreign-type nil
    (:struct dirent
	     (d-ino :unsigned-long)
	     (d-off :long)
	     (d-reclen :unsigned-short)
	     (d-type :unsigned-char)
	     (d-name (:array :char 256)))) 
 
(uffi:def-function "opendir"
    ((--name (* :char)))
  :returning (* (:struct --dirstream)))

(uffi:def-function "closedir"
    ((--dirp (* (:struct --dirstream))))
  :returning :int)

(uffi:def-function "readdir"
    ((--dirp (* (:struct --dirstream))))
  :returning (* (:struct dirent)))

(defun main ()
  (format t "DIRTEST/ffi~%")
  (let* ((tmp (my-convert-to-foreign-string "/tmp"))
	 (handle (opendir tmp)))
    (unwind-protect
	 (do ((entry (readdir handle) (readdir handle))
	      (x 0 (incf x)))
	     ((or (uffi:null-pointer-p handle) (uffi:null-pointer-p entry)))
	   (format t "~S: ~S~%" x
		   (my-convert-from-foreign-string
		    (uffi:get-slot-value entry dirent 'd-name))))
      (unless (uffi:null-pointer-p handle)
	(closedir handle))
      (uffi:free-foreign-object tmp))))

;(main)
