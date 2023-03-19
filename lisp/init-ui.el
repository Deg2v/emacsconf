;;; init-ui.el -*- lexical-binding:t no-byte-compile: t -*-
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(setq package-check-signature nil)


;; theme
;; (use-package gruvbox-theme
;;   :init (load-theme 'gruvbox-dark-soft t))
;;
;;modeline上显示我的所有的按键和执行的命令 bug
;; not display stats of evil
;;(use-package keycast :ensure t)
;; (add-to-list 'global-mode-string '("" keycast-mode-line))
;;(keycast-mode t)

(use-package doom-themes)
(load-theme 'doom-one 1)

;;; modeline
(use-package doom-modeline
    :ensure t
    ;; :init (doom-modeline-mode 1))
    :hook (after-init . doom-modeline-mode)
    :config
    (setq doom-modeline-icon t)
    (setq doom-modeline-modal-icon nil)
    :custom-face
    (mode-line ((t (:height 0.9))))
    (mode-line-inactive ((t (:height 0.9)))))

;; (setq doom-modeline-buffer-state-icon nil)

;;; Deprecations
;; (use-package cnfonts
;;   :if (display-graphic-p)
;; 	:defer nil
;; 	:init (cnfonts-mode 1)
;; 	:config(progn
;; (setq cnfonts-use-face-font-rescale t)
;; (setq cnfonts-profiles
;;     '("program" "org-mode" "read-book" "other"))))

;;;font config
(use-package emacs
    :if(display-graphic-p)
    :config
    ;; Font settings
    (if *is-linux*
        (progn
        ;; (set-face-attribute 'default nil  :font "CaskaydiaCove Nerd Font Mono 11")
        (set-face-attribute 'default nil  :font "CaskaydiaCove Nerd Font Mono 11")
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
			    ;; charset (font-spec :family "Microsoft YaHei UI" :size 22))))
			    ;; charset (font-spec :family "WenQuanYi Micro Hei Mono" :size 18))))
			    charset (font-spec :family "Microsoft YaHei Mono" :size 18))))
        ;; (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")
        )
    ;; Font settings
    (if *is-windows*
        (progn
        (set-face-attribute 'default nil  :font "CaskaydiaCove Nerd Font Mono 11")
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
			    charset (font-spec :family "Microsoft YaHei UI" :size 22))))
        ;; (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")
    ))


(provide 'init-ui)
