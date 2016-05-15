" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

set nocompatible
set ffs=dos
set autowrite
set number
set cindent
set shiftwidth=4
set tabstop=4
set diffopt+=iwhite
set laststatus=2
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch
set fileencodings=utf-8,cp936
set encoding=utf-8
set nobomb
set t_Co=256
set mouse=a " In many terminal emulators the mouse works just fine, thus enable it.
set ignorecase
set showmatch  "set matchtime=15
set infercase  "set noinfercase
"set list
"set listchars=tab:#~,trail:~
" if has("vms")
"  set nobackup         " do not keep a backup file, use versions instead
" else
"  set backup           " keep a backup file
" endif


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
        syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent              " always set autoindenting on
endif " has("autocmd")

" :colo slate
" :colo delek
" :colo zellner


"""""""""""""""""""""""""""""""""
" add by myself
"""""""""""""""""""""""""""""""""

" to use 'taglist'
filetype on
:let Tlist_Enable_Fold_Column = 0
:let Tlist_Exit_OnlyWindow = 1
:let Tlist_File_Fold_Auto_Close = 1
:let Tlist_Process_File_Always = 1
:let Tlist_Use_Right_Window = 1
:let Tlist_Show_One_File = 1

" to use 'cscope'
if has("cscope")
    set csprg=$HOME/local/bin/cscope
    set cscopetag
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

" to use tags
set previewheight=3

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"            \ | wincmd p | diffthis

map <F12> <C-]>
map <F11> <C-T>

" Don't use Ex mode, use Q for formatting
map Q gq

" save file and compile project
map <F7> <Esc>:w<CR><Esc>:make -C ./obj/ <CR><Esc>:copen<CR>G
map <F8> <Esc>:cn<CR>
map <C-<F8>> <Esc>:cp<CR>
map <F2> :execute "vimgrep /" . expand("<cword>") . "/j **/*.cpp" <Bar> cw<CR>
map <C-F2> :execute "vimgrep /" . expand("<cword>") . "/j **/*.h" <Bar> cw<CR>
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j ./*.log" <Bar> cw<CR>
"taglist
nmap <silent> <F8> :TlistToggle<CR>

syntax keyword warType WAR
syntax keyword errType ERR

highlight link warType TODO
highlight link errType ERROR
