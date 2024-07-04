" vim-plug setup
call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bluz71/vim-nightfly-colors'

call plug#end()

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Set colorscheme
colorscheme nightfly

" Indentation settings (adjust to your preference)
set tabstop=4
set shiftwidth=4
set expandtab

" Enable mouse support in terminal
set mouse=a
