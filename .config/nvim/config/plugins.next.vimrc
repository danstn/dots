call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
"Plug 'galooshi/vim-import-js'
Plug 'godlygeek/tabular'
Plug 'neovimhaskell/haskell-vim'
"Plug 'alx741/vim-hindent'
Plug 'alx741/vim-stylishask'
"Plug 'parsonsmatt/intero-neovim'
Plug 'w0rp/ale'
"Plug 'neomake/neomake'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
call plug#end()

" Plug 'vim-airline/vim-airline'
"""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme = 'nord'
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1


"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"""""""""""""""""""""""""""""""""""""""
nmap <leader>f :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
let NERDTreeMinimalUI=1

"Plug 'maxbrunsfeld/vim-yankstack'
"""""""""""""""""""""""""""""""""""""""
call yankstack#setup()
nmap <leader>o <Plug>yankstack_substitute_older_paste
nmap <leader>O <Plug>yankstack_substitute_newer_paste

" Tabularize
""""""""""""""""""""""""""""""""""""""""
vmap <leader><tab>p :Tabularize /\|<CR>
vmap <leader><tab>= :Tabularize /=<CR>
vmap <leader><tab>: :Tabularize /:<CR>
vmap <leader><tab><tab> :Tabularize /

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
   \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"syntax on
"filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"let g:intero_use_neomake = 0
"let g:intero_backend = {
        "\ 'command': 'make ide target=lib-ksdb',
        "\ 'cwd': '/home/daniel/Sources/keystone/cli/mono-haskell'
        "\}

        "\ 'cwd': expand('%:p:h'),

let g:ale_linters = {'haskell': ['hlint']}
let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'

"set previewpopup=height:11,width:60
"set completeopt+=preview

