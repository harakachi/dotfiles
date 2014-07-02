syntax on
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab
set number
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" 対応括弧をハイライト表示する
set showmatch
set cursorline

" 文字コード自動判別
" set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" colorscheme darkblue
colorscheme desert

" NeoBundle
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ujihisa/unite-colorscheme'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'Lokaltog/vim-powerline'

" add more
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-quickrun'


" ======= [[[ neocomplcache config ]]] ======
" ex) http://vim-users.jp/2010/10/hack177/
"     http://vim-users.jp/2010/11/hack185/

" neocomplcacheを起動時に有効化する設定
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" camel case機能を有効化
let g:neocomplcache_enable_camel_case_completion = 1

" _区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" dictionary
" ファイルタイプ毎にneocomplcacheのディクショナリを設定する
" $ mkdir ~/.vim/dict
" $ cd ~/.vim/dict
" $ wget https://raw.github.com/Cside/dotfiles/master/.vim/dict/perl.dict
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }
let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"buffer操作
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>

nmap bb :ls<CR>:buf 

" snipet
" $ mkdir ~/.vim/snippets
" $ cd ~/.vim/snippets
" $ wget
" https://raw.github.com/gist/2146105/464170751812997fc3b655cb547e2b5a929e9eb6/perl.snip
"
" Plugin key-mappings.
" <C-k>でスニペットの展開をできるようにします
" smapも同時に設定しないと、デフォルト値が選択されているときに展開やジャンプがされません
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" 前回行われた補完をキャンセルします。
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補のなかから、共通する部分を補完します。ちょうど、シェルの補完のような動作です。
inoremap <expr><C-l> neocomplcache#complete_common_string()
                     
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>で選択後、改行しないように
inoremap <expr><CR>  pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"


" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" 現在選択している候補を確定します。
inoremap <expr><C-y>  neocomplcache#close_popup()

" 現在選択している候補をキャンセルし、ポップアップを閉じます。
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl

filetype plugin indent on     " required!
filetype indent on

" power line
let g:Powerline_symbols = 'fancy'

hi cursorline term=reverse cterm=none ctermbg=234
