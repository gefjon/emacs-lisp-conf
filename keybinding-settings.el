;;; -*- lexical-binding: t -*-

(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(global-set-key (kbd "M-<backspace>") 'backward-kill-sexp)
(global-set-key (kbd "M-k") 'kill-sexp)
(global-set-key (kbd "C-c x") #'delete-frame)

(use-package hydra)

(defun at-indentation-p ()
  "`t` if point is at the current lines' indentation level, `nil` otherwise."
  (save-excursion
    (let ((old-point (point)))
      (back-to-indentation)
      (= old-point (point)))))

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

(provide 'keybinding-settings)
