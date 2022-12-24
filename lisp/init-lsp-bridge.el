
;;;;; (require 'yasnippet)   ;;; already
;;; epc orjson 
;;; posframe markdown-mode yasnippet

(use-package lsp-bridge
  ;; :defer nil
  :load-path "~/.emacs.d/site-lisp/lsp-bridge")
  ;; :config ())
(setq lsp-bridge-auto-format-code-idle 5)
(setq lsp-bridge-enable-auto-format-code t)

;; (require 'lsp-bridge)
;; (require 'lsp-bridge-jdtls)       ;; provide Java third-party library jump and -data directory support, optional

(yas-global-mode 1)
(global-lsp-bridge-mode)
(provide 'init-lsp-bridge)
