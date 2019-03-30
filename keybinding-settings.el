;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(eval-and-compile (require 'utility-fns))

(message-load-file)

(global-set-key (kbd "M-<backspace>") 'backward-kill-sexp)
(global-set-key (kbd "M-k") 'kill-sexp)
(global-set-key (kbd "C-c x") #'delete-frame)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(use-package hydra)

(defun at-or-after-indentation-p ()
  (save-excursion
    (let ((old-point (point)))
      (back-to-indentation)
      (>= old-point (point)))))

(defun at-or-before-indentation-p ()
  (save-excursion
    (let ((old-point (point)))
      (back-to-indentation)
      (<= old-point (point)))))

(defun my-move-beginning-of-line () (interactive)
       "If at the begining of line go to previous line.
 If at the indention go to begining of line.
 Go to indention otherwise."
       (cond ((bolp) (forward-line -1))
             ((at-or-before-indentation-p) (move-beginning-of-line nil))
             (t (back-to-indentation))))

(defun my-move-end-of-line () (interactive)
       "If at end of line go to next line.
If at indentation go to end of line.
Go to indentation otherwise"
       (cond ((eolp) (forward-line 1))
             ((at-or-after-indentation-p) (move-end-of-line nil))
             (t (back-to-indentation))))

(defun my-insert-date ()
  "Insert today's date at point"
  (interactive "*")
  (insert (format-time-string "%F")))

(global-set-key (kbd "C-c C-.") #'my-insert-date)
(global-set-key (kbd "C-a") #'my-move-beginning-of-line)
(global-set-key (kbd "C-e") #'my-move-end-of-line)

(defhydra hydra-swedish-vowels (:color blue)
  "Swedish vowels"
  ("e" (lambda () (interactive) (insert ?ä)) "ä")
  ("E" (lambda () (interactive) (insert ?Ä)) "Ä")
  ("o" (lambda () (interactive) (insert ?ö)) "ö")
  ("O" (lambda () (interactive) (insert ?Ö)) "Ö")
  ("a" (lambda () (interactive) (insert ?å)) "å")
  ("A" (lambda () (interactive) (insert ?Å)) "Å"))

(global-set-key (kbd "C-c s") 'hydra-swedish-vowels/body)

(use-package origami
  :config
  (add-hook-to-prog-modes #'origami-mode)
  (defhydra hydra-origami (:exit nil :foreign-keys run)
    "origami --- code folding"
    ("t" origami-toggle-node "toggle")
    ("r" origami-recursively-toggle-node "toggle recursive")
    ("o" origami-open-all-nodes "open all")
    ("c" origami-close-all-nodes "close all")
    ("f" origami-show-only-node "focus on point")
    ("u" origami-undo "undo fold")
    ("z" origami-redo "redo fold")
    ("n" origami-forward-fold "next fold")
    ("p" origami-backward-fold "previous fold")
    ("N" origami-forward-fold-same-level "next sibling fold")
    ("P" origami-backward-fold-same-level "previous sibling fold")
    ("g" nil "exit" :exit t)
    ("q" nil "exit" :exit t))
  :bind (:map prog-mode-map
              ("C-c o" . hydra-origami/body)))

(provide 'keybinding-settings)
