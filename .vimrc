" Use Vim settings, rather then Vi settings (much better!).  This must be
" first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom

set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.

if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" set up persistent undo anyway
set undodir=~/.vim/backups
set undofile
set undolevels=1000
set undoreload=10000

" ================ Indentation ======================

set autoindent
set cindent " smartindent has been deprecated in favour of cindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" utf-8 support
scriptencoding utf-8
set encoding=utf-8

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Various ======================
set tw=79               " Break at 79th column
set bg=dark             " Dark background
set laststatus=2        " Show status line in single window

let Tlist_GainFocus_On_ToggleOpen = 1 " When taglist window opens, move cursor there

set t_Co=256            " Tell vim we support 256 colors

let g:Powerline_symbols = 'fancy' " use fancy powerline symbols

" Recognized Chibi scheme .sld files as Scheme
au BufNewFile,BufRead *.sld set filetype=scheme

" Recognize Python files
au BufNewFile,BufRead *.py set filetype=python

" Toggle paste mode with CTRL+P in edit mode
set pastetoggle=<C-p>

" Mouse support
set mouse=a

" =============== Local configurations ===============

  if filereadable($HOME . "/.vimrc-local")
    exec ":source" . $HOME . "/.vimrc-local"
  endif

" =============== Vimp Initialization ===============
" This section enables vimp as a package manager, and
" was automatically added by vimp. Sorry for that!
"
" If you delete ~/.vimp/ then you can also remove
" this section, if you want to.

  if filereadable($HOME . "/.vimp/vimrc")
    exec ":source" . $HOME . "/.vimp/vimrc"
  endif
