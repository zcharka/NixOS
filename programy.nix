{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  btop
  antigravity
  lutris
  prismlauncher
  vscode
  libreoffice-fresh
  protonup-qt
  protonplus
  winetricks
  hydralauncher
  davinci-resolve
  gnomecast
  python3
  maven
  alsa-tools
  alsa-utils
  cursor-cli
  codex
  heroic
  pacman
  qemu
  dnsmasq
  kvmtool
  resources
  mangohud
  proton-pass
  kdePackages.partitionmanager
  gparted
  roboto-mono
  blockbench
  blender
  anydesk
  git

  (python3.withPackages (python-pkgs: with python-pkgs; [
        pip
        torchvision
        pillow
        hydra-core
        iopath
        #sam2
        opencv4
        pychromecast
        bottle
        pycaption
        paste
        html5lib
        pygobject3
        dbus-python
        libadwaita
      ]))

  (discord.override {
  withVencord = true;
})
  ];

  services.flatpak = {
  enable = true;
  packages = [
    "app.zen_browser.zen"
  ];
};

  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.symbols-only
  font-awesome
  roboto
  roboto-mono

  maple-mono.NormalNL-NF-CN
  maple-mono.NormalNL-CN
  maple-mono.NF-CN
];


programs = {
  virt-manager.enable = true;
  gamemode.enable = true;
  firefox.enable = true;
  thunderbird.enable = false;

  direnv.enable = true;
  direnv.nix-direnv.enable = true;

  steam = {
    enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos";
  };
};

virtualisation.libvirtd = {
  enable = true;
  qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
};

  nixpkgs.config.allowUnfree = true;

}
