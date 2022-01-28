require('telescope').setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

vim.api.nvim_set_keymap('', "<C-p>", ":lua require('telescope.builtin').find_files({hidden = true})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-g>", ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('', "<C-h>", ":lua require('telescope.builtin').oldfiles()<CR>", { noremap = true, silent = true })

require('telescope').load_extension('fzy_native')
