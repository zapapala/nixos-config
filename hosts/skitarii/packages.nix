{ config, pkgs, ... }:

{
  # Enable programs
  programs.steam = {
    enable = true;
 	  extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.obs-studio.enable = true;

  # Packages
  environment.systemPackages = with
pkgs; [

  # Milcom
  zapzap
  teams-for-linux

  # Office/Writing
  libreoffice-fresh
  obsidian
  calibre
  zotero
  papers
  zed-editor

  # Comms
  telegram-desktop
  discord

  # GNOME specific
  gnome-tweaks
  gnome-extension-manager
  mission-center

  # Media
  stable.davinci-resolve
  gnome-photos
  audacity
  vlc
  plexamp

  # Networking
  synology-drive-client

  # Peripherals
  hplipWithPlugin
  solaar

  # CLI and utilities
  fastfetch
  appimage-run
  cmatrix
  btop
  starship
];

  # Font list
  fonts.packages = with
  pkgs; [

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
];
}
