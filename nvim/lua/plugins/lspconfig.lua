return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      typos_lsp = {
        init_options = {
          config = "~/.config/nvim/lua/plugins/.typos.toml",
        },
      },
    },
  },
}
