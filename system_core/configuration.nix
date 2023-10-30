{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../hosts/ideapad_slim
    ];

  # Bootloader
  boot = {
    # For supporting ntfs drives
    supportedFilesystems = [ "ntfs" ];
    loader = {
      systemd-boot.enable = true;
      # Generations to keep
      systemd-boot.configurationLimit = 10;
    };
  };

  # Enable networking
  # I just manually configured the network manager configuration file, i believe its doable through nix but idk how rn
  networking = {
    hostName = "andromeda";
    networkmanager.enable = true;
  };

  # Time and locale
  time.timeZone = "Asia/Kolkata";

 i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  # System packages available for all hosts and users
  environment.systemPackages = with pkgs; [
    zip
    unzip
    file
    which
    tree
    btop 
    unzip
    vim
    killall
  ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Flakes and garbage collector
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # Optimize nixstore
      auto-optimise-store = true;
    };

    # Perform garbage collection weekly to maintain low disk usage
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  # Set default editor to vim
  environment.variables.EDITOR = "vim";

  # Don't touch this line!
  system.stateVersion = "23.05"; 
}
