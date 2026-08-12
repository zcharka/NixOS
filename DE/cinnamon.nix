{ config, lib, pkgs, ... }:
{
    services = {
    xserver.desktopManager.cinnamon.enable = true; = true;
};

environment.cinnamon.excludePackages = [
  pkgs.blueman
];
}
