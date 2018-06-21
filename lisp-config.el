;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(defvar slime-lisp-implementations)
(defvar slime-default-lisp)
(defvar slime-contribs)

(message-load-file)

(use-package slime-company)

(use-package slime
  :init
  (setf slime-lisp-implementations
        '((roswell ("ros" "-Q" "run"))
          (sbcl ("sbcl"))
          (ccl ("ccl"))
          (ccl32 ("ccl32"))))
  (setf slime-default-lisp 'roswell)
  (setf slime-contribs '(slime-fancy slime-asdf inferior-slime slime-company)))

(provide 'lisp-config)
