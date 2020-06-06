;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package toml-mode
  :mode "\\.toml\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package racer
  :if (executable-find "racer")
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))

(use-package cargo
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode))

(use-package toml-mode
  :mode "\\.toml\\'")

(provide 'rust-settings)
