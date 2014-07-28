(prelude-require-packages '(solarized-theme smart-mode-line))

;; Solarized color theme
(custom-set-variables '(solarized-use-variable-pitch nil))

(load-theme 'solarized-dark t)

(if (not window-system) '(default ((t (:background "nil")))))

;; Modeline conf
(require 'smart-mode-line)

(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 35)
(setq sml/mode-width 'full)

(add-to-list 'sml/hidden-modes " AC")
(add-to-list 'sml/hidden-modes " guru")
(add-to-list 'sml/hidden-modes " company")
(add-to-list 'sml/hidden-modes " Projectile")
(add-to-list 'sml/hidden-modes " Pre")
(add-to-list 'sml/hidden-modes " ws")
(add-to-list 'sml/hidden-modes " Undo-Tree")
(add-to-list 'sml/hidden-modes " VHl")
(add-to-list 'sml/hidden-modes " SliNav")
(add-to-list 'sml/hidden-modes " Fill")
(add-to-list 'sml/hidden-modes " yas")
(add-to-list 'sml/hidden-modes " cljr")
(add-to-list 'sml/hidden-modes " G-+")

;; Set font
(add-to-list 'default-frame-alist '(font . "Menlo-9"))

;; Remove scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
