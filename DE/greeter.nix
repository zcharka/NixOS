{ config, pkgs, ... }:
{
services = {
  displayManager.sddm.enable = true;
  displayManager.sddm.enable = false;
  displayManager.cosmic-greeter.enable = false;
};
}
