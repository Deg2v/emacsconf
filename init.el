; -*- lexical-binding: t -*-
;(setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-basic)
(require 'init-const)
(require 'init-functions)
(require 'init-keybinding)
(require 'init-better-defaults)
(require 'init-completion)
(require 'init-ui)
(require 'init-org)
(require 'init-evil)


(when *is-linux*
  (progn (require 'init-eaf)
			(require 'init-lsp-bridge)
      ;; (require 'init-lsp)
      ;; (require 'init-corfu)
      ))

(when *is-windows* (require 'init-windows))


(setq custom-file (expand-file-name "~/.emacs.d/custome.el"))
;; (load custom-file)
(when (file-exists-p custom-file)
  (load custom-file))

