;;; init-ui.el -*- lexical-binding:t no-byte-compile: t -*-
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )
(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))
(add-hook 'prog-mode-hook (lambda () (progn(setq-default tab-width 4)
(setq tab-width 4))))
(provide 'init-basic)
