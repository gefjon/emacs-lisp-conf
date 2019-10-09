;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package slime-company
  :after company)

(defun max-string (strings)
  (seq-reduce #'(lambda (max-so-far elt)
                  (if (string> elt max-so-far)
                      elt
                    max-so-far))
              strings
              ""))

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
  :init
  (setf slime-lisp-implementations
        '((sbcl-fast ("sbcl" "--core" "/Users/phoebe/sbcl.core-with-swank"))
          (sbcl ("sbcl"))
          (ccl ("ccl"))
          (ccl32 ("ccl32")))
        slime-default-lisp 'sbcl-fast
        slime-contribs '(slime-fancy
                         slime-asdf
                         inferior-slime
                         slime-company
                         slime-indentation
                         slime-mdot-fu
                         slime-editing-commands
                         slime-fancy-inspector))
  (add-hook 'slime-repl-mode-hook #'smartparens-mode))

(require 'scheme-settings)
(require 'racket-settings)

(provide 'lisp-config)
