;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(use-package forth-mode
  :mode (rx (: ?\.
               (or (: "f" (or "s" "th"))
                   "4th")
               eol)))

(provide 'forth-settings)
