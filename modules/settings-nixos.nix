{ pkgs, ... }:

{
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-kde ];
    config.common.default = "kde";
  };

  environment.systemPackages = with pkgs; [
    git
    nixos-generators

    dtach
    minicom

    flatpak-builder
  ];

  services.flatpak.enable = true;

  programs = {
    ssh = {
      extraConfig = "AddKeysToAgent yes";
      startAgent = true;
    };

    nix-ld.enable = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      # experimental-features = "cgroups dynamic-derivations repl-flake recursive-nix auto-allocate-uids"
      # keep-derivations = true;
      # keep-outputs = true;
    };
  };
}
