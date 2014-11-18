;;; gsnewmark-prog.el --- Common programming modes configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(yaml-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$"    . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.raml\\'" . yaml-mode))

;; Enable auto-fill
(add-hook 'prog-mode-hook
          (lambda ()
            (auto-fill-mode)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (auto-fill-mode)))

;; Enable auto-indent
(electric-indent-mode +1)

(provide 'gsnewmark-prog)

;;; gsnewmark-prog.el ends here
