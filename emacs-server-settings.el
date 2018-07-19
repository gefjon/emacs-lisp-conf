;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(eval-and-compile 
  (if (featurep 'server)
      (require 'server)))
(when (and (featurep 'server) (not (server-running-p)))
    (server-start))

(provide 'emacs-server-settings)
