(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (flycheck-mode t)
	    (flycheck-select-checker 'javascript-standard)
	    (setf js2-mode-show-parse-errors nil)
	    (setf js2-mode-show-strict-warnings nil)
	    (setf js2-basic-offset 2)))

(provide 'js-settings)
