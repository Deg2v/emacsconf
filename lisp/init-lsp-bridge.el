
;;;;; (require 'yasnippet)   ;;; already
(require 'lsp-bridge)
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)       ;; provide Java third-party library jump and -data directory support, optional
(setq lsp-bridge-auto-format-code-idle 5)
(setq lsp-bridge-enable-auto-format-code t)
(yas-global-mode 1)
(global-lsp-bridge-mode)
(provide 'init-lsp-bridge)
