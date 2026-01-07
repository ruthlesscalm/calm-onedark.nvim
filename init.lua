-- =============================================================================
--  Neovim Configuration Entry Point
-- =============================================================================
-- This is the "Main" file. It doesn't contain much logic itself; instead,
-- it acts as a conductor, loading your settings in a specific order.

-- 1. Load General Options first
--    (Line numbers, clipboard settings, indentation, etc.)
--    -> Go to 'lua/config/options.lua' to customize.
require("config.options")

-- 2. Load Keybindings
--    (Your custom shortcuts like Ctrl+d, Alt+Arrows, etc.)
--    -> Go to 'lua/config/keybinds.lua' to add/change keys.
require("config.keybinds")

-- 3. Load Snippets
--    (Your custom custom snippets for code expansion)
--    -> Go to 'lua/config/snippets.lua' to add new snippets.
--    (Uncomment the line below if you created the snippets file from our last step)
-- require("config.snippets")

-- 4. Load Plugin Manager (Lazy.nvim)
--    (This downloads plugins and loads files from 'lua/plugins/')
require("config.lazy")

-- =============================================================================
--  Global Automations (Autocommands)
-- =============================================================================

-- FEATURE: Autosave on Focus Lost / Buffer Switch
-- Usage: When you switch tabs or click another window, the file saves automatically.
--
-- CUSTOMIZATION:
-- If you prefer MANUAL saving only (via :w or Ctrl+s),
-- you can comment out or delete the block below.
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  command = "silent! update",
  desc = "Autosave file when leaving buffer",
})
