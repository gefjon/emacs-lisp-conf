;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  
  (package-refresh-contents)

  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (require 'use-package)
  (setf use-package-always-ensure t))

(setf custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

(add-to-list 'load-path (expand-file-name "~/emacs-lisp-conf"))

(byte-recompile-directory (expand-file-name "~/emacs-lisp-conf") 0)

(setf user-full-name "Phoebe Goldman"
      user-mail-address "phoebe@goldman-tribe.org")

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 4)
  (auto-package-update-maybe))

(use-package cl-lib)

(when (eq system-type 'darwin)
  (require 'mac-system-settings))
(require 'window-settings)
(require 'lisp-config)
(require 'misc-settings)
(require 'markup-settings)
(require 'tex-settings)
(require 'keybinding-settings)
(require 'erc-settings)
(require 'python-settings)
(require 'c-settings)

(provide 'init)
