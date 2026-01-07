-- =============================================================================
--  General Options
-- =============================================================================
--  This file controls the look and feel of Neovim.
--  It sets up line numbers, indentation, colors, and core behavior.

-- === UI & Appearance ===
vim.opt.number = true         -- Show line numbers on the left
vim.opt.relativenumber = true -- Show relative line numbers (helpful for jumping with j/k)
vim.opt.cursorline = true     -- Highlight the current line for better visibility
vim.opt.termguicolors = true  -- Enable 24-bit RGB color in the TUI
vim.opt.signcolumn = "yes"    -- Always show the sign column (prevents text shifting when errors/git signs appear)
vim.opt.wrap = false          -- Disable line wrapping (long lines scroll off screen)
vim.opt.ambiwidth = "double"  -- Fix for icon/emoji display width in some terminals

-- === Indentation (Tabs vs Spaces) ===
-- Current setup: 4 spaces per tab (common for Python, Lua, C++)
-- Tip: Change these to 2 for JavaScript/React/Web Development.
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.expandtab = true      -- Use spaces instead of actual tab characters
vim.opt.smartindent = true    -- Insert indents automatically (e.g., after '{')

-- === Window Splitting Behavior ===
-- Makes opening new windows feel more natural (like a modern IDE)
vim.opt.splitright = true     -- Vertical splits open to the right
vim.opt.splitbelow = true     -- Horizontal splits open to the bottom

-- === System Integration ===

-- Persistent Undo
-- Saves your undo history to a file, so you can undo changes even after closing/reopening a file.
vim.opt.undofile = true

-- Clipboard Sync
-- Syncs Neovim's clipboard with your OS clipboard (Ctrl+C / Ctrl+V compatibility).
-- We wrap this in 'schedule' to prevent it from slowing down startup time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
