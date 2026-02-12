return {
  -- {
  --   "neanias/everforest-nvim",
  --   lazy = true,
  --   priority = 1000,
  --   config = function()
  --     require("everforest").setup({
  --       transparent_background_level = 0.9,
  --     })
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "everforest",
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
