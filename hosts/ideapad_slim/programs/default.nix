{ config, pkgs, ... }:

{
    # Idk why this even here??
    programs.dconf.enable = true;
    
    #Zsh
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        autosuggestions.enable = true;
        ohMyZsh = {
                enable = true;
                theme = "refined";
                plugins = [
                    "git"
            ];
        };
    };

    
    programs.wireshark.enable = true;
    programs.wireshark.package = pkgs.wireshark;

    # Also for S3
    programs.java.enable = true;

    # Per host packages
    environment.systemPackages = with pkgs; [
        btop
        blueberry
        service-wrapper
        eww-wayland
        dmenu
        wget
        pgadmin
    ];
}
