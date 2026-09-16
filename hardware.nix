{ config, pkgs, ... }:

{

  swapDevices = [
  {
    device = "/var/lib/swapfile"; size = 8192;
  }
];
}
