" use backspace key on edit mode
set backspace=indent,eol,start

"------ about indent (start) ------
"新しい行のインデントを現在行と同じにしない
set noautoindent
"タブの代わりに空白文字を挿入する
set expandtab
"新しい行を作ったときに高度な自動インデントを行う
"set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
"------ about indent (end) ------
" directory for backup
set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" incremental search
set incsearch

" display command on status row.
set showcmd

"コマンド補完
set wildmenu
set wildchar =<tab>


"------ 不可視文字関連 start ------
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<
"行末のスペースをハイライトする"
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"------ 不可視文字関連 end -----

"行番号を表示する
set number
"行数を表示する
set nu
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
"set smartcase
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan
"PHP入力補完
"autocmd FileType php  :set dictionary=~/vimdic/php.dic
"オムニ補完
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"------ Syntax Check ------
" PHP Lint
autocmd BufWritePost *.php :call PHPLint()
function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  let headPart = strpart(result, 0, 16)
  if headPart != "No syntax errors"
    echo result
  endif
endfunction

"phpfolding
"source ~/.vim/phpfolding.vim
syntax on
set foldmethod=syntax
let php_folding = 1
let php_noShortTags = 1
let php_sql_query = 1
let php_htmlInStrings = 1



"able to use clipboard
set clipboard+=unnamed

"neobundle
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  "call neobundle#rc(expand('~/.vim/bundle/'))
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
" display as tree
NeoBundle 'scrooloose/nerdtree'
" for rails
NeoBundle 'tpope/vim-rails'
" for ruby's end
NeoBundle 'tpope/vim-endwise'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on
