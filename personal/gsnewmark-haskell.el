;;; gsnewmark-haskell.el --- Haskell configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-type 'cabal-repl))

(define-key haskell-mode-map (kbd "C-c M-j") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

(provide 'gsnewmark-haskell)

;;; gsnewmark-haskell.el ends here
