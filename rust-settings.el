(use-package rust-mode
  :mode "\\.rs\\'"
  :config (use-package flycheck-rust
            :config (add-hook 'rust-mode-hook (lambda () (flycheck-mode t))))
  :ensure t)
(use-package cargo)
(use-package toml-mode
  :mode "\\.toml\\'"
  :ensure t)

(provide 'rust-settings)
