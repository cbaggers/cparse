;;; 
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

(defpackage :cparse
  (:use :common-lisp)
  (:shadow :stream :char :unsigned-byte)
  (:export :void
	   :unsigned :int :unsigned-int
	   :long :unsigned-long :long-long :unsigned-long-long
	   :short :unsigned-short :byte :unsigned-byte
	   :cfloat :double
	   :char :signed-char :unsigned-char
	   :value :c-type
	   :pointer-type :to
	   :array-type :of :len
	   :func-type :return-type :args
	   :scope :objects :struct-tags :struct-members :outer-scope
	   :compound-type
	   :struct-type :union-type :members :tag
	   :enum-type :enumerators
	   :stdarg-type :typedef-type :defined-type
	   :cparse-stream :cparse-string :cparse-file
	   :cparse-error :cparse-error-file-name :cparse-error-line-number
	   :cparse-error-format-string :cparse-error-format-arguments))

#+CMU
(defpackage :cmu-alien
  (:shadowing-import-from :cparse :char :unsigned-byte)
  (:shadowing-import-from :alien :unsigned)
  (:use :cparse :alien :common-lisp)
  (:export :make-alien-defs))

#+ALLEGRO
(defpackage :acl-alien
  (:use :common-lisp :ff :cparse)
  (:shadowing-import-from :cparse :char)
  (:export :make-alien-defs :*enum-table*
	   :create-alien :alien-get :alien-ref :alien-decode :alien :alienp))

(when (string= *cparse-backend* "uffi-alien")
  (defpackage :uffi-alien
    (:shadowing-import-from :cparse :char :unsigned-byte)
    (:use :common-lisp :cparse)
    (:export :make-alien-defs
	     :create-alien :alien-get :alien-ref
	     :alien-decode :alien :alienp)))


