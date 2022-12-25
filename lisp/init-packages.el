(require 'package)
;; (setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
;; 			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")))
                         ;; 添加新的 nongnu 的源
(package-initialize) ;; You might already have this line

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
    (package-refresh-contents))
;; 除非已经安装use-package,否则每次先刷新，再安装use-package
(unless (package-install 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; (use-package sth
;; :ensure t ;
;; :defrt nil
;; :init (setq ....)
;; :config (jfksldjf)
;; :bind
;; :hook)

;;; auto-update
(use-package auto-package-update
    :ensure t
    :config
    (setq auto-package-update-delete-old-versions t)
    (setq auto-package-update-hide-results t)
    (auto-package-update-maybe))

(use-package restart-emacs
    :ensure t)

(use-package posframe
    :ensure t)

(use-package benchmark-init
    :init (benchmark-init/activate)
    :hook (after-init . benchmark-init/deactivate))

(use-package all-the-icons
    :ensure t
    :if (display-graphic-p))

(use-package gnu-elpa-keyring-update)

(eval-and-compile
    (setq use-package-always-ensure t)
    ;; (setq use-package-always-defer t)
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t))

;;magit
(use-package magit
    :ensure t
    :defer t)

(use-package awesome-tab
    :load-path  "~/.emacs.d/site-lisp/awesome-tab"
    :config
    (awesome-tab-mode 1)
    (setq awesome-tab-height 180)
    (setq awesome-tab-active-bar-height 40))

(defun awesome-tab-buffer-groups ()
"`awesome-tab-buffer-groups' control buffers' group rules.
Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
(list
(cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
	(memq major-mode '(magit-process-mode
			    magit-status-mode
			    magit-diff-mode
			    magit-log-mode
			    magit-file-mode
			    magit-blob-mode
			    magit-blame-mode)))
    "Emacs")
    ((derived-mode-p 'eshell-mode)
    "EShell")
    ((derived-mode-p 'dired-mode)
    "Dired")
    ((memq major-mode '(org-mode org-agenda-mode diary-mode))
    "OrgMode")
    ((derived-mode-p 'eaf-mode)
    "EAF")
    (t
    (awesome-tab-get-group-name (current-buffer))))))
(setq make-backup-files nil)
(use-package recentf
    :init
	(recentf-mode 1)
    :config
    (setq recentf-max-menu-item 10))

;; (use-package embark-consult :ensure t)


(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024));; 1mb
;; (setq lsp-log-io)
;; (setq lsp-idle-delay)

;; ;; eglot
;; (use-package eglot
;;   :hook ((c-mode
;;           c++-mode
;;           python-mode
;;           sh-mode) . eglot-ensure)
;;   :bind (("C-c e f" . #'eglot-format)
;;          ("C-c e a" . #'eglot-code-actions)
;;          ("C-c e i" . #'eglot-code-action-organize-imports)
;;          ("C-c e q" . #'eglot-code-action-quickfix))
;;   :config
;;   ;; (setq eglot-ignored-server-capabilities '(:documentHighlightProvider))
;;   (add-to-list 'eglot-server-programs '(web-mode "vls"))
;;   (defun eglot-actions-before-save()
;;     (add-hook 'before-save-hook
;;               (lambda ()
;;                 (call-interactively #'eglot-format)
;;                 (call-interactively #'eglot-code-action-organize-imports))))
;;   (add-hook 'eglot--managed-mode-hook #'eglot-actions-before-save))
;; 文件末尾
(provide 'init-packages)
