{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware.nix
      ./bootloader.nix
      ./programs.nix
      ./services.nix
      ./audio.nix
      ./etc.nix
      ./network.nix
# użytkownicy
      ./users/sebastian.nix
#       ./users/test.nix
# środowiska graficzne
      ./DE/greeter.nix
      ./DE/plasma.nix
#       ./DE/gnome.nix
#       ./DE/cosmic.nix
#       ./DE/hyprland.nix
#        ./DE/cinammon.nix
    ];

  system.stateVersion = "26.05";

}
