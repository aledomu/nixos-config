{ pkgs, ... }:

{
  environment = {

    variables.EDITOR = "vim";

    systemPackages = with pkgs; [

      nix-search-cli

      tmux
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

            vimtex
            vim-pandoc
            vim-pandoc-syntax
          ];
        };
      })

    ];
  };
}
