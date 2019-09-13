;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defvar *delimiters* '((?{ . ?})
                       (?( . ?))
                       (?[ . ?])
                       (?< . ?>)))

(defun pair-of-delimiters-p (first second)
  (eq (cdr (assq first *delimiters*)) second))

(defun point-between-delimiters-p ()
  (pair-of-delimiters-p (char-before) (char-after)))

(defun newline-at-block () (interactive)
  (newline-and-indent)
  (split-line)
  (indent-for-tab-command))

(defun newline-with-block-support ()
  (interactive)
  (if (point-between-delimiters-p)
      (newline-at-block)
    (newline-and-indent)))

(global-set-key (kbd "C-m") #'newline-with-block-support)

(use-package hydra)

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
  (add-hook-to-all-modes #'smartparens-mode)
  (add-hook-to-prog-modes #'smartparens-strict-mode)
  (add-hook-to-all-modes #'show-smartparens-mode)
  :bind (("C-)" . #'sp-forward-slurp-sexp)
         ("C-}" . #'sp-forward-barf-sexp)
         ("C-(" . #'sp-backward-slurp-sexp)
         ("C-{" . #'sp-backward-barf-sexp)
         ("C-c [" . #'hydra-smartparens/body))
  :defer nil)

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(provide 'smartparens-settings)
