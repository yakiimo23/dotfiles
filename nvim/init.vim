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

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/Users/charlie/.asdf/shims/python3'
let g:ruby_host_prog = '/Users/charlie/.asdf/installs/ruby/2.7.4/bin/neovim-ruby-host'

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
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'lighttiger2505/deoplete-vim-lsp'
" Plug 'zxqfl/tabnine-vim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'markonm/traces.vim'
Plug 'k0kubun/vim-open-github'

call plug#end()

let g:fzf_layout = { 'down': '80%' }
let g:airline_theme = 'onedark'
let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1
let g:rustfmt_autosave = 1
let g:lsp_diagnostics_enabled = 0

" deoplete
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
endfunction

" NERDTree
nnoremap <silent><C-\> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" List Symbol
nnoremap <C-s> :LspDocumentSymbol<Return>

" Multi Cursor
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<C-k>'        " start selecting up

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

colorscheme gruvbox
