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

    xdg.configFile = {
        "hypr/hyprland.conf".source = ../../hypr/hyprland.conf;
    };
}