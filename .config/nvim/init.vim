" if plug is not installed in nvim - install it automatically
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif    

call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'tpope/vim-commentary' " for simple commenting
Plug 'tpope/vim-surround'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'airblade/vim-gitgutter'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-eunuch'
Plug 'morhetz/gruvbox'
Plug 'alvan/vim-closetag'
call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/keys.vim
