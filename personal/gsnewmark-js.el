;;; gsnewmark-js.el --- JavaScript configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(js2-mode company-tern tern skewer-mode))

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(js2-imenu-extras-mode)

(eval-after-load 'tern
  '(progn
     (setq company-tern-property-marker "")
     (set (make-local-variable 'company-backends) '(company-tern))))

(eval-after-load 'skewer-mode
  '(progn
     (set (make-local-variable 'httpd-port) 4242)))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;;; gsnewmark-js.el ends here
