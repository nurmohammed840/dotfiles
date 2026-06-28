{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    # pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  in {
    nixosConfigurations.home = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            
            users.nur = import ./home.nix;
          };
        }
      ];
    };
    
    # Available through 'home-manager --flake ...'
    # homeConfigurations = {
    #   home = home-manager.lib.homeManagerConfiguration {
    #     inherit pkgs;
    #     modules = [ ./home.nix ];
    #   };  
    # };
  };
}
