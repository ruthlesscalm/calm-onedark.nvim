return {
  -- ===========================================================================
  --  Color Scheme: One Dark Pro
  -- ===========================================================================
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Load this before all other UI plugins
    config = function()
      -- 1. SETUP ONE DARK PRO
      -- We configure the base theme options before loading it.
      require("onedarkpro").setup({
        options = {
          transparency = false, -- Use the solid dark background for better contrast
          cursorline = true,    -- Highlight the line the cursor is on
        },
      })
      
      -- Load the theme
      vim.cmd("colorscheme onedark")

      -- =======================================================================
      --  2. CUSTOM OVERRIDES (The "Hybrid" Look)
      -- =======================================================================
      --  This section creates a unique look by mixing the professional One Dark
      --  base with softer "Peach" accents from the Catppuccin palette.
      
      local hl = vim.api.nvim_set_hl
      
      -- === COMPLETION MENU ===
      
      -- Menu Background:
      -- Keep it dark (#282c34) to match the One Dark theme seamlessly.
      hl(0, "Pmenu", { bg = "#282c34", fg = "#abb2bf" })

      -- Selected Item:
      -- Background: Deep Grey/Blue (#3e4452) for visibility.
      -- Foreground: PEACH (#e3a193). This makes the active selection "glow".
      hl(0, "PmenuSel", { bg = "#3e4452", fg = "#e3a193", bold = true })

      -- Matching Characters:
      -- The characters you have typed so far.
      -- We keep them muted Grey/White (#b3bac5) to avoid visual clutter.
      hl(0, "CmpItemAbbrMatch", { fg = "#b3bac5", bold = true })
      hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpItemAbbrMatch" })

      -- === KIND ICONS (The Peach Accent) ===
      -- We specifically color "Variables", "Functions", and "Methods"
      -- with the Catppuccin Peach color (#e3a193) to make them pop.
      hl(0, "CmpItemKindVariable", { fg = "#e3a193", italic = true })
      hl(0, "CmpItemKindFunction", { fg = "#e3a193", italic = true })
      hl(0, "CmpItemKindMethod",   { fg = "#e3a193", italic = true })
      
      -- Other kinds (Text, Units, etc.) remain a subtle muted purple.
      hl(0, "CmpItemKind", { fg = "#c678dd", italic = true }) 
      
      -- Source text (e.g. [LSP]) gets dimmed to stay in the background.
      hl(0, "CmpItemMenu", { fg = "#5c6370", italic = true }) 

      -- === BORDERS & SCROLLBAR ===
      -- Ensure these elements blend perfectly with the menu background.
      hl(0, "PmenuSbar", { bg = "#282c34" })
      hl(0, "PmenuThumb", { bg = "#5c6370" })
      hl(0, "FloatBorder", { fg = "#5c6370", bg = "#282c34" })

      -- === EDITOR TWEAKS ===
      -- Ensure comments are strictly grey (removes blue tint for better readability).
      hl(0, "Comment", { fg = "#5c6370", italic = true })
    end,
  },

  -- ===========================================================================
  --  Icons (Mini.icons)
  -- ===========================================================================
  {
    "echasnovski/mini.icons",
    lazy = false, -- Must load early to provide icons to other plugins
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
        -- Lualine automatically detects "onedark" and matches the theme.
        theme = "onedark",
        section_separators = "",
        component_separators = "",
      },
    },
  },
}
