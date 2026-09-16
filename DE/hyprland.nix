{ config, lib, pkgs, caelestia-shell, ... }:

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
  caelestia-shell.packages.${pkgs.system}.with-cli
  ];
}
