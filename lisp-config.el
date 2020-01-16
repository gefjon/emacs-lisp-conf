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
      (add-to-list 'load-path slime-path))))

(use-package slime
  :init
  (setf slime-lisp-implementations
        '((sbcl-fast ("sbcl" "--core" "~/sbcl.core-with-swank"))
          (sbcl ("sbcl"))
          (sbcl32 ("sbcl32"))
          (sbcl64 ("sbcl64"))
          (ccl ("ccl"))
          (ccl32 ("ccl32")))
        slime-default-lisp 'sbcl
        slime-contribs '(slime-fancy
                         slime-asdf
                         inferior-slime
                         slime-company
                         slime-indentation
                         slime-mdot-fu
                         slime-editing-commands
                         slime-fancy-inspector))
  (add-hook 'slime-repl-mode-hook #'smartparens-mode))

(provide 'lisp-config)
