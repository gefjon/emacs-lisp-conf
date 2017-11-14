(require 'pretty-mode)

(global-pretty-mode t)
(pretty-activate-groups
 '(:sub-and-superscripts :greek :arithmetic-nary :quantifiers))

(provide 'pretty-settings)
