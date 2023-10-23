{ config, pkgs, hyprland, ... }:

{

  imports = [
    hyprland.homeManagerModules.default
    ./programs
  ];
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
  ];

   # Don't touch this!
   stateVersion = "23.05";
  };
  
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}