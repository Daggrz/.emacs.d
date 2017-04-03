
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
(if (display-graphic-p)
    (setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
                              (sequence "⚑ WAITING(w)" "|")
                              (sequence "|" "✘ CANCELED(c)"))))
(setq org-src-fontify-natively t)

(setq evil-want-C-i-jump nil)
(setq evil-toggle-key "C-`")
(require 'evil)

(global-evil-leader-mode)

(evil-mode 1)

(evil-leader/set-leader ",")

(evil-leader/set-key
 "i" 'find-user-init-file
 "c" 'find-user-config-file
 "b" 'switch-to-buffer
 "f" 'toggle-frame-fullscreen
 "t" 'org-bullets-mode)

(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "E") 'end-of-line)
(define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "B") 'beginning-of-line)

;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;; Make horizontal movement cross lines
;;(setq-default evil-cross-lines t)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-normal-state-map "qt" 'load-user-init-file)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(require 'flycheck)
(global-flycheck-mode t)

(require 'move-text)
(move-text-default-bindings)

(require 'yasnippet)
(yas-global-mode 1)

;;(setq split-height-threshold 0)  ;; To set functions that auto-create a split
;;(setq split-width-threshold nil) ;; window to split them horizontally

(menu-bar-mode -1)        ;; to remove the toolbar at the top

(if (display-graphic-p)
    (scroll-bar-mode -1)) ;; to remove the scrollbars in GUI mode
(ido-mode t)              ;; for the scrolling buffer selection menu

;; Rebind help to F1
(global-set-key (kbd "<f1>") 'help-command)

;; A function to open the init file in split window
(defun find-user-init-file ()
  (interactive)
  (find-file-other-window user-init-file))
;; A function to open the config file in split window
(defun find-user-config-file()
  (interactive)
  (find-file-other-window "~/.emacs.d/config.org"))
;; A function that loads the init file
(defun load-user-init-file()
  (interactive)
  (load-file user-init-file))

(setq python-shell-interpreter "/usr/local/bin/python3.6")

(setq python-shell-native-complete nil)

(fset 'yes-or-no-p 'y-or-n-p)

(global-relative-line-numbers-mode)
