

" Explorer
let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 30,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'right-center',
\      'floating-width': 30,
\   },
\ }



" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-html',
  \'coc-tsserver',
  \'coc-prettier',
  \'coc-marketplace',
  \'coc-svg',
  \'coc-explorer',
  \'coc-snippets',
  \'coc-css',
  \'coc-cssmodules',
  \'coc-floaterm',
  \'coc-fzf-preview',
  \'coc-lists',
  \'coc-pairs',
  \'coc-stylelintplus',
  \'coc-tasks',
  \'coc-vimlsp',
  \'coc-yank'
  \]
