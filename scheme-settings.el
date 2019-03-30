;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package geiser
  :mode "^\\.s\\(cm\\|s\\)$"
  :init
  (setf geiser-default-implementation 'chicken
        geiser-mode-start-repl-p t
        geiser-implementations-alist '(((regexp "\\.scm$") chicken)
                                       ((regexp "\\.ss$") chicken))))

(provide 'scheme-settings)
