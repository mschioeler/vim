" endif

filetype plugin on
filetype indent on

" load plugins
" set rtp+=~/.vim/pack/mschioeler/start/vim-arpeggio/ " TODO doesnt work
" call arpeggio#load()
call plug#begin()
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'
" Plug 'shmargum/vim-sass-colors'
call plug#end()

" =========== ABBREVIATIONS ===========
nnoremap ,psvm ipublic static void main(String[] args) {<CR><CR>}<ESC>kI
 
"a tab counts as 2 spaces (default is 4)
set tabstop=2

"high light matches in search
set hlsearch

" set relativenumber 
set number "show line numbers

"undo actions > default 8
set history=100

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

"Make paragraph jumps more accessible
nnoremap å {
nnoremap ø }

"Make find more accesible
nnoremap æ /
nnoremap Æ ?

"Make PageDown and PageUp more accessible
nnoremap Å <PageUp>
nnoremap Ø <PageDown>

" " swap soft and har BOL
" nnoremap 0 ^
" nnoremap ^ 0

" " toggle between hybrid and absolute line numbers when toggling insert/normal mode
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

"set hid "supposedly makes performance better

"set timeoutlen=100 ttimeoutlen=0
"easy way to exit insert mode
inoremap jk <Esc>
" Arpeggio inoremap jk <Esc>

""more ergonomic special braces
" Arpeggio nmap ½7 {
" Arpeggio nmap ½8 [
" Arpeggio nmap ½9 ]
" Arpeggio nmap ½0 }

""more ergonomic special braces
nmap ½7 {
nmap ½8 [
nmap ½9 ]
nmap ½0 }

inoremap ½7 {
inoremap ½8 [
inoremap ½9 ]
inoremap ½0 }

"add subdirectories to file path (for file completion)
set path+=**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make Ctrl+Space omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <C-@> <C-x><C-o>

" Sets how many lines of history VIM has to remember
set history=500

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

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
set hid

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

"" Return to last edit position when opening files (You want this!)
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""
"" => Status line
"""""""""""""""""""""""""""""""
"" Always show the status line
"set laststatus=2

"" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:.m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif

"" Delete trailing white space on save, useful for some filetypes ;)
"fun! CleanExtraSpaces()
"    let save_cursor = getpos(".")
"    let old_query = getreg('/')
"    silent! %s/\s\+$//e
"    call setpos('.', save_cursor)
"    call setreg('/', old_query)
"endfun

"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" => CSS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable filetype plugins
filetype plugin indent on

" Set utf8 as standard encoding 
set encoding=utf8

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

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" highlight the status bar when in insert mode
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

" load plugins
" set rtp+=~/.vim/pack/mschioeler/start/vim-arpeggio/ " TODO doesnt work
" call arpeggio#load()
call plug#begin()
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'
Plug 'shmargum/vim-sass-colors'
call plug#end()

" =========== ABBREVIATIONS ===========
nnoremap ,psvm ipublic static void main(String[] args) {<CR><CR>}<ESC>kI
 
"a tab counts as 2 spaces (default is 4)
set tabstop=2

"high light matches in search
set hlsearch

" set relativenumber 
set number "show line numbers

"undo actions > default 8
set history=100

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

"Make paragraph jumps more accessible
nnoremap å {
nnoremap ø }

"Make find more accesible
nnoremap æ /
nnoremap Æ ?

"Make PageDown and PageUp more accessible
nnoremap Å <PageUp>
nnoremap Ø <PageDown>

" " toggle between hybrid and absolute line numbers when toggling insert/normal mode
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

"set hid "supposedly makes performance better

"set timeoutlen=100 ttimeoutlen=0
"easy way to exit insert mode
inoremap jk <Esc>
" Arpeggio inoremap jk <Esc>

""more ergonomic special braces
" Arpeggio nmap ½7 {
" Arpeggio nmap ½8 [
" Arpeggio nmap ½9 ]
" Arpeggio nmap ½0 }

""more ergonomic special braces
nmap ½7 {
nmap ½8 [
nmap ½9 ]
nmap ½0 }

inoremap ½7 {
inoremap ½8 [
inoremap ½9 ]
inoremap ½0 }

"add subdirectories to file path (for file completion)
set path+=**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make Ctrl+Space omnicomplete
inoremap <C-@> <C-x><C-o>
" inoremap <Tab> <C-n>
" inoremap <S-Tab> <C-P>

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au WinEnter * checktime
" Loop every 4 seconds, checking for file change
au CursorHold * checktime | call feedkeys("lh")

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

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
set hid

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

"" Enable 256 colors palette in Gnome Terminal
"if $COLORTERM == 'gnome-terminal'
"    set t_Co=256
"endif

try
    colorscheme wombat
catch
endtry

set background=dark

"" Set extra options when running in GUI mode
"if has("gui_running")
"    set guioptions-=T
"    set guioptions-=e
"    set t_Co=256
"    set guitablabel=%M\ %t
"endif

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

"" Return to last edit position when opening files (You want this!)
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""
"" => Status line
"""""""""""""""""""""""""""""""
"" Always show the status line
"set laststatus=2

"" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:.m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif

"" Delete trailing white space on save, useful for some filetypes ;)
"fun! CleanExtraSpaces()
"    let save_cursor = getpos(".")
"    let old_query = getreg('/')
"    silent! %s/\s\+$//e
"    call setpos('.', save_cursor)
"    call setreg('/', old_query)
"endfun

"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
