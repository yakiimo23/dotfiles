""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Color scheme: One Dark
Plug 'joshdick/onedark.vim'
" ステータスバー
Plug 'itchyny/lightline.vim'
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
Plug 'ctrlpvim/ctrlp.vim'

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
\ 'colorscheme': 'onedark',
\ }

let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar = '·'
let g:indent_guides_enable_on_vim_startup = 1
let g:deoplete#enable_at_startup = 1

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
"""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
imap " ""<LEFT>
imap ' ''<LEFT>

filetype on
