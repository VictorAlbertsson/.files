;; -*-lisp-*-
;; .stumpwm.d/init.lisp
;; Author: Victor Albertsson
;; License: GPL

(in-package :stumpwm)

;; Load swank
(require 'swank)
(swank:create-server)

(setq *startup-message* (format nil "Welcome Victor, Happy Hacking!"))

(setf *shell-program* (stumpwm:getenv "SHELL"))

;; Sound!
(run-shell-command "pulseaudio --start")

;; Prepare rxvt-unicode
(run-shell-command "xrdb -load ~/.Xresources -quiet")
(run-shell-command "urxvtd -q -f -o")

;; Setup emacs daemon
(run-shell-command "emacs --daemon")

;; Set wallpaper
;;(run-shell-command "~/.fehbg")

;; Disable system bell
(run-shell-command "xset b off")

;; Set cursor appearance
(run-shell-command "xsetroot -cursor_name left_ptr")

;; Enable mouse focus policy
(setf *mouse-focus-policy* :click)

;;; Visuals
(setf *message-window-gravity* :center)
(setf *input-window-gravity* :center)
(setf *window-format* "%n %10c: %15t|")
(setf *new-window-preferred-frame* '(:empty :unfocused :last :focused))
(setf *normal-border-width* 1)
;;(set-transient-gravity :centre)

(stumpwm:add-hook stumpwm:*destroy-window-hook*
                  #'(lambda (win) (stumpwm:repack-window-numbers)))

;;; Load configuration files
(load "~/.stumpwm.d/keybindings.lisp")
(load "~/.stumpwm.d/volume.lisp")
