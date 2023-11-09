 ;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#c5c8c6"))
 '(beacon-color "#cc6666")
 '(custom-enabled-themes '(sanityinc-tomorrow-eighties))
 '(custom-safe-themes
   '("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(js-indent-level 4)
 '(package-selected-packages
   '(xref dash s editorconfig chatgpt-shell web-mode browse-at-remote ido-vertical-mode dumb-jump robe flx-ido flx ivy jedi projectile-rails color-theme-solarized ## yasnippet virtualenvwrapper virtualenv use-package thrift string-inflection rspec-mode puppetfile-mode puppet-mode projectile neotree multiple-cursors move-text lua-mode let-alist json-mode js2-mode jedi-core grizzl go-guru go-autocomplete git-commit-training-wheels-mode git-blame gist f exec-path-from-shell elixir-mode direx company-go coffee-mode ag 0blayout))
 '(safe-local-variable-values '((encoding . utf-8)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(go-guru-hl-identifier-face ((t (:inherit highlight :background "#3e4446")))))

;; SOFT TABS MAYBE.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq ag-highlight-search t)
(show-paren-mode 1)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'neotree-find)

;; (add-hook 'after-init-hook #'projectile-mode)
(setq projectile-completion-system 'ivy)
;; (setq projectile-completion-system 'ido)
;; (require 'ido-vertical-mode)
;; (setq ido-vertical-define-keys 'C-n-and-C-p-only)

(setq projectile-remember-window-configs t)

(global-auto-revert-mode t)

;; no backups.
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
(setq create-lockfiles nil)

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20170216.1928")
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/snippets/yasnippets-rails")

;; YAML mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; disable soft returns
(setq truncate-partial-width-windows nil)

;; enable recent-file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

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

;; Show full file path
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

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
(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "M-t") 'projectile-find-file)
(global-set-key (kbd "M-T") 'textmate-goto-symbol)
(global-set-key [f3] 'revert-buffer)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-/") 'comment-line)

;; UPDATE me for when I'm not in go-mode
;; (global-set-key (kbd "C-c j") 'dumb-jump-go)
;; (global-set-key (kbd "C-c C-j") 'dumb-jump-go-other-window)
;; (global-set-key (kbd "C-c b") 'dumb-jump-back)
;; (setq dumb-jump-prefer-searcher 'ag)

(setq dumb-jump-force-searcher 'rg)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq dumb-jump-max-find-time 10)
(global-set-key (kbd "C-c j") 'xref-find-definitions)
(global-set-key (kbd "C-c b") 'xref-pop-marker-stack)

;; (setq xref-show-definitions-function #'xref-show-definitions-completing-read)

;; show column and line numbers.
(setq column-number-mode t)
(global-linum-mode t)

;; auto-rebalance vertical buffers after split.
(defadvice split-window-right (after rebalance-windows activate)
  (balance-windows))
(ad-activate 'split-window-right)

;; Go mode
;; Automatically formats your code to the one true coding style, used by every Go developer.
(setq gofmt-command "goimports")
;; (setq gofmt-command "gofmt")
(add-hook 'before-save-hook 'gofmt-before-save)

;; only load company-mode with go.
;; make sure gocode is installed!
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

;; Moar go sugar.
(defun my-go-mode-hook ()
  (whitespace-mode -1) ; don't highlight hard tabs
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "cd .. && make test"))
  (setq
   tab-width 2         ; display tabs as two-spaces
   indent-tabs-mode 1  ; use hard tabs to indent
   fill-column 100))   ; set a reasonable fill width

(add-hook 'go-mode-hook 'my-go-mode-hook)

;; ;; load go-guru "what" mode
;; (add-hook 'go-mode-hook 'go-guru-hl-identifier-mode)

;; Ruby --- Rails stuff
;; (projectile-rails-global-mode)

;; JS Mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (define-key js2-mode-map (kbd "C-c C-j") 'js2-jump-to-definition)

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

;; do not set magic encoding comment
(setq ruby-insert-encoding-magic-comment nil)

;; Nice fonts
;; (set-default-font "-*-Go-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1")
;; (set-default-font "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute 'default nil :height 170)

;; (load-file "~/.emacs.d/color-theme-tomorrow.el")
;; (color-theme-initialize)
;; (color-theme-tomorrow-night)

(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-eighties)

(windmove-default-keybindings)

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "~/.emacs.d/elpa/exec-path-from-shell-20170212.2116")
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(exec-path-from-shell-copy-env "GOPATH")

;; lint on save
;; (add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
;; (require 'golint)

(add-to-list 'load-path "~/.emacs.d/textmate.el")
(require 'textmate)
(textmate-mode)

;; (defun copy-current-path-to-clipboard ()
;;   "Put the current file name on the clipboard"
;;   (interactive)
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       default-directory
;;                     (buffer-file-name))))
;;     (when filename
;;       (with-temp-buffer
;;         (insert filename)
;;         (clipboard-kill-region (point-min) (point-max)))
;;       (message filename))))
;; (global-set-key (kbd "C-c p") 'copy-current-path-to-clipboard)

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'."
  (interactive)
  (let ((path-with-line-number
         (concat (file-relative-name buffer-file-name (projectile-project-root)) ":" (number-to-string (line-number-at-pos)))))
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))
(global-set-key (kbd "C-c p") 'copy-current-line-position-to-clipboard)

(defvar xah-run-current-file-before-hook nil "Hook for `xah-run-current-file'. Before the file is run.")
(defvar xah-run-current-file-after-hook nil "Hook for `xah-run-current-file'. After the file is run.")
(defun xah-run-current-file ()
  (interactive)
  (let (
        ($outputb "*xah-run output*")
        (resize-mini-windows nil)
        ($suffix-map
         ;; (‹extension› . ‹shell program name›)
         `(
           ("php" . "php")
           ("pl" . "perl")
           ("py" . "python")
           ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
           ("rb" . "ruby")
           ("go" . "go run")
           ("hs" . "runhaskell")
           ("js" . "node")
           ("mjs" . "node --experimental-modules ")
           ("ts" . "tsc") ; TypeScript
           ("tsx" . "tsc")
           ("sh" . "bash")
           ("clj" . "java -cp ~/apps/clojure-1.6.0/clojure-1.6.0.jar clojure.main")
           ("rkt" . "racket")
           ("ml" . "ocaml")
           ("vbs" . "cscript")
           ("tex" . "pdflatex")
           ("latex" . "pdflatex")
           ("java" . "javac")
           ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
           ))
        $fname
        $fSuffix
        $prog-name
        $cmd-str)
    (when (not (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))
    (setq $fname (buffer-file-name))
    (setq $fSuffix (file-name-extension $fname))
    (setq $prog-name (cdr (assoc $fSuffix $suffix-map)))
    (setq $cmd-str (concat $prog-name " \""   $fname "\" &"))
    (run-hooks 'xah-run-current-file-before-hook)
    (cond
     ((string-equal $fSuffix "el")
      (load $fname))
     ((or (string-equal $fSuffix "ts") (string-equal $fSuffix "tsx"))
      (if (fboundp 'xah-ts-compile-file)
          (progn
            (xah-ts-compile-file current-prefix-arg))
        (if $prog-name
            (progn
              (message "Running")
              (shell-command $cmd-str $outputb ))
          (error "No recognized program file suffix for this file."))))
     ;; ((string-equal $fSuffix "go")
     ;;  (when (fboundp 'gofmt) (gofmt) )
     ;;  (shell-command $cmd-str $outputb ))
     ((string-equal $fSuffix "java")
      (progn
        (shell-command (format "java %s" (file-name-sans-extension (file-name-nondirectory $fname))) $outputb )))
     (t (if $prog-name
            (progn
              (message "Running")
              (shell-command $cmd-str $outputb ))
          (error "No recognized program file suffix for this file."))))
    (run-hooks 'xah-run-current-file-after-hook)))

(global-set-key (kbd "C-c C-r") 'xah-run-current-file)

(setq ring-bell-function 'ignore)

(use-package copilot
  :load-path (lambda () (expand-file-name "copilot.el" user-emacs-directory))
  ;; don't show in mode line
  :diminish)


(global-set-key (kbd "C-t") 'copilot-accept-completion)

(defun rk/copilot-tab ()
  "Tab command that will complet with copilot if a completion is
available"
  (interactive)
  (or (copilot-accept-completion)
      (indent-for-tab-command)))

(defun rk/copilot-tab ()
  "Tab command that will complete with Copilot if a completion is available."
  (interactive)
  (if (and (minibufferp)
           (fboundp 'minibuffer-complete))
      (call-interactively 'minibuffer-complete)
    (or (copilot-accept-completion)
        (indent-for-tab-command))))

;; Bind the tab key to the custom function
(global-set-key (kbd "TAB") #'rk/copilot-tab)
