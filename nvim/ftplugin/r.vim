colorscheme cobalt2 
command! Run :vsplit | terminal  stty cbreak & R

nnoremap <leader>R yyj<c-w>lpa<cr><c-\><c-n><c-w>h
vnoremap <leader>R yj<c-w>lpa<cr><c-\><c-n><c-w>h
"nnoremap <leader><cr> :%y<cr><c-w>lpa<cr><c-\><c-n><c-w>h
"
"vnoremap <buffer> <leader>R :Aconsola<cr><c-w>li<cr><c-\><c-n><c-w>h
"nnoremap <buffer> <leader>R :Aconsola<cr><c-w>li<cr><c-\><c-n><c-w>h

xnoremap <buffer> <CR> :w! temporal.R<cr><c-w>lisource("temporal.R",echo=TRUE) <cr><c-\><c-n><c-w>h
" Templates

command! Documento read ~/.config/nvim/templates/R.txt



