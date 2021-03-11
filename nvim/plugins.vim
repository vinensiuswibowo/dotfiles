
set nocompatible
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'gruvbox-community/gruvbox'
Plug 'gregsexton/MatchTag'                              " highlight matching html tags
Plug 'Jorengarenar/vim-MvVis'                           " move visual selection
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'                               " git support
Plug 'vim-airline/vim-airline'
Plug 'romgrk/barbar.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'liuchengxu/vim-which-key'
Plug 'moll/vim-bbye'
Plug 'voldikss/vim-floaterm'
Plug 'stsewd/fzf-checkout.vim'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

