{ config, lib, pkgs, ... }:

{
  programs.waybar.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  environment.systemPackages = with pkgs; [
  kitty
  rofi
  ];
}
