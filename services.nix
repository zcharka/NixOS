{ config, pkgs, ... }:
{

services = {
  xserver.enable = false;
  avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

  printing = {
  enable = true;
  drivers = with pkgs; [
    cups-filters
    cups-browsed
    epson-escpr2
  ];
};
  libinput.enable = false;
  openssh.enable = false;
  system-config-printer.enable = true;
  logind.settings.Login = {
  HandlePowerKey = "suspend";
  HandlePowerKeyLongPress = "poweroff";
};
};

}

