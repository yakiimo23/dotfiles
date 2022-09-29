require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      -- width = 0.9,
      -- preview_width = 0.65,
      preview_height = 0.5,
      height = 0.95
    }
  },
  pickers = {
    find_files = {
      disable_devicons = true,
      hidden = true,
    },
    live_grep = {
      -- disable_devicons = true,
      only_sort_text = true,
    },
    oldfiles = {
      disable_devicons = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'ignore_case',
    },
    live_grep_args = {
      auto_quoting = true,
    }
  }
}

vim.api.nvim_set_keymap('', "<C-p>", ":lua require('telescope.builtin').find_files({hidden = true})<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('', "<C-g>", ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-g>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', "<C-h>", ":lua require('telescope.builtin').oldfiles()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-h>", ":lua require('telescope').extensions.frecency.frecency()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-s>", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<leader>ts", ":lua require('telescope.builtin').spell_suggest()<CR>", { noremap = true, silent = true })

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('frecency')

