

" theme
" let g:nvcode_termcolors=256
" colorscheme nvcode
colorscheme gruvbox

if (has("termguicolors"))
    hi LineNr ctermbg=NONE guibg=NONE
endif

hi Normal guibg=NONE
" hi Normal guibg=#282c34
" hi Pmenu guibg='#00010a' guifg=white                    " popup menu colors
hi Comment gui=italic cterm=italic                      " italic comments
hi Search guibg=#b16286 guifg=#ebdbb2 gui=NONE          " search string highlight color
" hi NonText guifg=bg                                     " mask ~ on empty lines
hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold
hi SpellBad guifg=NONE gui=bold,undercurl               " misspelled words

" colors for git (especially the gutter)
hi DiffAdd  guibg=#0f111a guifg=#43a047
hi DiffChange guibg=#0f111a guifg=#fdd835
hi DiffRemoved guibg=#0f111a guifg=#e53935

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

