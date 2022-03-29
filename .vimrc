"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""      

" autosave folding // source: https://vim.fandom.com/wiki/Make_views_automatic
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview


"COLORS:
"colorscheme molokai
"colorscheme deus

" muchas cosas de esta  configuracion copiada de https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" está bueno como lo divide en categorías Luke Smith: basics, por ejemplo.
" Tambien lo  de indentar 

"set fileencodings=ucs-bom,utf-8,latin1

set encoding=utf-8

"set encoding=Unicode

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on


" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
"set number
set number relativenumber

" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
"set nowrap

"will break a line at spaces or punctuation, but not in the middle of a word.
    set wrap linebreak nolist

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch
" una vez que encuentra el resultado queda resaltado, con el comando :noh se soluciona esto (ver siguiente linea)
"This unsets the last search pattern register by hitting return
nnoremap <silent> <ESC><ESC> :noh<CR> :call clearmatches()<CR>



" Set the commands to save in history default number is 20.
set history=1000

set undolevels=1000


" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx



"FOLDS
"---------------------------------------------------------------------------------------------
" zo = open a single fold under the cursor
" zc = close the fold under the cursor
" zR = open all folds


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'junegunn/goyo.vim'

Plug 'ajmwagar/vim-deus'



" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }



call plug#end()




" luego de insertar el Plugin => Save the .vimrc file with the command :w and source the .vimrc file with this command :source ~/.vimrc to make the changes take effect.  Now type :PlugInstall to download and install the two plugins.



" }}}


" Varios MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
"key mapping sintax is:
"map_mode <what_you_type> <what_is_executed>
"nnoremap – Allows you to map keys in normal mode
"inoremap – Allows you to map keys in insert mode
"vnoremap – Allows you to map keys in visual mode

"Command no funciona en CLI
"Cmd+c (cmd v ya viene por default)
"cnoremap <D-c> "+y

let mapleader = ","

" Flecha

"esta no me salio
"nnoremap <Leader>f a<Space>--->
inoremap <C-f> --->


" Ir a la ultima linea con texto
"https://stackoverflow.com/questions/33663205/vim-jump-to-last-non-whitespace-character-of-a-file
nnoremap <Leader>G G?\S<CR>:noh<CR>


"Save 
noremap  <silent> <C-S>    :update<CR>

"Escape
inoremap <S-Tab> <ESC>
vnoremap <S-Tab> <ESC>
 

" sacada de 'Going Text' (Brian Schell) ---- NO SE PORQUE ME FLASHEA LA K CON
"nnoremap j gj
"nnoremap k gk 
"vnoremap j gj 
"vnoremap k gk
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-b> <ESC>bi
inoremap <C-w> <ESC>lwi


" start new line btw 2 juxtaposed lines, leaving one line above and below
"para abajo
nnoremap <Leader>oo 2o<ESC>O
" para arriba
nnoremap <Leader>OO 2O<ESC>O

" insert new line without in NORMAL mode switch to INSERT mod
" para abajo
nnoremap <silent> <Leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
"para arriba
nnoremap <silent> <Leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR> 


" tiempo de espera POR EL MOMENTO LO DEJO COON EL DEFAULT DE 1000 ms
set timeoutlen=900 ttimeoutlen=0



"COMMAND LINE (mapeado como la terminal de mac)
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

"cnoremap <Esc-b> <S-Left> => por defecto se hace con Shift+left arrow
"cnoremap <Esc-f> <S-Right> => por defecto se hace con Shift+right arrow
" comentario de Stack Overflow: I've found that aligning Vim command-mode and shell bindings, especially if you're using Vi bindings, works well. I'd refine the above great suggestion to avoid overwriting existing useful bindings; for example, C-f since that's usefully bound to <edit current line in command-mode in buffer>. ^b in command-mode in Vim is already bound to (Emacs-like) <Home>, and ^a clashes with screen(1) (and for lots of people, tmux(1)).


"shortcuting split navigation, saving a keypress:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l


" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
" BORRADORES 
" ESTO NO VA EN GITHUB




"autoclose (vanilla approach)(https://stackoverflow.com/questions/21316727/automatic-closing-brackets-for-vim)
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

"This autocomplete in insert mode, provided set paste is not set. Keep it in the vimrc to avoid typing it every time and when we don't want the mapping, we need to escape it using ctrl + v before typing the mapped char like ( { etc.


"VER ESTO******************************* 
"
"# encolsing parentheses
"(hay un pluggin vimsurround)

"Opcion vanilla: tomada de https://stackoverflow.com/questions/8070892/enclosing-in-parentheses-with-vim

"You can use the following commands:

"cw(<C-r><C-o>")<ESC>
"The advantage is that you can use the dot command for repeat this action for different words. This works for custom encloses too, for example:

"Before change:

"word
"then use the command:

"cw\enquote{<C-r><C-o>"}<ESC>
"Final result:

"\enquote{word}

"#PARA VISUAL MODE:
"c(<C-r><C-o>")<ESC>

"The pasting of the default or unnamed register containing the text of the last delete or yank (see :help i_^r) to the last position of the cursor (:help ^o) and immediately inserting a closing parenthesis is a quite handy

""""""""""""""""""""""""""""""""""""""""""""""""



"LaTeX ----------------------------- {{{

" Autocompilar LaTeX y ver preview
" 
" 1------ no me convence -- sacado de aca https://tpaschalis.github.io/macos-latex-vim/
" Custom Silent command that will call redraw
"command! -nargs=+ Silent
"\   execute 'silent ! <args>'
"\ | redraw!
"map <F5> :Silent pdflatex % && open -a skim && open -a Terminal

" 2----------
" vim-latex-live-preview settings
"autocmd Filetype tex setl updatetime=1000
"let g:livepreview_previewer = 'open -a Preview'
"nmap <F5> :LLPStartPreview<Cr>

" 3------------ 'Going Text' Brian Schell .vimrc config
" Latex compile and preview key bindings

"Maps COMMA-U to compile the text file on the screen to a PDF using PDFLATEX.
"    :map <Leader>u <ESC>:! pdflatex "%" 

"Maps COMMA-I to load the Evince PDF viewer and preview the file created when I hit COMMA-U.
"    :map <Leader>i <ESC>:! open -a skim "%:t:r.pdf" &

" (CURRENTLY USING) 4 ------------ 
"https://www.dianacai.com/blog/2018/06/28/latex-vim-skim-setup/
"control-T compiles the tex to pdf using latexmk
"shift-T opens the pdf in Skim (????)
"shift-C cleans the directory (????)
"
"mi version: guardar + compilar con latexmk + abrir skim
    autocmd FileType tex nmap <buffer> <F5> :w! %<CR>:!latexmk -pdf %<CR><CR>:!open -a skim "%:t:r.pdf"<CR><CR>


 
" 5 ------------ esta es la version del Vikingo-copia-de-Luke-Smith
"https://www.youtube.com/watch?v=igX_QbCS5bg&list=LL&index=1






"    }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""      
