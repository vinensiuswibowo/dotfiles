
set nocompatible
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'gruvbox-community/gruvbox'
Plug 'Jorengarenar/vim-MvVis'                           " move visual selection
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'tpope/vim-fugitive'                               " git support
Plug 'vim-airline/vim-airline'
Plug 'romgrk/barbar.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'
Plug 'moll/vim-bbye'
Plug 'voldikss/vim-floaterm'
Plug 'stsewd/fzf-checkout.vim'

call plug#end()

