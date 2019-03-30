;;; -*- lexical-binding: t -*-

(eval-and-compile
  (require 'cl-lib))

(defun message-load-file ()
  (message "loading %s"
           (or load-file-name buffer-file-name)))

(message-load-file)

;; (defvar *hooks-for-data-modes* '(nginx-mode-hook
;;                                  json-mode-hook
;;                                  yaml-mode-hook
;;                                  toml-mode-hook
;;                                  makefile-mode-hook))

;; (defvar *hooks-for-webdev-modes* '(json-mode-hook
;;                                    js2-mode-hook
;;                                    typescript-mode-hook
;;                                    sass-mode-hook
;;                                    css-mode-hook
;;                                    html-mode-hook
;;                                    pug-mode-hook))

;; (defvar *hooks-for-interactive-modes* '(slime-mode-hook
;;                                         lisp-interaction-mode-hook
;;                                         inferior-emacs-lisp-mode-hook
;;                                         inferior-scheme-mode-hook
;;                                         eshell-mode-hook
;;                                         term-mode-hook))

;; (defvar *hooks-for-markup-modes* '(pug-mode-hook
;;                                    org-mode-hook
;;                                    latex-mode-hook
;;                                    text-mode-hook
;;                                    markdown-mode-hook))

;; (defvar *hooks-for-c-like-modes* '(js2-mode-hook
;;                                    typescript-mode-hook
;;                                    rust-mode-hook
;;                                    c-mode-hook
;;                                    c++-mode-hook))

;; (defvar *hooks-for-lisp-modes* '(lisp-mode-hook
;;                                  slime-repl-mode-hook
;;                                  slime-mode-hook
;;                                  scheme-mode-hook
;;                                  inferior-scheme-mode-hook
;;                                  emacs-lisp-mode-hook
;;                                  inferior-emacs-lisp-mode-hook
;;                                  lisp-interaction-mode-hook))

;; (defvar *hooks-for-functional-modes* '(haskell-mode-hook
;;                                        tuareg-mode-hook
;;                                        caml-mode-hook))

;; (defvar *hooks-for-other-language-modes* '(lua-mode-hook
;;                                            python-mode-hook))

;; (defun union-many (&rest sets)
;;   (let ((union nil))
;;     (dolist (set sets)
;;       (setf union (cl-union set union)))
;;     union))

(defun add-hook-to-list-of-modes (hook modes)
  (dolist (mode modes)
    (add-hook mode hook t)))

;; (defun add-hook-to-all-major-modes (hook)
;;   (add-hook-to-list-of-major-modes hook
;;                                    (union-many *hooks-for-data-modes*
;;                                                *hooks-for-webdev-modes*
;;                                                *hooks-for-interactive-modes*
;;                                                *hooks-for-markup-modes*
;;                                                *hooks-for-c-like-modes*
;;                                                *hooks-for-lisp-modes*
;;                                                *hooks-for-functional-modes*
;;                                                *hooks-for-other-language-modes*)))

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

;; (defun add-hook-to-lisp-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-lisp-modes*))

;; (defun add-hook-to-c-like-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-c-like-modes*))

;; (defun add-hook-to-webdev-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-webdev-modes*))

;; (defun add-hook-to-interactive-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-interactive-modes*))

;; (defun add-hook-to-data-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-data-modes*))

;; (defun add-hook-to-markup-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-markup-modes*))

;; (defun add-hook-to-functional-modes (hook)
;;   (add-hook-to-list-of-major-modes hook *hooks-for-functional-modes*))

(provide 'utility-fns)
