{ config, pkgs, ... }:

{

    # XDG portal
    xdg = {
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                /* xdg-desktop-portal-hyprland */
                xdg-desktop-portal-gtk
                xdg-desktop-portal-wlr
            ];
        };
    };

    # Enables support for Bluetooth
    hardware.bluetooth.enable = true; 

    # Powers up the default Bluetooth controller on boot
    hardware.bluetooth.powerOnBoot = true; 
    
    # System services
    services = {
        # X11 
        xserver = {
            enable = true;
            layout = "us";
            xkbVariant = "";
            libinput.enable = true;
            displayManager.startx.enable = true;
            windowManager.awesome.enable = true;
        };
       

        # Pipewire
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };


        
        # Had to put it here coz of dbms S3 smh...
        
        # Postgresql
        postgresql = {
            enable = true;
            authentication = pkgs.lib.mkOverride 10 ''
            #type database  DBuser  auth-method
            local all       all     trust

            # IPv4 local connections:
            host  all      all     127.0.0.1/32   trust

            # IPv6 local connections:
            host  all      all     ::1/128        trust
            '';
        };
        # Pgadmin
        pgadmin.enable = true;
        pgadmin.initialEmail = "arunkrishnan711@gmail.com";
        pgadmin.initialPasswordFile = builtins.toFile "password" "123456";
        
        # Mysql
        mysql = {
            enable = true;
            package = pkgs.mariadb;
        };
    };
}
