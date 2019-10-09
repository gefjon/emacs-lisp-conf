;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(when (and (featurep 'server) (not (server-running-p)))
    (server-start))

(use-package edit-server)
(edit-server-start)

(provide 'emacs-server-settings)
