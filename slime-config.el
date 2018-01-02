(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(defvar slime-lisp-implementations)
(defvar slime-default-lisp)
(defvar slime-contribs)

(message-load-file)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setf slime-lisp-implementations
      '((sbcl ("sbcl"))
        (ccl ("ccl"))
        (ccl32 ("ccl32"))))
(setf slime-default-lisp 'sbcl)
(setq slime-contribs '(slime-fancy slime-asdf inferior-slime))

(use-package paredit
  :bind (("M-{" . paredit-wrap-curly)
         ("M-[" . paredit-wrap-square)))

(provide 'slime-config)
