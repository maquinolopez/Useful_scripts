colorscheme cobalt2
filetype plugin indent on "Prende algunas cosas especiales para después
runtime macros/matchit.vim "superpoderes para %
set encoding=utf-8 "Para acentos, etc. que no te de lata
set ff=unix "Las compus de guindous hacen algo bien raro con los saltos de línea. Esto lo arregla
set fileencoding=utf-8 "Pero tú no quieres ponerle esos saltos de línea raros al guardar
set mouse=a "Prende el mouse.
set backspace=indent,eol,start "backspace no jala normalmente a menos que le pongas esto

set path +=**
set nrformats-=octal "Vim entiende números, pero si los números empiezan con 0 los interpreta como octales y no decimales. Esto lo quita

set wildmenu "Un menú bonito para buscar archivos, comandos, etc. en modo comando lo activas con <tab>
set wildmode=longest,full "mejora el funcionamiento del wildmenu

set completeopt=longest,menuone "para el autocompletado. Esta es la forma más intuitiva
set number "pone números de linea
set relativenumber "pone números de línea relativos. Si tienes ambos entonces el de la linea actual es absoluto

"lo siguiente es un poquito más avanzado, pero los números de línea relativos solo son para archivos activos. Se los quitamos a archivos en otras ventanas
augroup linenr
    autocmd!
    autocmd WinEnter * setlocal relativenumber
    autocmd WinLeave * setlocal norelativenumber
augroup END

"linea de estado de nico. Igual y luego quieres cambiarla, pero esto te da bastante información
"esta linea está abajo de tu archivo y te dice el nombre de archivo, en qué lenguaje está, si está guardado o no, etc.
set laststatus=2
set statusline=%f\ \ %y%m%r%h%w%=[%l,%v]\ \ \ \ \ \ [%L,%p%%]\ %n

syntax on "colorsitos para lo que vas escribiendo
set showmatch "para que te marque qué paréntesis estás abriendo/cerrando

set hlsearch "para búsquedas, que te marque de color todas las apariciones de lo que buscaste
set incsearch "para que vaya buscando incluso desde antes de dar "enter"

set ignorecase "mayúsculas y minúsculas en la búsqueda. Normalmente que las ignore
set smartcase "pero si tú las usas entonces sí mejor hazles caso

set lazyredraw "ahorra un poco de CPU
set title "que le cambie el título a tu consolita
set scrolloff=5 "igual y no te gusta, es para que trate de darte 5 líneas arriba y abajo de tu cursor siempre
set display+=lastline "que no te esté dando lata por líneas demasiado largas
set linebreak "que no corte lineas a media palabra. Encuentra un buen lugar dónde hacerlo para que siga legible
set splitbelow "abreme splits horizontales abajo, no arriba
set splitright "abreme splits verticales a la derecha, no a la izquierda

set autoindent "se explica solo
set pastetoggle=<F2> "Recuérdame explicarte qué onda con esto
set undolevels=500 "Cuánto RAM tienes vs. cuánto deshacer quieres que recuerde. Default es 1000, esto ahorra RAM
set history=5000 "El mismo chow. El history es el historial de comandos. Default es 50, y se me hace muy poco

"ahora siguen cosas más manchadas pero que seguro sí vas a querer

"Esta te da w!! para escribir incluso si se te olvidó abrir vim con sudo. Te va pedir la contraseña.
cnoremap w!! w !sudo tee % > /dev/null

"para editar o cargar este mesmo archivo cuando quieras. Recuérdame explicarte cómo usarlo.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Esto te va ahorrar un buen dolor de cabeza. Escape para salir de modo consola
tnoremap <esc> <c-\><c-n>

"para netrw luego te cuento de eso. Otras cosas puede o no que te gusten, pero definitivamente quieres
let g:netrw_banner = 0 "si no tienes esto netrw escupe tonterías en tu pantalla


set spell spelllang=en_gb " Esto le dice a vim que quiero usar el diccionario de englis para corregir idioma

" para inicializar el autocompletado
packadd nvim-yarp
packadd vim-hug-neovim-rpc
packadd deoplete.nvim

" Use deoplete.
call deoplete#enable()


call deoplete#custom#option({
\   'smart_case': v:true,
\   })
call deoplete#custom#source('LanguageClient',
\   'min_pattern_length',
\   2)

" LanguageClient-neovim
let g:LanguageClient_autoStart = 0"1
let g:LanguageClient_serverCommands = {
\   'python': ['pyls'],
\   }
packadd LanguageClient-neovim


let g:LanguageClient_serverCommands = {
\   'r': ['R', '--slave', '-e', 'languageserver::run()'],
\   'python': ['pyls'],
\   }

"Esto iniciara templates




set cursorcolumn
set cursorline


"Este es el auto completador de Nico

"set completeopt=noinsert,menuone

"function! Automaticcomplete()
"    let linea=strpart(getline('.'),-1,col('.')) " linea actual hasta el cursor
"    let palabra=matchstr(linea,"[^ \s]*$") " palabra actual
"    if strlen(palabra)==2
"        call feedkeys("\<C-P>")
"    endif
"endfunction

"augroup autocompletado
"    autocmd!
"    autocmd InsertCharPre * call Automaticcomplete()
"augroup end

let g:slime_target = "neovim"

" para reparar cosa de consola
"
"
":echo b:terminal_job_id
let consolaactiva=5

command! -range Aconsola call jobsend(consolaactiva,getline(<line1>,<line2>))


"Abrir el quickfix automáticamente --------- {{{
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost l* nested lwindow
augroup END
"}}}

"select all
nnoremap <c-a> ggVG 

" quita modo ex y usa mayusculas para mandar algo a bash y devolver el
" resultado

nnoremap Q !!sh<CR>

command! Opengithub !open -a firefox "https://github.com/maquinolopez"




