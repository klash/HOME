
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(setq backup-by-copying t)		; some tools save reference by inode
(setq inhibit-startup-message t)	; No startup message
(setq diary-file "/homes/klash/.diary")

;; Various things that are disabled by default
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(server-start)				; nice to use emacsclient

(add-to-list 'auto-mode-alist '("\\.sc" . python-mode))

;; (display-time)				; see display-time-day-and-date

;; For shell modes, match my prompt.
(setq shell-prompt-pattern "klash.*\] ")

(setq-default c-basic-offset 4)
(setq-default fill-column 85)

;; Where to look for personal libraries
(setq load-path (append load-path (cons (expand-file-name "~/.emacs.d/lisp") nil)))

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("f09958186a75607e192af3ee134a0e7faebc93d83e735b01db05aba2022f6539" default)))
 '(package-selected-packages (quote (realgud))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x |") 'toggle-window-split)

(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))

(defun display-new-buffer (buffer force-other-window)
  "If BUFFER is visible, select it.
If it's not visible and there's only one window, split the
current window and select BUFFER in the new window. If the
current window (before the split) is more than 100 columns wide,
split horizontally(left/right), else split vertically(up/down).
If the current buffer contains more than one window, select
BUFFER in the least recently used window.
This function returns the window which holds BUFFER.
FORCE-OTHER-WINDOW is ignored."
  (or (get-buffer-window buffer)
    (if (one-window-p)
        (let ((new-win
               (if (> (window-width) 100)
                   (split-window-horizontally)
                 (split-window-vertically))))
          (set-window-buffer new-win buffer)
          new-win)
      (let ((new-win (get-lru-window)))
        (set-window-buffer new-win buffer)
        new-win))))
;; use display-buffer-alist instead of display-buffer-function if the following line won't work
;; (setq display-buffer-function 'display-new-buffer)

;(setq split-height-threshold nil)
;(setq split-width-threshold 0)

;;— User Option: pop-up-frames
;;If the value of this variable is non-nil, that means display-buffer may display buffers by making new frames. The default is nil.
;;
;;A non-nil value also means that when display-buffer is looking for a window already displaying buffer-or-name, it can search any visible or iconified frame, not just the selected frame.

;  (customize-set-variable
;           'display-buffer-base-action
;           '((display-buffer-reuse-window display-buffer-same-window
;              display-buffer-in-previous-window
;              display-buffer-use-some-window)))

; (customize-set-variable
;           'display-buffer-base-action
;           '((display-buffer-reuse-window display-buffer-pop-up-frame)
;             (reusable-frames . 0)))
