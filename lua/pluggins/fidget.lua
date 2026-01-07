return {
  -- Plugin: Fidget.nvim
  -- URL: https://github.com/j-hui/fidget.nvim
  -- Description: A standalone UI that shows LSP progress notifications.
  --              (e.g., "Indexing files...", "Formatting...", "Loading Workspace")
  --              It sits in the bottom right corner, separate from other notifications.
  "j-hui/fidget.nvim",
  
  config = function()
    require("fidget").setup({
      -- Options for the notification window
      notification = {
        window = {
          -- Winblend: Controls transparency.
          -- 0 = Solid background (Opaque)
          -- 100 = Fully transparent
          winblend = 0, 
        },
      },
      
      -- Options for integration with other plugins
      integration = {
        ["nvim-tree"] = {
          enable = false, -- Disable integration to prevent weird overlapping with the file explorer
        },
      },
    })

    -- === THEME CUSTOMIZATION ===
    -- Fidget uses its own highlight groups. Here we manually override them
    -- to match the "Info" color of the Dracula theme (Pink: #ff79c6).
    -- Without this, it might default to white or a color that blends into the background.
    
    -- "FidgetTitle": The name of the Language Server (e.g., "lua_ls")
    vim.api.nvim_set_hl(0, "FidgetTitle", { fg = "#ff79c6" })
    
    -- "FidgetTask": The actual message (e.g., "Indexing...")
    vim.api.nvim_set_hl(0, "FidgetTask", { fg = "#ff79c6" })
  end,
}
