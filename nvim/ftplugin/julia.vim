setlocal comments=:#
setlocal commentstring=#%s

"Solo en neovim o vim 8+
command! Run :vsplit | terminal julia 

nnoremap <leader>R yyj<c-w>lpa<cr><c-\><c-n><c-w>h
vnoremap <leader>R yj<c-w>lpa<cr><c-\><c-n><c-w>h
nnoremap <leader><cr> ggVGyj<c-w>lpa<cr><c-\><c-n><c-w>h

"convertir 'and', 'or' y 'not' A sus equivalentes julianos
iab and &
iab or \|
iab not ~
nnoremap <Space> <Nop>
let mapleader='\'

