" Set incompatible with VI
set nocompatible

" Workaround! gnome-terminal supports 256 colors, but doesn't advertise its support
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Invoke pathogen
execute pathogen#infect()

" Use comma as <Leader> key
let mapleader=","

" Use BASH shell
set shell=/bin/bash

" Always show line numbers
set number

" Word wrap + no folding
set linebreak
set nofoldenable

" Mouse in all modes
set mouse=a

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Highlight spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Indentation -- tabs are four spaces, autoindent
set tabstop=4      " a tab is four spaces
set expandtab      " Use spaces, not tabs
set autoindent     " always set autoindenting on
set copyindent     " copy the previous indentation on autoindenting
set shiftwidth=4   " number of spaces to use for autoindenting
set shiftround     " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab       " insert tabs on the start of a line according to shiftwidth, not tabstop

" Searching 
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" History and undo
set history=1000
set undolevels=1000

" Only autocomplete longest common
set completeopt=menu,longest

" Ignore certain files from open menues
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.git,.dSYM,*.pdf,*.jpg,*.gif,*.png,*.avi,*.mkv,*.so
set wildmenu
set wildmode=list:longest

" Change terminal's title + keep quiet
set title
set noerrorbells

" Show airline all the time
set laststatus=2

" Don't use backup files
set nobackup
set noswapfile

" Syntax highlighting and file type detection
syntax on           " Enable syntax highlighting
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins
