;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

;; start windows in fullscreen
(add-to-list 'default-frame-alist
             (cons
              'fullscreen
              (if (eq system-type 'darwin)
                  'fullboth
                'maximized)))

(use-package dracula-theme
  :config (load-theme 'dracula t))

;; disable all possible window devices
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(provide 'window-settings)
