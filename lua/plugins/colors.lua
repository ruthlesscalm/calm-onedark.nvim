return {
  -- ===========================================================================
  --  Color Scheme: One Dark Pro
  -- ===========================================================================
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      --------------------------------------------------------------------------
      -- 1. SETUP THEME
      --------------------------------------------------------------------------
      require("onedarkpro").setup({
        options = {
          transparency = false,
          cursorline = true,
        },
      })

      vim.cmd("colorscheme onedark")

      --------------------------------------------------------------------------
      -- 2. CUSTOM HIGHLIGHT OVERRIDES
      --------------------------------------------------------------------------
      local hl = vim.api.nvim_set_hl

      --------------------------------------------------------------------------
      -- COMMENTS (Readable, not ghosted)
      --------------------------------------------------------------------------
      hl(0, "Comment", {
        fg = "#7f848e", -- readable soft grey
        italic = true,
      })

      --------------------------------------------------------------------------
      -- COMPLETION MENU (Peach Accent Style)
      --------------------------------------------------------------------------
      hl(0, "Pmenu", { bg = "#282c34", fg = "#abb2bf" })
      hl(0, "PmenuSel", {
        bg = "#3e4452",
        fg = "#e3a193", -- peach
        bold = true,
      })

      hl(0, "CmpItemAbbrMatch", {
        fg = "#b3bac5",
        bold = true,
      })
      hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpItemAbbrMatch" })

      hl(0, "CmpItemKindVariable", {
        fg = "#e3a193",
        italic = true,
      })
      hl(0, "CmpItemKindFunction", {
        fg = "#e3a193",
        italic = true,
      })
      hl(0, "CmpItemKindMethod", {
        fg = "#e3a193",
        italic = true,
      })

      hl(0, "CmpItemKind", {
        fg = "#c678dd",
        italic = true,
      })

      hl(0, "CmpItemMenu", {
        fg = "#5c6370",
        italic = true,
      })

      hl(0, "PmenuSbar", { bg = "#282c34" })
      hl(0, "PmenuThumb", { bg = "#5c6370" })
      hl(0, "FloatBorder", { fg = "#5c6370", bg = "#282c34" })

      --------------------------------------------------------------------------
      -- FOLDS (Distinct UI element, NOT comments)
      --------------------------------------------------------------------------
      -- Make folded text cleaner and use the peach accent for visibility.
      hl(0, "Folded", {
        fg = "#e3a193", -- peach accent
        bg = "NONE",    -- transparent to blend with theme
        bold = true,
      })

      hl(0, "FoldColumn", {
        fg = "#5c6370",
        bg = "NONE",
      })

      --------------------------------------------------------------------------
      -- LINE NUMBERS (Visible + Peach current line)
      --------------------------------------------------------------------------
      hl(0, "LineNr", {
        fg = "#6f737b",
      })

      hl(0, "CursorLineNr", {
        fg = "#e3a193", -- peach highlight
        bold = true,
      })

      -- Indent guides (subtle, calm)
      hl(0, "IblIndent", { fg = "#3b4048" })

      -- Active indent scope (slightly brighter)
      hl(0, "IblScope", { fg = "#e3a193" }) -- peach accent
    end,
  },

  -- ===========================================================================
  --  Icons (Mini.icons)
  -- ===========================================================================
  {
    "echasnovski/mini.icons",
    lazy = false,
    opts = {},
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- ===========================================================================
  --  Status Line (Lualine)
  -- ===========================================================================

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "onedark",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_x = {
          -- 👇 THIS IS THE KEY PART
          { "%S", color = { fg = "#6FCF97" } }, -- command preview
        },
      },
    },
  }
}
