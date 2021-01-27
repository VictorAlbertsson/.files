{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "victor";
  home.homeDirectory = "/home/victor";

  # User X session
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  # Configure-less user programs
  home.packages = [
    pkgs.killall
    pkgs.htop
    pkgs.neofetch
    pkgs.rofi-pass
    pkgs.steam # Unfree
    pkgs.multimc
  ];

  # User programs
  programs = {
    home-manager.enable = true;
    rofi.enable = true;
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [ vim-airline vim-nix ];
      settings = { 
        ignorecase = true; 
        mouse = "a"; 
      };
    };
    taskwarrior.enable = true;
    kitty.enable = true;
    brave.enable = true;
  };

  # User services
  services = {
    syncthing.enable = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
