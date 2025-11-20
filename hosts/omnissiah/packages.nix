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

  # Comms
  telegram-desktop
  discord

  # GNOME specific
  gnome-tweaks
  gnome-extension-manager

  # Media
  stable.davinci-resolve

  ghostty
  audacity
  hplipWithPlugin
  fastfetch
  solaar
  papers
  plexamp
  vlc
  appimage-run
  zed-editor
  gitg
];
}
