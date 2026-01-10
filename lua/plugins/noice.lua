return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { pattern = "^/", icon = "", lang = "regex" },
          search_up = { pattern = "^%?", icon = "", lang = "regex" },
        },
      },

      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
      },

      presets = {
        bottom_search = true,
        command_palette = false, -- Disabled so we can fully control views
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },

      views = {
        -- 1. The Input Box (Bottom Left)
        cmdline_popup = {
          position = {
            row = -1, -- 1 line from bottom (The input itself)
            col = 0,
          },
          size = {
            width = "40%",
            height = "auto",
          },
        },

        -- 2. The Suggestion Menu
        cmdline_popupmenu = {
          relative = "editor",
          -- ⚓ KEY CHANGE: Anchor to Bottom-Left (SW)
          -- This makes the menu grow UPWARDS from the specified row
          -- anchor = "SW",
          position = {
            row = -2, -- The BOTTOM of the menu will be at this line (just above input)
            col = 0,
          },
          size = {
            width = "40%",
            height = "auto", -- 🟢 Dynamic height
            max_height = 15, -- 🟢 Stop it from getting too tall
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },

      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    })
  end,
}
