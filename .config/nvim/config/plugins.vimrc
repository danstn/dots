""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" Appearance
" -----------
Plug 'ajh17/spacegray.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Productivity
" -----------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-signify'
Plug 'maxbrunsfeld/vim-yankstack'

" Editing & Typing Support
" -----------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

" Haskell
" -----------
Plug 'neovimhaskell/haskell-vim'
Plug 'neovimhaskell/nvim-hs'
Plug 'neovimhaskell/nvim-hs-contrib'
Plug 'eagletmt/neco-ghc'

Plug 'elmcast/elm-vim'
Plug 'Shougo/neco-vim'
Plug 'derekwyatt/vim-scala'
Plug 'hashivim/vim-terraform'

" Fonts
" -----------
Plug 'ryanoasis/vim-devicons'

call plug#end()

" NERDTree
nmap <leader>f :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Neco GHC
let g:necoghc_enable_detailed_browse = 1

" Signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_skip_filetype = {}
hi SignifySignAdd    ctermbg=none  ctermfg=119
hi SignifySignDelete ctermbg=none  ctermfg=167
hi SignifySignChange ctermbg=none  ctermfg=227


" Tabularize
""""""""""""""""""""""""""""""""""""""""
vmap <leader><tab>p :Tabularize /\|<CR>
vmap <leader><tab>= :Tabularize /=<CR>
vmap <leader><tab>: :Tabularize /:<CR>
vmap <leader><tab><tab> :Tabularize /

" Airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme = 'ravenpower'

" Ctrl-P
""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.(git|hg|svn)$\|\.yardoc\|node_modules\|log\|tmp\|target\|dist\|elm-stuff',
  \ 'file': '\v\.(class|cache|stats)$'
  \ }

" Elm
""""""""""""""""""""""""""""""""""""""""
let g:elm_setup_keybindings = 1
let g:elm_format_autosave = 0

" Yankstack
""""""""""""""""""""""""""""""""""""""""
call yankstack#setup()
nmap <leader>o <Plug>yankstack_substitute_older_paste
nmap <leader>O <Plug>yankstack_substitute_newer_paste

