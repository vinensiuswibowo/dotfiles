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
hi FloatermBorder guibg=#282828 guifg=#928374
hi FloatermNC guibg=gray

" hi Comment gui=italic cterm=italic                      " italic comments
" hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
" hi CursorLineNr gui=bold                                " make relative number bold
" hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words

hi DiffAdd  guibg=#43a047 guifg=#3c3836
hi DiffChange guibg=#fdd835 guifg=#3c3836
hi DiffDelete guibg=#e53935 guifg=#3c3836

" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

