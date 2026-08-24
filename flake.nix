{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Pinned nixpkgs for Flutter/Android (August 24, 2026)
    flutterPkgs.url = "github:NixOS/nixpkgs/a12fe02";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flutterPkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.home = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit flutterPkgs; };

      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager 
        {
          nixpkgs.config.allowUnfree = true;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";

            users.nur = import ./home.nix;
          };
        }
      ];
    };
  };
}
