;;; Copyright (c) 2001 Timothy Moore
;;; All rights reserved.
;;;
;;; Modified 2004 by Christian Lynbech
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

;;;
;;; CPARSE - library for parsing C header files.

;; Choose one of the supported backends
(defvar *cparse-backend* (nth 0 '("uffi-alien" "cmu-alien" "acl-alien")))

(when (string= *cparse-backend* "uffi-alien")
  '(require :uffi))

#+CMU
;;; CMUCL 18c and earlier doesn't hash strings with fill pointers correctly.
(let ((string-with-fill (make-array 32
				    :element-type 'base-char
				    :adjustable t
				    :fill-pointer 7)))
  (setf (subseq string-with-fill 0) "typedef")
  (unless (= (sxhash string-with-fill) (sxhash "typedef"))
    (pushnew :hash-fill-bug *features*)))


;;; We will define a system  for all available defsystem systems, even
;;; if that means duplicated info but this allows the user to work
;;; with whatever kind of system his is most comfortable with.

#+ASDF
'(to-be-done asdf:defsystem cparse)

#+MK-DEFSYSTEM
(mk:defsystem cparse
    :source-extension "lisp"
    :components
    ((:file "package")
     (:file "ctype" :depends-on ("package"))
     (:file "cparse" :depends-on ("package"))
     (:file #.*cparse-backend* :depends-on ("package" "cparse"))))

#+ALLEGRO
(defsystem :cparse (:default-file-type "lisp")
  (:serial "package" 
	   (:parallel "ctype" "cparse")
	   #.*cparse-backend*))
