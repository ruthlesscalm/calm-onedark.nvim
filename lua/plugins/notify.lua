return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup({
      timeout = 3000,
      
      -- "wrapped-compact" is the fix. 
      -- It forces text to wrap inside the box instead of expanding the box.
      render = "wrapped-compact", 
      
      stages = "fade_in_slide_out",
      top_down = true,
    })

    -- =========================================================================
    --  THEME ALIGNMENT (One Dark Pro + Peach Accent)
    -- =========================================================================
    
    -- 1. Icon: Peach (#e3a193) matches your variable highlights
    vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#e3a193" })
    
    -- 2. Title: Peach & Bold
    vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#e3a193", bold = true })
    
    -- 3. Border: Peach
    vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#e3a193" })
    
    -- 4. Body: Link to Normal so it's readable against the dark background
    vim.api.nvim_set_hl(0, "NotifyINFOBody", { link = "Normal" })

    vim.notify = notify
  end
}
