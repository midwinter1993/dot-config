" reference https://github.com/wklken/k-vim
"
set nocompatible       " be iMproved, required
filetype off           " required

"==========================================
" Vundle config
"==========================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"------------YouCompleteMe--------------------
" 代码自动补全
" 重启 :YcmRestartServer
Bundle 'Valloric/YouCompleteMe'
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion                  =['<c-n>']
let g:ycm_key_list_select_completion                   =['<Down>']
" let g:ycm_key_list_previous_completion                =['<c-p>']
let g:ycm_key_list_previous_completion                 =['<Up>']
let g:ycm_complete_in_comments                         =1 "在注释输入中也能补全
let g:ycm_complete_in_strings                          =1 "在字符串输入中也能补全
" let g:ycm_use_ultisnips_completer                      =1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings=1 "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files          =1
"let g:ycm_seed_identifiers_with_syntax                  =1 "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_goto_buffer_command                          ='vertical-split' " 跳转到定义处, 分屏打开
" let g:ycm_goto_buffer_command                          ='horizontal-split' " 跳转到定义处, 分屏打开
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif
let g:ycm_filetype_blacklist={
            \ 'tagbar' : 1,
            \ 'gitcommit' : 1,
            \}

"###############Easy Operation ###############
"---------------MultipleCursor----------------
" 多光标选中编辑
" Bundle 'terryma/vim-multiple-cursors'
" let g:multi_cursor_use_default_mapping=0
"---------------------------------------------

"---------------Ultisnips&&snippets-----------
" Snippets are separated from the engine. Add this if you want them:
" 代码片段快速插入 (snippets中,是代码片段资源,需要学习)
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger      ="<tab>"
let g:UltiSnipsJumpForwardTrigger ="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories =['UltiSnips']
let g:UltiSnipsSnippetsDir        ='~/.vim/UltiSnips'
" 定义存放代码片段的文件夹
" .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
" 进入对应filetype的snippets进行编辑
map <leader>us :UltiSnipsEdit<CR>
" ctrl+j/k 进行选择
func! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
    endif
endfunction

func! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
    endif
endfunction

inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger="<c-k>"

"---------------------------------------------

"-------------EasyMotion----------------------
" 更高效的移动 [,, + w/fx]
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase=1
" let g:EasyMotion_startofline=0 " keep cursor colum when JK motion
" map <Leader><leader>h <Plug>(easymotion-linebackward)
" map <Leader><Leader>j <Plug>(easymotion-j)
" map <Leader><Leader>k <Plug>(easymotion-k)
" map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

map <leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
"---------------------------------------------

"-------------EasyAlign-----------------------
" 快速赋值语句对齐
Bundle 'junegunn/vim-easy-align'
"---------------------------------------------

"-------------NerdComment---------------------
" 快速注释
Bundle 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
"---------------------------------------------

"-------------TrailingWhitespace--------------
"快速去行尾空格 [, + <Space>]
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>
"---------------------------------------------

"-------------DelimitMate---------------------
" 自动补全单引号，双引号等
Bundle 'Raimondi/delimitMate'
"---------------------------------------------

"################File && Search###############
"-------------Tagbar--------------------------
" 标签导航
" Bundle 'majutsushi/tagbar'
" nmap <F9> :TagbarToggle<CR>
" let g:tagbar_autofocus=1
"---------------------------------------------

"-------------NerdTree------------------------
Bundle 'scrooloose/nerdtree'
nmap ntr :NERDTree<CR>
nmap ntrc :NERDTreeClose<CR>
nmap ntrt :NERDTreeToggle<CR>

let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$', '\.bc$', '\.class$', '\.d$']
"---------------------------------------------

"-------------CtrlP---------------------------
Bundle 'ctrlpvim/ctrlp.vim'
"---------------------------------------------

"-------------CtrlP-Funnky--------------------
" ctrlp插件1 - 不用ctag进行函数快速跳转
Bundle 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight=1
let g:ctrlp_extensions=['funky']
"---------------------------------------------

