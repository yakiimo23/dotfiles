return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    require('mason').setup()
    local lspconfig = require('lspconfig')

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    require('neodev').setup()

    local servers = {
      -- rust_analyzer = {},
      -- solargraph = {
      --   filetypes = { 'ruby' },
      -- },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      rubocop = {},
      ruby_lsp = {},
      tsserver = {},
    }

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }

    lspconfig.typos_lsp.setup({
      init_options = {
        config = '~/.config/nvim/spell/.typos.toml',
      },
    })

    -- Rubocop
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.rb",
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    vim.lsp.buf.format({
      filter = function(client)
        return client.name ~= 'tsserver'
      end
    })

    -- Ruby LSP
    -- local function add_ruby_deps_command(client, bufnr)
    --   vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
    --     local params = vim.lsp.util.make_text_document_params()
    --     local showAll = opts.args == "all"
    --
    --     client.request("rubyLsp/workspace/dependencies", params, function(error, result)
    --       if error then
    --         print("Error showing deps: " .. error)
    --         return
    --       end
    --
    --       local qf_list = {}
    --       for _, item in ipairs(result) do
    --         if showAll or item.dependency then
    --           table.insert(qf_list, {
    --             text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
    --             filename = item.path
    --           })
    --         end
    --       end
    --
    --       vim.fn.setqflist(qf_list)
    --       vim.cmd('copen')
    --     end, bufnr)
    --   end,
    --   {nargs = "?", complete = function() return {"all"} end})
    -- end
    --
    -- -- local util = require 'lspconfig.util'
    -- lspconfig.ruby_lsp.setup({
    --   -- cmd = { "ruby-lsp" },
    --   -- filetypes = { "ruby" },
    --   -- root_dir = util.root_pattern("Gemfile", ".git"),
    --   -- init_options = {
    --   --   formatter = 'auto',
    --   -- },
    --   -- single_file_support = true,
    --   on_attach = function(client, buffer)
    --     add_ruby_deps_command(client, buffer)
    --   end,
    -- })
  end
}
