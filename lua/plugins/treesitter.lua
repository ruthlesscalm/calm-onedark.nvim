return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- auto-update parsers
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        -- Core
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",

        -- Web dev essentials
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "jsonc",

        -- Backend / extras
        "node",
        "regex",
        "markdown",
        "markdown_inline",
      },
      auto_install = true, -- automatically install missing parsers when entering buffer
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    },
  },
}
