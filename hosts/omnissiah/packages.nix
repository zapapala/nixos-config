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
  kdePackages.kdenlive
  virtio-win  # Windows virtio drivers ISO

  # Milcom
  zapzap
  teams-for-linux

  # Office/Writing
  #libreoffice-fresh
  obsidian
  calibre
  zotero
  zed-editor
  hunspell
  hunspellDicts.en_US
  hunspellDicts.en_GB-large
  hunspellDicts.en_GB-ize
  hunspellDicts.es_ES

  # Comms
  telegram-desktop
  discord
  element-desktop
  brave
  thunderbird
  inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

  # GNOME specific
  #gnome-tweaks
  #gnome-extension-manager
  #mission-center
  #papers
  #gnome-photos
  #morewaita-icon-theme

  # KDE Plasma specific
  #libsForQt5.qtstyleplugin-kvantum
  kdePackages.kcalc
  libreoffice-qt

  # Media and Games
  audacity
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
  cmatrix
  btop
  localsend
  yad
  unzip
  xdotool
  unixtools.xxd
  xorg.xwininfo
  impression
  gnome-disk-utility
  python315
  gphoto2
  tesseract

  # Icons
  papirus-nord
];

nixpkgs.config.permittedInsecurePackages = [
                "ventoy-gtk3-1.1.07"
              ];

}
