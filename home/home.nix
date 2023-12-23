{ config, pkgs, hyprland, inputs, ... }:

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
    burpsuite
    neofetch
    swww
    google-chrome
    xfce.thunar
    pamixer
    vlc
    grim
    slurp
    netcat
    socat
    jq
    discord
    brightnessctl
    nwg-look
    fuzzel
    pfetch
    playerctl
    cava
    xdg-utils
    webcord
    nodejs
    python311
    virtualenv
    php
    go
    ngrok
    sqlmap
    gobuster
    qbittorrent
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "DaddyTimeMono" ]; })
    pavucontrol
    nmap
    virtualenv
    swaylock
    framac
    bore-cli
    openssl
    openvpn
    exiftool
    pywal
    texliveMedium
    dig
    john
    inetutils
    stegseek
    steghide
    sherlock
    ffuf
  ];
   # Don't touch this!
   stateVersion = "23.05";
  };
  
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
