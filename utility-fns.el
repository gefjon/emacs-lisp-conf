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

(defun add-hook-to-all-major-modes (hook)
  (dolist (mode *hooks-for-global-modes*)
    (add-hook mode hook)))

(provide 'utility-fns)
