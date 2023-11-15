{ config, pkgs, ... }:

{
    security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}


