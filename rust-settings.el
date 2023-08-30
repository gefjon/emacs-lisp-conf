;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package toml-mode
  :demand t
  :mode "\\.toml\\'")

(use-package lsp-mode)

(use-package rustic
  :demand t
  :mode ("\\.rs\\'" . rustic-mode)
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  (setf rustic-format-on-save t))

(use-package cargo
  :demand t
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode))

(provide 'rust-settings)
