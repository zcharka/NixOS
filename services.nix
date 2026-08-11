{ config, pkgs, ... }:

{

services = {
  xserver.enable = false;
  flatpak.enable = true;
  printing.enable = true;
  xserver.libinput.enable = true;
#   openssh.enable = true;
};

}

