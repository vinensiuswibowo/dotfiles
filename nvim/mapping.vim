

"" the essentials

" Set leader to space bar
let mapleader = " "
let maplocalleader = " "


" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>


vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"interface with the system's clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" new line in normal mode and back
map <Enter> o<ESC>
map <S-Enter> O<ESC>


" Alternate way to quit
nnoremap <silent> <C-q> :wq!<CR>

nnoremap <C-h> <C-w>h

" Navigate to down window.
nnoremap <C-j> <C-w>j

" Navigate to top window.
nnoremap <C-k> <C-w>k

" Navigate to right window.
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use <c-space> to trigger completion.

inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

vmap H <Plug>(MvVisLeft)
vmap J <Plug>(MvVisDown)
vmap K <Plug>(MvVisUp)
vmap L <Plug>(MvVisRight)

" Indent controls
" Reselect text ater indent/unindent.
vnoremap < <gv
vnoremap > >gv
" Tab to indent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


" exc terminal
tnoremap <Esc> <C-\><C-n>

call which_key#register('<Space>', "g:which_key_map")
