
;; 快速打开配置文件
(defun open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
;; consult-ripgrep search word then replace them ,c-c c-c then
;; c-s can also 
(defun embark-export-write ()
  "Export the current vertico results to a writable buffer if possible.
Supports exporting consult-grep to wgrep, file to wdeired, and consult-location to occur-edit"
    (interactive)
    (require 'embark)
    (require 'wgrep)
    (pcase-let ((`(,type . ,candidates)
        (run-hook-with-args-until-success 'embark-candidate-collectors)))
    (pcase type
        ('consult-grep (let ((embark-after-export-hook #'wgrep-change-to-wgrep-mode))
                (embark-export)))
    ('file (let ((embark-after-export-hook #'wdired-change-to-wdired-mode))
        (embark-export)))
    ('consult-location (let ((embark-after-export-hook #'occur-edit-mode))
                (embark-export)))
    (x (user-error "embark category %S doesn't support writable export" x)))))
(define-key minibuffer-local-map (kbd "C-c C-e") 'embark-export-write)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key (kbd "<f12>") 'consult-imenu)
(global-set-key (kbd "C-W") 'backward-kill-word)
(provide 'init-keybinding)
