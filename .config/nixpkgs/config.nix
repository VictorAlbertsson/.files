{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    base = pkgs.buildEnv {
      name = "Base packages for this user";
      paths = [
         # System information
         neofetch
         # Application launcher
         dmenu 
         # Terminal emulator
         termonad-with-packages 
         # Password manager
         pass 
         # Browser
         firefox 
         # Games
         steam
         multimc
      ];
    };
  };
}
