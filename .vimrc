" 设置全局变量判断系统类型和环境
let g:isWin = has("win32") || has("win64") || has("win32unix")
let g:isGUI = has("gui_running")
let g:isMac = has('mac')
let g:isLinux = has('unix') && !g:isMac

" Leader 键设置
let mapleader = ";"

" 折叠设置
set foldenable
set foldmethod=marker
set foldcolumn=0
setlocal foldlevel=1
autocmd! BufNewFile,BufRead * setlocal nofoldenable

" 加载插件管理器
execute pathogen#infect()
syntax on
filetype plugin indent on

" 插件窗口的宽度
let s:PlugWinSize = 30

" TagList 插件配置
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_WinWidth = s:PlugWinSize
let Tlist_Auto_Open = 0
let Tlist_Display_Prototype = 0
nmap <silent> <leader>t :TlistToggle<cr>

" OmniCppComplete 插件配置
set completeopt=menu
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std"]
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 2
imap <expr> <c-j> pumvisible() ? "\<C-N>" : "\<C-X><C-O>"
imap <expr> <c-k> pumvisible() ? "\<C-P>" : "\<esc>"
imap <C-]> <C-X><C-]>
imap <C-F> <C-X><C-F>
imap <C-D> <C-X><C-D>
imap <C-L> <C-X><C-L>

" NERD_tree 插件配置
let NERDTreeShowHidden = 1
let NERDTreeWinPos = "right"
let NERDTreeWinSize = s:PlugWinSize
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>r :NERDTreeFind<cr>

" 颜色方案设置
syntax enable
if g:isMac
    set background=dark
    colorscheme solarized
else
    if has('termguicolors')
        set termguicolors
    endif
    set background=dark
    colorscheme solarized
endif

" 基础设置
set nobackup noswapfile lbr nocompatible number showcmd lz hid
set autoindent smartindent cindent
set wildmenu
set expandtab smarttab shiftwidth=4 tabstop=4
set backspace=eol,start,indent whichwrap+=<,>,h,l
set incsearch hlsearch ignorecase magic showmatch
set vb t_vb= history=400 autoread mouse=v

" 快捷键设置
map <silent> <leader>ee :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc
nmap <leader>ww :w!<cr>
nmap <C-Z> :shell<cr>
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>

" 文件类型和自动命令
filetype plugin on
autocmd BufEnter * :syntax sync fromstart
if g:isWin
    let &termencoding=&encoding
    set fileencodings=utf8,cp936,ucs-bom,latin1,gbk,gb2312,gb18030
else
    set encoding=utf8
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,latin1
    set termencoding=utf-8
endif

" 状态栏设置
set laststatus=2
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 删除 buffer 时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" 文件类型相关自动设置
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

" 项目相关配置
autocmd VimEnter * :call s:ReadSession()
function! s:ReadSession()
    let session_file = "./session.vim"
    if filereadable(session_file)
        execute "so " . session_file
    endif
endfunction

autocmd VimLeave * :call s:WriteSession()
function! s:WriteSession()
    let session_file = "./session.vim"
    if filereadable(session_file)
        execute "mks! " . session_file
    endif
endfunction
