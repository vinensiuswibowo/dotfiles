" ============= Vim-Plug ============== "{{{

filetype plugin on

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

source $HOME/.config/nvim/plugins.vim
" luafile $HOME/.config/nvim/nvcodeline.lua
source $HOME/.config/nvim/barbar.vim
source $HOME/.config/nvim/config.vim
source $HOME/.config/nvim/whichkey.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/startify.vim
source $HOME/.config/nvim/plugins-settings.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/function.vim
source $HOME/.config/nvim/mapping.vim

