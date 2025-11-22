{
  description = "OC Blanco Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixos-hardware, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {

    # Omnissiah desktop
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

    # Skitarii laptop - Framework 13 7040
      nixosConfigurations = {
        skitarii = lib.nixosSystem {
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

            ./hosts/skitarii/configuration.nix
            ./hosts/skitarii/packages.nix
            nixos-hardware.nixosModules.framework-13-7040-amd
          ];
       };
    };
  };
}
