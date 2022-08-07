;;; init-ui.el -*- lexical-binding:t no-byte-compile: t -*-
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(setq package-check-signature nil)
;; (package-install 'gnu-elpa-keyring-update)
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

;;;; modeline 
;;  (use-package smart-mode-line
;;    :init
;;    (setq sml/no-confirm-load-theme t)
;;    (setq sml/theme 'respectful)
;;    (sml/setup)

;; ;;fix doom modeline
;; :custom-face
;; (mode-line ((t (:height 0.9))))
;; (mode-line-inactive ((t (:height 0.9)))))
;;;;;; ----
;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode t))
;; (require 'doom-modeline)
;; (doom-modeline-mode 1)
(use-package doom-modeline
  :ensure t
  ;; :init (doom-modeline-mode 1))
  :hook (after-init . doom-modeline-mode)
  ;; :config (setq doom-modeline-modal-icon t)
  :custom-face
(mode-line ((t (:height 0.9))))
(mode-line-inactive ((t (:height 0.9)))))
(setq doom-modeline-icon t)
(setq doom-modeline-modal-icon nil)
;; (setq doom-modeline-buffer-state-icon nil)

(use-package cnfonts
  :if (display-graphic-p)
	:defer nil
	:init (cnfonts-mode 1)
	:config(progn
(setq cnfonts-use-face-font-rescale t)
(setq cnfonts-profiles
    '("program" "org-mode" "read-book" "other"))))
(provide 'init-ui)
