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
      solargraph = {
        filetypes = { 'ruby' },
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      rubocop = {},
      ruby_ls = {
        init_options = {
          formatter = "auto",
        }
      }
    }

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }

    local _timers = {}
    local ruby_setup_diagnostics = function(client, buffer)
      if require("vim.lsp.diagnostic")._enable then
        return
      end

      local diagnostic_handler = function()
        local params = vim.lsp.util.make_text_document_params(buffer)
        client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
          if err then
            local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
            vim.lsp.log.error(err_msg)
          end
          if not result then
            return
          end
          vim.lsp.diagnostic.on_publish_diagnostics(
            nil,
            vim.tbl_extend("keep", params, { diagnostics = result.items }),
            { client_id = client.id }
          )
        end)
      end

      diagnostic_handler() -- to request diagnostics on buffer when first attaching

      vim.api.nvim_buf_attach(buffer, false, {
        on_lines = function()
          if _timers[buffer] then
            vim.fn.timer_stop(_timers[buffer])
          end
          _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
        end,
        on_detach = function()
          if _timers[buffer] then
            vim.fn.timer_stop(_timers[buffer])
          end
        end,
      })
    end

    require('lspconfig').ruby_ls.setup({
      capabilities = capabilities,
      -- init_options = {
      --   enabledFeatures = {
      --     "documentSymbol",
      --     "documentLink",
      --     "hover",
      --     "foldingRanges",
      --     "selectionRanges",
      --     "semanticHighlighting",
      --     "formatting",
      --     "onTypeFormatting",
      --     "diagnostics",
      --     "codeActions",
      --     "codeActionResolve",
      --     "documentHighlight",
      --     "inlayHints",
      --     "completion",
      --     "codeLens",
      --   },
      -- },
      -- settings = {
      --   formatter = 'auto',
      -- },
      filetypes = { 'ruby' },
      on_attach = function(client, buffer)
        ruby_setup_diagnostics(client, buffer)
      end,
    })

    require('lspconfig').typos_lsp.setup({
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
  end
}
