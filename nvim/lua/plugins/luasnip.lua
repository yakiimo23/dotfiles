return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  config = function()
    local ls = require("luasnip")
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
  end,
}
