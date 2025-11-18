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
];
}
