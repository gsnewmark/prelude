;;; gsnewmark-bindings.el --- Key bindings.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-x t") 'toggle-input-method)

(global-set-key (kbd "C-x C-i") 'helm-imenu)

;;; Org-mode
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c M-.") 'org-time-stamp-inactive)

(eval-after-load 'gsnewmark-foundation
  '(progn
     ;; Multiple cursors
     (require 'multiple-cursors)
     (global-set-key (kbd "C-c m l") 'mc/edit-lines)
     (global-set-key (kbd "C-c m b") 'mc/edit-beginnings-of-lines)
     (global-set-key (kbd "C-c m e") 'mc/edit-ends-of-lines)
     (global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
     (global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
     (global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

     ;; neotree
     (require 'neotree)
     (global-set-key (kbd "M-<f1>") 'neotree-toggle)

     ;; FlySpell
     (global-set-key (kbd "<f6>") 'fd-switch-dictionary)
     (global-set-key (kbd "C-<f6>") 'flyspell-check-previous-highlighted-word)
     (global-set-key (kbd "M-<f6>") 'flyspell-check-next-highlighted-word)))

(eval-after-load 'gsnewmark-python
  '(progn
     (require 'jedi)
     (add-hook 'python-mode-hook
               '(lambda ()
                  (local-set-key (kbd "C-c C-d d") 'jedi:show-doc)
                  (local-set-key (kbd "M-.") 'jedi:goto-definition)
                  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)))))

(eval-after-load 'gsnewmark-scala
  '(progn
     (require 'ensime)
     (require 'scala-mode2)
     (add-hook 'scala-mode-hook
               '(lambda ()
                  (local-set-key (kbd "RET")
                                 '(lambda ()
                                    (interactive)
                                    (newline-and-indent)
                                    (scala-indent:insert-asterisk-on-multiline-comment)))
                  (local-set-key (kbd "<backtab>")
                                 'scala-indent:indent-with-reluctant-strategy)
                  (local-set-key (kbd "C-x '") 'sbt-run-previous-command)
                  (local-set-key (kbd "C-c M-j") 'ensime)))))

(eval-after-load 'gsnewmark-haskell
  '(progn
     (require 'haskell-mode)
     (define-key haskell-mode-map (kbd "C-c M-j") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)
     (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))

(global-set-key (kbd "C-M-o") 'ace-window)

;;; From emacs-live https://github.com/overtone/emacs-live

;;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

;;; winner undo and redo
(global-set-key (kbd "C-c w b") 'winner-undo)
(global-set-key (kbd "C-c w f") 'winner-redo)

;;; window and buffer movement
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c w /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c w '") (lambda () (interactive) (enlarge-window 1)))

;;; Git Gutter
(global-set-key (kbd "C-c v g") 'git-gutter:toggle)

;;; Jump to next/previous diff
(global-set-key (kbd "C-c v p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c v n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c v d") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-c v r") 'git-gutter:revert-hunk)

;;; mark current function
(global-set-key (kbd "C-x C-p") 'mark-defun)

;;; make ^h delete rather than help
(global-set-key (kbd "C-h") 'delete-backward-char)

;;; redefine help shortcut
(global-set-key (kbd "M-h") 'help-command)

;;; allow the deletion of words:
;;; backward kill word (forward kill word is M-d)
(global-set-key (kbd "C-\\") 'backward-kill-word)

;;; kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)

;;; set the mark
(global-set-key (kbd "C-SPC") 'set-mark-command)

;;; repeat previous command
(global-set-key (kbd "M-'") 'repeat)

;;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;;; comment region
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(global-set-key (kbd "C-s")   'isearch-forward)
(global-set-key (kbd "C-r")   'isearch-backward)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)

;;; Ace jump mode
(global-set-key (kbd "C-o") 'avy-goto-word-1)

;;; Clojure keybindings
(require 'cider)
(define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
(define-key cider-mode-map (kbd "M-RET") 'cider-doc)
(define-key cider-mode-map (kbd "M-r") 'cider-reset)

;;; SmartParens
(define-key sp-keymap (kbd "C-M-e") 'sp-backward-barf-sexp)
(define-key sp-keymap (kbd "C-M-s") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-j") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-y") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "M-S")   'sp-split-sexp)
(define-key sp-keymap (kbd "M-s")   'sp-splice-sexp)
(define-key sp-keymap (kbd "M-j")   'sp-join-sexp)

(provide 'gsnewmark-bindings)

;;; gsnewmark-bindings.el ends here
