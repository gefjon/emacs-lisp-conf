(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(use-package ido
  :config (ido-mode +1)
  (ido-everywhere +1))

(use-package ido-completing-read+
  :config (ido-ubiquitous-mode +1))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-show-count t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package smex
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))

(setq magit-completing-read-function 'magit-ido-completing-read)

(provide 'ido-settings)
