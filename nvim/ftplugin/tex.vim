
colorscheme edge 
"Ortografia y guardar cada 2 segundos si no hago nada
set updatetime=3000
set spell
set spelllang=en_gb,es_mx
augroup guardado
    autocmd!
    autocmd CursorHold,CursorHoldI * silent! wall
    "autocmd BufWritePost,FileWritePost * !pandoc -f latex % -o %.docx --bibliography=../bibliography.bib
    autocmd BufWritePost,FileWritePost * !pandoc --citeproc -f latex -s % -o %.docx --bibliography=bibliography.bib
    " autocmd BufWritePost,FileWritePost * !pandoc -f latex % -o %.docx --bibliography=bibliography.bib -F pandoc-crossref --natbib
    autocmd BufWritePost,FileWritePost * !pandoc -F pandoc-crossref  --citeproc --mathjax -f latex -t html -s % -o %.html --bibliography=bibliography.bib
    " autocmd BufWritePost,FileWritePost * !cp *.pdf ../
    " autocmd BufWritePost,FileWritePost * !cp %.docx ../
    " autocmd BufWritePost,FileWritePost * !latex2rtf %
    autocmd BufWritePost,FileWritePost * !git add -A
augroup END
"i$ y a$ para fórmulas (Imperfectas: No funcionan si estás sobre el símbolo de peso)
onoremap i$ :<C-u>normal! T$vt$<CR>
onoremap a$ :<C-u>normal! F$vf$<CR>

"Compile para compilar en latexmk AGUAS: solo en neovim.
"Como lo tengo configurado compila en pdflatex.
" command! Compile normal! :11 split <cr><c-w>j:terminal latexmk %<CR>G
command! Compile 5 split | terminal /opt/homebrew/bin/latexmk  -pvc -interaction=nonstopmode %
" command! Compile 5 split | terminal /opt/local/bin/latexmk  -pvc -interaction=nonstopmode
command! LatexCleanUp !latexmk -c
command! GitCo !git commit -m "autocommit"
command! GitPu !git push
"Planillas
command! Documento read ~/.config/nvim/templates/latex.txt 
command! Presentacion read ~/.config/nvim/templates/beamer.txt 




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
iab ltit \textit{}<esc>ha
iab 210Pb $^{210}$Pb
iab 14C $^{14}$C
iab 226Ra $^{226}$Ra
iab 137Cs $^{137}$Cs
iab Plum \textit{Plum}
iab lframe \begin{frame}{title}<CR><CR>\end{frame} <esc>kA
iab lequation \begin{eqnarray}<CR><CR>\end{eqnarray} <esc>kA
iab lblock \begin{block}{title}<CR><CR>\end{block} <esc>kA

"Para que cheque el contenido del texto escrito. Es raro que esto sea necesario.
syntax spell toplevel





