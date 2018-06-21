(require 'git-settings)

(use-package projectile
  :config (projectile-mode))

(use-package counsel-projectile
  :if (and (require 'projectile nil :noerror)
           (require 'counsel nil :noerror))
  :config (counsel-projectile-mode))

(provide 'project-settings)