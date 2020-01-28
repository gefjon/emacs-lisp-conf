;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package company
  :config (global-company-mode)
  :bind (("M-i" . company-complete)
         ("TAB" . indent-for-tab-command))
  :demand)

(use-package ivy
  :config (ivy-mode 1)
  (setf magit-completing-read-function #'ivy-completing-read
        ivy-use-virtual-buffers t)
  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume))
  :demand)

(use-package counsel
  :config (counsel-mode 1)
  :bind (("C-c k" . counsel-ag))
  :demand)

(provide 'completion-settings)
