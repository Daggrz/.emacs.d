(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (nord)))
 '(custom-safe-themes
   (quote
    ("bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "6bcfa702a7ab0fd99aa61b1ae35641c3c936be41d1d1d30af8a4afe0e6ae8a11" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ns-use-native-fullscreen t)
 '(package-selected-packages
   (quote
    (elpy python-mode auto-complete-clang rtags auto-complete-c-headers flycheck move-text yasnippet evil-leader cyberpunk-theme virtualenv jedi powerline-evil powerline use-package org-beautify-theme org-bullets relative-line-numbers key-chord projectile neotree hardcore-mode evil-tutor evil python)))
 '(semantic-mode t))

;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Lazy-Highlight ((t (:background "black" :foreground "white" :underline t))))
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white")))))

(require 'org)
(eval-after-load "org"
  '(require 'ox-md nil t))
(org-babel-load-file (concat user-emacs-directory "config.org"))
