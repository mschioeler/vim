""  If you don't understand a setting in here, just type ':h setting'.
"  
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set utf8 as standard encoding 
set encoding=utf8

" load plugins
call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'kana/vim-arpeggio'
" makes the auocomplete dialogue appear automatically
Plug 'vim-scripts/AutoComplPop'
" Requires Python support, which requires MSYS2 on windows, 
" which I can't get to work
" Plug 'Valloric/YouCompleteMe'
" Plug 'shmargum/vim-sass-colors'
call plug#end()
call arpeggio#load()

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
" Arpeggio inoremap jk <Esc>

" more ergonomic special braces
Arpeggio noremap a7 {
Arpeggio noremap a8 [
Arpeggio noremap a9 ]
Arpeggio noremap a0 }

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

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


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
set ffs=unix,dos,mac


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


"""""""""""""""""""""""""""""""
"" => Status line
"""""""""""""""""""""""""""""""
"highlight the status bar when in insert mode
" from ChrisHunt
if version >= 700
  if has("termguicolors")
    " adapted to GUI term
    au InsertEnter * hi StatusLine guibg=bg guifg=LightGreen
    au InsertLeave * hi StatusLine guibg=bg guifg=fg
  else
    au InsertEnter * hi StatusLine ctermbg=bg ctermfg=2
    au InsertLeave * hi StatusLine ctermbg=bg ctermfg=fg
  endif
endif

" " Always show the status line 
" set laststatus=2

"" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


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

" make Ctrl+Space omnicomplete
inoremap <C-@> <C-x><C-o>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

nnoremap æ /
nmap å [
nmap ø ]
nmap Å {
nmap Ø }

" erb= starts evaluation tag
" see :h rails-surround
nnoremap <leader>erb= o<%=  %><ESC>2hi

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""b
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

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
" command W w !sudo tee % > /dev/null


" Turn on the Wild menu
set wildmenu

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
" " Close the current buffer
" map <leader>bd :Bclose<cr>:tabclose<cr>gT

"" Close all the buffers
"map <leader>ba :bufdo bd<cr>

"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>

"" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext 

"" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()


"" Opens a new tab with the current buffer's path
"" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

"" Specify the behavior when switching between buffers 
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

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
