;;; -*- lexical-binding: t; use-package-always-ensure: t; -*-

(use-package erc
  :demand t)

(defvar my-erc-modules '(autoaway autojoin notifications))
(defun add-erc-module (module-name)
  (add-to-list 'erc-modules module-name))
(mapc 'add-erc-module my-erc-modules)
(erc-autojoin-mode 1)

(add-to-list 'erc-autojoin-channels-alist
             `("irc\\.remexre\\.xyz" . ("#general")))

;;; from https://www.emacswiki.org/emacs/ErcNickColors
;; Pool of colors to use when coloring IRC nicks.
(defvar erc-colors-list '("#8be9fd" "#50fa7b" "#ffb86c"
			  "#ff79c6" "#bd93f9"
			  "#ff5555" "#f1fa8c"))
;; special colors for some people

(defvar erc-nick-color-alist `())

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use that color, else hash the nick and use a random color from the pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
	     (substring (md5 (downcase nick)) 0 6) 16)
	    (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (while (forward-word 1)
      (setq bounds (bounds-of-thing-at-point 'word))
      (setq word (buffer-substring-no-properties
                  (car bounds) (cdr bounds)))
      (when (or (and (erc-server-buffer-p) (erc-get-server-user word))
                (and erc-channel-users (erc-get-channel-user word)))
        (put-text-property (car bounds) (cdr bounds) 
                           'face (cons 'foreground-color
                                       (erc-get-color-for-nick word)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)

(defun erc-list-channels ()
  (interactive)
  (erc-with-server-buffer
    (erc-once-with-server-event
     321
     (let ((buf (current-buffer)))
       (lambda (_proc _parsed)
	 (erc-list-install-322-handler buf)))))
  (erc-server-send "LIST"))

(defun erc-nathan-connect ()
  (interactive)
  (erc-tls :server "irc.remexre.xyz" :port 12345 :nick "phoebe" :full-name "Phoebe"))

(defun completing-read-user (prompt history)
  (completing-read prompt erc-channel-users nil nil nil history nil t))

(defvar erc-dm-users-history ())

(defun erc-direct-message (name)
  (interactive (list (completing-read-user "DM user: " 'erc-dm-users-history)))
  (erc-query name (current-buffer)))

(bind-key "C-c C-l" 'erc-list-channels erc-mode-map)
(bind-key "C-c d" 'erc-direct-message erc-mode-map)

(provide 'erc-settings)
