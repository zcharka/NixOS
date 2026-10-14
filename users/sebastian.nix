{ config, pkgs, ... }:
{
  users.users."sebastian" = {
    isNormalUser = true;
    description = "sebastian";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "usb" ];
    packages = with pkgs; [
      kdePackages.kate
#       thunderbird
    ];
  };
}
