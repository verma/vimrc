" Enable syntax highlighting
" and apply our nice color theme
"
if &t_Co > 2 || has("gui_running")
	syntax on
	colorscheme wombat
endif
set ls=2
set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set visualbell t_vb=
set novisualbell
set number
set expandtab
set softtabstop=4
set ruler
set hidden
set autochdir
set autoindent
set title

set scrolloff=3

if has("gui_win32")
  set backupdir=$TEMP,$TMP,.
  set directory=$TEMP,$TMP,.
else
  set backupdir=~/.vim/tmp,/tmp
  set directory=~/.vim/tmp,/tmp
endif

set backspace=indent,eol,start

filetype on
filetype indent on
filetype plugin on

" if we are in gui mode set the appropriate gui font
if has("gui_running")
    if has("gui_gtk2")
      set guifont=Terminus\ (TTF)\ 11
    else
      set guifont=Terminus:h14
    endif
    set go-=T
endif


" Load the python ft plugin when loading a python file
if has("gui_win32")
  au FileType python source ~\\vimfiles\ftplugin\python.vim
  au FileType vala source ~\\vimfiles\ftplugin\vala.vim
  au FileType make source ~\\vimfiles\ftplugin\make.vim
else
  au FileType python source ~/.vim/ftplugin/python.vim
  au FileType vala source ~/.vim/ftplugin/vala.vim
  au FileType make source ~/.vim/ftplugin/make.vim
endif

" Vala configuration
"
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

" make sure .tac files are correclty identified as python files
au BufRead,BufNewFile *.tac             setfiletype python

" Setup emacs style indentation
"
set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2

" Key Mappings
" " """"""""""""""""""""""""""""""""""
map ,e :e ~/.vimrc<cr>      " edit my .vimrc file
map ,s :source ~/.vimrc<cr> " update the system settings from my vimrc file

map  <F1> :bp<CR>  " map F1 to open previous buffer
map  <F2>   :bn<CR>      " map F2 to open next buffer
imap <F1> <esc> :bp<CR>  " map F1 to open previous buffer
imap <F2>   <esc> :bn<CR>      " map F2 to open next buffer

" Tabs in the window.
map <C-S-t> :tabnew<CR> " Ctrl+shift+t will create a new tab
map <C-w> :tabclose<CR> " Close the current tab

" Nerdtree.
map nt :NERDTree<CR> " Start up nerdtree

" Map ctrlA to select all
map <C-a> :ggVG<CR>
imap <C-a> <esc>:ggVG<CR>

" Mappings to access buffers (don't use ",p" because a
" delay before pressing "p" would accidentally paste).
" ,l       : list buffers
" ,b ,f ,g : go back/forward/last-used
" ,1 ,2 ,3 : go to buffer 1/2/3 etc
nnoremap ,l :ls<CR>
nnoremap ,b :bp<CR>
nnoremap ,f :bn<CR>
nnoremap ,g :e#<CR>
nnoremap ,1 :1b<CR>
nnoremap ,2 :2b<CR>
nnoremap ,3 :3b<CR>
nnoremap ,4 :4b<CR>
nnoremap ,5 :5b<CR>
nnoremap ,6 :6b<CR>
nnoremap ,7 :7b<CR>
nnoremap ,8 :8b<CR>
nnoremap ,9 :9b<CR>
nnoremap ,0 :10b<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  if has("gui_win32")
    autocmd BufRead,BufNewFile,FileReadPost *.py source ~\\vimfiles\python
  else
    autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
  endif
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

