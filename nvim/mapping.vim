
let mapleader=" "
"" the essentials

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

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>

" Alternate way to quit
nnoremap <silent> <C-q> :wq!<CR>

" use a different register for delete and paste
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


" " show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

"" coc

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" multi cursor shortcuts
nmap <silent> <C-a> <Plug>(coc-cursors-word)
xmap <silent> <C-a> <Plug>(coc-cursors-range)


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

vmap H <Plug>(MvVisLeft)
vmap J <Plug>(MvVisDown)
vmap K <Plug>(MvVisUp)
vmap L <Plug>(MvVisRight)

" Better indenting
vnoremap < <gv
vnoremap > >gv

" exc terminal
tnoremap <Esc> <C-\><C-n>

call which_key#register('<Space>', "g:which_key_map")
