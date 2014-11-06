(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it
 ;; by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; no backups.
(setq make-backup-files nil)
(setq auto-save-default nil)

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(require 'yasnippet) ;; not yasnippet-bundle

;; peepopen: https://github.com/topfunky/PeepOpen-Issues/issues/290#issuecomment-44611464
(setq ns-pop-up-frames nil)
(add-to-list 'load-path "~/.emacs.d/textmate.el")
(require 'textmate)
(add-to-list 'load-path "~/.emacs.d/elpa/peepopen-0.1.0/")
(require 'peepopen)
(textmate-mode)

(toggle-frame-maximized)

;; enable recent-file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; command as meta
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; my rebinds
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "<M-down>") 'end-of-buffer)
(global-set-key (kbd "<M-up>") 'beginning-of-buffer)
(global-set-key (kbd "M-n") 'end-of-buffer)
(global-set-key (kbd "M-p") 'beginning-of-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-t") 'shell)
(global-set-key (kbd "M-F") 'query-replace)

(global-linum-mode t)

;; Febuiles dotemacs
;; interpret and use ansi color codes in shell output windows
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; hide all the chrome.
(setq inhibit-startup-message t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ns-use-native-fullscreen nil)

;; interpret and use ansi color codes in shell output windows
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; use cmd as meta in Carbon Emacs
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'option)

;; hide all the chrome.
(setq inhibit-startup-message t)
(menu-bar-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ns-use-native-fullscreen nil)

;; hour/day in mode line
(display-time)

;; see if you're working with assholes.
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(server-start)

;; Nice fonts
(set-default-font "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute 'default nil :height 130)

(load-file "~/.emacs.d/color-theme-tomorrow.el")
;;(color-theme-initialize)
;;(color-theme-tomorrow-night)

(windmove-default-keybindings)