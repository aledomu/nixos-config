params@{ pkgs, ... }:

{
  variables.EDITOR = "vim";

  systemPackages = with pkgs; [
    abduco
    minicom
    weechat

    fzf
    git

    (import ./vim.nix params)
  ];
}
