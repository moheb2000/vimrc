" General vimrc settings ---------------------- {{{
set number
set numberwidth=5
set tabstop=4
set foldlevelstart=0
let maplocalleader=","
" }}}
" normal mode mapping ---------------------- {{{
" Select current word with space
nnoremap <space> viW
" Capitalized whole word with ctrl+u
inoremap <c-u> <esc>viWUi
nnoremap <c-u> viWU
" Open .vimrc with split
nnoremap <localleader>ev :vsplit $MYVIMRC<cr>
nnoremap <localleader>sv :source $MYVIMRC<cr>
" Go to the begining and end of current line wiht H and L
nnoremap H ^
nnoremap L $
" inactivate up and down arrow in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
" change buffer with right and left arrow in normal mode
nnoremap <Right> :bn<cr>
nnoremap <Left> :bp<cr>
" }}}
" Auto complete ---------------------- {{{
inoremap " ""<esc>i
inoremap ' ''<esc>i
inoremap ` ``<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap < <><esc>i
" }}}
" Abbrevations  ---------------------- {{{
iabbrev @@ moh.ebrahimi@gmail.com
iabbrev ccopy Copyright 2020 Mohammad Ebrahimi, all rights reserved
iabbrev cweb https://mebrahimi.ir 
iabbrev ctel https://t.me/moheb2000
iabbrev cins https://www.instagram.com/moh_eb79
" }}}
" Autocmd file specific ---------------------- {{{
augroup filetype_lang
autocmd!
autocmd FileType python,shell nnoremap <localleader>c I#<space><esc>
autocmd FileType javascript nnoremap <localleader>c I//<space><esc>
augroup END
" }}}
" Operating-Pending Mapping ---------------------- {{{
onoremap " i"
onoremap ' i'
onoremap ` i`
onoremap ( i(
onoremap [ i[
onoremap { i{
onoremap < i<
" }}}
" Set statusline ---------------------- {{{
set noruler
set laststatus=2
set statusline=%.20f	" Path to the file
set statusline+=\ -\ FileType:\  " Display the file type label
set statusline+=%y	" Display the file type
set statusline+=%=	" set to the right
set statusline+=%p\ percent\ - " percentage of page
set statusline+=\ %l	" the current line
set statusline+=\ /\ 	" seperator
set statusline+=%-4L	" the total lines
" }}}
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
