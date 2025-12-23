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
  # synology-drive-client # Outdated atm. Use Flatpak instead.

  # Milcom
  zapzap
  teams-for-linux

  # Office/Writing
  libreoffice-fresh
  obsidian
  calibre
  zotero
  zed-editor

  # Comms
  telegram-desktop
  discord
  brave

  # GNOME specific
  gnome-tweaks
  gnome-extension-manager
  mission-center
  morewaita-icon-theme

  # Games and Media
  audacity
  vlc
  plexamp
  parabolic
  protonplus
  gamescope
  gamemode
  heroic

  # Peripherals
  hplipWithPlugin
  solaar


  # CLI and utilities
  fastfetch
  appimage-run
  cmatrix
  btop
  ghostty
  localsend
  lazygit
  gearlever
  yad
  unzip
  xdotool
  unixtools.xxd
  xorg.xwininfo
];

  # Font list
  fonts.packages = with
  pkgs; [

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
];
}
