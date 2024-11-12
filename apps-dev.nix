{ pkgs, ... }:

{

  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment = {

    variables.EDITOR = "vim";

    systemPackages = with pkgs; [

      distrobox

      nix-search-cli

      minicom
      weechat

      fzf
      git

      (pkgs.vim_configurable.customize {
        name = "vim";
        vimrcConfig = {
          customRC = ''
            set nocompatible

            set number relativenumber
            set wrap
            set scrolloff=8
            set backspace=indent,eol,start

            set hidden
            set noswapfile
            set incsearch
          '';
          packages.myplugins.start = with pkgs.vimPlugins; [
            fzf-vim
            undotree
            vim-dispatch

            vim-fugitive
            vim-gitgutter
            vim-lsp
            vim-lsp-settings
            vim-tmux-navigator

            vimtex
            vim-pandoc
            vim-pandoc-syntax
          ];
        };
      })

    ];
  };

}
