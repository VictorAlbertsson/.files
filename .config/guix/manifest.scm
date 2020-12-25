(specifications->manifest
 '("xorg-server"
   "xinit"
   "alacritty"
   "git"
   "xclip" ; Useful for copy-pasting error logs
   "pinentry" ; TODO Switch out 'pinentry' for 'emacs-pinentry'
   "shepherd" ; Global 'shepherd' doesn't seem to work
   "ncurses" ; For the colored PS1
   "pulseaudio"
   "pavucontrol"
   "syncthing"
   "neofetch" ; For style points
   "guile"
   "guile-chickadee"
   "emacs" ; To complete the Lisp machine
   "texlive" ; Required for ORG to PDF conversion
   "ghostscript" ; For PDF viewing in Emacs
   "taskwarrior" ; For GTD
   ;; "vimb" ; 'vimb' is to unstable on GuixSD to use
   ;; "gstreamer" ; Dependency of 'vimb'
   ;; "gst-libav" ; Dependency of 'vimb'
   ;; "gst-plugins-good" ; Dependency of 'vimb'
   "fontconfig" ; Required for multilingual systems
   "font-wqy-zenhei" ; 你好吗?
   ;;; Nonguix (non-GNU)
   "firefox" ; Replacement for 'vimb'
   ;;; Guix Gaming (non-GNU)
   "multimc" ; For Minecraft gaming
   ))
