local lspconfig = require("lspconfig")

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
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      },
    },
  },
}
