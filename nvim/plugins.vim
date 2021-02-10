
set nocompatible
call plug#begin(expand('~/.config/nvim/plugged'))

"}}}

" ================= looks and GUI stuff ================== "{{{

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'tomasr/molokai'			" sublime theme
Plug 'gregsexton/MatchTag'                              " highlight matching html tags
Plug 'Jorengarenar/vim-MvVis'                           " move visual selection
Plug 'glepnir/galaxyline.nvim'

" ================= Functionalities ================= "{{{

Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
" Plug 'SirVer/ultisnips'                                 " snippets manager
" Plug 'honza/vim-snippets'                               " actual snippets
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'                               " cool start up screen
Plug 'voldikss/vim-floaterm'

" Terminal
Plug 'voldikss/vim-floaterm'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'                               " git support

" Better tabline
Plug 'romgrk/barbar.nvim'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'liuchengxu/vim-which-key'
" Intuitive buffer closing
Plug 'moll/vim-bbye'

Plug 'editorconfig/editorconfig-vim'
Plug 'herringtondarkholme/yats.vim' 	" Typescript syntax

call plug#end()

