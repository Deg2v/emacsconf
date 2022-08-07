
;; expore
;; (defun consult-directory-externally (file)
;;   "Open FILE externally using the default application of the system."
;;   (interactive "fOpen externally: ")
;;   (if (and (eq system-type 'windows-nt)
;; 	   (fboundp 'w32-shell-execute))
;;       (shell-command-to-string (encode-coding-string (replace-regexp-in-string "/" "\\\\"
;; 	    (format "explorer.exe %s" (file-name-directory (expand-file-name file)))) 'gbk))
;;     (call-process (pcase system-type
;; 		    ('darwin "open")
;; 		    ('cygwin "cygstart")
;; 		    (_ "xdg-open"))
;; 		  nil 0 nil
;; 		  (file-name-directory (expand-file-name file)))))
;; (require 'embark)
;;  (eval-after-load 'embark
;;    (define-key embark-file-map (kbd "E") #'consult-directory-externally))

;; emax
;; (progn
;; 	(defvar emax-root (concat (expand-file-name "~") "/emax"))
;; 	(defvar emax-bin (concat emax-root "/bin"))
;; 	(defvar emax-bin64 (concat emax-root "/bin64"))

;; 	(setq exec-path (cons emax-bin exec-path))
;; 	(setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

;; 	(setq exec-path (cons emax-bin64 exec-path))
;; 	(setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

;; 	(setq emacsd-bin (concat user-emacs-directory "bin"))
;; 	(setq exec-path (cons  emacsd-bin exec-path))
;; 	(setenv "PATH" (concat emacsd-bin  ";" (getenv "PATH")))

	;;可选安装msys64
	;;下载地址: http://repo.msys2.org/mingw/sources/
	;; (setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

	;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
	;;   (add-to-list 'load-path dir))
	;; )


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

;; (package-install 'monokai)

;;(load-theme 'monokai 1)

;; 快捷键
;; (setq w32-pass-lwindow-to-system nil)  ; 左windows键
;; (setq w32-lwindow-modifier 'super)

;; (setq w32-pass-rwindow-to-system nil) ; 右windows键
;; (setq w32-rwindow-modifier 'super)
;; (w32-register-hot-key [s-])

;; (setq w32-pass-apps-to-system nil) ; 菜单键/App键
;; (setq w32-apps-modifier 'hyper)
;; (w32-register-hot-key [H-])

;; (server-mode 1)

;;(icomplete-mode -1)
