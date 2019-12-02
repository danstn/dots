if executable('fzf')
    " This is the default extra key bindings
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  " An action can be a reference to a function that processes selected lines
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  let g:fzf_layout = { 'down': '~40%' }

  " <C-p> or <C-t> to search files
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :Files<cr>
  nnoremap <silent> <C-f> :Ag<cr>
  nnoremap <silent> <C-M-f> :Ag!<cr>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  " <M-S-p> for MRU
  nnoremap <silent> <M-S-p> :History<cr>

  " Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

  " Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '40'})
  nnoremap q: :CmdHist<CR>

  " Better search history
  command! QHist call fzf#vim#search_history({'right': '40'})
  nnoremap q/ :QHist<CR>

  command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('down:80%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

  " Likewise, Files command with preview window
  command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \                    fzf#vim#with_preview('right:50%', '?'), 
  \                    <bang>0)

  command! -bang -nargs=? -complete=dir Commits
  \ call fzf#vim#commits(1)

  command! -bang -nargs=? -complete=dir BCommits
  \ call fzf#vim#buffer_commits(1)


  else
    " CtrlP fallback
end
