;;; -*- lexical-binding: t -*-

(eval-and-compile
  (require 'cl-lib))

(defun message-load-file ()
  (message "loading %s"
           (or load-file-name buffer-file-name)))

(message-load-file)

(defun add-hook-to-list-of-modes (hook modes)
  (dolist (mode modes)
    (add-hook mode hook t)))

(defun add-hook-to-prog-modes (h)
  (add-hook 'prog-mode-hook h t))

(defun add-hook-to-text-modes (h)
  (add-hook 'text-mode-hook h t))

(defun add-hook-to-special-modes (h)
  (add-hook 'special-mode-hook h t))

(defun add-hook-to-all-modes (h)
  (add-hook-to-list-of-modes h '(prog-mode-hook
                                 text-mode-hook
                                 special-mode-hook)))

(provide 'utility-fns)
