{ config, pkgs, lib, nix-hardware, surface-book-pro-3, ... }:

{


  hardware.microsoft-surface.kernelVersion = "stable";
  hardware.graphics = {
   enable = true;
   enable32Bit = true;
   };
  hardware.cpu.intel.updateMicrocode = true;

  environment.systemPackages = with pkgs; [
    surface-control
    maliit-keyboard
  ];

  i18n.defaultLocale = "pl_PL.UTF-8";

  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };
}
