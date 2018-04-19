;;; -*- lexical-binding: t -*-

(declare-function message-load-file "utility-fns" () nil)

(message-load-file)

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package racer
  :if (executable-find "racer")
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))

(use-package cargo)
(use-package toml-mode
  :mode "\\.toml\\'")

(provide 'rust-settings)
