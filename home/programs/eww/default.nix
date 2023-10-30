{ config, lib, pkgs, ... }:

{
    programs.eww.enable = true;
    programs.eww.configDir = ../../config/eww;
}