{ config, pkgs, ... }:
{
services = {
  displayManager.sddm.enable = true;
  displayManager.gdm.enable = false;
  displayManager.cosmic-greeter.enable = false;
};
}
