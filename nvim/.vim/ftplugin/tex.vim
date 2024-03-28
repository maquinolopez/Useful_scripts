"Ortografia y guardar cada 2 segundos si no hago nada
set updatetime=10000
set spell
augroup guardado
    autocmd!
    autocmd CursorHold,CursorHoldI * silent! wall
    autocmd BufWritePost,FileWritePost * echo "toy chulo"  
    autocmd BufWritePost,FileWritePost * !pandoc -f latex % -o %.docx --bibliography=bibliography.bib
augroup END

"i$ y a$ para fórmulas (Imperfectas: No funcionan si estás sobre el símbolo de peso)
onoremap i$ :<C-u>normal! T$vt$<CR>
onoremap a$ :<C-u>normal! F$vf$<CR>

"Compile para compilar en latexmk AGUAS: solo en neovim.
"Como lo tengo configurado compila en pdflatex.
" command! Compile normal! :11 split <cr><c-w>j:terminal latexmk %<CR>G
command! Compile 5 split | terminal latexmk %


"Planillas
command! Beamer read ~/.vimsnips/beamerdefault
command! Article read ~/.vimsnips/latexdefault

"Abreviaturas
iab \1 1{\hskip -2.5 pt}\hbox{I}
iab lenumerate \begin{enumerate}<CR>\item{}<CR>\end{enumerate}<esc>k0f{a
iab litemize \begin{itemize}<CR>\item{}<CR>\end{itemize}<esc>k0f{a
iab lfigure \begin{figure}<CR>\begin{centering}<CR>\includegraphics{}<CR>\caption{}<CR>\label{}<CR>\end{centering}<CR>\end{figure}<esc>4k0f{a
iab lframe \begin{frame}<CR>\frametitle{}<CR>\framesubtitle{}<CR>\end{frame}<esc>2k0f{a
iab ldocument \begin{document}<CR>\end{document}<esc>ko
iab labstract \begin{abstract}<CR>\end{abstract}<esc>ko
iab ltabular \begin{tabular}{cc}<CR>&\\ <CR>\end{tabular}<esc>2k$T{i
iab lproof \begin{proof}<CR>\end{proof}<esc>ko
iab ltable \begin{table}<CR>\begin{tabular}{cc}<CR>\hline<CR>&\\ <CR>\hline<CR>\end{tabular}<CR>\caption{}<CR>\end{table}<esc>6k$T{i
iab larray \begin{array}{}<CR>\end{array}<esc>k$T{i
iab lcase \begin{case}<CR>\end{case}<esc>kA


"Para que cheque el contenido del texto escrito. Es raro que esto sea necesario.
syntax spell toplevel
