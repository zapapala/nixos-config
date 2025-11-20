{
  description = "OC Blanco Flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, nixpkgsStable, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        omnissiah = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/omnissiah/configuration.nix
            ./hosts/omnissiah/packages.nix
            ./modules/automounts.nix
            ./modules/amdhardware.nix
          ];
          nixpkgs.overlays = [
            (final: prev: {
              davinci-resolve = nixpkgsStable.legacyPackages.x86_64-linux.davinci-resolve;
            })
          ];
          # If needed, pass nixpkgsStable via specialArgs for other uses:
          # specialArgs = { inherit nixpkgsStable; };
        };
      };

      nixosConfigurations = {
        skitarii = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/skitarii/configuration.nix
            ./hosts/skitarii/packages.nix
          ];
       };
    };
  };
}
