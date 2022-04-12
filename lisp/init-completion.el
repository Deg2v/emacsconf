(use-package company
	:init
	(setq company-minimum-prefix-length 1)
	(setq company-idle-delay 0)
	(global-company-mode 1))
(use-package company-flx
:after (comapny)
:init
(company-flx-mode 1))

(use-package vertico
  :hook (after-init . vertico-mode)
  :config
  (setq vertico-resize nil
        vertico-count 17
        vertico-cycle t)
  ;; Cleans up path when moving directories with shadowed paths syntax, e.g.
  ;; cleans ~/foo/bar/// to /, and ~/foo/bar/~/ to ~/.
  (add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)
  (add-hook 'minibuffer-setup-hook #'vertico-repeat-save)
  (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous)
  (define-key vertico-map [backspace] #'vertico-directory-delete-char)
  (define-key vertico-map (kbd "s-SPC") #'+vertico/embark-preview)
  )


;; add comment to the option in minibuffer
(use-package marginalia
  :hook (after-init . marginalia-mode)
  :init
  :config
  ;; (advice-add #'marginalia--project-root :override #'doom-project-root)
  ;; (pushnew! marginalia-command-categories
  ;;           '(+default/find-file-under-here. file)
  ;;           '(doom/find-file-in-emacsd . project-file)
  ;;           '(doom/find-file-in-other-project . project-file)
  ;;           '(doom/find-file-in-private-config . file)
  ;;           '(doom/describe-active-minor-mode . minor-mode)
  ;;           '(flycheck-error-list-set-filter . builtin)
  ;;           '(persp-switch-to-buffer . buffer)
  ;;           '(projectile-find-file . project-file)
  ;;           '(projectile-recentf . project-file)
  ;;           '(projectile-switch-to-buffer . buffer)
  ;;           '(projectile-switch-project . project-file))
  )



(use-package embark
:defer t
:init
(setq prefix-help-command 'embark-prefix-help-command)
(global-set-key (kbd "C-;") 'embark-act)
)



(package-install 'consult)
;;replace swiper
(global-set-key (kbd "C-s") 'consult-line)
;;consult-imenu

(package-install 'orderless)
(setq completion-styles '(orderless))


(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand
  :config
  (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))


(use-package which-key
:ensure t
:init (which-key-mode))
;;   (eval-after-load
;;     'consult
;;   '(eval-after-load
;;        'embark
;;      '(progn
;; 	(require 'embark-consult)
;; 	(add-hook
;; 	 'embark-collect-mode-hook
;; 	 #'consult-preview-at-point-mode))))

(with-eval-after-load 'company
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous))


(use-package wgrep
  :commands wgrep-change-to-wgrep-mode
  :config (setq wgrep-auto-save-buffer t))

(provide 'init-completion)
