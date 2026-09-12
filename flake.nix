{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    kwin-effects-better-blur-dx = {
      url = "github:xarblu/kwin-effects-better-blur-dx";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    kwin-effects-better-blur-dx,
    nix-flatpak,
    nixos-hardware,
    ...
  }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit kwin-effects-better-blur-dx;
        };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };

      surface-book-2 = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit kwin-effects-better-blur-dx;
        };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          nixos-hardware.nixosModules.microsoft-surface-common

          ./configuration.nix
          ./hardware-configuration-surface-book-2.nix
          ./hosts/surface-book-2/default.nix
        ];
      };

    };
  };
}