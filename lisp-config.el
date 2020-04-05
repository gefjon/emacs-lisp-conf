;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package sly
  :init
  (setf sly-lisp-implementations
        '((sbcl-fast ("sbcl" "--core" "/Users/phoebe/sbcl.core-with-slynk"))
          (sbcl ("sbcl"))
          (allegro ("alisp"))
          (ccl ("ccl"))
          (ccl32 ("ccl32")))
        sly-default-lisp 'sbcl-fast)
  (add-hook 'sly-mrepl-mode-hook #'smartparens-mode))

(require 'scheme-settings)
(require 'racket-settings)

(provide 'lisp-config)
