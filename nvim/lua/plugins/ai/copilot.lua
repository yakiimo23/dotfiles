-- ref: https://github.com/LazyVim/LazyVim/issues/5899#issuecomment-2781398031
-- remove after fix this problem
return {
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
    end,
  },
}
