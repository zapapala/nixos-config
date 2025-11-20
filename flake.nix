{
  description = "OC Blanco Flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/25.05";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {
    nixosConfigurations = {
      omnissiah = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };


        modules = [
        ({
          nixpkgs.overlays = [
            (final: prev: {
              stable = import nixpkgs-stable {
                inherit system;
                config = {
                  allowUnfree = true;
                  permittedInsecurePackages = [
                    "ventoy-qt5-1.1.05"
                    "qtwebengine-5.15.19"
                  ];
                };
              };
            })
          ];
        })
          ./hosts/omnissiah/configuration.nix
          ./hosts/omnissiah/packages.nix
          ./modules/automounts.nix
          ./modules/amdhardware.nix
        ];
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
