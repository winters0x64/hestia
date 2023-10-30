{ config, pkgs, hyprland, ... }:

{
  imports = [
    hyprland.homeManagerModules.default
    ./programs
  ];

  # Font config
  fonts.fontconfig.enable = true;

  # Basic Info about the user
  home = {
    username = "winters";
    homeDirectory = "/home/winters";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
    distrobox
    vscode
    discord
    burpsuite
    neofetch
    swww
    google-chrome
    xfce.thunar
    vlc
    grim
    slurp
    netcat
    jq
    socat
    (pkgs.nerdfonts.override { fonts = [ "DaddyTimeMono" "JetBrainsMono" ]; })
    brightnessctl
    eww-wayland
  ];

   # Don't touch this!
   stateVersion = "23.05";
  };
  
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
