""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 CORE SETTIGNS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent   " enable automatic indentation
set expandtab
set hlsearch     " highlight search results
set ignorecase   " case insensitive search
set incsearch    " match the search and return to the initial position
set list         " Show `listchars` characters
set nofoldenable
set number       " show line numbers
set showcmd      " show command in bottom bar
set showmatch    " highlight matching [{()}]
set smartcase    " use case sensitive search if a capital letter is used
set warn         " show current mode
set wildmenu     " visual autocomplete for command menu
set hidden
set exrc         " support local vimrc
set secure
set nowrap
"set cursorline
set noshowmode

set encoding=utf8
set backspace=indent,eol,start
set fillchars+=vert:\ 
set foldlevel=10
set laststatus=2
set listchars=tab:\ \ ,trail:·
set mouse=a
set pastetoggle=<F2>
set shiftwidth=2
set tabstop=2
set scrolloff=5
set autoread
set inccommand=nosplit
set backupcopy=yes

" Jump to the previous location when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Strip whitespace on write
fun! StripTrailingWhitespace()
  if &ft =~ 'vim\|vimrc'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

