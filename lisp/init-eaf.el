;;; init-eaf.el -*- lexical-binding:t no-byte-compile: t -*-

(use-package eaf
  ;; :defer nil
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"

  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
    (eaf-browser-continue-where-left-off t)
    (eaf-browser-enable-adblocker t)
    (browse-url-browser-function 'eaf-open-browser)
  :config
    (require 'eaf-markdown-previewer)
    (require 'eaf-pdf-viewer)
    (require 'eaf-image-viewer)
    ;; (require 'eaf-browser)
    ;; (require 'eaf-demo)
    (require 'eaf-org-previewer)
    (setq eaf-python-command "/usr/bin/python3")
(setq eaf-buffer-background-color "#FFFFFF")

    (defalias 'browse-web #'eaf-open-browser)
    (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
    (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
    ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
    ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki
    )


(provide 'init-eaf)
