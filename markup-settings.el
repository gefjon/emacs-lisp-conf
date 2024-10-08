;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package pandoc-mode
  :demand t)

(defun markup-editing-settings ()
  (set-fill-column 90)
  (pandoc-mode 1)
  (pandoc-load-default-settings))

(use-package fountain-mode
  :mode "\\.fountain\\'"
  :hook (fountain-mode . markup-editing-settings))

(use-package poly-markdown
  :ensure t
  :mode ("\\.md\\'" . poly-markdown-mode)
  :hook (poly-markdown-mode . markup-editing-settings))

(defvar org-notes-dir (expand-file-name "~/notes"))

(use-package org
  :demand t
  :config
  (setf org-src-fontify-natively t
        org-log-done 'time
        org-agenda-files (list org-notes-dir)
        org-agenda-start-day "-1d"
        org-agenda-span 16
        org-image-actual-width 500)
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((emacs-lisp . t)
                                 (lisp . t)))
  :bind (("C-c a" . org-agenda)
         ("C-c l" . org-store-link))
  :hook (org-mode . markup-editing-settings))

(use-package hydra)
(defhydra hydra-org-dispatch (;; i.e :foreign-keys warn :exit t
                              :color teal)
  "Catch-all dispatch for org-mode related stuff."
  ("f" org-footnote-new "create a footnote (C-c C-c once done to return)"))

(use-package org-roam
  :init (setf org-roam-v2-ack t)
  :config
  (setf org-roam-directory org-notes-dir)
  (org-roam-setup)
  :bind (("C-c f" . org-roam-node-find)
         :map org-mode-map
         ("C-c r" . org-roam)
         ("C-c i" . org-roam-insert)
         ("C-c o" . hydra-org-dispatch/body)))


(provide 'markup-settings)
