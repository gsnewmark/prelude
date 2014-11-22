;;; gsnewmark-clojure.el --- Clojure configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-package 'clj-refactor)

(require 'cider)

(setq cider-repl-use-clojure-font-lock t)

(defun cider-reset ()
  (interactive)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-interactive-eval "(user/reset)")))

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-r")))

(provide 'gsnewmark-clojure)

;;; gsnewmark-clojure.el ends here
