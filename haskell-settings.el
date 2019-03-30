;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package haskell-mode
  :demand t
  :mode "\\.l?hs\\'"
  :interpreter "ghci"
  :bind (:map haskell-mode-map
              ("C-c C-i" . haskell-navigate-imports)
              ("C-c \\" . haskell-mode-stylish-buffer))
  :hook (haskell-mode . haskell-indent-mode)
  :config (setf haskell-tags-on-save t
                haskell-stylish-on-save t))

(provide 'haskell-settings)
