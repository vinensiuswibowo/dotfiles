

" theme
" let g:nvcode_termcolors=256
" colorscheme nvcode
colorscheme gruvbox
set background=dark

" if (has("termguicolors"))
"     hi LineNr ctermbg=NONE guibg=NONE
" endif

" hi Normal guibg=NONE
" hi Normal guibg=#282c34
" hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
" colors for git (especially the gutter)
" hi NonText guifg=bg                                     " mask ~ on empty lines
" coc multi cursor highlight color

hi clear CursorLineNr                                   " use the theme color for relative number
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan

" hi Comment gui=italic cterm=italic                      " italic comments
" hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
" hi CursorLineNr gui=bold                                " make relative number bold
" hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words

" hi DiffAdd  guibg=#0f111a guifg=#43a047
" hi DiffChange guibg=#0f111a guifg=#fdd835
" hi DiffRemoved guibg=#0f111a guifg=#e53935

" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

