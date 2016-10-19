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
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" Wrap toggle
:nnoremap <F3> :set wrap!<CR>

" Save as sudo
cmap w!! w !sudo tee % >/dev/null
