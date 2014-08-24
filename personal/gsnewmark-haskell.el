;;; gsnewmark-haskell.el --- Haskell configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(haskell-mode ghc company-ghc))

(eval-after-load 'haskell-mode
  '(progn
     (autoload 'ghc-init "ghc" nil t)

     (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
     (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

     (custom-set-variables
      '(haskell-process-suggest-remove-import-lines t)
      '(haskell-process-auto-import-loaded-modules t)
      '(haskell-process-log t)
      '(haskell-process-type 'cabal-repl))

     (define-key haskell-mode-map (kbd "C-c M-j") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

     (add-to-list 'company-backends 'company-ghc)))

(provide 'gsnewmark-haskell)

;;; gsnewmark-haskell.el ends here
