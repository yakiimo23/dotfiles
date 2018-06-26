""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Color scheme: One Dark
Plug 'joshdick/onedark.vim'
" ステータスバー
Plug 'itchyny/lightline.vim'
" branch表示用
Plug 'tpope/vim-fugitive'
" tree 表示
Plug 'scrooloose/nerdtree'
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" インデントの空白表示
Plug 'Yggdroot/indentLine'
" 自動補完
Plug 'Shougo/deoplete.nvim'
" Rubyの自動補完
Plug 'Shougo/deoplete-rct'
" endの自動挿入
Plug 'tpope/vim-endwise'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" 検索ツール
Plug 'junegunn/fzf.vim'
" コメントアウト
Plug 'tomtom/tcomment_vim'
" インデントガイド
Plug 'nathanaelkane/vim-indent-guides'
" ファイル検索
"Plug 'ctrlpvim/ctrlp.vim'
" ファイルオープン
Plug 'Shougo/unite.vim'
" grep
Plug 'Sixeight/unite-grep'
" rails
Plug 'basyura/unite-rails'
" outline
Plug 'Shougo/unite-outline'
" ファイルオープン
" Plug 'ctrlpvim/ctrlp.vim'
" セッション
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
" vim-tags
Plug 'szw/vim-tags'
" 行に変更差分表示
Plug 'airblade/vim-gitgutter'
" j k の速度アップ
Plug 'rhysd/accelerated-jk'

call plug#end()

syntax enable
syntax on

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['gitbranch', 'readonly', 'filename', 'modified']
\   ],
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ }
\ }

let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = ''
let g:indent_guides_enable_on_vim_startup = 1
let g:deoplete#enable_at_startup = 1

set background=dark
set tags=~/.tags
set number
set clipboard=unnamed
set title
set mouse=a
set showmatch
set smartindent
set autoindent
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set fenc=utf-8
set autoread
set showcmd
set wildmenu
set cursorline
set hidden
set list
set listchars=tab:\▸\-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set expandtab
set tabstop=2
set smarttab
set shiftwidth=2
set ruler
set laststatus=2
set nobackup
set noswapfile
set completeopt+=noinsert
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline+=%{fugitive#statusline()}
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set timeoutlen-=300

""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" unite-rails
noremap :rc :<C-u>Unite rails/controller<CR>
noremap :rm :<C-u>Unite rails/model<CR>
noremap :rv :<C-u>Unite rails/view<CR>
noremap :rh :<C-u>Unite rails/helper<CR>
noremap :rs :<C-u>Unite rails/stylesheet<CR>
noremap :rj :<C-u>Unite rails/javascript<CR>
noremap :rr :<C-u>Unite rails/route<CR>
noremap :rg :<C-u>Unite rails/gemfile<CR>
noremap :rt :<C-u>Unite rails/spec<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" http://inari.hatenablog.com/entry/2014/05/05/231307
"""""""""""""""""""""""""""""""
" 全角スペースの表示
"""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

""""""""""""""""""""""""""""""
" セッションの設定
""""""""""""""""""""""""""""""
" 現在のディレクトリ直下の .vimsessions/ を取得
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '~/.vimsessions')
" 存在すれば
if isdirectory(s:local_session_directory)
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vimを辞める時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 1
else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endif
unlet s:local_session_directory

"""""""""""""""""""""""""""""
" CtrlPの設定
"""""""""""""""""""""""""""""
"let g:ctrlp_custom_ignore = {
"  \ 'dir': '\.git$\|log\|node_modules\|tmp$'
"  \ }
"let g:ctrlp_max_height = 30

nnoremap <silent><C-\> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""
" j k の速度アップ
"""""""""""""""""""""""""""""
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

filetype on
