"  If you don't understand a setting in here, just type ':h setting'.
"  
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" load plugins
set rtp+=~/.vim/pack/mschioeler/start/vim-arpeggio/
call arpeggio#load()

" =========== ABBREVIATIONS ===========
nnoremap ,psvm ipublic static void main(String[] args) {}<ESC>ji<CR>
 
" set autoindent "automatically indent new lines

"a tab counts as 2 spaces (default is 4)
set tabstop=2

"high light matches in search
set hlsearch

"relativenumber "show line numbers
set number

"undo actions > default 8
set history=100

colorscheme wombat

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

"Make PageDown and PageUp more accessible
nnoremap å {
nnoremap ø }

"Make find more accesible
nnoremap æ /
nnoremap Æ ?

"Make paragraph jumps more accessible
nnoremap Å <PageUp>
nnoremap Ø <PageDown>

"
" toggle between hybrid and absolute line numbers when toggling inser/normal
" mode
"augroup numbertoggle
  "autocmd!
  "autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  "autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

"set hid "supposedly makes performance better

"set timeoutlen=100 ttimeoutlen=0
"easy way to exit insert mode
inoremap jk <Esc>

""more ergonomic special braces
" Arpeggio noremap ½7 {
" Arpeggio noremap ½8 [
" Arpeggio noremap ½9 ]
" Arpeggio noremap ½0 }

""more ergonomic special braces
noremap ½7 {
noremap ½8 [
noremap ½9 ]
noremap ½0 }

inoremap ½7 {
inoremap ½8 [
inoremap ½9 ]
inoremap ½0 }

"add subdirectories to file path (for file completion)
set path+=**
