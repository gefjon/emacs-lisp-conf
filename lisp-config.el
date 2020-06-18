;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package sly-asdf
  :after sly)

(use-package sly
  :config
  (setf sly-lisp-implementations
        '((sbcl-fast ("sbcl" "--core" "/Users/phoebe/sbcl.core-with-slynk"))
          (sbcl ("sbcl"))
          (allegro ("alisp"))
          (ccl ("ccl"))
          (ccl32 ("ccl32")))
        sly-default-lisp 'ccl)
  (add-hook 'sly-mrepl-mode-hook #'smartparens-mode)
  (cl-flet ((start-sly ()
                       (unless (sly-connected-p)
                         (save-excursion (sly)))))
    (add-hook 'lisp-mode-hook #'start-sly))
  :bind (:map sly-mode-map ))

(provide 'lisp-config)
