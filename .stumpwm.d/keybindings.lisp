(in-package :stumpwm)

(defparameter *HOME* "/home/victor")

(defparameter *IMAGES* (concatenate 'string *HOME* "/images/"))

;; Ensure correct prefix key
(set-prefix-key (kbd "C-z"))

;;(define-key *root-map* (kbd "<space>") "windowlist")

(defmacro make-program-binding (program-name window-class &optional alias)
  "Create run-or-raise and run-or-pull commands for program-name
  window-class is the windows-class
  Also add keybinding to the commands.
  [keybinding] r calls run-or-raise
  [keybinding] p calls run-or-pull
  [keybinding] n creates a new instance of the program"
  (if (not alias)
    (setf alias program-name))
    `(progn
       (defvar ,(intern (format nil "*~a-map*" alias)) nil)

       (defcommand ,(intern (format nil "~a" alias)) () () (run-shell-command ,program-name))

       (defcommand ,(intern (format nil "run-or-raise-~a" alias)) () ()
		   (run-or-raise ,program-name '(:class ,window-class)))

       (defcommand ,(intern (format nil "run-or-pull-~a" alias)) () ()
		   (run-or-pull ,program-name '(:class ,window-class)))

       (fill-keymap ,(intern (format nil "*~a-map*" alias))
		    (kbd "p") ,(format nil "run-or-pull-~a" alias)
		    (kbd "r") ,(format nil "run-or-raise-~a" alias)
		    (kbd "n") ,(format nil "~a" alias))))

(make-program-binding "emacsclient -c -a ''" "Emacs" "emacs")
(make-program-binding "urxvtc" "Urxvt" "urxvt")
(make-program-binding "firefox" "Firefox")

(defparameter *program-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "e") |*emacs-map*|)
    (define-key m (kbd "c") |*urxvt-map*|)
    (define-key m (kbd "b") |*firefox-map*|)
    m))

(define-key *root-map* (kbd ".") *program-map*)

(defcommand screenshot () ()
	    (let ((screenshot-dir (concatenate 'string *HOME* "/.screenshots/")))
	      (run-shell-command (concatenate 'string "cd " screenshot-dir "; scrot")))) ; This should look something like "cd /home/USER/.screenshots/; scrot"

(defcommand screenshot-name () ()
	    (let ((screenshot-dir (concatenate 'string *HOME* "/.screenshots/")))
	      (run-shell-command (concat "cd " screenshot-dir "; scrot temp.png") t)
	      (let ((filename (read-one-line (current-screen) "Filename: ")))
		(run-shell-command (concat "cd " screenshot-dir "; mv ./temp.png ./" filename ".png")))))

(defcommand volume-control () ()
	    "Start volume control"
	    (run-or-raise "pavucontrol" '(:class "Pavucontrol")))

;;; Shutdown and Reboot
(defcommand shutdown (confirm) ((:y-or-n "Confirm Shutdown "))
            "Ask the user to confirm before shutting down"
	    (if confirm
		(run-shell-command "poweroff")))

(defcommand reboot (confirm) ((:y-or-n "Confirm Reboot "))
            "Ask the user to confirm before rebooting"
	    (if confirm
	        (run-shell-command "reboot")))

;;; System Command Keymap
(defparameter *screenshot-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "f") "screenshot")
    (define-key m (kbd "n") "screenshot-name")
    m))

(defparameter *power-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "p") "shutdown")
    (define-key m (kbd "r") "reboot")
    m))

(defparameter *layout-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "s") *screenshot-map*)
    m))

(defparameter *system-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "s") *screenshot-map*)
    (define-key m (kbd "l") *layout-map*)
    (define-key m (kbd "p") *power-map*)
    m))

(define-key *root-map* (kbd "s") *system-map*)