"###############Color && Theme################

"-------------Molokai-------------------------
" Bundle 'tomasr/molokai'
" monokai原始背景色
" let g:molokai_original=1
"---------------------------------------------

"-------------CSApprox------------------------
Plugin 'godlygeek/csapprox'
"---------------------------------------------

"-------------Color Themes--------------------
Plugin 'flazz/vim-colorschemes'
"---------------------------------------------

"--------------Polyglot-----------------------
" Syntax highlight
Bundle 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']
"---------------------------------------------

"--------------Airline------------------------
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
"let g:airline#themes#github#palette={}
"---------------------------------------------

"-------------Airline-Theme-------------------
Plugin 'vim-airline/vim-airline-themes'
"---------------------------------------------

"--------------RainbowParantheses-------------
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
" Bundle 'kien/rainbow_parentheses.vim'
" " 不加入这行, 防止黑色括号出现, 很难识别
" " \ ['black',       'SeaGreen3'],
" let g:rbpt_colorpairs=[
            " \ ['brown',       'RoyalBlue3'],
            " \ ['Darkblue',    'SeaGreen3'],
            " \ ['darkgray',    'DarkOrchid3'],
            " \ ['darkgreen',   'firebrick3'],
            " \ ['darkcyan',    'RoyalBlue3'],
            " \ ['darkred',     'SeaGreen3'],
            " \ ['darkmagenta', 'DarkOrchid3'],
            " \ ['brown',       'firebrick3'],
            " \ ['gray',        'RoyalBlue3'],
            " \ ['darkmagenta', 'DarkOrchid3'],
            " \ ['Darkblue',    'firebrick3'],
            " \ ['darkgreen',   'RoyalBlue3'],
            " \ ['darkcyan',    'SeaGreen3'],
            " \ ['darkred',     'DarkOrchid3'],
            " \ ['red',         'firebrick3'],
            " \ ]
" let g:rbpt_max=16
" let g:rbpt_loadcmd_toggle=0
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
"---------------------------------------------

"------------IndentLine-----------------------
Bundle 'Yggdroot/indentLine'
" indent line ¦, ┆, ︙ or │
" let g:indentLine_char='│'
let g:indentLine_char = '┊'
" Plugin 'nathanaelkane/vim-indent-guides'
"---------------------------------------------

"------------VimStartify----------------------
Bundle 'mhinz/vim-startify'
"---------------------------------------------

"------------vim-flake8----------------------
Bundle 'nvie/vim-flake8'
"---------------------------------------------

"------------python highlight-----------------
Bundle 'hdima/python-syntax'
let python_highlight_all = 1
"---------------------------------------------
"
"------------Mini Buffer Explorer-----------------
" Bundle 'fholgado/minibufexpl.vim'
"---------------------------------------------

"------------vim clang format-----------------
Bundle 'rhysd/vim-clang-format'
let g:clang_format#auto_format_on_insert_leave=0
let g:clang_format#code_style='google'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "IndentWidth": 4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "DerivePointerAlignment" : "true",
            \ "Standard" : "C++11"}
nmap <Leader>f :ClangFormat<CR>
"---------------------------------------------

"------------vim React -----------------
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
"---------------------------------------------

"------------Undetree-------------------------
" Plugin 'mbbill/undotree'
"---------------------------------------------

"------------surround.vim---------------------
Plugin 'tpope/vim-surround'
"---------------------------------------------

"------------repeat.vim-----------------------
Plugin 'tpope/vim-repeat'
"---------------------------------------------

"------------Docker file----------------------
" Plugin 'ekalinin/Dockerfile.vim'
"---------------------------------------------

"------------fugitive-------------------------
" Plugin 'tpope/vim-fugitive'
"---------------------------------------------

"------------abolish--------------------------
Plugin 'tpope/vim-abolish'
" Usage
"----
"  crc to convert to fooBar
"  crm to convert to FooBar
"  cr_ or
"  crs to convert to foo_bar
"  cru to convert to FOO_BAR
"  cr- to convert to foo-bar
"---------------------------------------------

