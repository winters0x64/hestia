{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
    EDITOR = "lvim";
    BROWSER = "librewolf";
    TERMINAL = "alacritty";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    };
  };
}