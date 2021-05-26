;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package sly-asdf
  :after sly)

(use-package sly
  :config
  (setf sly-lisp-implementations
        '((sbcl-fast ("sbcl" "--core" "/Users/phoebe/sbcl.core-with-slynk"))
          (sbcl ("sbcl"))
          (allegro ("alisp"))
          (ccl ("ccl")))
        sly-default-lisp 'sbcl)
  (add-hook 'sly-mrepl-mode-hook #'smartparens-mode)
  (cl-flet ((start-sly ()
                       (unless (sly-connected-p)
                         (save-excursion (sly))))
            (fill-110 ()
                      (set-fill-column 110)))
    (add-hook 'lisp-mode-hook #'start-sly)
    (add-hook 'lisp-mode-hook #'fill-110))
  :bind (:map sly-mode-map ))

(provide 'lisp-config)