"-----------yapf vim--------------------------
Plugin 'mindriot101/vim-yapf'
nnoremap <leader>q :Yapf<cr>
"---------------------------------------------

"-----------Import sort for python-----------
Plugin 'fisadev/vim-isort'
"---------------------------------------------

"-------------GitHub Gist---------------------
Bundle 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
let g:gist_show_privates = 1
let g:gist_post_private = 1
"---------------------------------------------

"-------------Devicons------------------------
" Plugin 'ryanoasis/vim-devicons'
" set encoding=utf8
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
" let g:airline_powerline_fonts = 1
"---------------------------------------------

"-------------vim-racket----------------------
Plugin 'wlangstroth/vim-racket'
"---------------------------------------------

"-------------vim-racket----------------------
Plugin 'vim-scripts/a.vim'
nmap t :A<CR>
"---------------------------------------------

"------------ vimtex for Latex ---------------
Plugin 'lervag/vimtex'
"---------------------------------------------
let g:tex_conceal = ""

call vundle#end()            " required
filetype plugin indent on    " required
"---------------------------------------------

"==========================================
" Genaral
"==========================================
" history length
set history=1000

"检测文件类型
filetype on

" 针对不同的文件类型采用不同的缩进格式
filetype indent on

"允许插件
filetype plugin on

"启动自动补全
filetype plugin indent on

" 文件修改之后自动载入。

set autoread
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 取消备份。
set nobackup
set nowb
set noswapfile

"粘贴时保持格式
" set paste

" 在所有的模式下面打开鼠标。
set mouse=a

" No annoying sound on errors
" " 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" show and format
"==========================================
" 显示行号：
set number
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
" 显示tab符
" set list
" set listchars=tab:\|\ ,

"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" 高亮search命中的文本。
set hlsearch

" 搜索时忽略大小写
"set ignorecase

" 随着键入即时搜索
set incsearch

" 有一个或以上大写字母时仍大小写敏感
"set smartcase

" 代码折叠
set foldenable

" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=manual

" 在左侧显示折叠的层次
"set foldcolumn=4

" 设置Tab键的宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 将Tab自动转化成空格
set expandtab

"Auto indent
set autoindent

"Smart indent
set smartindent
set cindent

"==========================================
" status
"==========================================
"显示当前的行号列号：
set ruler

""在状态栏显示正在输入的命令
set showcmd

" 突出显示当前行
set cursorline

" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2


"==========================================
"colors and fonts
"==========================================
"开启语法高亮
syntax enable
syntax on
" Set extra options when running in GUI mode

"==========================================
"others
"==========================================

"autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。


" 自动完成
set completeopt=longest,menu
" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class,*.bc

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

" Javsscript
autocmd FileType html,javascript,scheme set tabstop=2 shiftwidth=2 sts=2 expandtab


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

au BufRead,BufNewFile *.asm set filetype=nasm

au FileType scheme setl sw=2 sts=2 et

" A buffer becomes hidden when it is abandoned
"set hid

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

"+++++++++++++ Color Theme++++++++++++++++
let g:rehash256=1
set t_Co=256
set term=xterm-256color
let g:solarized_termcolors=256
set background=dark
" set background=light

" colorscheme solarized
colorscheme molokai
" colorscheme dracula
" colorscheme github
if has("gui_running")
    " set guioptions -= T
    set guioptions += e
    set t_Co=256
    set guitablabel=%M\ %t
endif
set guifont=Monaco:h20

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
" set t_ti= t_te=
nnoremap <c-l> gt
nnoremap <c-h> gT
hi Normal ctermbg=none
" highlight NonText ctermbg=none

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Copy to clipboard
vmap <F2> "+yy

nnoremap <F10> :set pastetoggle<CR>
nnoremap <F6> :setlocal spell spelllang=en_us<CR>
