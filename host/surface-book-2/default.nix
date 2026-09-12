{ config, pkgs, lib, ... }:

{


  hardware.microsoft-surface.kernelVersion = "stable";

  services.iptsd.enable = true;

  services.surface-dtx-daemon = {
    enable = true;

    attach = ''
    '';

    detach = ''
    '';

    detach_abort = ''
    '';
  };


  hardware.sensor.iio.enable = true;


  environment.systemPackages = with pkgs; [
    surface-control
  ];


  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.cpu.intel.updateMicrocode = true;
}