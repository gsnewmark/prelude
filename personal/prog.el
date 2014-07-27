;; Enable auto-fill
(add-hook 'prog-mode-hook
          (lambda ()
            (auto-fill-mode)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (auto-fill-mode)))

;; Enable auto-indent
(electric-indent-mode +1)
