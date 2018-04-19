;;; -*- lexical-binding: t -*-

(eval-when-compile (require 'utility-fns))

(message-load-file)

(global-set-key (kbd "C-c m")
                (if (eq system-type 'darwin)
                    'toggle-frame-fullscreen
                  'toggle-frame-maximized))
(add-to-list 'default-frame-alist (cons
                                   'fullscreen
                                   (if (eq system-type 'darwin)
                                       'fullboth
                                     'maximized)))
(provide 'window-settings)
