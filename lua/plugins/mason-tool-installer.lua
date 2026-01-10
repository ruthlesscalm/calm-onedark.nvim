return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    local mti = require("mason-tool-installer")

    mti.setup({
      ensure_installed = {
        -- JS/TS
        "typescript-language-server",
        "typescript",
        "prettier",
        "eslint_d",

        -- Lua
        "lua-language-server",
        "stylua",

        -- Other
        "clangd", -- optional
      },
      auto_update = false,
      run_on_start = false,
    })
  end,
}
