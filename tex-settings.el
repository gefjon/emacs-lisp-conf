;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package tex-site
  :ensure auctex
  :demand
  :mode ("\\.\\(la\\)?tex\\'" . TeX-latex-mode))

(provide 'tex-settings)
