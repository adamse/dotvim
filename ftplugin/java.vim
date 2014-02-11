set makeprg=javac\ -g\ -Xlint:unchecked\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#

nnoremap <leader>o :cnext<cr>
nnoremap <leader>p :cprevious<cr>
nnoremap <C-m> :make<cr>:copen<cr>
