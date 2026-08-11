{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = false;
    enableIPv6 = false;
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
    nftables.enable = true;
  };
  systemd.services.NetworkManager-wait-online.enable = false; # Nie czekaj na internet by uruchomić system

  services.zerotierone = {
    enable = false;
    joinNetworks = [""];
    };

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

}
