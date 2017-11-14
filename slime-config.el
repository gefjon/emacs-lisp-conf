(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setf slime-lisp-implementations
      '((sbcl ("sbcl" "--core" "/Users/rowan/sbcl.core-for-slime"))
        (ccl ("ccl"))
        (ccl32 ("ccl32"))))
(setf slime-default-lisp 'sbcl)
(setq slime-contribs '(slime-fancy slime-asdf inferior-slime))

(provide 'slime-config)
