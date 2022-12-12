vim.api.nvim_create_user_command('Ripgrep', ':call ripgrep#search(<q-args>)', { nargs = '+', complete = 'file' })
