language en_US.UTF-8
set termguicolors

set encoding=UTF-8
set fileencodings=utf-8
set number
set cursorline
set ruler
set wildmenu
set expandtab
set tabstop=2
set smartindent
set shiftwidth=2
set showmatch
set clipboard=unnamed
set noswapfile
set list
set infercase
set hidden
set switchbuf=useopen
set ignorecase
set smartcase
set incsearch
set hlsearch
set mouse=a
" set ambiwidth=double
set backspace=2
set listchars=tab:»-,space:_,eol:↲
set cmdheight
set updatetime=300
set shortmess+=c
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
set completeopt=menu,menuone,noselect

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/Users/charlie/.asdf/shims/python3'
let g:ruby_host_prog = '/Users/charlie/.asdf/installs/ruby/2.7.4/bin/neovim-ruby-host'

let mapleader=";"

" Emacs key binds
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Switch tab
nnoremap <S-Tab> :tabprev<Return>
nnoremap <Tab> :tabnext<Return>

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Copy Relative Path
nmap rp :let @+ = expand("%")<Return>

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'ulwlu/elly.vim'
" Plug 'tpope/vim-endwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'
Plug 'markonm/traces.vim'
Plug 'k0kubun/vim-open-github'
Plug 'lambdalisue/fern.vim'
Plug 'rmagatti/auto-session'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'windwp/nvim-autopairs'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let g:rainbow_active = 1
let g:rustfmt_autosave = 1
" let g:lsp_diagnostics_enabled = 0

" coc.nvim
" let g:coc_global_extensions = ['coc-pairs', 'coc-json']

" if has("nvim-5.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" endwise回避用
" inoremap <silent> <CR> <C-r>=<SID>coc_confirm()<CR>
" function! s:coc_confirm() abort
"   if pumvisible()
"     return coc#_select_confirm()
"   else
"     return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"   endif
" endfunction

" Fern
nnoremap <silent><C-\> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden=1

" List Symbol
" nnoremap <C-s> :LspDocumentSymbol<Return>

" Multi Cursor
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>' " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<C-k>' " start selecting up

" Telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <C-g> <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <C-h> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <C-h> <cmd>lua require('telescope.builtin').oldfiles()<cr>

" lua
lua << END
  require("plugins.telescope-config")
  require("plugins.lualine-config")
  require("plugins.nvim-treesitter-config")
  require("plugins.nvim-cmp-config")
  require("plugins.nvim-autopairs-config")
  require("plugins.nvim-lspconfig-config")
  require("plugins.nvim-lsp-installer-config")
END

colorscheme elly
