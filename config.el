
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 
  (custom-set-faces
   '(col-highlight ((t (:background "color-233"))))
   '(hl-line ((t (:background "color-233"))))
   '(Lazy-Highlight ((t (:background "black" :foreground "white" :underline t))))
   '(neo-dir-link-face ((t (:foreground "cyan"))))
   '(neo-file-link-face ((t (:foreground "white"))))
  )
  (custom-set-variables
   '(custom-enabled-themes (quote (nord)))
   '(custom-safe-themes (quote ("bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" "6bcfa702a7ab0fd99aa61b1ae35641c3c936be41d1d1d30af8a4afe0e6ae8a11" default)))
   '(ns-use-native-fullscreen t)
  )

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;setting up the org-bullets mode
;;and configuring todo keywords
(use-package org-bullets
:ensure t
:init
(if (display-graphic-p)
  (setq org-bullets-bullet-list '("◉" "◎" "⚫" "○" "►" "◇"))
)
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(setq org-todo-keywords '((sequence "☛ TODO(t)" "⚑ WAITING(w)" "|" "✘ CANCELED(c)" "✔ DONE(d)")))

(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "ev" 'evil-mode)
(key-chord-define-global "ag" 'org-agenda)
(key-chord-define-global "bl" 'org-bullets-mode)
(key-chord-define-global "nt" 'find-user-init-file)
(key-chord-define-global "fs" 'toggle-frame-fullscreen)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(menu-bar-mode -1)        ;; to remove the toolbar at the top
(if (display-graphic-p)
    (scroll-bar-mode -1)) ;; to remove the scrollbars in GUI mode
(ido-mode t)              ;; for the scrolling buffer selection menu

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

;; A function to open the init file in current window
(defun find-user-init-file ()
  (interactive)
  (find-file user-init-file))

(setq python-shell-interpreter "/usr/local/bin/python3.6")


(global-relative-line-numbers-mode)
