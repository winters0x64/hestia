{ config, pkgs, user, ... }:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.winters = {
        isNormalUser = true;
        description = "Arun Krishnan";
        extraGroups = [ "networkmanager" "wheel" "docker" "wireshark"];
        shell = pkgs.zsh;
    };
}