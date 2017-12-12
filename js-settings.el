(use-package js2-mode
  :mode "\\.js\\'"
  :interpreter "node"
  :config (add-hook 'js2-mode-hook
	  (lambda ()
	    (flycheck-mode t)
	    (flycheck-select-checker 'javascript-standard)
	    (setf js2-mode-show-parse-errors nil)
	    (setf js2-mode-show-strict-warnings nil)
	    (setf js2-basic-offset 2)))
  :ensure t)
(use-package json-mode
  :mode "\\.json\\'"
  :ensure t)
(use-package pug-mode
  :mode "\\.pug\\'"
  :ensure t)
(use-package sass-mode
  :ensure t
  :mode "\\.sass\\'")
(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

(provide 'js-settings)
