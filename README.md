<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Theme</a></li>
<li><a href="#sec-2">2. Neo-tree</a></li>
<li><a href="#sec-3">3. Org-mode</a></li>
<li><a href="#sec-4">4. Evil-Mode</a></li>
<li><a href="#sec-5">5. Key-chords</a></li>
<li><a href="#sec-6">6. Custom binds</a></li>
</ul>
</div>
</div>


# Theme<a id="sec-1" name="sec-1"></a>

I use the nord theme because while I'm fond of dark themes the gray and black themes always felt too depressing.

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

# Neo-tree<a id="sec-2" name="sec-2"></a>

    (require 'neotree)
    (global-set-key [f8] 'neotree-toggle)

# Org-mode<a id="sec-3" name="sec-3"></a>

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
                                  (sequence "|" "✘ CANCELED(c)")))
      )
    (eval-after-load "org"
      '(require 'ox-md nil t))

# Evil-Mode<a id="sec-4" name="sec-4"></a>

The first lisp command is just to give TAB the ability to open header bullets in org-mode when in evil-mode.

    (setq evil-want-C-i-jump nil)
    (setq evil-toggle-key "C-`")
    (require 'evil)
    (evil-mode 1)
    
    (define-key evil-normal-state-map (kbd "E") 'end-of-line)
    (define-key evil-normal-state-map (kbd "B") 'beginning-of-line)
    (define-key evil-normal-state-map (kbd "j") '(kbd "gj")
    (define-key evil-normal-state-map (kbd "k") '(kbd "gk")
    (define-key evil-normal-state-map (kbd "h") '(kbd "gh")
    (define-key evil-normal-state-map (kbd "l") '(kbd "gl")
    (Evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
    (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

# Key-chords<a id="sec-5" name="sec-5"></a>

    (require 'key-chord)
    (key-chord-mode 1)
    (key-chord-define-global ",v" 'evil-mode)
    (key-chord-define-global "ag" 'org-agenda)
    (key-chord-define-global "bl" 'org-bullets-mode)
    (key-chord-define-global ",e" 'find-user-init-file)
    (key-chord-define-global "fs" 'toggle-frame-fullscreen)
    (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

# Custom binds<a id="sec-6" name="sec-6"></a>

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
    
    (setq python-shell-interpreter "/usr/local/bin/python3")
    
    
    (global-relative-line-numbers-mode)