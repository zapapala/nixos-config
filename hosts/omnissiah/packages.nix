{ config, pkgs, ... }:

{


  # Specific packages for this host
  environment.systemPackages = with
pkgs; [

  stable.davinci-resolve
];

  # Font list
  fonts.packages = with
  pkgs; [

    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
];
}
