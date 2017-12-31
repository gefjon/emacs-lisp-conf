(use-package js2-mode
  :mode "\\.js\\'"
  :interpreter "node"
  :config (add-hook 'js2-mode-hook
	  ;; (lambda ()
	  ;;   (flycheck-mode t)
	  ;;   (flycheck-select-checker 'javascript-standard)
	  ;;   (setf js2-mode-show-parse-errors nil)
	  ;;   (setf js2-mode-show-strict-warnings nil)
	  ;;   (setf js2-basic-offset 2))
          ))
(use-package json-mode
  :mode "\\.json\\'")
(use-package pug-mode
  :mode "\\.pug\\'")
(use-package sass-mode
  :mode "\\.sass\\'")
(use-package typescript-mode
  :mode "\\.ts\\'")

(provide 'js-settings)
