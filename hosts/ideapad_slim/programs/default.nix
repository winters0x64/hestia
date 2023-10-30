{ config, pkgs, ... }:

{
    programs.dconf.enable = true;

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

    environment.systemPackages = with pkgs; [
        btop
        blueberry
    ];
}
