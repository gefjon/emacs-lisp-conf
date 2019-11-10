;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defvar *debian-site-lisp-path* "/usr/share/emacs/site-lisp")
(defvar *mu4e-site-lisp-path* (concat *debian-site-lisp-path* "/mu4e"))

(when (file-directory-p *mu4e-site-lisp-path*)
  (add-to-list 'load-path *mu4e-site-lisp-path*)
  (require 'mu4e))

(provide 'mail-settings)
