(use-package rust-mode
  :mode "\\.rs\\'"
  :config (use-package flycheck-rust
            :config (add-hook 'rust-mode-hook (lambda ()
                                                (flycheck-mode t)
                                                (flycheck-rust-setup)
                                                (auto-complete-mode))))
  :ensure t)
(use-package cargo)
(use-package toml-mode
  :mode "\\.toml\\'"
  :ensure t)

(provide 'rust-settings)
