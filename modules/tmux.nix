{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
  };
}
