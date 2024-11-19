{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfigBeforePlugins = ''
      set -g mouse on
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
  };
}
