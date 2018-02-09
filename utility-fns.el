;;; -*- lexical-binding: t -*-

(defun message-load-file ()
  (message "loading %s"
           (or load-file-name buffer-file-name)))

(message-load-file)

(defvar *hooks-for-global-modes* '(js2-mode-hook
                                   sass-mode-hook
                                   slime-mode-hook
                                   typescript-mode-hook
                                   lisp-interaction-mode-hook
                                   emacs-lisp-mode-hook
                                   rust-mode-hook
                                   c-mode-hook
                                   json-mode-hook
                                   pug-mode-hook
                                   nginx-mode-hook
                                   latex-mode-hook
                                   text-mode-hook
                                   markdown-mode-hook))

(defvar *hooks-for-lisp-modes* '(lisp-mode-hook
                                 slime-repl-mode-hook
                                 slime-mode-hook
                                 emacs-lisp-mode-hook
                                 lisp-interaction-mode-hook))

(defun add-hook-to-list-of-major-modes (hook modes)
  (dolist (mode modes)
    (add-hook mode hook)))

(defun add-hook-to-all-major-modes (hook)
  (add-hook-to-list-of-major-modes hook *hooks-for-global-modes*))

(defun add-hook-to-lisp-modes (hook)
  (add-hook-to-list-of-major-modes hook *hooks-for-lisp-modes*))

(provide 'utility-fns)
