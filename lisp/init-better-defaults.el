;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)
(delete-selection-mode 1)

(setq tab-always-indent 'complete)

(electric-pair-mode t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(show-paren-mode t)

(provide 'init-better-defaults)
