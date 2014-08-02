;;; gsnewmark-bindings.el --- Key bindings.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-x t") 'toggle-input-method)

(global-set-key (kbd "C-x C-i") 'idomenu)

;; Org-mode
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; From emacs-live https://github.com/overtone/emacs-live

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

;; winner undo and redo
(global-set-key (kbd "C-c w b") 'winner-undo)
(global-set-key (kbd "C-c w f") 'winner-redo)

;;window and buffer movement
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c w /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c w '") (lambda () (interactive) (enlarge-window 1)))

;; Git Gutter
(global-set-key (kbd "C-c v g") 'git-gutter:toggle)

;; Jump to next/previous diff
(global-set-key (kbd "C-c v p") 'git-gutter:previous-diff)
(global-set-key (kbd "C-c v n") 'git-gutter:next-diff)
(global-set-key (kbd "C-c v d") 'git-gutter:popup-diff)
(global-set-key (kbd "C-c v r") 'git-gutter:revert-hunk)

;;mark current function
(global-set-key (kbd "C-x C-p") 'mark-defun)

;;make ^h delete rather than help
(global-set-key (kbd "C-h") 'delete-backward-char)

;;redefine help shortcut
(global-set-key (kbd "M-h") 'help-command)

;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
(global-set-key (kbd "C-\\") 'backward-kill-word)

;;kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)

;;set the mark
(global-set-key (kbd "C-SPC") 'set-mark-command)

;;repeat previous command
(global-set-key (kbd "M-'") 'repeat)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; comment region
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(global-set-key (kbd "C-s")   'isearch-forward)
(global-set-key (kbd "C-r")   'isearch-backward)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)

;; Ace jump mode
(global-set-key (kbd "C-o") 'ace-jump-mode)

;; Show documentation/information with M-RET
(require 'cider)
(define-key lisp-mode-shared-map (kbd "M-RET") 'live-lisp-describe-thing-at-point)
(define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
(define-key cider-mode-map (kbd "M-RET") 'cider-doc)

;; SmartParens
(define-key sp-keymap (kbd "C-M-e") 'sp-backward-barf-sexp)
(define-key sp-keymap (kbd "C-M-s") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-j") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-y") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "M-S")   'sp-split-sexp)
(define-key sp-keymap (kbd "M-s")   'sp-splice-sexp)
(define-key sp-keymap (kbd "M-j")   'sp-join-sexp)

(provide 'gsnewmark-bindings)

;;; gsnewmark-bindings.el ends here
