return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    -- pictograms for completion menu
    'onsails/lspkind-nvim',

    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    -- Adds buffer completion capabilities
    'hrsh7th/cmp-buffer',

    -- Adds path completion capabilities
    'hrsh7th/cmp-path',

    -- Adds cmdline completion capabilities
    'hrsh7th/cmp-cmdline',

    -- Spell check
    'f3fora/cmp-spell',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    require('luasnip.loaders.from_vscode').lazy_load()

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
    end

    cmp.setup {
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
          -- if require('copilot.suggestion').is_visible() then
          --   require('copilot.suggestion').accept()
          -- elseif cmp.visible() then
          --   cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          -- elseif luasnip.expandable() then
          --   luasnip.expand()
          -- elseif has_words_before() then
          --   cmp.complete()
          -- else
          --   fallback()
          -- end
        end, {
          'i',
          's',
        }),
        -- ['<Tab>'] = vim.schedule_wrap(function(fallback)
        --   if cmp.visible() and has_words_before() then
        --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        --   else
        --     fallback()
        --   end
        -- end),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          max_width = 50,
          symbol_map = {
            Copilot = ""
          },
          -- with_text = true,
          -- menu = {
          --   buffer = "[Buffer]",
          --   nvim_lsp = "[LSP]",
          --   luasnip = "[LuaSnip]",
          --   nvim_lua = "[Lua]",
          --   path = "[Path]",
          --   spell = "[Spell]",
          --   cmdline = "[Cmdline]",
          -- },
        }),
      },
      sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        -- { name = 'spell' },
      }, {
        { name = 'buffer' },
      }),
    }

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    -- cmp.event:on('menu_opened', function()
    --   vim.b.copilot_suggestion_hidden = true
    -- end)
    --
    -- cmp.event:on("menu_closed", function()
    --   vim.b.copilot_suggestion_hidden = false
    -- end)
    --
  end
}
