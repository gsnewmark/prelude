;;; gsnewmark-foundation.el --- Misc Emacs configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(xclip idomenu git-gutter ag multiple-cursors neotree))

(setq-default tab-width 4)
(setq-default fill-column 78)

;;; Add ukrainian input method
(set-input-method 'ukrainian-computer)

;;; whitespace config
(setq whitespace-style '(face lines-tail trailing))
(setq-default whitespace-line-column fill-column)
(global-whitespace-mode t)
(setq whitespace-global-modes '(not erc-mode scala-mode))

;;; Auto refresh buffers
(global-auto-revert-mode 1)

;;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;;; Workaround for auto completion in terminal modes
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))

;;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restore the previous window configuration and kill the magit buffer."
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(setq ediff-split-window-function 'split-window-horizontally)

;;; Integrate terminal-mode clipboard with X11 one
(require 'xclip)
(turn-on-xclip)

;;; Enable flyspell for comments in programming languages
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(dolist (hook '(org-mode-hook markdown-mode-hook magit-log-edit-mode-hook))
  (add-hook hook 'flyspell-mode))

;;; dictionary switching
(defun fd-switch-dictionary()
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "ukrainian") "english" "ukrainian")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)))
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

;;; git-gutter
(global-diff-hl-mode -1)
(global-git-gutter-mode +1)

;;; Enable highlighting in Ag search results
(setq ag-highlight-search t)

(provide 'gsnewmark-foundation)

;;; gsnewmark-foundation.el ends here
