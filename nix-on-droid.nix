params@{ pkgs, ... }: let
  env-dev = import ./modules/env-dev.nix params;
in
{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  android-integration = {
    am.enable                     = true;
    termux-open.enable            = true;
    termux-open-url.enable        = true;
    termux-reload-settings.enable = true;
    termux-setup-storage.enable   = true;
    termux-wake-lock.enable       = true;
    termux-wake-unlock.enable     = true;
    xdg-open.enable               = true;
  };

  environment = {
    etcBackupExtension = ".bak";

    sessionVariables = env-dev.variables;

    packages = with pkgs; [
      # Some common stuff that people expect to have
      #procps
      #killall
      #diffutils
      #findutils
      #utillinux
      #tzdata
      #hostname
      #man
      #gnugrep
      #gnupg
      #gnused
      #gnutar
      #bzip2
      #gzip
      #xz
      #zip
      #unzip
    ]
    ++ env-dev.systemPackages;
  };

  system.stateVersion = "24.05";
}
