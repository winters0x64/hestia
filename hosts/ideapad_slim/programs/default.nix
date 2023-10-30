{ config, pkgs, ... }:

{
    programs.dconf.enable = true;


     


    environment.systemPackages = with pkgs; [
        btop
        blueberry
    ];
}
