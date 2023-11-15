# Isolated nix environment for CTFs with all the necessary tools and for development too
# Just cli based apps
# Temporarily froz until i find a reliable reason why to use this feature...

{pkgs ? import <nixpkgs> {} }:

pkgs.mkShell
{
    packages = with pkgs; [
        nodejs
        python311
        virtualenv
        php
        go
        ngrok
    ] ++ (with pkgs.python311Packages; [ pip requests]);

    shellHook = ''
        echo "██╗    ██╗██╗███╗   ██╗████████╗███████╗██████╗ ███████╗"
        echo "██║    ██║██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██╔════╝"
        echo "██║ █╗ ██║██║██╔██╗ ██║   ██║   █████╗  ██████╔╝███████╗"
        echo "██║███╗██║██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗╚════██║"
        echo "╚███╔███╔╝██║██║ ╚████║   ██║   ███████╗██║  ██║███████║"
        echo " ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝"
        echo "Hamptions with the magic..."
        echo "---------------------------------------------------------"
        echo "---------------------------------------------------------"
        echo "---------------------------------------------------------"
        exec zsh
      '';
}