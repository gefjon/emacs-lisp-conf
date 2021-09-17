;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

;;; M-i company-complete
;;; TAB indent-for-tab-command
(use-package company
  :config
  (global-company-mode)
  :bind (("M-i" . company-complete)
         ("TAB" . indent-for-tab-command))
  :demand t)

(use-package wgrep
  :demand t
  :config (setf wgrep-auto-save-buffer t))

;;;; replace builtins with ivy equivalents
;;; C-s swiper
;;; M-x counsel-M-x
;;; C-x C-f counsel-find-file
;;; C-h f counsel-describe-function
;;; C-h v counsel-describe-variable
;;; C-c k counsel-ag
;;; C-c C-r ivy-resume
;;; C-c C-f find-file
(use-package ivy
  :demand t
  :config
  (ivy-mode 1)
  (setf ivy-use-virtual-buffers t)
  :bind (("C-s" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-c k" . counsel-ag)
         ("C-c C-r" . ivy-resume)))

;;;; use M- to kill sexps
;;; M-backspace backward-kill-sexp
;;; M-k kill-sexp
(global-set-key (kbd "M-<backspace>") 'backward-kill-sexp)
(global-set-key (kbd "M-k") 'kill-sexp)

;;; C-x delete-frame
(global-set-key (kbd "C-c x") #'delete-frame)

;;; C-x C-b ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; C-a move-beginning-of-line-or-indentation
(defun at-or-before-indentation-p ()
  (save-excursion
    (let ((old-point (point)))
      (back-to-indentation)
      (<= old-point (point)))))
(defun move-beginning-of-line-or-indentation () (interactive)
       "If at the begining of line go to previous line.
 If at the indention go to begining of line.
 Go to indention otherwise."
       (cond ((bolp) (forward-line -1))
             ((at-or-before-indentation-p) (move-beginning-of-line nil))
             (t (back-to-indentation))))
(global-set-key (kbd "C-a") #'move-beginning-of-line-or-indentation)

;;; C-e move-end-of-line-or-indentation
(defun at-or-after-indentation-p ()
  (save-excursion
    (let ((old-point (point)))
      (back-to-indentation)
      (>= old-point (point)))))
(defun move-end-of-line-or-indentation () (interactive)
       "If at end of line go to next line.
If at indentation go to end of line.
Go to indentation otherwise"
       (cond ((eolp) (forward-line 1))
             ((at-or-after-indentation-p) (move-end-of-line nil))
             (t (back-to-indentation))))
(global-set-key (kbd "C-e") #'move-end-of-line-or-indentation)

;;; C-c C-. insert-date
(defun insert-date ()
  "Insert today's date at point"
  (interactive "*")
  (insert (format-time-string "%F")))
(global-set-key (kbd "C-c C-.") #'insert-date)

;;; C-c s [e -> ä | E -> Ä | o -> ö | O -> Ö | a -> å | A -> Å]
(use-package hydra
  :demand t)
(defhydra hydra-swedish-vowels (:color blue)
  "Swedish vowels"
  ("e" (insert ?ä) "ä")
  ("E" (insert ?Ä) "Ä")
  ("o" (insert ?ö) "ö")
  ("O" (insert ?Ö) "Ö")
  ("a" (insert ?å) "å")
  ("A" (insert ?Å) "Å"))
(global-set-key (kbd "C-c s") 'hydra-swedish-vowels/body)

;;; C-c g [s -> ß | a -> ä | A -> Ä | o -> ö | O -> Ö | u -> ü | U -> Ü]
(defhydra hydra-german-letters (:color blue)
  "German letters"
  ("s" (insert ?ß) "ß")
  ("a" (insert ?ä) "ä")
  ("A" (insert ?Ä) "Ä")
  ("o" (insert ?ö) "ö")
  ("O" (insert ?Ö) "Ö")
  ("u" (insert ?ü) "ü")
  ("U" (insert ?Ü) "Ü"))
(global-set-key (kbd "C-c g") 'hydra-german-letters/body)

;;; C-c e eval-print-last-sexp
(define-key lisp-interaction-mode-map (kbd "C-c e") #'eval-print-last-sexp)

;;; C-x C-l downcase-region
(put 'downcase-region 'disabled nil)
;;; C-x C-u upcase-region
(put 'upcase-region 'disabled nil)

;;; C-/ undo-tree-undo
;;; C-? undo-tree-redo
;;; C-x u undo-tree-visualize
(use-package undo-tree
  :config (global-undo-tree-mode)
  :bind (("C-/" . undo-tree-undo)
         ("C-?" . undo-tree-redo)
         ("C-x u" . undo-tree-visualize))
  :demand t)

;; use M-<mouse-1> for mouse-2, because mac trackpads are bad
(define-key key-translation-map (kbd "M-<mouse-1>") (kbd "<mouse-2>"))

;;; C-c m become-fullscreen
;; defined in window-settings.el
(global-set-key (kbd "C-c m") #'become-fullscreen)

(defun become-fullscreen ()
  (interactive)
  (if (eq system-type 'darwin)
      'toggle-frame-fullscreen
    'toggle-frame-maximized))

;;; C-m newline-with-block-support
;; C-m does a funky newline which puts delimiters where i expect them
;; to be, i.e. on the lines preceding and following point.
(defvar *delimiters* '((?{ . ?})
                       (?\( . ?\))
                       (?\[ . ?\])
                       (?< . ?>)))
(defun pair-of-delimiters-p (first second)
  "Returns T if FIRST is an opening delimiter and SECOND is its corresponding close delimeter."
  (eq (cdr (assq first *delimiters*)) second))
(defun point-between-delimiters-p ()
  "Returns T if the characters preceding and following point are matching delimiters, or nil otherwise."
  (pair-of-delimiters-p (char-before) (char-after)))
(defun newline-at-block ()
  "Open a c-style block at point, leaving point on an empty indented line."
  (newline-and-indent)
  (open-line 1))
(defun newline-with-block-support ()
  "If the characters preceding and following point are matching delimiters, insert and indent a blank line between them. Otherwise, `newline-and-indent' as normal."
  (interactive)
  (if (point-between-delimiters-p)
      (newline-at-block)
    (newline-and-indent)))
(global-set-key (kbd "C-m") #'newline-with-block-support)

;;;; smartparens
;; C-[( | )] to slurp
;; C-[{ | }] to barf
;; C-c [ to toggle strict mode
;;; C-) sp-forward-slurp-sexp
;;; C-( sp-backward-slurp-sexp
;;; C-} sp-forward-barf-sexp
;;; C-{ sp-backward-barf-sexp
;;; C-c [ smartparens-strict-mode
(use-package smartparens
  :demand t
  :config
  (add-to-list 'sp-lisp-modes 'sly-mrepl-mode)
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  (smartparens-global-strict-mode 1)
  :bind (("C-)" . sp-forward-slurp-sexp)
         ("C-}" . sp-forward-barf-sexp)
         ("C-(" . sp-backward-slurp-sexp)
         ("C-{" . sp-backward-barf-sexp)
         ("C-c [" . smartparens-strict-mode)))

;;;; compilation
;;; C-c c compile
;;; c-c r recompile
(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c r") #'recompile)

(provide 'keybinding-settings)
