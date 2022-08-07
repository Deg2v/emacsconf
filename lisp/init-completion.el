
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

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (prog-mode . yas-minor-mode)
  :config (yas-reload-all)
  :bind ("C-o" . yas-expand))
(use-package yasnippet-snippets :diminish)

(use-package posframe)
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(add-to-list 'load-path (expand-file-name "~/Downloads/lsp-bridge"))


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
;; embark-act pop context 
;; c-x x-h can execute command and needn't remember key



(use-package consult :ensure t)
;;replace swiper
(global-set-key (kbd "C-s") 'consult-line)
;;consult-imenu

(use-package orderless :ensure t)
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



(use-package wgrep
  :commands wgrep-change-to-wgrep-mode
  :config (setq wgrep-auto-save-buffer t))

(provide 'init-completion)
