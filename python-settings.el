(use-package elpy
  :config (elpy-enable)
  (setq ac-modes (delq 'python-mode ac-modes)))
(provide 'python-settings)
