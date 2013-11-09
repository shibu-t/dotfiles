set encoding=utf-8
set fileencodings=utf8,iso-2022-jp,sjis,euc-jp

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

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

" シンタックスハイライト有効化 (背景黒向け。白はコメントアウトされている設定を使用)
syntax on

set t_Co=256
colorscheme jellybeans

"set nohlsearch " 検索キーワードをハイライトしないように設定
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

" 検索時に大文字小文字を区別しない
"set ic

" 自動的にファイルを読み込むパスを設定 ~/.vim/userautoload/*vim
set runtimepath+=~/.vim/
runtime! userautoload/*.vim

" インデント、空白、改行の設定

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" rvm でいれたrubyをvimのquick runで使う
let g:quickrun_config = {}

if strlen($rvm_bin_path)
    let g:quickrun_config['ruby'] = {
                \       'command': 'ruby',
                \       'exec': '$rvm_bin_path/ruby %s',
                \       'tempfile': '{tempname()}.rb'
                \    }
endif

" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 2000

" 行末の空白を保存時に自動削除する設定
"autocmd BufWritePre * :%s/\s\+$//e

"php 辞書
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
let g:ref_phpmanual_path='~/phpmanual'

" 補完時の色変更
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" 外部で変更のあったファイルを自動的に読み直す
set autoread
" ウィンドウを移動する度にチェック {{{
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END
" }}}

"tab {{{ 
" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 "常にタブラインを表示

" The prefix key.
nnoremap    [Tag] <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" t1で1番左のタブ、t2で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
" }}}

" delete forward
inoremap <C-d> <Del>

" シンタックスエラーチェック for php
"autocmd FileType php set makeprg=php\ -l\ %
"autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

""" unite.vim
" 入力モードで開始する
"let g:unite_enable_start_insert=1
" " ブックマーク一覧
nnoremap <silent> ,ub :<C-u>Unite bookmark<CR>
" ファイル一覧
 nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" " レジスタ一覧
 nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" " 最近使用したファイル一覧
 nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" " 常用セット
 nnoremap <silent> ,uu :<C-u>Unite buffer file_mru file<CR>
" " 全部乗せ
 nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" " カラースキームの切り替えを簡単にする
 nnoremap <silent> ,uc :<C-u>Unite colorscheme -auto-preview<CR>
" " Unite gtags/def
 nnoremap <silent> ,ud :<C-u>Unite gtags/def<CR>
" " Unite gtags/ref
 nnoremap <silent> ,ur :<C-u>Unite gtags/ref<CR>
" " Unite-php-ethna
 nnoremap <silent> ,ue :<C-u>Unite ethna<CR>

" " ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-h> unite#do_action('split')
" " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"vimfiler {{{
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
""セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
"nnoremap <silent> ,fe :<C-u>VimFilerBufferDir -quit<CR>
""現在開いているバッファをIDE風に開く
"nnoremap <silent> ,fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
"}}}

"neosnippet {{{
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

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/vim-snippets/snippets'
"}}}

"php-doc{{{
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

"}}}

"vdebug{{{
let g:vdebug_options = {
\    "break_on_open" : 0,
\    "continuous_mode"  : 1,
\}
"}}}

"aoi-jump{{{
"grep command setting
set grepprg=grep\ -nH
" back jump list
" <C-O>
" foward jump list
" <C-I>
" aoi grep
nnoremap <silent> <space>ag :call AoiGrep()<CR>
" jump to aoi module
nnoremap <silent> <space>am :call AoiModuleJump()<CR>
" jump to aoi processor
nnoremap <silent> <space>ap :call AoiProcessorJump()<CR>
" jump to aoi client
nnoremap <silent> <space>ac :call AoiClientJump()<CR>
" jump to smarty include file
nnoremap <silent> <space>i  :call SmartyJump()<CR>
"}}}

"gist{{{
let g:github_api_url = 'https://git.gree-dev.net/api/v3'
"}}}

"vim-sumode{{{
"call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
"call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
"call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
"call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
"call submode#map('winsize', 'n', '', '>', '<C-w>>')
"call submode#map('winsize', 'n', '', '<', '<C-w><')
"call submode#map('winsize', 'n', '', '+', '<C-w>-')
"call submode#map('winsize', 'n', '', '-', '<C-w>+')
"}}}

" {{{ function PearErrorSnipet()
function! PearErrorSnipet()
    let l:cursor_word  = expand("<cword>")
    let l:text = printf("if (PEAR::isError($err = $%s)) {", l:cursor_word)
    exe "norm! o" . l:text
    let l:text = "return $err;"
    exe "norm! o" . l:text
    let l:text = "}"
    exe "norm! o" . l:text
endfunction
noremap <silent> <space>p :call PearErrorSnipet()<CR>
" }}}

" neobundle
set nocompatible               " Be iMproved

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'phpfolding.vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'Mark'
NeoBundle 'Align'
NeoBundle 'joonty/vdebug.git'
NeoBundle 'watanabe0621/aoi-jump.vim'
NeoBundle 'gtags.vim'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'hk4nsuke/unite-php-ethna'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'submode'

" color scheme plugin
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
" vim-scripts repos
" Non github repos
" Non git repos

" ...

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

let g:unite_source_file_mru_filename_format = ''"

call unite#set_profile('default', 'ignorecase', 1)
call unite#set_profile('default', 'smartcase', 0)