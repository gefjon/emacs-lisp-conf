;;; -*- lexical-binding: t -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(provide 'c++-settings)
