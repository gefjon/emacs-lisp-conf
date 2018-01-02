(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(use-package rust-mode
  :mode "\\.rs\\'")
(use-package cargo)
(use-package toml-mode
  :mode "\\.toml\\'")

(provide 'rust-settings)
