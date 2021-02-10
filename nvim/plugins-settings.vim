

" ======================== Plugin Configurations ======================== "{{{


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters={
	\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
let g:python3_host_prog = '/usr/local/bin/python3'

"" built in plugins
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

"" coc

" indentLine
let g:indentLine_char_list = ['▏', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
let g:indentLine_fileTypeExclude = ['startify']

" rainbow brackets
" let g:rainbow_active = 1


" GitGutter

let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_removed            = '契'
let g:gitgutter_sign_removed_first_line = '契'
let g:gitgutter_sign_modified_removed   = '▎'
let g:gitgutter_preview_win_floating = 1

let g:gitgutter_enabled = 1

highlight GitGutterAdd    guifg=#587C0C ctermfg=2
highlight GitGutterChange guifg=#0C7D9D ctermfg=3
highlight GitGutterDelete guifg=#94151B ctermfg=1

"" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea'"

"}}}


let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
let g:floaterm_title=''

" Floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
