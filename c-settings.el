;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package cc-mode
  :config
  (c-add-style "otbs-2-spaces"
               '("java"
                 (c-basic-offset . 2)))
  (setf c-default-style "otbs-2-spaces"
        c-basic-offset 2))
