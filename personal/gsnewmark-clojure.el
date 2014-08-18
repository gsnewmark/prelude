;;; gsnewmark-clojure.el --- Clojure configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'cider)

(setq cider-repl-use-clojure-font-lock t)

(defun cider-reset ()
  (interactive)
  (cider-interactive-eval "(user/reset)"))

(provide 'gsnewmark-clojure)

;;; gsnewmark-clojure.el ends here