;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package slime
  :config
  (setf slime-lisp-implementations
        '((sbcl ("sbcl")))
        sly-default-lisp 'sbcl)
  (add-hook 'slime-repl-mode-hook #'smartparens-mode)
  (cl-flet ((start-slime ()
              (unless (slime-connected-p)
                (save-excursion (slime))))
            (fill-110 ()
              (set-fill-column 110)))
    (add-hook 'lisp-mode-hook #'start-slime)
    (add-hook 'lisp-mode-hook #'fill-110)))

(provide 'lisp-config)
