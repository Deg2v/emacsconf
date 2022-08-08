
(use-package evil
  :ensure t
  :defer nil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(provide 'init-evil)
