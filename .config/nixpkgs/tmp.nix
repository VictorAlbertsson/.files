{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    base = pkgs.buildEnv {
      name = "user-packages";
      paths = [
         # Haskell packages
         haskellPackages.xmobar
         haskellPackages.xmonad
         haskellPackages.xmonad-extras
         haskellPackages.xmonad-contrib
         # System utilities
         killall
         # System information
         neofetch
         # Application launcher
         rofi
         # Password manager
         pass ## CLI
         rofi-pass ## GUI
         # Terminal emulator
         kitty
         # Browser
         brave
         # Games
         steam ## For most games
         multimc ## For Minecraft
      ];
    };
  };
}
