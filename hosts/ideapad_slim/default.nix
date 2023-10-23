{ config, lib, pkgs, ... }:
{
    imports = [
        ./virtualisation
        ./services
        ./users
        ./programs
    ];
}