
syntax enable             " Enables syntax highlighing
set hidden                " Required to keep multiple buffers open multiple buffers
set whichwrap+=<,>,[,],h,l
set cmdheight=1           " More space for displaying messages
set mouse=a               " Enable your mouse
set splitbelow            " Horizontal splits will automatically be below
set splitright            " Vertical splits will automatically be to the right
set number                " Line numbers
" set noshowmode            " We don't need to see things like -- INSERT -- anymore
set nobackup              " This is recommended by coc
set nowritebackup         " This is recommended by coc
set shortmess+=c          " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes        " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300        " Faster completion
set timeoutlen=500        " By default timeoutlen is 1000 ms
set clipboard=unnamedplus " Copy paste between vim and everything else
" set termguicolors         " Opaque Background
set relativenumber        " current line is 1
set history=1002          " history limit
set undofile              " enable persistent undo
set undodir=/tmp          " undo temp file directory
set grepprg=rg\ --vimgrep " use rg as default grepper
set nocursorline
set nocursorcolumn
set scrolljump=8
set showmatch
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set shiftround
set ignorecase
set smartcase
set encoding=utf-8
" set nowrap                              " Display long lines as just one line


