(specifications->manifest
 '("alacritty"
   "git"
   "xclip"
   "pinentry" ; TODO Switch out 'pinentry' for 'emacs-pinentry'
   "shepherd" ; Global 'shepherd' doesn't seem to work
   "ncurses" ; For the colored PS1
   "pulseaudio"
   "pavucontrol"
   "syncthing"
   "guile"
   "guile-chickadee"
   "emacs"
   "taskwarrior"
   ;; "vimb" ; 'vimb' is to unstable on GuixSD to use
   ;; "gstreamer" ; Dependency of 'vimb'
   ;; "gst-libav" ; Dependency of 'vimb'
   ;; "gst-plugins-good" ; Dependency of 'vimb'
   "firefox" ; Replacement for 'vimb'
   "fontconfig"
   "font-wqy-zenhei"
   ))
