let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Single mappings
let g:which_key_map['?'] = [ ':Commands',                                    'commands' ]
let g:which_key_map['a'] = [ '<Plug>(EasyAlign)',                            'Align' ]
let g:which_key_map['F'] = [ ':Format',                                      'Format Buffer' ]
let g:which_key_map['f'] = [ 'za',                                           'Folding' ]
let g:which_key_map['n'] = [ ':CocCommand explorer --sources=buffer+,file+', 'Toggle Explorer' ]
let g:which_key_map['t'] = [ ':FloatermToggle',                              'Toggle Terminal' ]


"s is for search
let g:which_key_map.s = {
      \ 'name' : '+Search',
      \ 'w' : [':Rg',       'Search Words'],
      \ 'f' : ['Files',     'Search files'],
      \ 'a' : [':Ag',       'Search text ag'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'l' : [':Buffers',  'List Buffers'],
      \ 'd' : [':Bdelete',  'delete-buffer'],
      \ 'n' : ['bnext',     'next-buffer'],
      \ 'p' : ['bprevious', 'previous-buffer'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'a' : [':Git add .',                        'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus', 'actions'],
      \ 'b' : [':Git blame',                        'blame'],
      \ 'B' : [':GBrowse',                          'browse'],
      \ 'c' : [':Git commit',                       'commit'],
      \ 'C' : [':GCheckout',                        'checkout'],
      \ 'D' : [':Git diff',                         'diff'],
      \ 'd' : [':Gvdiffsplit!',                     'diff merge tool'],
      \ 'q' : ['<C-w>o',                            'close merge tool'],
      \ 's' : [':Gstatus',                          'status'],
      \ 'l' : [':Git log',                          'log'],
      \ 'p' : [':Git push',                         'push'],
      \ 'P' : [':Git pull',                         'pull'],
      \ 't' : [':GitGutterSignsToggle',             'toggle signs'],
      \ 'v' : [':GV',                               'view commits'],
      \ 'V' : [':GV!',                              'view buffer commits'],
      \ '[' : [':diffget //2',                      'Pick Incoming'],
      \ ']' : [':diffget //3',                      'Pick Current'],
      \ }

" c is for language server protocol
let g:which_key_map.c = {
      \ 'name' : '+Coc',
      \ '.' : [':CocConfig',                            'config'],
      \ 'b' : [':CocNext',                              'next action'],
      \ 'B' : [':CocPrev',                              'prev action'],
      \ 'c' : [':CocList commands',                     'commands'],
      \ 'd' : ['<Plug>(coc-definition)',                'definition'],
      \ 'e' : [':CocList extensions',                   'extensions'],
      \ 'F' : ['<Plug>(coc-format-selected)',           'format selected'],
      \ 'f' : ['<Plug>(coc-fix-current)',               'fix current'],
      \ 'i' : ['<Plug>(coc-implementation)',            'implementation'],
      \ 'I' : [':CocList diagnostics',                  'diagnostics'],
      \ 'l' : ['<Plug>(coc-codelens-action)',           'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)',           'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)',     'next error'],
      \ 'O' : [':CocList outline',                      'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)',           'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)',     'prev error'],
      \ 'r' : [':CocCommand fzf-preview.CocReferences', 'references'],
      \ 'R' : ['<Plug>(coc-rename)',                    'rename'],
      \ 'S' : [':CocList snippets',                     'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)',           'type definition'],
      \ }

let g:which_key_map.h = {
      \ 'name': '+help',
      \ 'h': [':help', 'help']
  \ }




