" GENERAL SETTINGS


" Basic Settings

	set formatoptions-=cro

    filetype plugin indent on
	set smarttab

    set termguicolors

    " global tab settings
    set tabstop=4
    set shiftwidth=4

    set mouse=a

    set ignorecase
    set smartcase

    set relativenumber
    set number
	set complete-=t

	set iskeyword+=-
	set iskeyword+=.

    set scrolloff=4 " Keep 4 lines below and above the cursor

    set path+=**

    colorscheme gruvbox

" Keybindings

    let mapleader=" "

    map <leader>i :setlocal autoindent<CR>
    map <leader>I :setlocal noautoindent<CR>
	map <leader>q :conf q<CR>

	map <leader>tac :ToggleAutoComment<CR>

	" " Copy to clipboard
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy

	" " Paste from clipboard
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P

	" convenient way to open nerdtree
	nmap <leader>ne :NERDTree<cr>

	" change working directory to buffers directory
	nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


	" when using escape make sure to get rid of highlighting
	nnoremap <ESC> :noh<cr>:<BS>
	" :noh<cr>    // gets rid of the current highlighted search
	" :<BS>       // enters a : into the command line of vim and deletes it
    " this way the vim command line gets cleared

	" fzf
	map <C-p> <Esc><Esc>:Files!<CR>
	inoremap <C-f> <Esc><Esc> :BLines!<CR>


	" Extras

    " Vertically center document when entering insert mode
    " autocmd InsertEnter * norm zz

    " Remove whitespace at the end of lines
    autocmd BufWritePre * %s/\s\+$//e

    " -- FOLDING --
     set foldmethod=syntax " highlighting items specify folds
     set foldcolumn=1
     " Make all folds be open
     set foldlevelstart=99

    " ctrlp ignore folders
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

    " Shortcutting split navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()


command! ToggleAutoComment if &fo =~ 'cro' | set fo-=cro | else | set fo+=cro | endif

