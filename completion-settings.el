;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(use-package ivy
  :config
  (ivy-mode 1)
  (setq magit-completing-read-function 'ivy-completing-read)
  (setq ivy-use-virtual-buffers t)
  :bind (("C-s" . swiper)
         ("M-x" . counsel-M-x)
         ("C-c C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-c k" . counsel-ag)
         ("C-c C-r" . ivy-resume))
  :demand)

(provide 'completion-settings)
