;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(require 'scheme-settings)

(use-package slime-company
  :after company)

(defun max-string (strings)
  (seq-reduce #'(lambda (max-so-far elt)
                  (if (string> elt max-so-far)
                      elt
                    max-so-far))
              strings
              ""))

(defun configure-slime ()
  (setf slime-lisp-implementations
        '((sbcl ("sbcl"))
          (ccl ("ccl"))
          (ccl32 ("ccl32")))
        slime-default-lisp 'sbcl
        slime-contribs '(slime-fancy slime-asdf inferior-slime slime-company))
  (add-hook 'slime-repl-mode-hook #'smartparens-mode))

(eval-and-compile 
  (when-let ((slime-paths (file-expand-wildcards
                           "~/quicklisp/dists/quicklisp/software/slime-v*/")))
    (let ((slime-path (max-string slime-paths)))
      (add-to-list 'load-path slime-path)))
  (when-let ((slime-annot-paths (directory-files
                                 "~/quicklisp/dists/quicklisp/software"
                                 t ; full-name
                                 (rx bol ; match-regexp
                                     "cl-annot-"
                                     (zero-or-more digit)
                                     "-git"
                                     eol))))
    (let* ((slime-annot-path (max-string slime-annot-paths))
           (the-actual-folder (concat (file-name-as-directory slime-annot-path)
                                      "misc/")))
      (add-to-list 'load-path the-actual-folder))))

(use-package slime
  :config (require 'slime-annot)
  :init (configure-slime))

(provide 'lisp-config)
