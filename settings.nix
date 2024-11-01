{ pkgs, ... }:
{
  i18n.defaultLocale = "es_ES.UTF-8";

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
