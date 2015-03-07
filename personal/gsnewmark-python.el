;;; gsnewmark-python.el --- Python configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-package 'company-jedi)

(setq jedi:tooltip-method nil)

(add-hook 'python-mode-hook
          '(lambda ()
             (add-to-list 'company-backends 'company-jedi)
             (jedi:setup)))

(provide 'gsnewmark-python)

;;; gsnewmark-python.el ends here
