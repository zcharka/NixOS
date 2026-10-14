{
  description = "NixOS config";

  inputs = {
    # Główne nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Stable 26.05
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    kwin-effects-glass = {
      url = "github:4v3ngR/kwin-effects-glass";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    superfile = {
      url = "github:yorukot/superfile";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # LineXinBar
    linexinbar = {
      url = "github:petexy/LineXinBar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Console Experience Desktop Manager
    cedm = {
      url = "github:petexy/CEDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-stable,
    nix-flatpak,
    nixos-hardware,
    caelestia-shell,
    linexinbar,
    cedm,
    ...
  }:
  let
    system = "x86_64-linux";

    # Poprawiony LineXinBar compositor.
    # lxb-compositor ma tylko target binarny, więc nie może być
    # testowany z `--lib`.
    lxb-compositor =
      (nixpkgs.legacyPackages.${system}.callPackage
        "${linexinbar}/packaging/nix/package.nix"
        {
          src = linexinbar;
          component = "compositor";
        }).overrideAttrs (old: {
          cargoTestFlags = [
            "-p"
            "lxb-compositor"
            "--bins"
          ];
        });

    # CEDM z naszym poprawionym lxb-compositor.
    cedm-package =
      nixpkgs.legacyPackages.${system}.callPackage
        "${cedm}/packaging/nix/package.nix"
        {
          src = cedm;
          lxb-compositor = lxb-compositor;
        };

    # CEDM z aktualnym modułem NixOS ma jeszcze:
    #
    #   services.greetd.vt = cfg.vt;
    #
    # W obecnym nixpkgs opcja `services.greetd.vt` już nie istnieje.
    # Usuwamy tylko tę linię podczas importowania modułu.
    cedm-module =
      import (builtins.toFile "cedm-module.nix"
        (builtins.replaceStrings
          [ "      vt = cfg.vt;\n" ]
          [ "" ]
          (builtins.readFile "${cedm}/packaging/nix/module.nix")
        ));
  in
  {
    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          inherit nixpkgs-stable;
          inherit caelestia-shell;
          inherit linexinbar;
          inherit cedm;
          inherit lxb-compositor;
          inherit cedm-package;
        };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak

          nixos-hardware.nixosModules.microsoft-surface-pro-intel

          # LineXinBar
          linexinbar.nixosModules.linexinbar

          # CEDM - poprawiony moduł
          cedm-module

          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };

      surface-book-pro-3 = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          inherit nixpkgs-stable;
          inherit linexinbar;
          inherit cedm;
          inherit lxb-compositor;
          inherit cedm-package;
        };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak

          nixos-hardware.nixosModules.microsoft-surface-pro-intel

          # LineXinBar
          linexinbar.nixosModules.linexinbar

          # CEDM - poprawiony moduł
          cedm-module

          ./configuration.nix
          ./hardware-configuration.nix
          ./hosts/surface-pro-3/default.nix
        ];
      };

    };
  };
}
