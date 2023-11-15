# Isolated nix environment for CTFs with all the necessary tools and for development too

{pkgs ? import <nixpkgs> {} }:

pkgs.mkShell
{
    packages = with pkgs; [
        nodejs
        python311
        virtualenv
        php
        go
        wireshark
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