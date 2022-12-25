
(use-package evil
    :ensure t
    ;; :defer nil
    :init
    (setq evil-want-C-u-scroll t)
    (setq evil-want-keybinding nil)

    ;; :hook (after-init . evil-mode)
    :config
    (evil-mode 1))
;;; disable evil in orgmode
(add-to-list 'evil-emacs-state-modes 'org-mode)
(provide 'init-evil)
