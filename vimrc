" Add pathogen plagun ---------------------- {{{
execute pathogen#infect()
" }}}
" General vimrc settings ---------------------- {{{
syntax on
set number
set numberwidth=5
set hlsearch incsearch
set nocp
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set foldlevelstart=0
set pastetoggle=<F2>
let maplocalleader=","
colorscheme plasmid
" }}}
" set autoindent for vim ---------------------- {{{
set autoindent
set cindent
set si
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
" Add maps for split page
nnoremap <localleader><Up> :execute "leftabove split ".bufname("#")<cr>
nnoremap <localleader><Down> :execute "rightbelow split ".bufname("#")<cr>
nnoremap <localleader><Left> :execute "leftabove vsplit ".bufname("#")<cr>
nnoremap <localleader><Right> :execute "rightbelow vsplit ".bufname("#")<cr>
" change buffer with right and left arrow in normal mode
nnoremap <localleader>n :bn<cr>
nnoremap <localleader>p :bp<cr>
" Highlight two spaces for ERRORS
nnoremap <localleader>w :match Error /\v  /<cr>
nnoremap <localleader>W :match none<cr>
" Add \v for search
nnoremap <localleader>/ /\v
" Clear search highlighting from the last one
nnoremap <localleader>nh :nohlsearch<cr>
" }}}
" Auto complete ---------------------- {{{
inoremap " ""<esc>i
inoremap ' ''<esc>i
inoremap ` ``<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
augroup html_complete
autocmd!
autocmd FileType html inoremap < <><esc>i
augroup END
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
autocmd FileType python,shell nnoremap <localleader>c mqI#<space><esc>`q
autocmd FileType python,shell nnoremap <localleader>nc mq0xx`q
autocmd FileType javascript nnoremap <localleader>c mqI//<space><esc>`q
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
" Add a map and function for quickfix window ---------------------- {{{
nnoremap <localleader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open=0
function! QuickfixToggle()
if g:quickfix_is_open
cclose
let g:quickfix_is_open=0
execute g:current_window."wincmd w"
else
let g:current_window=winnr()
copen
let g:quickfix_is_open=1
endif
return
endfunction
" }}}
" Add F5 map for run programming languages with runlangs bashscript ---------------------- {{{
nnoremap <F5> :execute "!runlangs ".expand('%')<cr>
" }}}

" Add some plugin to vim  ---------------------- {{{
" autocomplpop setting
set omnifunc=syntaxcomplete " This is necessary for acp plugin
let g:acp_behaviorKeywordLength = 1 "  Length of keyword characters before the cursor, which are needed to attempt keyword completion
"indentLine 
let g:indentLine_char = '.'
" NERDTree plugin setting

"toggle showing NERDTree with F9
:map <F9> :NERDTreeToggle<CR><esc><esc>

"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open file in new tab with ctrl + t
:let NERDTreeMapOpenInTab='<c-t>'
" }}}
