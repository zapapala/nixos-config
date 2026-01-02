{ config, pkgs, inputs, ... }:

{

  # Enable programs
  programs.steam = {
    enable = true;
 	  extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.obs-studio.enable = true;
  services.qbittorrent.enable = true;
  services.hardware.openrgb.enable = true;


environment.systemPackages = with
pkgs; [

  # Specific packages for this host
  stable.davinci-resolve
  inputs.nix-citizen.packages.${system}.rsi-launcher

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

  # Comms
  telegram-desktop
  discord
  brave

  # GNOME specific
  # gnome-tweaks
  # gnome-extension-manager
  # mission-center
  # papers
  # gnome-photos
  # morewaita-icon-theme

  # KDE Plasma specific
  libsForQt5.qtstyleplugin-kvantum

  # Media and Games
  audacity
  mpv
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
  winboat
  impression
];




  # Font list
  fonts.packages = with
  pkgs; [

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
];
}
