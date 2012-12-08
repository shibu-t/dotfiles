set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,utf8,euc-jp

" [Backspace] で既存の文字を削除できるように設定
"  start - 既存の文字を削除できるように設定
"  eol - 行頭で[Backspace]を使用した場合上の行と連結
"  indent - オートインデントモードでインデントを削除できるように設定
set backspace=start,eol,indent

" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"  < - [←]          ノーマルモード ビジュアルモード
"  > - [→]          ノーマルモード ビジュアルモード
"  [ - [←]          挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,[,],<,>,~

" マウス機能有効化
set mouse=a
set ttymouse=xterm2

"見えない文字の表示
set list
set listchars=eol:¬,tab:▸\ 

" シンタックスハイライト有効化 (背景黒向け。白はコメントアウトされている設定を使用)
syntax on

colorscheme jellybeans

set nohlsearch " 検索キーワードをハイライトしないように設定
set cursorline " カーソルラインの強調表示を有効化

" 行番号を表示
set number

"オートインデントを有効化
set autoindent

" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容

" インクリメンタル検索を有効化
set incsearch

" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full

" 自動的にファイルを読み込むパスを設定 ~/.vim/userautoload/*vim
set runtimepath+=~/.vim/
runtime! userautoload/*.vim

"ヤンク時に自動でクリップボードにコピー
set clipboard=unnamed,autoselect

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" minibufexpl
:let g:miniBufExplMapWindowNavVim = 1
:let g:miniBufExplMapWindowNavArrows = 1
:let g:miniBufExplMapCTabSwitchBuffs = 1

" unite.vim
" 入力モードで開始する
 " let g:unite_enable_start_insert=1
 " バッファ一覧
 nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
 " ファイル一覧
 nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
 " レジスタ一覧
 nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
 " 最近使用したファイル一覧
 nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
 " 常用セット
 nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
 " 全部乗せ
 nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

 " ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'

" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin indent on
