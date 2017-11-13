syntax on

set showcmd             " display incomplete commands
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENCODING=%{&fileencoding}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime('%d/%m/%y\ -\ %H:%M')}

set autoindent              " always set autoindenting on
set cindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set number
set hlsearch
set incsearch           " do incremental searching
"set ffs=unix
set encoding=utf-8 "vim内部使用的编码
set fileencodings=ucs-bom,utf-8,gbk,gb10830  " 文件使用的编码
"set termencoding=gb18030 " vim显示字符使用的编码
set nowrap
set showmatch
set matchtime=15
"set backspace=indent,eol,start " 禁用Backspace键

filetype on
filetype plugin on
filetype indent on

"color
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solorized_termtrans=1

"set nocompatible
"set autowrite
"set diffopt+=iwhite
"set backspace=indent,eol,start " allow backspacing over everything in insert mode
"set nobackup
"set history=50          " keep 50 lines of command line history
"set ruler               " show the cursor position all the time
"set nobomb
"set mouse=a " In many terminal emulators the mouse works just fine, thus enable it.
"set ignorecase
"set infercase  "set noinfercase
"set list
"set listchars=tab:#~,trail:~
" if has("vms")
"  set nobackup         " do not keep a backup file, use versions instead
" else
"  set backup           " keep a backup file
" endif
"

" to use 'taglist'
:let Tlist_Enable_Fold_Column = 0
:let Tlist_Exit_OnlyWindow = 1
:let Tlist_File_Fold_Auto_Close = 1
:let Tlist_Process_File_Always = 1
:let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth=0
:let Tlist_Show_One_File = 1
nmap TT :TlistToggle<CR>

""
set nocp
"set complete=menu,menuone
let OmniCpp_NamespaceSearch=2
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1
"let OmniCpp_MayCompleteDot=1
"let OmniCpp_MayCompleteArrow=1
"let OmniCpp_MayCompleteScope=1
"let OmniCpp_DefaultNamespaces=...
let OmniCpp_DisplayMode=1
let OmniCpp_SelectFirstItem=0

"map
"nmap <F8> :!ctags -R --c-kinds=+px --fields=+ias --extra=+q codepath<cr>
"set tags+=xxtags
"set tags+=systags

set previewheight=3

" set path
if has ("unix")
	" set searched directory
	set path+=/usr/include,/usr/include/c++/4.4.7
	"set path+=local_code_path
endif

"=========================================================================================================
map <F4> :call TitleDet()<CR>
function AddTitle()
  call append(0, "\/\/")
  call append(1, "\/\/ Author: zhaokuo@pwrd.com (Zhao Kuo)")
  call append(2, "\/\/ ")
  call append(3, "\/\/ Description:")
  call append(4, "\/\/ ")
  "echohl WarningMsg | echo "Successful in adding file title." | echohl None
endfunction

function UpdateTitle()
  normal m'
  execute '/ *Last modify:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")."."@'
  normal ''
  normal mk
  execute '/ *File name:/s@:.*$@\=": ".expand("%:t")@'
  execute "noh"
  normal 'k
  "echohl WarningMsg | echo "Successful in updating file title." | echohl None
endfunction

function TitleDet()
  let n = 1
  while n < 10
    let line = getline(n)
    if line =~'\/\/\sLast\_smodify:'
      call UpdateTitle()
      return
    endif
    let n = n + 1
  endwhile
  call AddTitle()
endfunction
"=========================================================================================================

" http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates
function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef _" . gatename . "_"
    execute "normal! o#define _" . gatename . "_"
    execute "normal! Go#endif // _" . gatename . "_"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

