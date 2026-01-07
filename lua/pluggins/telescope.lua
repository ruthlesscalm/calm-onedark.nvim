return {
  -- Plugin: Telescope
  -- URL: https://github.com/nvim-telescope/telescope.nvim
  -- Description: The "Google Search" of your codebase.
  --              It lets you fuzzy find files, text, help docs, and more.
  "nvim-telescope/telescope.nvim",

  dependencies = { 
    "nvim-lua/plenary.nvim" -- Required Lua utility library
  },

  config = function()
    local builtin = require("telescope.builtin")
    
    -- =========================================================================
    --  KEYMAPPINGS
    -- =========================================================================

    -- 1. Find Files (Equivalent to VS Code 'Ctrl + P')
    --    Searches for files by name in the current directory. 
    --    Respects .gitignore by default.
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    
    -- 2. Live Grep (Equivalent to VS Code 'Ctrl + Shift + F')
    --    Searches for specific string/text INSIDE all files in the project.
    --    IMPORTANT: Requires 'ripgrep' (rg) to be installed on your system!
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    
    -- 3. Find Buffers
    --    Lists only the files you currently have open (tabs).
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    
    -- 4. Find Help
    --    Searches Neovim's internal documentation. 
    --    (e.g., search for "keymap" or "options")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
  end,
}
