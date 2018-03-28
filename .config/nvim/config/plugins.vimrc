""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" Appearance
" -----------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'

" Productivity
" -----------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-signify'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'

" Editing & Typing Support
" -----------
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


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
Plug 'jparise/vim-graphql'

" Clojure
" ----------
Plug 'venantius/vim-cljfmt'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'


" Go
" -----------
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

" XML
" -----------
"Plug 'alvan/vim-closetag'
"Plug 'Valloric/MatchTagAlways'

" Javascript
" -----------
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'fleischie/vim-styled-components'
Plug 'galooshi/vim-import-js'

" CSS
" -----------
Plug 'ap/vim-css-color'
Plug 'JulesWang/css.vim'

" PSQL
" -----------
"Plug 'exu/pgsql.vim'

" Fonts
" -----------
"Plug 'ryanoasis/vim-devicons'

call plug#end()

" NERDTree
nmap <leader>f :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1

" Deoplete
autocmd CompleteDone * silent! pclose!
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_delay = 25
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
set completeopt-=preview

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
let g:airline_theme = 'nord'

" Airline
""""""""""""""""""""""""""""""""""""""""
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1

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

" Javascript
""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" XML
""""""""""""""""""""""""""""""""""""""""
"let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"

" Yankstack
""""""""""""""""""""""""""""""""""""""""
call yankstack#setup()
nmap <leader>o <Plug>yankstack_substitute_older_paste
nmap <leader>O <Plug>yankstack_substitute_newer_paste

" Ale
""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_format = '%linter% >> %s'
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']

let g:ale_linters = {'javascript': ['flow', 'eslint']}
let g:ale_lint_on_save = 1

let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1

let g:ale_javascript_standard_use_global = 0
let g:ale_javascript_prettier_options = '--no-semi'

"let g:ale_javascript_standard_options = '--fix'
"autocmd bufwritepost *.js !standard --parser babel-eslint --fix %
"set autoread

" Tagbar
""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

" PGSQL
""""""""""""""""""""""""""""""""""""""""
let g:sql_type_default = 'pgsql'

" UltiSnips
""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-s-C>"
autocmd FileType javascript UltiSnipsAddFiletypes javascript-es6-react
