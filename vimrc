"Original Settings

"---------------------------------------------------------------------------
"" GUI固有ではない画面表示の設定:
"
syntax on
"" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" " タブや改行を表示 (list:表示)
set nolist
" " どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" " 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" " 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
" colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)
colorscheme koehler

set wildmode=longest:full,full

set nobackup

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=8
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
" colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

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
if match($TERM, "screen")!=-1
	set term=xterm
endif
set t_Co=256

" ----------------------------------------------------------------------------------------
"   neobundle
" ----------------------------------------------------------------------------------------
set nocompatible " be iMproved
filetype plugin indent off " required!
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'thinca/vim-quickrun'

 
""VimFilerの設定
"デフォルトでIDE風のFilerを開く
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
 
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck

" 特定の環境だとhttpsでないとうまくcheckoutできないので以下を設定すること
" let g:neobundle_default_git_protocol='https'

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap Q <Nop>
" nnoremap Q gq

