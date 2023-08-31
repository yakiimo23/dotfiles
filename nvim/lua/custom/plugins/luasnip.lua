return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require('luasnip')
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node

    ls.add_snippets("ruby", {
      s("deb", {
        t("debugger"),
      }),
    })

    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                    ls.change_choice(1)
            end
    end, {silent = true})
  end,
}

