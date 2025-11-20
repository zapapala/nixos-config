{ config, pkgs, nixpkgsStable, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      davinci-resolve = nixpkgsStable.legacyPackages.x86_64-linux.davinci-resolve;
    })
  ];
}
