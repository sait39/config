" if plug is not installed in nvim - install it automatically
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Find files

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'tpope/vim-commentary' " for simple commenting
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ludovicchabant/vim-gutentags'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
" Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" Plug 'godlygeek/tabular'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'airblade/vim-gitgutter'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-eunuch'


call plug#end()

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim

" Settings for Plugins
source $HOME/.config/nvim/setup-coc.vim
source $HOME/.config/nvim/setup-closetag.vim
source $HOME/.config/nvim/setup-auto-pairs.vim
