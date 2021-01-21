" props to https://dougblack.io/words/a-good-vimrc.html

syntax on                           " enable syntax processing
set tabstop=2                       " number of visual spaces per TAB
set softtabstop=2                   " number of spaces in tab when editing
set expandtab                       " tabs are spaces
set number                          " show line numbers
set showcmd                         " show command in bottom bar
set cursorline                      " highlight current line
filetype indent plugin on           " load filetype-specific indent files
set wildmenu                        " visual autocomplete for command menu
set lazyredraw                      " redraw only when we need to
set showmatch                       " highlight matching [{()}]
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches

" jk is escape
inoremap jk <esc>
