""  If you don't understand a setting in here, just type ':h setting'.
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.2

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
" Use za, zc, zo to open and close folds
" Use zf an zd to add and delete folds
" Run setlocal foldmethod=marker to enable folding
set foldmethod=marker
setlocal foldmethod=marker

" Enable filetype plugins
filetype plugin on
filetype indent on

"PLUGINS{{{
call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" asynchronous dispatch of external programs
Plug 'tpope/vim-dispatch'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
" makes the auocomplete dialogue appear automatically
Plug 'vim-scripts/AutoComplPop'
Plug 'vim-syntastic/syntastic'
" Requires Python support, which requires MSYS2 on windows,
" which I can't get to work
" Plug 'Valloric/YouCompleteMe'
" Plug 'shmargum/vim-sass-colors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" automatically update tags
Plug 'michaeljsmith/vim-indent-object'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
call plug#end()
"}}}

"NON-PLUGIN MAPPINGS AND ABBREVIATIONS{{{
nnoremap ,psvm ipublic static void main(String[] args) {<CR><CR>}<ESC>kI

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" powerful: create curly brace block
inoremap <leader>æ {<CR>}<ESC>O
inoremap <leader>æ {<CR>}<ESC>O

" make Ctrl+Space omnicomplete
inoremap <C-@> <C-x><C-o>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

nnoremap æ /
nnoremap Ã /
nmap å [
nmap ø ]
nmap Å {
nmap Ø }
omap å [
omap ø ]
omap Å {
omap Ø }
xmap å [
xmap ø ]
xmap Å {
xmap Ø }
vmap å [
vmap ø ]
vmap Å {
vmap Ø }

inoremap æj {}<Esc>i
inoremap Ãj {}<Esc>i
inoremap kl []<Esc>i
inoremap jæ {}<Esc>i
inoremap jÃ¦ {}<Esc>i
inoremap lk []<Esc>i

" erb= starts evaluation tag
" see :h rails-surround
nnoremap <leader>erb= o<%=  %><ESC>2hi

"Omnicomplete
inoremap <C-@> <C-x><C-o>

" find in files
nnoremap ,f :noautocmd vimgrep 
 
" Pressing  will toggle and untoggle spell checking
map <F2> :setlocal spell!<CR>

"easy way to exit insert mode
inoremap jk <Esc>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"}}}

"GENERAL{{{
" Use Unix as the standard file type
" set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

"high light matches in search
set hlsearch

"show line numbers
set number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
"add subdirectories to file path (for file completion)
set path+=**

" Autocomplete longest common text among matches
set completeopt=longest

" make Ctrl+Space omnicomplete
set omnifunc=syntaxcomplete#Complete

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set visualbell
set tm=500
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au WinEnter * checktime "commented out for performance
" Loop every 4 seconds, checking for file change
" au CursorHold * checktime | call feedkeys("lh")
"}}}

"COLORS AND FONTS{{{

" Enable syntax highlighting
syntax enable

" enable 24 bit colors if available
if has("termguicolors")
  set termguicolors
endif
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

try
    colorscheme wombat
catch
endtry

set background=dark"}}}

" PLUGIN CONFIGURATION{{{
""""""""""""""""""""""""""""""""
""" => Status line
""""""""""""""""""""""""""""""""
" Airline patched Fonts automatic popuplation
let g:airline_powerline_fonts = 1
let g:airline_section_b = "%{matchstr(fugitive#statusline(), '(.*)')}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
" Add Alt + F1 as shortcut to open up NERDTree (or close it)
noremap <F4> :NERDTreeToggle<CR>

" horizontal split windows start below instead above current one
set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby on Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Model
nmap <leader>rm :e app/models/
" View
nmap <leader>rv :e app/views/
" Controller
nmap <leader>rc :e app/controllers/
" Routes
nmap <leader>rr :e config/routes.rb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If you use `:mksession` to save Vim sessions you should probably make sure to
" remove option "blank" from 'sessionoptions': 
" This will prevent `:mksession` from saving |syntastic-error-window| as empty
" quickfix windows.
set sessionoptions-=blank"}}}
