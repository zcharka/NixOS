{ config, pkgs, ... }:

{

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

environment.sessionVariables = {
  XDG_DATA_DIRS = [
    "/var/lib/flatpak/exports/share"
    "/home/sebastian/.local/share/flatpak/exports/share"
  ];
};

  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
};

nix.gc = {
  automatic = true;
  dates = "daily";
  options = "--delete-older-than 7d";
};

  nix.settings.auto-optimise-store = true;

  console.keyMap = "pl2";

networking = {
  firewall.trustedInterfaces = [ "virbr0" ];
  # firewall.allowedTCPPorts = [ ... ];
  # firewall.allowedUDPPorts = [ ... ];
  # firewall.enable = false;
  };

  nixpkgs.overlays = [
  (final: prev: {
    pythonPackagesExtensions =
      prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          paste = python-prev.paste.overridePythonAttrs (_old: {
            doCheck = false;
          });
        })
      ];
  })
];
  environment.shellAliases = {
  nhs = "nh os switch -a /etc/nixos";
  nhu = "nh os switch -a /etc/nixos --update";
};

}
