;;; init-functions -*- lexical-binding:t no-byte-compile: t -*-
(defun my-open-current-directory ()
    (interactive)
    (consult-directory-externally default-directory))


(provide 'init-functions)
