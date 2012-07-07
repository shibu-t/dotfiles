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

"見えない文字の表示
set list
set listchars=eol:¬,tab:▸\ 

" シンタックスハイライト有効化 (背景黒向け。白はコメントアウト
" されている設定を使用)
syntax on
colorscheme jellybeans

set nohlsearch " 検索キーワードをハイライトしないように設定
set cursorline " カーソルラインの強調表示を有効化

" 行番号を表示
set number

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
