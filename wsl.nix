params@{ pkgs, ... }:

{
  wsl = {
    enable = true;
    defaultUser = "nixos";
    usbip.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  imports = [
    ./modules/settings-nixos.nix
    ./modules/virtualisation.nix
    ./modules/tmux.nix
  ];

  environment = import ./modules/env-dev.nix params;

  system.stateVersion = "24.05";

}
