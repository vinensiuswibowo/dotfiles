filetype plugin on
syntax on
set path+=**
set nocompatible
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
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
" set termguicolors         " Opaque Backgrou
set relativenumber        " current line is 1
set history=1002          " historyit limit
set undofile              " enable persistent undo
set undodir=/tmp          " undo temp file directory
set grepprg=rg\ --vimgrep " use rg as default grepper
set scrolloff=8
set nocursorcolumn
set scrolljump=8
set showmatch
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set shiftround
set ignorecase
set smartcase
set encoding=utf-8
set foldmethod=syntax
set foldlevel=99

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rafamadriz/neon'
Plug 'Mofiqul/vscode.nvim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'NTBBloodbath/rest.nvim'
Plug 'unblevable/quick-scope'
Plug 'romgrk/barbar.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glepnir/dashboard-nvim'
Plug 'tpope/vim-commentary'
Plug 'goldfeld/vim-seek'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

call plug#end()

" lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}

require('rest-nvim').setup()
EOF


lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'vscode',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

EOF

let g:neon_style = "dark"
let g:neon_italic_comment = "true"
colorscheme neon
set background=dark

hi Comment cterm=italic
" hi Normal     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE
" hi DiffAdd  guibg=#000000 guifg=#43a047
" hi DiffChange guibg=#000000 guifg=#fdd835
" hi DiffDelete guibg=#000000 guifg=#e53935

let g:dashboard_custom_header = {
    \ }
let g:dashboard_default_executive ='telescope'
let g:mapleader = "\<Space>"
let g:which_key_map = {}
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:omni_sql_no_default_maps = 1
let g:seek_subst_disable = 1

let g:which_key_map['s'] = {
    \ 'name' : '+search',
    \ 'f' : [':Telescope git_files theme=get_dropdown', 'Files'],
    \ 'w' : [':Telescope live_grep', 'Words'],
    \ 'b' : [':Telescope buffers', 'Buffers'],
    \ 'r' : [':Rg', 'Search And Replace'],
    \ }

let g:which_key_map.b = {
    \ 'name' : '+buffer',
    \ 'd' : [':bdelete',                        'Close'],
    \ 'c' : [':bufdo bd',                        'Close All'],
    \ }

let g:which_key_map.g = {
    \ 'name' : '+git',
    \ 'a' : [':FzfPreviewGitActions', 'Actions'],
    \ '>' : ['<Plug>(coc-git-nextconflict)',       'Next Conflict'],
    \ '<' : ['<Plug>(coc-git-prevconflict)',       'Prev Conflict'],
    \ 'c' : ['<Plug>(coc-git-keepcurrent)',        'Keep Current'],
    \ 'i' : ['<Plug>(coc-git-keepincoming)',       'Keep Incoming'],
    \ 'b' : ['<Plug>(coc-git-keepboth)',           'Keep Both'],
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


let g:which_key_map['?'] = [ ':Commands',                                    'commands' ]
let g:which_key_map['n'] = [ ':CocCommand explorer', 'Toggle Explorer' ]
let g:which_key_map['.'] = [ ':e ~/.config/nvim/init.vim',             'Config' ]
let g:which_key_map['v'] = [ '<C-W>v',                                       'split right']
let g:which_key_map['f'] = [ 'za',                                                                    'Terminal']
let g:which_key_map['r'] = [ '<Plug>RestNvim',                                                                    'Send REST Request']
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-html',
  \'coc-tsserver',
  \'coc-svelte',
  \'coc-explorer',
  \'coc-css',
  \'coc-prettier',
  \'coc-snippets',
  \'coc-git',
  \'coc-go',
  \'coc-pairs',
  \'coc-tailwindcss',
  \'coc-marketplace'
  \]


highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

augroup Format
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
augroup END

autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

call which_key#register('<Space>', "g:which_key_map")


" COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

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

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <expr> <silent> <C-d> <SID>select_current_word()
nnoremap <silent> K :call <SID>show_documentation()<CR>

"  END COC


" FUNCTIONS
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

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
endfunction

" END FUNCTION
nnoremap <silent> <TAB> :BufferNext<CR>
nnoremap <silent> <S-TAB> :BufferPrevious<CR>
nnoremap <C-q> :BufferClose<CR>
nnoremap <C-w> :q<CR>
vmap ++ :Commentary<CR>
nmap ++ :Commentary<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <silent><esc> <esc>:noh<CR><esc>
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>
inoremap jk <Esc>
inoremap kj <Esc>
map <Enter> o<ESC>
map <S-Enter> O<ESC>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" :cfdo %s/<text to search>/<text to replace with>/g | update
