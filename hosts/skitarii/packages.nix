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
  homebank
  hunspell
  hunspellDicts.en_US
  hunspellDicts.en_GB-large
  hunspellDicts.en_GB-ize
  hunspellDicts.es_ES

  # Comms
  telegram-desktop
  discord
  element-desktop

  # GNOME specific
  gnome-tweaks
  gnome-extension-manager
  mission-center
  morewaita-icon-theme

  # KDE Plasma specific
  # libsForQt5.qtstyleplugin-kvantum
  # kdePackages.kcalc
  # libreoffice-qt

  # Games and Media
  audacity
  vlc
  plexamp
  parabolic
  protonplus
  gamescope
  gamemode
  heroic
  retroarch-full

  # Peripherals
  hplipWithPlugin
  solaar


  # CLI and utilities
  fastfetch
  appimage-run
  cmatrix
  btop
  localsend
  lazygit
  gearlever
  yad
  unzip
  xdotool
  unixtools.xxd
  xorg.xwininfo
  impression
  ventoy-full-gtk

  # Icons
  papirus-nord
];

nixpkgs.config.permittedInsecurePackages = [
                "ventoy-gtk3-1.1.07"
              ];


}
