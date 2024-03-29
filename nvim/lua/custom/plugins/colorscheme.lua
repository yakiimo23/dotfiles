if vim.g.vscode then
  return {}
end

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = 'night'
    })

    vim.cmd([[colorscheme tokyonight]])
  end
}

-- return {
--   'ellisonleao/gruvbox.nvim',
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       terminal_colors = true,
--     })
--
--     vim.o.background = "dark"
--     vim.cmd([[colorscheme gruvbox]])
--   end
-- }

-- return {
--   'rmehri01/onenord.nvim',
--   priority = 1000,
--   config = function()
--     require('onenord').setup({
--       theme = 'dark',  -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
--       borders = true,  -- Split window borders
--       fade_nc = false, -- Fade non-current windows, making them more distinguishable
--       -- Style that is applied to various groups: see `highlight-args` for options
--       styles = {
--         comments = "NONE",
--         strings = "NONE",
--         keywords = "NONE",
--         functions = "italic",
--         variables = "NONE",
--         diagnostics = "underline",
--       },
--       disable = {
--         background = false,  -- Disable setting the background color
--         cursorline = false, -- Disable the cursorline
--         eob_lines = true,   -- Hide the end-of-buffer lines
--       },
--       -- Inverse highlight for different groups
--       inverse = {
--         match_paren = false,
--       },
--       custom_highlights = {}, -- Overwrite default highlight groups
--       custom_colors = {},     -- Overwrite default colors
--     })
--   end,
-- }
