""  If you don't understand a setting in here, just type ':h setting'.
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

profile start syntastic.log
profile! file */syntastic/*

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set utf8 as standard encoding
set encoding=latin1
set fileencoding=latin1

" load plugins
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

" =========== ABBREVIATIONS ===========
nnoremap ,psvm ipublic static void main(String[] args) {<CR><CR>}<ESC>kI

" find in files
nnoremap ,f :noautocmd vimgrep 
 
"a tab counts as 2 spaces (default is 4)
set tabstop=2

"high light matches in search
set hlsearch

set number "show line numbers

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Allow hidden buffers, don't limit to 1 file per window/split
" set hidden

"set timeoutlen=100 ttimeoutlen=0
"easy way to exit insert mode
inoremap jk <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"add subdirectories to file path (for file completion)
set path+=**

" Autocomplete longest common text among matches
set completeopt=longest

" make Ctrl+Space omnicomplete
set omnifunc=syntaxcomplete#Complete
inoremap <C-@> <C-x><C-o>

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

" Turn on the Wild menu
" set wildmenu

" " Ignore compiled files
" set wildignore=*.o,*~,*.pyc
" if has("win16") || has("win32")
"     set wildignore+=.git\*,.hg\*,.svn\*
" else
"     set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" endif

""Always show current position
"set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
" set hid

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"" Enable 256 colors palette in Gnome Terminal
"if $COLORTERM == 'gnome-terminal'
"    set t_Co=256
"endif

try
    colorscheme wombat
catch
endtry

set background=dark

" Use Unix as the standard file type
" set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


""""""""""""""""""""""""""""""""
""" => Status line
""""""""""""""""""""""""""""""""
" Airline patched Fonts automatic popuplation
let g:airline_powerline_fonts = 1
let g:airline_section_b = "%{matchstr(fugitive#statusline(), '(.*)')}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing  will toggle and untoggle spell checking
map <F2> :setlocal spell!<CR>

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au WinEnter * checktime "commented out for performance
" Loop every 4 seconds, checking for file change
" au CursorHold * checktime | call feedkeys("lh")

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the Wild menu
set wildmenu

" Height of the command bar
set cmdheight=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
" Add Alt + F1 as shortcut to open up NERDTree (or close it)
noremap <F4> :NERDTreeToggle<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
set sessionoptions-=blank
