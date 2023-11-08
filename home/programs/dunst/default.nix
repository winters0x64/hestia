{ config, lib, pkgs, ... }:

{
    services.dunst = {
        enable = true;
    };
    xdg.configFile = {
        "dunst/dunstrc".source = ../../config/dunst/dunstrc;
    };
}