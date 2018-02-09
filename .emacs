
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq backup-by-copying t)		; some tools save reference by inode
(setq inhibit-startup-message t)	; No startup message
(setq diary-file "/homes/klash/.diary")

;; Various things that are disabled by default
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(server-start)				; nice to use emacsclient

;; (display-time)				; see display-time-day-and-date

;; For shell modes, match my prompt.
(setq shell-prompt-pattern "klash.*\] ")

(setq-default c-basic-offset 4)

;; Where to look for personal libraries
(setq load-path (append load-path (cons (expand-file-name "~/emacs") nil)))

(setq c-mode-hook			; C-mode settings
      (function (lambda ()
		  (setq c-indent-level 4
			c-arg-decl-indent 0)
		  (modify-syntax-entry ?: "." c-mode-syntax-table)
		  (turn-on-auto-fill))))

;;
;;  Some useful variable-settings, extracted from the GNU sample
;;  .emacs file
;;
(setq default-major-mode 'text-mode	; use text-mode instead of Fund.
      text-mode-hook 'turn-on-auto-fill	; use auto-fill in text
      require-final-newline t		; end with <return>, always
      completion-auto-exit t)		; if completion, do it now

;;(setq term-setup-hook
;;      (function (lambda ()
;;        (if (and window-system (string-equal (getenv "ARCH") "sun4"))
            ;;  If we're running under a window system, and the current
            ;;  environment is a sun, then set up to use the sun function keys
;;	    (load-library (getenv "ARCH"))))))

;; (if (string-equal (getenv "TERM") "vt100")
;; ((evade-flow-control)
;; (message "^S, ^Q, mapped to ^\, ^]")))))))
;;;
;;; From: boyd@cs.unca.edu (Mark Boyd)
;;; Subject: Re: more on filling
;;; Date: Sat, 16 May 1992 00:37:24 GMT
;;; 
;;; I use a line prefix adder and remover that was posted a year or so
;;; ago.  Unfortunately, I just stuck it in my .emacs and didn't save the
;;; author's name. It does essentially the same thing that others have
;;; suggested, but it is nicely packaged.  Here is the prefix adder:



;; Set-up for C mode at the C company
;; (load "cc-mode")
;; (defconst cisco-c-style
;;   '((c-basic-offset . 4)
;;     (c-auto-newline)
;;     (comment-multi-line . t)
;;     (c-tab-always-indent)
;;     (c-offsets-alist
;;      (knr-argdecl-intro . +)
;;      (knr-argdecl . 0)
;;      (statement-cont . +)
;;      (statement-case-open . +)
;;      (substatement-open . 0)
;;      (label . 0)
;;      (case-label . 0)))
;;   "Cisco C Style for CC-MODE")
;; 
;; (defun user-c-mode-hook()
;;   (set-c-style "CISCO"))
;; 
;; (c-add-style "CISCO" cisco-c-style)
;; (add-hook 'c-mode-common-hook 'user-c-mode-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (realgud))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
