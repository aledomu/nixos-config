params@{ pkgs, ... }:

{
  wsl = {
    enable = true;
    docker-desktop.enable = true;
    defaultUser = "nixos";
    usbip.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  imports = [
    ./modules/settings-nixos.nix
    ./modules/virtualisation.nix
  ];

  system.stateVersion = "24.11";
}
