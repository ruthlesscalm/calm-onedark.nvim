return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "static",
      timeout = 1200,  -- default (overridden per-level)
      top_down = false, -- bottom-right
      render = "minimal", -- IMPORTANT: use notify highlight groups
      background_colour = "#FFCBA4",
      max_width = 60,
      max_height = 6,
    })

    -- ======================
    -- Color Palette
    -- ======================
    local bg = "#FFCBA4"  -- peach background
    local text = "#3b3b3b" -- neutral body text
    local info = "#6FCF97" -- green (info)
    local warn = "#F2B94A" -- amber (warn)
    local error = "#E53935" -- red (error)

    -- Background
    pcall(vim.api.nvim_set_hl, 0, "NotifyBackground", { bg = bg })

    -- ======================
    -- INFO (green text + green border)
    -- ======================
    pcall(vim.api.nvim_set_hl, 0, "NotifyINFOBorder", { fg = info })
    pcall(vim.api.nvim_set_hl, 0, "NotifyINFOTitle", { fg = info, bold = true })
    pcall(vim.api.nvim_set_hl, 0, "NotifyINFOIcon", { fg = info })
    pcall(vim.api.nvim_set_hl, 0, "NotifyINFOBody", { fg = info })

    -- ======================
    -- WARN (amber border, neutral body)
    -- ======================
    pcall(vim.api.nvim_set_hl, 0, "NotifyWARNBorder", { fg = warn })
    pcall(vim.api.nvim_set_hl, 0, "NotifyWARNTitle", { fg = warn, bold = true })
    pcall(vim.api.nvim_set_hl, 0, "NotifyWARNIcon", { fg = warn })
    pcall(vim.api.nvim_set_hl, 0, "NotifyWARNBody", { fg = text })

    -- ======================
    -- ERROR (red border, neutral body)
    -- ======================
    pcall(vim.api.nvim_set_hl, 0, "NotifyERRORBorder", { fg = error })
    pcall(vim.api.nvim_set_hl, 0, "NotifyERRORTitle", { fg = error, bold = true })
    pcall(vim.api.nvim_set_hl, 0, "NotifyERRORIcon", { fg = error })
    pcall(vim.api.nvim_set_hl, 0, "NotifyERRORBody", { fg = text })

    -- ======================
    -- Override vim.notify (timeouts per level)
    -- ======================
    vim.notify = function(msg, level, opts)
      if not level then
        return
      end
      opts = opts or {}

      if level == vim.log.levels.ERROR then
        opts.timeout = 4000
      elseif level == vim.log.levels.WARN then
        opts.timeout = 2500
      else -- INFO
        opts.timeout = 2000
      end

      notify(msg, level, opts)
    end
  end,
}
