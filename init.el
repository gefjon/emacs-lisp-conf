;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ;; ("marmalade" . "https://marmalade-repo.org/packages/")
			   ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  
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
      user-mail-address "a@goldman-tribe.org")

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 4)
  (auto-package-update-maybe))

(require 'utility-fns)

(when (eq system-type 'darwin)
  (require 'mac-system-settings))
(require 'window-settings)
(require 'git-settings)
(require 'project-settings)
(require 'lisp-config)
; (require 'prolog-settings)
(require 'misc-settings)
(require 'smartparens-settings)
(require 'rust-settings)
; (require 'c++-settings)
; (require 'python-settings)
; (require 'haskell-settings)
; (require 'ocaml-settings)
; (require 'julia-settings)
; (require 'forth-settings)
(require 'js-settings)
; (require 'lua-settings)
(require 'markup-settings)
(require 'org-settings)
(require 'tex-settings)
(require 'keybinding-settings)
(require 'ag-settings)
(require 'completion-settings)

(provide 'init)
