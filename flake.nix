{
  description = "Winter's NixOS configuration";

  # Inputs for the flake
  inputs = {

    # Nixpkgs input
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager input
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland's input
    hyprland.url = "github:hyprwm/Hyprland";
  };

  # Output of the flake
  outputs = { self, nixpkgs, home-manager, hyprland, ...}:

    # Variables to use
    let

      # System architecture 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;

        # Enabling unfree software
        config.allowUnfree=true;
      };
      lib = nixpkgs.lib;
    
    # Actual output definition
    in {
      nixosConfigurations = {
        "andromeda" = lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit hyprland; };
          modules = [
            ./system_core/configuration.nix
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.winters = import ./home/home.nix;
                home-manager.extraSpecialArgs = specialArgs;
              }
            
            # Overlays
            (args: { nixpkgs.overlays = import ./overlays args; })
          ];
        };
      };
    };
}