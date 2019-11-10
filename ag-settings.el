;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package ag
  :if (executable-find "ag"))

(provide 'ag-settings)
