params@{ pkgs, ... }:

{
  variables.EDITOR = "vim";

  systemPackages = with pkgs; [
    dtach
    minicom
    weechat

    fzf
    git

    (import ./vim.nix params)
  ];
}
