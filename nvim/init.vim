if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/charlie/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/charlie/.cache/dein')
  call dein#begin('/Users/charlie/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/charlie/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('joshdick/onedark.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('Yggdroot/indentLine')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/deoplete-rct')
  call dein#add('tpope/vim-endwise')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('junegunn/fzf.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

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

let g:deoplete#enable_at_startup = 1

set number
set clipboard=unnamed
set title
set mouse=a
set showmatch
set smartindent
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set fenc=utf-8
set autoread
set showcmd
set cursorline
set list
set listchars=tab:\▸\-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set expandtab
set tabstop=2
set shiftwidth=2
set ruler
set laststatus=2
set nobackup
set noswapfile
set completeopt+=noinsert
