{ config, lib, pkgs, kwin-effects-better-blur-dx, ... }:

{

  environment.systemPackages = with pkgs; [
  kdePackages.kdenlive
  kdePackages.qtstyleplugin-kvantum
  kdePackages.kwin
  kde-rounded-corners
  kwin-effects-better-blur-dx.packages.${pkgs.system}.default

  ];

programs = {
  kdeconnect.enable = true;
  };

services = {
  desktopManager.plasma6.enable = true;
  };
}
