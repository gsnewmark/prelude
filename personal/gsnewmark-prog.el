;;; gsnewmark-prog.el --- Common programming modes configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

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
