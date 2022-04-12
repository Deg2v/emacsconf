(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")

			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-install 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;
;; (use-package sth
;; :ensure t ;
;; :defrt nil
;; :init (setq ....)
;; :config (jfksldjf)
;; :bind
;; :hook)
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t))


(require 'use-package)


(use-package restart-emacs)

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(keycast-mode t)

;;magit
(package-install 'magit)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-height 180)
(setq awesome-tab-active-bar-height 150)

;; (package-install 'embark-consult)
; Minimized lsp-mode setup
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (defun lsp-save-actions ()
    "LSP actions before save."
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
	(add-hook 'before-save-hook #'lsp-format-buffer t t))
  :hook ((lsp-mode . #'lsp-enable-which-key-integration)
         (lsp-mode . #'lsp-save-actions)
         ((c-mode
           c++-mode
           python-mode
e) . lsp-deferred))
  :config
  (setq lsp-auto-guess-root t
	    lsp-headerline-breadcrumb-enable nil
	    lsp-keymap-prefix "C-c l"
	    lsp-log-io nil)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

;; Optional features, disabled default
(when nil
  (use-package lsp-ui
    :after lsp-mode
    :init
    (setq lsp-ui-doc-include-signature t
	      lsp-ui-doc-position 'at-point
          lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (add-hook 'lsp-ui-mode-hook 'lsp-modeline-code-actions-mode)
    :config
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)))

;; 文件末尾
(provide 'init-packages)
