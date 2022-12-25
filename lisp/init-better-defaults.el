;;; init-ui.el -*- lexical-binding:t no-byte-compile: t -*-
;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)
(delete-selection-mode 1)

(setq tab-always-indent 'complete)

(electric-pair-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(use-package emacs
:config (defalias 'yes-or-no-p 'y-or-n-p))
;; (fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)
(setq confirm-kill-processes nil)
(defun my/tianqi ()
    "天气预报 based on https://github.com/chubin/wttr.in"
    (interactive)
    (eww "zh-cn.wttr.in/Tianhe?TAFm"))
(provide 'init-better-defaults)
