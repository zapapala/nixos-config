{ config, pkgs, ... }:

{

  # Enable programs
  programs.steam = {
    enable = true;
 	  extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.obs-studio.enable = true;

environment.systemPackages = with
pkgs; [

  # Specific packages for this host
  stable.davinci-resolve

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
  gnome-photos
  audacity
  vlc
  plexamp

  # Peripherals
  hplipWithPlugin
  solaar

  # CLI and utilities
  fastfetch
  appimage-run
  cmatrix
  btop
  ghostty
];




  # Font list
  fonts.packages = with
  pkgs; [

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
];
}
