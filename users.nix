{ config, pkgs, ... }:

{
  users.users."sebastian" = {
    isNormalUser = true;
    description = "sebastian";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      kdePackages.kate
#       thunderbird
    ];
  };
}
