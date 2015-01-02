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

(setq ag-highlight-search t)
(show-paren-mode 1)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'neotree-find)

(add-hook 'after-init-hook #'projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(setq projectile-remember-window-configs t)

(global-auto-revert-mode t)

;; no backups.
(setq make-backup-files nil)
(setq auto-save-default nil)

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20141117.327")
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/textmate.el")
(require 'textmate)
(textmate-mode)

;; YAML mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; rspec-mode
;; (add-to-list 'load-path "~/.emacs.d/elpa/rspec-mode-20141005.1509")
;; (require 'rspec-mode)
;; (eval-after-load 'rspec-mode
;;   '(rspec-install-snippets))

;; markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; disable soft returns
(setq truncate-partial-width-windows nil)

;; enable recent-file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; command as meta
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;; delete selection on edit
(delete-selection-mode t)
(setq transient-mark-mode t)
;; Ctrl-K with no kill
(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
)
(global-set-key (kbd "C-k") 'delete-line-no-kill)

(defun increase-font-size ()
  (set-face-attribute 'default (selected-frame) :height (+ (face-attribute 'default :height) 10)))

(defun decrease-font-size ()
  (set-face-attribute 'default (selected-frame) :height (- (face-attribute 'default :height) 10)))

(defun font-larger ()
  "Increases font size."
  (interactive)
  (increase-font-size))

(defun font-smaller ()
  "Decreases font size."
  (interactive)
  (decrease-font-size))

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; my rebinds
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "<M-down>") 'end-of-buffer)
(global-set-key (kbd "<M-up>") 'beginning-of-buffer)
(global-set-key (kbd "M-n") 'end-of-buffer)
(global-set-key (kbd "M-p") 'beginning-of-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-t") 'shell)
(global-set-key (kbd "M-R") 'query-replace)
(global-set-key (kbd "M-F") 'ag-project-files)
(global-set-key (kbd "C-j") 'hippie-expand)
(global-set-key (kbd "C-x <C-down>") 'move-text-down)
(global-set-key (kbd "C-x <C-up>") 'move-text-up)
(global-set-key (kbd "M-t") 'projectile-find-file)
(global-set-key [f3] 'revert-buffer)
(global-set-key (kbd "M-s") 'save-buffer)

;; show column and line numbers.
(setq column-number-mode t)
(global-linum-mode t)

;; Go mode
;; Automatically formats your code to the one true coding style, used by every Go developer.
(add-hook 'before-save-hook 'gofmt-before-save)
;; only load company-mode with go
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

;; Febuiles dotemacs
;; interpret and use ansi color codes in shell output windows
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; hide all the chrome.
(setq inhibit-startup-message t)
(menu-bar-mode 1)
(setq ns-use-native-fullscreen nil)

(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; use cmd as meta in Carbon Emacs
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'option)

;; hour/day in mode line
(display-time)

;; see if you're working with assholes.
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(load "server")
(unless (server-running-p) (server-start))

;; Nice fonts
(set-default-font "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute 'default nil :height 130)

(load-file "~/.emacs.d/color-theme-tomorrow.el")
;;(color-theme-initialize)
;;(color-theme-tomorrow-night)

(windmove-default-keybindings)

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "~/.emacs.d/elpa/exec-path-from-shell-20140731.907")
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
