{
  description = "NixOS config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kwin-effects-better-blur-dx = {
      url = "github:xarblu/kwin-effects-better-blur-dx";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
  outputs = { self, nixpkgs, kwin-effects-better-blur-dx, nix-flatpak, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit kwin-effects-better-blur-dx;
      };
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
      ];
    };
  };
}