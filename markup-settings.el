;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defun markup-editing-settings ()
  (turn-on-auto-fill)
  (set-fill-column 79) ; my emacs config leaves buffers at 79-wide
                       ; when using two windows
  (flyspell-mode))

(add-hook-to-text-modes #'markup-editing-settings)

(use-package fountain-mode
  :mode "\\.fountain\\'"
  :hook (fountain-mode . markup-editing-settings))

(require 'org-settings)
(require 'tex-settings)

(provide 'markup-settings)
