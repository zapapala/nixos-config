{ config, pkgs, ... }:

{

  # Automounts
  fileSystems."/mnt/home" = {
  device = "//192.168.1.37/home";
  fsType = "cifs";
  options = [
    "credentials=/root/.smbcreds"
    "uid=1000"
    "gid=1000"
    "x-systemd.automount"
    "noauto"
    "rw"
  ];
};
  fileSystems."/mnt/data" = {
  device = "//192.168.1.37/data";
  fsType = "cifs";
  options = [
    "credentials=/root/.smbcreds"
    "uid=1000"
    "gid=1000"
    "x-systemd.automount"
    "noauto"
    "rw"
  ];
};


}
