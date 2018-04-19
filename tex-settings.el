;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(use-package auctex
  :mode "\\.\\(la\\)?tex\\'")

(provide 'tex-settings)
