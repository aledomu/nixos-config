params@{ pkgs, ... }:

{
  systemPackages = with pkgs; [
    dtach
    minicom
    weechat

    fzf
    git
  ];
}
