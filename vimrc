set showcmd             " display incomplete commands
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ENCODING=%{&fileencoding}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime('%d/%m/%y\ -\ %H:%M')}
set autoindent              " always set autoindenting on
set cindent
set expandtab
set shiftwidth=4
set tabstop=4
set number
set hlsearch
set incsearch           " do incremental searching
set encoding=utf-8 "vim内部使用的编码
set fileencodings=ucs-bom,utf-8,gbk,gb10830  " 文件使用的编码
"set termencoding=gb18030 " vim显示字符使用的编码
set nowrap
set showmatch
set matchtime=15
set nocompatible
filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.hrp set filetype=cpp

" to use 'taglist'
":let Tlist_Enable_Fold_Column = 0
":let Tlist_Exit_OnlyWindow = 1
":let Tlist_File_Fold_Auto_Close = 1
":let Tlist_Process_File_Always = 1
":let Tlist_Use_Right_Window = 1
"let Tlist_Inc_Winwidth=0
":let Tlist_Show_One_File = 1
"nmap TT :TlistToggle<CR>

""
"set nocp
"set complete=menu,menuone
"let OmniCpp_NamespaceSearch=2
"let OmniCpp_GlobalScopeSearch=1
"let OmniCpp_ShowAccess=1
"let OmniCpp_ShowPrototypeInAbbr=1
""let OmniCpp_MayCompleteDot=1
""let OmniCpp_MayCompleteArrow=1
""let OmniCpp_MayCompleteScope=1
""let OmniCpp_DefaultNamespaces=...
"let OmniCpp_DisplayMode=1
"let OmniCpp_SelectFirstItem=0

"map
"nmap <F8> :!ctags -R --links=no --c-kinds=+px --fields=+ias --extra=+q /export/home/zhaokuo/work/sandbox_server<cr>
nmap <F7> :!ctags -R --links=no --c-kinds=+px --fields=+ias --extra=+q /home/zhaokuo/brpc/brpc-0.9.5<cr>
"set tags+=xxtags
"set tags+=systags

set previewheight=3

" set path
if has ("unix")
	" set searched directory
	set path+=/usr/include,/usr/include/c++/4.4.7
	"set path+=local_code_path
endif


syntax on 
set background=dark
let g:solarized_termtrans=1
"colorscheme solarized
colorscheme desert
set backspace=indent,eol,start

"=========================================================================================================
map <F4> :call TitleDet()<CR>
function AddTitle()
  call append(0, "\/\/")
  call append(1, "\/\/ Authors      : Zhao,Kuo (zhaokuo_game@163.com)")
  call append(2, "\/\/ Create Time  : ".strftime("%Y-%m-%d %H:%M:%S"))
  call append(3, "\/\/ Last modify  : ".strftime("%Y-%m-%d %H:%M:%S"))
  call append(4, "\/\/ File name    : ".expand("%:t"))
  call append(5, "\/\/ ")
  call append(6, "\/\/ Description  :")
  call append(7, "\/\/ ")
  "echohl WarningMsg | echo "Successful in adding file title." | echohl None
endfunction

function UpdateTitle()
  normal m'
  execute '/\/\/ Last modify *:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
  normal ''
  normal mk
  execute '/\/\/ File name *:/s@:.*$@\=": ".expand("%:t")@'
  execute "noh"
  normal 'k
  echohl WarningMsg | echo "Successful in updating file title." | echohl None
endfunction

function TitleDet()
  let n = 1
  while n < 8
    let line = getline(n)
    if line =~ '^\/\/\sLast\smodify\s*:*.*$'
      call UpdateTitle()
      return
    endif
    let n = n + 1
  endwhile
  call AddTitle()
endfunction
"=========================================================================================================

"
function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef _" . gatename . "_"
    execute "normal! o#define _" . gatename . "_"
    execute "normal! Go#endif // _" . gatename . "_"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"" vimwiki
let g:vimwiki_list = [{"path":"~/kecookier_wiki", "path_html":"~/kecookier_wiki_html", "ext":".md", "syntax":"markdown", "auto_export":0}]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 补全插件
" set nocompatible              " be iMproved, required
" filetype off                  " required
" "设置Vundle的运行路径并初始化
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" " Vundle安装位置与插件路径不同时，需要Vundle插件的路径
" "call vundle#begin('~/some/path/here')
" "------------------要安装的插件不能写在此行前！------------------
"  
" "Vundle对自己的调用，不可删去
" Plugin 'VundleVim/Vundle.vim'
" "以下是所支持的各种不同格式的示例
" "需要安装的插件应写在调用的vundle#begin和vundle#end之间
" "如果插件托管在Github上，写在下方，只写作者名/项目名就行了
"  
" "Plugin 'Valloric/YouCompleteMe'
" Plugin 'majutsushi/tagbar'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vim-airline/vim-airline'
"  
" "如果插件来自vim-scripts(官方)，写插件名就行了
" " Plugin 'L9'
"  
" "如果Git仓库不在Github上，需要提供完整的链接
" " Plugin 'git://git.wincent.com/command-t.git'
"  
" "本地的插件需要提供文件路径
" " Plugin 'file:///home/gmarik/path/to/plugin'
" "一定要确保插件就在提供路径的文件夹中(没有子文件夹，直接在这层目录下)
" "运行时目录的路径
" "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" "避免插件间的命名冲突
" "Plugin 'ascenator/L9', {'name': 'newL9'}
" "------------------要安装的插件不能写在此行后！------------------
" call vundle#end()            " required
" filetype plugin indent on    " required
" "要忽略插件缩进更改，请改用：
" "filetype plugin on
" "
" " 安装插件的相关指令
" ":PluginList			- 列出已安装插件
" ":PluginInstall			- 安装新添加的插件;添加`!`或使用`:PluginUpdate`来更新已安装插件
" ":PluginSearch xxx		- 寻找名字带有xxx的插件;添加`!`刷新本地缓存
" ":PluginClean			- 删除已经从列表移除的插件;添加`!`静默卸载
" ":h						- 帮助和说明文档 
