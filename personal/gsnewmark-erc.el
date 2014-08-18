;;; gsnewmark-erc.el --- IRC configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-package 'erc-hl-nicks)

(require 'erc)
(require 'erc-hl-nicks)

(setq erc-hide-list '("JOIN" "NICK" "PART" "QUIT" "MODE"))

(provide 'gsnewmark-erc)

;;; gsnewmark-erc.el ends here