
;;使用ripgrep来进行搜索
;;consult-ripgrep

;;everyting
;;consult-locate
;; 配置搜索中文
;; (progn
;;   (setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk))
;;   (add-to-list 'process-coding-system-alist '("es" gbk . gbk))
;;   )
;; (eval-after-load 'consult
;;   (progn
;;       (setq
;; 	consult-narrow-key "<"
;; 	consult-line-numbers-widen t
;; 	consult-async-min-input 2
;; 	consult-async-refresh-delay  0.15
;; 	consult-async-input-throttle 0.2
;; 	consult-async-input-debounce 0.1)
;;     ))

;; 快捷键
(setq w32-pass-lwindow-to-system nil)  ; 左windows键
(setq w32-lwindow-modifier 'super)

(setq w32-pass-rwindow-to-system nil) ; 右windows键
(setq w32-rwindow-modifier 'super)
(w32-register-hot-key [s-])

(setq w32-pass-apps-to-system nil) ; 菜单键/App键
(setq w32-apps-modifier 'hyper)
(w32-register-hot-key [H-])
;;;(setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application


(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切
;; (server-mode 1)

;;(icomplete-mode -1)

(use-package company
	:init
	(setq company-minimum-prefix-length 1)
	(setq company-idle-delay 0)
	(global-company-mode 1)
	:bind (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous)))

(use-package company-flx
:after (comapny)
:init
(company-flx-mode 1))


;; emax
(progn
	(defvar emax-root (concat (expand-file-name "~") "/emax"))
	(defvar emax-bin (concat emax-root "/bin"))
	(defvar emax-bin64 (concat emax-root "/bin64"))

	(setq exec-path (cons emax-bin exec-path))
	(setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

	(setq exec-path (cons emax-bin64 exec-path))
	(setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

	(setq emacsd-bin (concat user-emacs-directory "bin"))
	(setq exec-path (cons  emacsd-bin exec-path))
	(setenv "PATH" (concat emacsd-bin  ";" (getenv "PATH")))

	;;可选安装msys64
	;;下载地址: http://repo.msys2.org/mingw/sources/
	(setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

	;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
	;;   (add-to-list 'load-path dir))
	)
;; expore
(setq file-name-coding-system 'gbk)
(defun consult-directory-externally (file)
  "Open FILE externally using the default application of the system."
  (interactive "fOpen externally: ")
  (if (and (eq system-type 'windows-nt)
	   (fboundp 'w32-shell-execute))
      (shell-command-to-string (encode-coding-string (replace-regexp-in-string "/" "\\\\"
	    (format "explorer.exe %s" (file-name-directory (expand-file-name file)))) 'gbk))
    (call-process (pcase system-type
		    ('darwin "open")
		    ('cygwin "cygstart")
		    (_ "xdg-open"))
		  nil 0 nil
		  (file-name-directory (expand-file-name file)))))
(require 'embark)
;;  (eval-after-load 'embark
;;    (define-key embark-file-map (kbd "E") #'consult-directory-externally))

;;everyting
;;consult-locate
;; 配置搜索中文

(progn
  (setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk))
  (add-to-list 'process-coding-system-alist '("es" gbk . gbk))
  )


(provide 'init-windows)
