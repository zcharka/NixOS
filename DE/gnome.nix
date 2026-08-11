{ config, lib, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [

    gnome-tweaks
    nautilus
    gnome-software
    blackbox-terminal
    gnome-extension-manager
    gnomeExtensions.blur-my-shell
    gnomeExtensions.accent-directories
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.quick-settings-audio-panel
    gnomeExtensions.user-themes
    ];

environment.gnome.excludePackages = with pkgs; [
    seahorse
    ];

services = {
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = true;
    gnome.core-developer-tools.enable = false;
    gnome.games.enable = false;
    displayManager.gdmm.enable = true;
};
}
