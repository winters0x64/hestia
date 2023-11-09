{ config, pkgs, hyprland, inputs, ... }:

{
  imports = [
    hyprland.homeManagerModules.default
    ./programs
  ];

  # Font config
  fonts.fontconfig.enable = true;

  # GTK theme
  # Not working idk why....
  /* gtk = {
    enable = true;
    theme = {
      name = "juno-theme";
      package = pkgs.juno-theme;
    };
    font.name = "DaddyTimeMono";
    iconTheme.name = "Numix Circle";
    iconTheme.package = pkgs.numix-icon-theme-circle;
  }; */

  # Basic Info about the user
  home = {
    username = "winters";
    homeDirectory = "/home/winters";
    # Packages that should be installed to the user profile.
    packages = with pkgs; [
    distrobox
    vscode
    burpsuite
    neofetch
    swww
    google-chrome
    xfce.thunar
    vlc
    grim
    slurp
    netcat
    socat
    jq
    discord
    pamixer
    brightnessctl
    nwg-look
    fuzzel
    nodejs
    pfetch
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "DaddyTimeMono" ]; })
    pavucontrol
  ];
   # Don't touch this!
   stateVersion = "23.05";
  };
  
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
