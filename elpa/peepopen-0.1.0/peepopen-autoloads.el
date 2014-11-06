;;; peepopen-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "peepopen" "peepopen.el" (21594 29063 0 0))
;;; Generated autoloads from peepopen.el

(autoload 'peepopen-goto-file-gui "peepopen" "\
Uses external GUI app to quickly jump to a file in the project.

\(fn)" t nil)

(autoload 'peepopen-bind-keys "peepopen" "\


\(fn)" nil nil)

(add-hook 'textmate-mode-hook 'peepopen-bind-keys)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; peepopen-autoloads.el ends here
