{ config, pkgs, ... }:
{

services = {
  xserver.enable = false;
  printing.enable = true;
  xserver.libinput.enable = false;
  openssh.enable = false;
};

}

