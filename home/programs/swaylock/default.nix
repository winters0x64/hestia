{ config, pkgs, ... }:

{
    # Swaylock
    programs.swaylock.enable = true;
    programs.swaylock.package = pkgs.swaylock-effects;
}


