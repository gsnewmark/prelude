;;; gsnewmark-appeareance.el --- Appeareance configuration.
;;

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(prelude-require-packages '(solarized-theme smart-mode-line))

;; Solarized color theme
(custom-set-variables '(solarized-use-variable-pitch nil))

(load-theme 'solarized-dark t)

;; fix terminal background color
(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))

;; Modeline conf
(require 'smart-mode-line)

(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 35)
(setq sml/mode-width 'full)

(setf sml/hidden-modes
      (cl-list*
       " AC" " guru" " company" " Projectile" " Pre" " ws" " WS" " VHl" " yas"
       " SliNav" " Fill" " cljr" " G-+" " MRev" " Fly" " Undo-Tree" " GitGutter"
       sml/hidden-modes))

;; Set font
(add-to-list 'default-frame-alist '(font . "Menlo-9"))

;; Remove scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(provide 'gsnewmark-appeareance)

;;; gsnewmark-appeareance.el ends here
