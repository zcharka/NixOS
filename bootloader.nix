{ config, pkgs, ... }:

{
boot.loader.systemd-boot.enable = false;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.limine = {
  enable = true;
  maxGenerations = 5;
  efiSupport = true;
};

nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 7d";
  };

}
