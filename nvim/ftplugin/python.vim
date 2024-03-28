colorscheme black_is_the_color

command! Run :vsplit | terminal /Users/ma2060/miniconda/envs/en_tf/bin/python
"/Users/ma2060/miniforge3/envs/en_tf/bin/python3 
"/Users/ma2060/mambaforge/bin/python3
"/Users/maquinolopez/opt/anaconda3/bin/python
"xnoremap <buffer> <cr> <cr>:w! temporal.py<cr><c-w>liexec(open("temporal.py").read()) <cr>
nnoremap <leader><cr> :%y<cr>:w! temporal.py<cr><c-w>liexec(open("temporal.py").read()) <cr>
nnoremap <leader>R yyj<c-w>lpa<cr><c-\><c-n><c-w>h
vnoremap <leader>R yj<c-w>lpa<cr><c-\><c-n><c-w>h
"nnoremap <leader><cr> :%y<cr><c-w>lpa<cr><c-\><c-n><c-w>h

" Esto es para poner autocompletado en nvim

let g:lsc_server_commands = {
\   'python': 'pyls',
\   }


" Templates

command! Documento read ~/.config/nvim/templates/python.txt

command! GitCo !git commit -m "autocommit"
command! GitPu !git push
