syntax on

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

"ポップアップ補完メニュー色設定（通常の項目、選択されている項目、スクロールバー、スクロールバーのつまみ部分）
highlight Pmenu ctermbg=6 guibg=#4c745a
highlight PmenuSel ctermbg=3 guibg=#d4b979
highlight PmenuSbar ctermbg=0 guibg=#333333
highlight PmenuThumb ctermbg=0 guibg=Red

"set listchars=tab:>.
"set list


"set wildmode=longest,list

" ちゃんと文字書いて○とか
set ambiwidth=double
"
" " ポップアップメニューをよしなに
set completeopt=menu,preview,longest,menuone
"
" " 補完候補の設定
set complete=.,w,b,u,k
"
" " バックアップとか自分でしろ
set nobackup
"
" " 誰かが編集したら読み直して
set autoread
"
" " 袖あまりは良いものだ
set scrolloff=10000000

" " 行番号の表示
set number

"" デフォルトインデント設定"
set autoindent smartindent

" " よさげなタブ
"set smarttab
"set softtabstop=4 tabstop=4 shiftwidth=4

" " BS の挙動
set backspace=indent,eol,start
"
" " よしなにしてくれ
set ignorecase smartcase
" " インクメンタル
set incsearch
" " 最初にもどれ
set wrapscan
"
" " 対応する括弧の表示
set showmatch

" " 入力中のコマンドを表示
set showcmd
"
" 行頭・行末間移動を可能に
set whichwrap=b,s,h,l,<,>,[,]
"
" 補完候補を表示する
set wildmenu
"
" " ステータス表示用変数
set laststatus=2
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}%=%l,%c%V%8P

filetype plugin on
filetype indent on
