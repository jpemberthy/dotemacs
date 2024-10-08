;;; virtualenv-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "virtualenv" "virtualenv.el" (0 0 0 0))
;;; Generated autoloads from virtualenv.el

(autoload 'virtualenv-workon "virtualenv" "\
Activate a virtual environment for python.
Optional argument ENV if non-nil, either use the string given as
the virtual environment or if not a string then query the user.

\(fn &optional ENV)" t nil)

(autoload 'virtualenv-deactivate "virtualenv" nil t nil)

(autoload 'virtualenv-minor-mode "virtualenv" "\
Toggle Virtualenv minor mode on or off.

If called interactively, enable Virtualenv minor mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\\{virtualenv-minor-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "virtualenv" '("virtualenv-")))

;;;***

;;;### (autoloads nil nil ("virtualenv-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; virtualenv-autoloads.el ends here
