if vim.g.vscode then
  return { "neovim/nvim-lspconfig", enabled = false }
else
  return {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          init_options = {
            config = "~/.config/nvim/lua/plugins/.typos.toml",
          },
        },
        rubocop = {
          mason = false,
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
        },
        ruby_lsp = {
          mason = false,
          cmd = function(dispatchers, config)
            local env = vim.fn.environ()
            env.PATH = vim.fn.expand("~/.local/share/mise/shims") .. ":" .. env.PATH
            return vim.lsp.rpc.start({ "ruby-lsp" }, dispatchers, {
              cwd = config.cmd_cwd or config.root_dir,
              env = env,
            })
          end,
        },
      },
    },
  }
end
