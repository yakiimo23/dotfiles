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
      },
      solargraph = {
        cmd = { "solargraph", "stdio" },
        settings = {
          solargraph = {
            diagnostics = true,
            useBundler = false,
            formatting = true,
            reporters = { "require_not_found" },
          },
        },
      },
    },
  },
}
