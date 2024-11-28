params@{ pkgs, ... }:

{
  variables.EDITOR = "vim";

  systemPackages = with pkgs; [
    minicom
    weechat

    fzf
    git

    (import ./vim.nix params)
  ];
}
