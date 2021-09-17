;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

;;; utf-8 because it's the 21st century
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;; just a whole bunch of config vars
(setf
 ;; put stuff in .emacs.d
 backup-directory-alist (list (cons "." (concat user-emacs-directory
                                                     "backups")))

 ;; flash for bell instead of making a noise
 visible-bell t
 ring-bell-function 'ignore

 ;; start in *scratch* instead of the logo
 inhibit-startup-screen t
 
 ;; read-quoted-char in hex
 read-quoted-char-radix 16

 ;; things which require no explanation
 require-final-newline t
 load-prefer-newer t
 tab-stop-list (number-sequence 2 120 2)
 compilation-scroll-output 'first-error
 shell-command-dont-erase-buffer t)

(setq-default
 ;; 90-char lines
 fill-column 90)

;;; reopen files with point in the place it was when closed
(use-package saveplace
  :ensure nil
  :config
  (setf save-place-file (concat user-emacs-directory "places"))
  (save-place-mode 1)
  :demand t)

(use-package rx
  :ensure nil
  :demand t)

(use-package re-builder
  :ensure nil
  :after rx
  :config (setf reb-re-syntax 'rx)
  :demand t)

;;; garbage collect on focus-out
(defun gc-if-unfocused ()
  (unless (cl-find t (mapcar #'frame-focus-state (frame-list)))
    (garbage-collect)))
(if (string-version-lessp emacs-version "27.1")
    (add-hook 'focus-out-hook #'gc-if-unfocused)
  (add-function :after after-focus-change-function #'gc-if-unfocused))

;;; read the chars y or n instead of the strings yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;;; as in modern oses, typing with a selection active replaces it
(delete-selection-mode 1)

(use-package dockerfile-mode
  :mode "Dockerfile[^[:space:]]*")

;;; show column number in modeline
(column-number-mode 1)

;;; indent with spaces
(setq-default indent-tabs-mode nil)

(use-package tramp
  :config (setf tramp-default-method "ssh")
  :demand t)
(use-package flycheck
    :demand t)
(use-package flyspell
  :ensure nil
  :demand t)
(use-package yaml-mode
  :mode "\\.yml\\'")

;;; if multiple buffers have the same filename, add more of the full
;;; path to the beginning of the buffer name to disambiguate
(use-package uniquify
  :ensure nil
  :config (setf uniquify-buffer-name-style 'forward)
  :demand t)

;;; display line numbers using the sexy high-performance c library
(use-package display-line-numbers
  :ensure nil
  :if (>= emacs-major-version 26)
  :config
  (setf display-line-numbers-grow-only t
        display-line-numbers-width-start 4
        display-line-numbers-width 4)
  (global-display-line-numbers-mode)
  :demand t)

;;; ag search
(use-package ag
  :demand t)

;;; project(ile)
(use-package projectile
  :config (projectile-mode)
  :demand t)
(use-package counsel-projectile
  :after (counsel projectile)
  :config (counsel-projectile-mode)
  :demand t)

;;; (ma)git
(use-package magit
  :config (setf magit-completing-read-function 'ivy-completing-read)
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))

;;; rainbow-delims
(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  :demand t)

(use-package gnuplot
  :demand t
  :mode ("\\.gp\\'" . gnuplot-mode))

(use-package llvm-mode
  :load-path "/usr/local/src/llvm/utils/emacs"
  :mode "\\.llvm\\'")

(use-package unicode-fonts
  :demand t
  :config (unicode-fonts-setup))

;;; auto-save stuff
;; keep auto-save files in a subdir of .emacs.d, instead of next to their source files

(defvar auto-save-files-dir
  (expand-file-name (concat user-emacs-directory "auto-saves/"))
  "Parent directory in which to store auto-save files")

(setf auto-save-file-name-transforms `((".*" ,auto-save-files-dir t)))

(provide 'misc-settings)
