;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defvar opam-share (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1)))

(defvar opam-site-lisp
  (concat opam-share "/emacs/site-lisp"))

(add-to-list 'load-path opam-site-lisp)

(use-package tuareg
  :config (defalias 'tuareg 'tuareg-mode)
  :mode "\\.ml[iylp]?\\'")

(defun my-ocp-indent ()
  (interactive)
  (if (use-region-p)
      (ocp-indent-region (region-beginning)
                         (region-end))
    (ocp-indent-buffer)))

(use-package ocp-indent
  :bind (:map tuareg-mode-map
              ("C-c i" . my-ocp-indent)
              ("C-c p b" . ocp-indent-buffer)
              ("C-c p l" . ocp-indent-line)
              ("C-c p r" . ocp-indent-region)))

(use-package merlin
  :config
  (add-hook 'tuareg-mode-hook #'merlin-mode t)
  (add-hook 'caml-mode-hook #'merlin-mode t))

(add-to-list 'auto-mode-alist '("_oasis\\'" . conf-colon-mode))

(provide 'ocaml-settings)
