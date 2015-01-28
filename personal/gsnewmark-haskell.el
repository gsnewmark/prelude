;;; gsnewmark-haskell.el --- Haskell configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(haskell-mode ghc company-ghc))

(eval-after-load 'haskell-mode
  '(progn
     (autoload 'ghc-init "ghc" nil t)

     (add-hook 'haskell-mode-hook
               (lambda ()
                 (subword-mode +1)
                 (turn-on-haskell-doc-mode)
                 (turn-on-haskell-indentation)
                 (ghc-init)
                 (rainbow-delimiters-mode)))

     (custom-set-variables
      '(haskell-process-suggest-remove-import-lines t)
      '(haskell-process-auto-import-loaded-modules t)
      '(haskell-process-log t)
      '(haskell-tags-on-save t)
      '(company-ghc-show-info 'oneline)
      '(haskell-process-type 'cabal-repl))

     (add-to-list 'company-backends 'company-ghc)))

(provide 'gsnewmark-haskell)

;;; gsnewmark-haskell.el ends here
