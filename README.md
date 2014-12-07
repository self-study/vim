vim
===

# .vimrc関連

## NeoBundle

- call neobundle#rc(expand('~/.vim/bundle/'))

がdeprecatedになったため、以下の記述に変更。

- call neobundle#begin(expand('~/.vim/bundle/'))
- NeoBundleFetch 'Shougo/neobundle.vim'
- call neobundle#end()
