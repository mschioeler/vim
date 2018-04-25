"  If you don't understand a setting in here, just type ':h setting'.
"  
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable filetype plugins
" Set utf8 as standard encoding 

set encoding=utf8

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
call plug#end()

" =========== ABBREVIATIONS ===========
nnoremap ,psvm ipublic static void main(String[] args) {<CR><CR>}<ESC>kI
 
" now
" set autoindent "automatically indent new lines

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

"""more ergonomic special braces
"nmap ½7 {
"nmap ½8 [
"nmap ½9 ]
"nmap ½0 }

" inoremap ½7 {
" inoremap ½8 [
" inoremap ½9 ]
" inoremap ½0 }

"add subdirectories to file path (for file completion)
set path+=**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make Ctrl+Space autocomplete
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-P>

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

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
set noerrorbells
set novisualbell
" set t_vb=
set tm=500

" " Properly disable sound on errors on MacVim
" if has("gui_macvim")
"     autocmd GUIEnter * set vb t_vb=
" endif


" " Add a bit extra margin to the left
" set foldcolumn=1


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

"set background=dark

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

" " Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" " Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

"" " Quickly open a markdown buffer for scribble
"" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Returns true if paste mode is enabled
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    endif
"    return ''
"endfunction

"" " Don't close window, when deleting a buffer
"" command! Bclose call <SID>BufcloseCloseIt()
"" function! <SID>BufcloseCloseIt()
""     let l:currentBufNum = bufnr("%")
""     let l:alternateBufNum = bufnr("#")

""     if buflisted(l:alternateBufNum)
""         buffer #
""     else
""         bnext
""     endif

""     if bufnr("%") == l:currentBufNum
""         new
""     endif

""     if buflisted(l:currentBufNum)
""         execute("bdelete! ".l:currentBufNum)
""     endif
"" endfunction

"" function! CmdLine(str)
""     call feedkeys(":" . a:str)
"" endfunction 

"" function! VisualSelection(direction, extra_filter) range
""     let l:saved_reg = @"
""     execute "normal! vgvy"

""     let l:pattern = escape(@", "\\/.*'$^~[]")
""     let l:pattern = substitute(l:pattern, "\n$", "", "")

""     if a:direction == 'gv'
""         call CmdLine("Ack '" . l:pattern . "' " )
""     elseif a:direction == 'replace'
""         call CmdLine("%s" . '/'. l:pattern . '/')
""     endif

""     let @/ = l:pattern
""     let @" = l:saved_reg
"" 		A
"" endfunction
