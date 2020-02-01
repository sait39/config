" custom key mappings

inoremap jk <ESC>

" when using escape make sure to get rid of highlighting
nnoremap <ESC> :noh<cr>:<BS>
" :noh<cr>    // gets rid of the current highlighted search
" :<BS>       // enters a : into the command line of vim and deletes it
    " this way the vim command line gets cleared

" set plus and minus to window resize
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif



" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" " better curlybraces action
" inoremap {<cr> {<cr>}<c-o>O<tab>
" inoremap [<cr> [<cr>]<c-o>O<tab>
" inoremap (<cr> (<cr>)<c-o>O<tab>


" ctrl-backspace to delete word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

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

" Change leader to space
