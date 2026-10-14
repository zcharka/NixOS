{ config, pkgs, ... }:

{
boot.loader.systemd-boot.enable = false;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.limine = {
  enable = true;
  maxGenerations = 5;
  efiSupport = true;
};

#nix.gc = {
#  automatic = true;
#  dates = "daily";
#  options = "--delete-older-than 7d";
#  };

  boot = {
    plymouth = {
      enable = true;
      theme = "spinner";
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    loader.timeout = 5;
  };

}
