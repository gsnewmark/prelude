;;; gsnewmark-python.el --- Python configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-package 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'gsnewmark-python)

;;; gsnewmark-python.el ends here
