vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- self
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use { 'morhetz/gruvbox', opt = true }
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  }

  use { 'editorconfig/editorconfig-vim' }
  use { 'windwp/nvim-autopairs' }
  use { 'ntpeters/vim-better-whitespace' }
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'mg979/vim-visual-multi' }

  if vim.g.vscode then return nil end

  -- Only Neovim
  -- finder
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- Git
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }
  use { 'tyru/open-browser-github.vim', requires = 'tyru/open-browser.vim' }
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }

  -- auto completion
  use { 'hrsh7th/nvim-cmp' }
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'onsails/lspkind-nvim' }
  -- 使えない
  -- use {
  --   'zbirenbaum/copilot-cmp',
  --   after = { 'copilot.lua' },
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end
  -- }
  use { 'github/copilot.vim' }

  -- telescope
  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-live-grep-args.nvim' }
    },
    config = function()
      require('telescope').load_extension('live_grep_args')
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require('telescope').load_extension('frecency')
    end,
    requires = { 'tami5/sqlite.lua' }
  }

  -- statusbar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- syntax highlight
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow' }

  -- Quick Fix
  use { 'kevinhwang91/nvim-bqf' }

  -- save session
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      }
    end
  }
end)
