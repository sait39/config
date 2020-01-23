" GENERAL SETTINGS

filetype plugin indent on

set termguicolors

set path+=**

" global tab settings
set expandtab
set tabstop=4
set shiftwidth=4

" set number
" set relativenumber

" set default clipboard to global clipboard set clipboard+=unnamedplus 
set number

" -- FOLDING --
" set foldmethod=syntax " highlighting items specify folds
" set foldcolumn=1 
" let javaScript_fold=1 " activate folding by JS syntax"
" set foldlevelstart=99

" hi Folded ctermbg=234
" hi Folded ctermfg=177
" hi MatchParen ctermbg=61 
" guibg=17

set scrolloff=4 " Keep 4 lines below and above the cursor
colorscheme gruvbox

" Window Swapping

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" ctrlp ignore folders

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

