filetype plugin on

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
set nocompatible
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'Jorengarenar/vim-MvVis'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'whatyouhide/vim-gotham'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sainnhe/sonokai'


call plug#end()

syntax enable             " Enables syntax highlighing
set hidden                " Required to keep multiple buffers open multiple buffers
set noerrorbells
set nowrap
set whichwrap+=<,>,[,],h,l
set cmdheight=1           " More space for displaying messages
set mouse=a               " Enable your mouse
set nohlsearch
set splitbelow            " Horizontal splits will automatically be below
set splitright            " Vertical splits will automatically be to the right
set number                " Line numbers
set noshowmode            " We don't need to see things like -- INSERT -- anymore
set nobackup              " This is recommended by coc
set noswapfile
set nowritebackup         " This is recommended by coc
set shortmess+=c          " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes        " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=50         " Faster completion
set timeoutlen=500        " By default timeoutlen is 1000 ms
set clipboard=unnamedplus " Copy paste between vim and everything else
set termguicolors         " Opaque Backgrou
set relativenumber        " current line is 1
set history=1002          " history limit
set undofile              " enable persistent undo
set undodir=/tmp          " undo temp file directory
set grepprg=rg\ --vimgrep " use rg as default grepper
set scrolloff=8
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
set foldmethod=syntax
set foldlevel=99

" THEMES
" colorscheme gruvbox
" colorscheme dracula
" colorscheme gotham
" colorscheme PaperColor
let g:sonokai_style = 'atlantis'
colorscheme sonokai
let g:sonokai_transparent_background = 1
" let g:airline_theme='onehalfdark'
" let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" let g:material_theme_style= 'darker'
" let g:airline_theme = 'material'

set background=dark
hi Comment cterm=italic
hi Normal     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
" hi Search cterm=NONE ctermfg=grey ctermbg=blue
" hi LineNr ctermbg=NONE guibg=NONE

hi DiffAdd  guibg=#000000 guifg=#43a047
hi DiffChange guibg=#000000 guifg=#fdd835
hi DiffDelete guibg=#000000 guifg=#e53935

" hi DiffAdd  guibg=#43a047 guifg=#000000
" hi DiffChange guibg=#fdd835 guifg=#000000
" hi DiffDelete guibg=#e53935 guifg=#000000

" END THEMES

" SETTINGS
" AIRLINE
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'


let g:mapleader = "\<Space>"
let g:which_key_map = {}
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:coc_snippet_next = '<tab>'
let maplocalleader = " "
let loaded_netrw = 0
let g:mapleader = "\<Space>"
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
    \ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
    \ }
let g:NERDDefaultAlign = 'left'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:omni_sql_no_default_maps = 1
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

let g:startify_lists = [
  \ { 'type': 'dir'       },
  \ { 'type': 'files'     },
  \ { 'type': 'sessions'  },
  \ { 'type': 'bookmarks' },
  \ { 'type': 'commands' },
  \ ]

let g:startify_commands = [
  \ {'ch': ['Health Check',       ':checkhealth']},
  \ {'ps': ['Plugins status',     ':PlugStatus']},
  \ {'pu': ['Update vim plugins', ':PlugUpdate | PlugUpgrade']},
  \ {'uc': ['Update coc Plugins', ':CocUpdate']},
  \ {'f':  ['Find file',          ':CocCommand fzf-preview.DirectoryFiles']},
  \ {'ui': ['Edit init.vim',      ':e ~/code/dotfiles/nvim/init.vim']},
  \ {'h':  ['Help',               ':help']},
  \ ]

let g:startify_custom_header = []
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-html',
  \'coc-tsserver',
  \'coc-marketplace',
  \'coc-explorer',
  \'coc-snippets',
  \'coc-css',
  \'coc-prettier',
  \'coc-cssmodules',
  \'coc-lists',
  \'coc-pairs',
  \'coc-stylelintplus',
  \'coc-vimlsp',
  \'coc-restclient',
  \'coc-fzf-preview',
  \'coc-git',
  \'coc-yank'
  \]

" END SETTINGS


let g:which_key_map['s'] = {
    \ 'name' : '+search',
    \ 'f' : [':CocCommand fzf-preview.DirectoryFiles', 'Files'],
    \ 'w' : [':Rg',                                    'Words'],
    \ }

let g:which_key_map.b = {
    \ 'name' : '+buffer',
    \ 'l' : [':CocCommand fzf-preview.Buffers', 'List'],
    \ 'd' : [':bdelete',                        'Close'],
    \ }

let g:which_key_map.l = {
    \ 'name' : '+lsp' ,
    \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
    \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
    \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
    \ 'b' : [':CocNext'                            , 'next action'],
    \ 'B' : [':CocPrev'                            , 'prev action'],
    \ 'c' : [':CocList commands'                   , 'commands'],
    \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
    \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
    \ 'e' : [':CocList extensions'                 , 'extensions'],
    \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
    \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
    \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
    \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
    \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
    \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
    \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
    \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
    \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
    \ 'O' : [':CocList outline'                    , 'search outline'],
    \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
    \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
    \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
    \ 'r' : ['<Plug>(coc-references)'              , 'references'],
    \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
    \ 's' : [':CocList -I symbols'                 , 'references'],
    \ 'S' : [':CocList snippets'                   , 'snippets'],
    \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
    \ }

let g:which_key_map.g = {
    \ 'name' : '+git',
    \ 'a' : [':CocCommand fzf-preview.GitActions', 'Actions'],
    \ 'B' : [':Gblame',                            'Blame'],
    \ 'l' : [':CocCommand fzf.-preview.GitLogs',   'Logs'],
    \ '>' : ['<Plug>(coc-git-nextconflict)',       'Next Conflict'],
    \ '<' : ['<Plug>(coc-git-prevconflict)',       'Prev Conflict'],
    \ 'c' : ['<Plug>(coc-git-keepcurrent)',        'Keep Current'],
    \ 'i' : ['<Plug>(coc-git-keepincoming)',       'Keep Incoming'],
    \ 'b' : ['<Plug>(coc-git-keepboth)',           'Keep Both'],
    \ }

" Single mappings
let g:which_key_map['?'] = [ ':Commands',                                    'commands' ]
let g:which_key_map['n'] = [ ':CocCommand explorer --sources=buffer+,file+', 'Toggle Explorer' ]
let g:which_key_map['w'] = [ ':BLines',                                      'Current Buffer Fuzzy Find' ]
let g:which_key_map['.'] = [ ':e ~/code/dotfiles/nvim/init.vim',             'init.vim' ]
let g:which_key_map['v'] = [ '<C-W>v',                                       'split right']
let g:which_key_map['f'] = [ 'za',                                           'Fold']



highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline


" AUTO COMMANDS
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

call which_key#register('<Space>', "g:which_key_map")


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" startify if no passed argument or all buffers are closed
augroup noargs
    " startify when there is no open buffer left
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')




" END AUTO COMMANDS


" FUNCTIONS
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


" MAPPINGS
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf <Plug>(coc-fix-current)
nmap <expr> <silent> <C-d> <SID>select_current_word()
nnoremap <silent> K :call <SID>show_documentation()<CR>
xmap <silent> ga <Plug>(EasyAlign)
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

"Navigate to window.
nnoremap <C-w> <cmd>q<CR>
nnoremap <C-q> :bdelete<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <silent><esc> <esc>:noh<CR><esc>

"resize window
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

map <Enter> o<ESC>
map <S-Enter> O<ESC>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>


" Indent controls
vnoremap < <gv
vnoremap > >gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vmap J <Plug>(MvVisDown)
vmap K <Plug>(MvVisUp)



