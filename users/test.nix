{ config, pkgs, ... }:
{
  users.users."test" = {
    isNormalUser = true;
    description = "test";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [
    ];
  };
}
