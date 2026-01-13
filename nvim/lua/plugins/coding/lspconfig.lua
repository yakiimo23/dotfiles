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
      },
    },
  }
end
