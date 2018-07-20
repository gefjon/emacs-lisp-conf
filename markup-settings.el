;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(defun markup-editing-settings ()
  (turn-on-auto-fill)
  (set-fill-column 80)
  (flyspell-mode))

(add-hook-to-markup-modes #'markup-editing-settings)

(require 'org-settings)
(require 'tex-settings)

(provide 'markup-settings)
