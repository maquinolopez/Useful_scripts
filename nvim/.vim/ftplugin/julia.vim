setlocal comments=:#
setlocal commentstring=#%s

"Solo en neovim o vim 8+
command! Run :vertical terminal julia

nnoremap <leader>R yyj<c-w>la<c-w>"0<Esc><c-w>h
vnoremap <leader>R y<c-w>lpa<c-w>"0<Esc><c-w>ha

vnoremap <leader>R y<c-w>lpa<c-w>"0<Esc><c-w>ha
"convertir 'and', 'or' y 'not' A sus equivalentes julianos
iab and &
iab or \|
iab not ~
nnoremap <Space> <Nop>
let mapleader='\'

