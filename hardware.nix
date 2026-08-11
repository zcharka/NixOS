{ config, pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    # Akceleracja wideo na zintegrowanej grafice Intel
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    prime = {
      # 0000:00:02.0
      intelBusId = "PCI:0@0:2:0";

      # 0000:01:00.0
      nvidiaBusId = "PCI:1@0:0:0";

      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  fileSystems."/mnt/pliki" = {
  device = "/dev/disk/by-uuid/b5471966-ae4e-4821-8b0d-0ec5f41e225b";
  fsType = "btrfs";
  options = [
    "defaults"
    "nofail"
  ];
};

  swapDevices = [
  {
    device = "/var/lib/swapfile"; size = 8192;
  }
];
}
