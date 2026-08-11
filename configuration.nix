{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware.nix
      ./bootloader.nix
      ./users.nix
      ./programs.nix
      ./services.nix
      ./audio.nix
      ./etc.nix
      ./network.nix
# środowiska graficzne
      ./DE/plasma.nix
#       ./DE/gnome.nix
#       ./DE/cosmic.nix
#       ./DE/hyprland.nix
    ];

  system.stateVersion = "26.05";

}
