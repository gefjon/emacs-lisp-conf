(add-hook 'latex-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (set-fill-column 80)
            (flyspell-mode t)))

(provide 'tex-settings)
