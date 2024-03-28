
colorscheme edge
set spelllang=en_gb,es_mx
match Statement /\$\{1,2}[ A-Za-z0-9_\=\{\}()\[\]+\-\/]\+\$/"\{1,2}/
"hi Statement ctermbg=94
hi Statement ctermfg=94

command! -range Tabla <line1>,<line2>s /|/§|/g | <line1>,<line2>!column -s § -t

nnoremap <leader>b G:w<cr>:read ! pandoc  --biblio bibliography.bib -t beamer -s % -o %.pdf <cr>
nnoremap <leader>l G:w<cr>! pandoc -f latex % -o %.pdf --bibliography=bibliography.bib <cr>
nnoremap <leader>o :! open -a skim %.pdf <cr>
nnoremap <leader>nota G:w<cr>! pandoc -f -o %.pdf <cr>
nnoremap <leader>C :tabedit ../bibliography.bib <cr> 

" Templates 
command! Documento read ~/.config/nvim/templates/manus_MD.txt
command! Presentacion read ~/.config/nvim/templates/pre_MD_Beamer.txt
command! Diario read ~/.config/nvim/templates/Diario.txt
command! CompilePDF :w |!pandoc -o %.pdf % 
command! OpenPDF :w |!open -a skim.app %.pdf
command! CompileHTML :w |!markdown % > %.html



