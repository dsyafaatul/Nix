{
  description = "dsyafaatul NixOS Config";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        HPPavilion14 = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/HPPavilion14/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.dsyafaatul = import ./users/dsyafaatul/home.nix;
            }
          ];
        };
      };
    };
}
