{ config, lib, pkgs, ... }:

{
      imports = [ 
        ./hyprland-env.nix
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        systemdIntegration = true;
        xwayland.enable = true;
    };

    home.file."./config/hypr/hyprland.conf".source = ./hyprland.conf;
}