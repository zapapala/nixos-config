{ config, pkgs, nixpkgsStable, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Overlay
  nixpkgs.overlays = [
    (final: prev: {
      davinci-resolve = nixpkgsStable.legacyPackages.x86_64-linux.davinci-resolve;
    })
  ];
}
