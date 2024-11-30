{ pkgs, ... }:

pkgs.vim.customize {
  vimrcConfig = {
    customRC = ''
      set nocompatible

      set number relativenumber
      set wrap
      set scrolloff=8
      set backspace=indent,eol,start
      set mouse=a

      set hidden
      set noswapfile
      set incsearch

      let g:slime_target = "vimterminal"
    '';

    packages.myplugins.start = with pkgs.vimPlugins; [
      vim-vinegar
      fzf-vim
      undotree
      vim-dispatch

      vim-fugitive
      vim-gitgutter
      vim-lsp
      vim-lsp-settings
      vim-slime
      vim-tmux-navigator

      vimtex
      vim-pandoc
      vim-pandoc-syntax
      vim-table-mode
    ];
  };
}
