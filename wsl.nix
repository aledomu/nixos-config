{ pkgs, ... }:
{
  wsl = {
    enable = true;
    defaultUser = "nixos";
    usbip.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };
}
