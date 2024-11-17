{ pkgs, ... }:

{
  wsl = {
    enable = true;
    defaultUser = "nixos";
    usbip.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  system.stateVersion = "24.05";

}
