{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    extraConfigBeforePlugins = ''
      set -g mouse on
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
  };
}
