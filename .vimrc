set tabstop=4       " Tab is eq 4 spaces
set shiftwidth=4    " Spaces for autoIndent
set softtabstop=4   " Something rable rable
set expandtab       " Expands tab-key presses
set autoindent      " Enable autoindent(keep indent)
set number          " Show line numbers

" Text formatting
set textwidth=79  " Maximum width of text
set formatoptions=c,q,r,t " Formatting foo

set showmatch       " Show matching bracket
set incsearch       " Show matched elms for search
set ruler           " Make some foo on line,pos

set background=light " Use colors good with lights bg

set directory =~/.vim/swp "change swap directory to be in one folder instead of with the file
                          "Saves some hassle from VCS and uploads

filetype plugin on
syntax on
