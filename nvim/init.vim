" vim-plug setup
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Set colorscheme (choose your favorite)
colorscheme nightfly

" Indentation settings (adjust to your preference)
set tabstop=4
set shiftwidth=4
set expandtab

" Enable mouse support in terminal
set mouse=a

" vim-plug setup
call plug#begin('~/.local/share/nvim/plugged')
