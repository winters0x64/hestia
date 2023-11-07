{ config, lib, pkgs, ... }: 

{
    programs.eww.enable = true;
    programs.eww.package = pkgs.eww-wayland;
}