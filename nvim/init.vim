set termguicolors

set encoding=UTF-8
set fileencodings=utf-8
set number
set cursorline
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
set ambiwidth=double
set backspace=2
set listchars=tab:»-,space:_,eol:↲
set cmdheight
set updatetime=300
set shortmess+=c

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

Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'ulwlu/elly.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'markonm/traces.vim'
Plug 'k0kubun/vim-open-github'
Plug 'lambdalisue/fern.vim'
Plug 'rmagatti/auto-session'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:fzf_layout = { 'down': '80%' }
let g:airline_theme = 'elly'
let g:rainbow_active = 1
let g:rustfmt_autosave = 1
let g:lsp_diagnostics_enabled = 0

" coc.nvim
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" endwise回避用
inoremap <silent> <CR> <C-r>=<SID>coc_confirm()<CR>
function! s:coc_confirm() abort
  if pumvisible()
    return coc#_select_confirm()
  else
    return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif
endfunction

" Fern
nnoremap <silent><C-\> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden=1

" List Symbol
nnoremap <C-s> :LspDocumentSymbol<Return>

" Multi Cursor
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>' " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<C-k>' " start selecting up

" RipgrepFzf config
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <C-g> :Rg<Space>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-h> :History<CR>

colorscheme elly
