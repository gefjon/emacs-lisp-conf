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
