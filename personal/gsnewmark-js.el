;;; gsnewmark-js.el --- JavaScript configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(js2-mode company-tern tern skewer-mode))

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
  '(progn
     (set (make-local-variable 'company-backends) '(company-tern))))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;;; gsnewmark-js.el ends here
