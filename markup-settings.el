;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(add-hook-to-markup-modes (lambda ()
                            (turn-on-auto-fill)
                            (set-fill-column 80)
                            (flyspell-mode t)))

(require 'org-settings)
(require 'tex-settings)

(provide 'markup-settings)
