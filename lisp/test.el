
(unless (package-install 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  )
