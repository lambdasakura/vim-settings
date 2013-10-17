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

" Python autocompletion
NeoBundleLazy "davidhalter/jedi-vim", {
            \ "rev" : 'dev',
            \ "autoload": {
            \ "filetypes": [ "python", "python3", "djangohtml"]}}

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

":set encoding=cp932
:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
:set fileformats=unix,dos,mac

"英語メニューにする 
source $VIMRUNTIME/delmenu.vim 
set langmenu=none 
source $VIMRUNTIME/menu.vim

"英語メッセージにする
if has("multi_lang")
    language C
endif

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
        set term=beos-ansi
    else
        set term=builtin_xterm
    endif
    unlet s:uname
endif

" screenだと上手くtermが設定されないので別途設定
if match($TERM, "screen")!=-1
    set term=xterm
endif

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

"---------------------------------------------------------------------------
""VimFilerの設定
"---------------------------------------------------------------------------
"デフォルトでIDE風のFilerを開く
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let $PATH="C:/Python33/DLLs:".$PATH
" let $PATH="C:/Python27/DLLs:".$PATH


autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
