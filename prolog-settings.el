;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package prolog
  :mode ((rx (: ?\.
                "pro"
                eol))
         . prolog-mode)
  :interpreter ("swi-prolog" . prolog-mode)
  :demand)

(use-package ediprolog
  :bind (("C-c C-e" . #'ediprolog-dwim)))

(provide 'prolog-settings)
