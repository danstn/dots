""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make yank behave as expected
map Y y$

" Clipboard integration
map <leader>p "+p
map <leader>y "+y

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear highlighed search
nmap <silent> ,/ :nohlsearch<CR>
nmap <Leader>h :bnext<CR>
nmap <Leader>l :bprevious<CR>

" Wrap toggle
:nnoremap <F3> :set wrap!<CR>

" Reload current file
:nnoremap <F5> :source %<CR>

" Save as sudo
cmap w!! w !sudo tee % >/dev/null
