;;; init-ui.el -*- lexical-binding:t no-byte-compile: t -*-
(defconst *is-mac* (eq system-type 'darwin)
    "this is comment")
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(provide 'init-const)
