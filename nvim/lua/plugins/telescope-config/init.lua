require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.9,
      preview_width = 0.65,
    }
  },
  pickers = {
    find_files = {
      disable_devicons = true,
      hidden = true
    },
    live_grep = {
      disable_devicons = true,
      only_sort_text = true
    },
    oldfiles = {
      disable_devicons = true
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'ignore_case',
    }
  }
}

vim.api.nvim_set_keymap('', "<C-p>", ":lua require('telescope.builtin').find_files({hidden = true})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-g>", ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-a>", ":lua require('telescope').extensions.live_grep_raw.live_grep_raw()<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('', "<C-h>", ":lua require('telescope.builtin').oldfiles()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-s>", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", { noremap = true, silent = true })

-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf')
