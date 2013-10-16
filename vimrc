" ----------------------------------------------------------------------------------------
"   neobundle
" ----------------------------------------------------------------------------------------
set nocompatible " be iMproved
filetype plugin indent off " required!
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
"
" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
                        \ 'build' : {
                        \ 'windows' : 'make -f make_mingw32.mak',
                        \ 'cygwin' : 'make -f make_cygwin.mak',
                        \ 'mac' : 'make -f make_mac.mak',
                        \ 'unix' : 'make -f make_unix.mak',
                        \ },
                        \ }

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'thinca/vim-quickrun'


NeoBundleLazy "dag/vim2hs",                  {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "eagletmt/ghcmod-vim",         {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "eagletmt/unite-haddock",      {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "ujihisa/neco-ghc",            {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "ujihisa/unite-haskellimport", {"autoload" : { "filetypes" : ["haskell"] }}

"
" NeoBundle 'davidoc/taskpaper.vim'
" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'L9'
" NeoBundle 'surround.vim'
" NeoBundle 'https://svn.macports.org/repository/macports/contrib/mpvim/'
" NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
" NeoBundle 'https://git.wincent.com/command-t.git'
filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck

" 特定の環境だとhttpsでないとうまくcheckoutできないので以下を設定すること
" let g:neobundle_default_git_protocol='https'
"

"---------------------------------------------------------------------------
"Original Settings
"---------------------------------------------------------------------------
syntax on  " 行番号を非表示 (number:表示)

set number " ルーラーを表示 (noruler:非表示)
set ruler  " タブや改行を表示 (list:表示)
set nolist " どの文字でタブや改行を表示するかを設定
set wrap " 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2 " コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2 " コマンドをステータス行に表示
set showcmd " タイトルを表示
set title
set wildmode=longest:full,full
set nobackup
set backspace=indent,eol,start
set showmatch " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set wildmenu  " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set formatoptions+=mM  " テキスト挿入中の自動折り返しを日本語に対応させる

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"---------------------------------------------------------------------------
set ignorecase " 検索時に大文字小文字を無視 (noignorecase:無視しない) 
set smartcase " 大文字小文字の両方が含まれている場合は大文字小文字を区別 
set wrapscan  " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)

"---------------------------------------------------------------------------
" インデントに関する設定
"---------------------------------------------------------------------------
" expandtab 	TabをSpaceに置き換える
" tabstop 	画面上でタブ文字が占める幅
" shiftwidth 	自動インデントでずれる幅
" softtabstop 	連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
" autoindent 	改行時に前の行のインデントを継続する
" smartindent 	改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"
set tabstop=4 " タブの画面上での幅 
set shiftwidth=4
set expandtab " タブをスペースに展開しない (expandtab:展開する) 
set autoindent

"---------------------------------------------------------------------------
" 画面の色関連の設定
"---------------------------------------------------------------------------
" 256色設定
set t_Co=256

" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
" colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)
colorscheme koehler

" termを設定
if has('unix') && !has('gui_running')
        let s:uname = system('uname')
        if s:uname =~? "linux"
                set term=builtin_linux
        elseif s:uname =~? "freebsd"
                set term=builtin_cons25
        elseif s:uname =~? "Darwin"
                set term=builtin_xterm
        else
                set term=builtin_xterm
        endif
        unlet s:uname
endif

" screenだと上手くtermが設定されないので別途設定
if match($TERM, "screen")!=-1
          set term=xterm
endif

"VimFilerの設定
"---------------------------------------------------------------------------
"デフォルトでIDE風のFilerを開く
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
 
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3

"---------------------------------------------------------------------------
" key binding
"---------------------------------------------------------------------------
"
" ZZ, ZQは誤爆が怖いので消しちゃう
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" Exモードは発動しないように
nnoremap Q <Nop>
" nnoremap Q gq " もし使う場合はこちらの設定

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" vを二回で行末まで選択
vnoremap v $h

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

"---------------------------------------------------------------------------
"" Uniteのバインド
"---------------------------------------------------------------------------
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>


