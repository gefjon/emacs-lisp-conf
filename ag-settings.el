;;; -*- lexical-binding: t -*-

(declare-function message-load-file "utility-fns" () nil)
(declare-function add-hook-to-all-major-modes "utility-fns" (hook) nil)

(message-load-file)

(use-package ag
  :if (executable-find "ag")
  :demand t
  :init
  (let ((extension-list '()))
    (cl-labels ((clean-and-call (to-call)
                                (interactive)
                                (setf extension-list '())
                                (call-interactively to-call))
                (finalize-ag ()
                             (interactive)
                             (cond
                              ((not extension-list)
                               (clean-and-call 'ag))

                              ((cl-subsetp '(dired files) extension-list)
                               (progn
                                 (setf extension-list '())
                                 (message "DIRED and FILES are not compatible")))

                              ((cl-subsetp '(dired project regexp) extension-list)
                               (clean-and-call 'ag-project-dired-regexp))

                              ((cl-subsetp '(dired project) extension-list)
                               (clean-and-call 'ag-project-dired))

                              ((cl-subsetp '(dired regexp) extension-list)
                               (clean-and-call 'ag-dired-regexp))

                              ((memq 'dired extension-list)
                               (clean-and-call 'ag-dired))

                              ((cl-subsetp '(project regexp) extension-list)
                               (progn
                                 (setf extension-list '())
                                 (message "PROJECT and REGEXP are not compatible")))

                              ((cl-subsetp '(files project) extension-list)
                               (clean-and-call 'ag-project-files))
                              
                              ((cl-subsetp '(files regexp) extension-list)
                               (clean-and-call 'ag-files-regexp))
                              
                              ((memq 'project extension-list)
                               (clean-and-call 'ag-project))
                              
                              ((memq 'files extension-list)
                               (clean-and-call 'ag-files))

                              ((memq 'regexp extension-list)
                               (clean-and-call 'ag-regexp))

                              (t (clean-and-call 'ag))))
                (add-files ()
                           (interactive)
                           (setf extension-list
                                 (cons 'files extension-list))
                           (message "%S" extension-list))
                (add-project ()
                             (interactive)
                             (setf extension-list
                                   (cons 'project extension-list))
                             (message "%S" extension-list))
                (add-regexp ()
                            (interactive)
                            (setf extension-list
                                  (cons 'regexp extension-list))
                            (message "%S" extension-list))
                (add-dired ()
                           (interactive)
                           (setf extension-list
                                 (cons 'dired extension-list))
                           (message "%S" extension-list)))
      (defhydra hydra-ag (:color red :exit nil)
        "ag"
        ("a" finalize-ag "run" :exit t)
        ("f" add-files "files")
        ("p" add-project "project")
        ("r" add-regexp "regexp")
        ("d" add-dired "dired"))))
  (global-set-key (kbd "C-c f") 'hydra-ag/body))

(provide 'ag-settings)
