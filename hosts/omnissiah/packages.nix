{ config, pkgs, ... }:

{
  # Enable programs
  programs.steam = {
    enable = true;
 	  extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.obs-studio.enable = true;

  # Overlays
  nixpkgs.overlays = [
      (final: prev: {
        davinci-resolve = import (builtins.getAttr "legacyPackages" nixpkgsStable).x86_64-linux.davinci-resolve;
        # For newer Nix, try: davinci-resolve = nixpkgsStable.legacyPackages.x86_64-linux.davinci-resolve;
      })
    ];

  # Packages
  environment.systemPackages = with
pkgs; [
  teams-for-linux
  telegram-desktop
  libreoffice-fresh
  davinci-resolve
  gnome-tweaks
  gnome-extension-manager
  zapzap
  ghostty
  audacity
  discord
  hplipWithPlugin
  obsidian
  calibre
  fastfetch
  zotero
  solaar
  papers
  plexamp
  vlc
  appimage-run
  zed-editor
  gitg
];
}
