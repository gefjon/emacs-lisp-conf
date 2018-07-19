;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defhydra hydra-smartparens-strict-mode (:color blue)
  "smartparens strict mode"
  ("e" turn-on-smartparens-strict-mode "enable")
  ("d" turn-off-smartparens-strict-mode "disable")
  ("g" smartparens-global-strict-mode "toggle global")
  ("s" smartparens-strict-mode "toggle local"))

(defhydra hydra-smartparens (:color blue)
  "smartparens"
  ("s" hydra-smartparens-strict-mode/body "strict mode"))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (add-hook-to-all-major-modes #'smartparens-mode)
  (add-hook-to-lisp-modes #'smartparens-strict-mode)
  (add-hook-to-all-major-modes #'show-smartparens-mode)
  :bind (("C-)" . #'sp-forward-slurp-sexp)
         ("C-}" . #'sp-forward-barf-sexp)
         ("C-(" . #'sp-backward-slurp-sexp)
         ("C-{" . #'sp-backward-barf-sexp)
         ("C-c [" . #'hydra-smartparens/body))
  :defer nil)

(provide 'smartparens-settings)
