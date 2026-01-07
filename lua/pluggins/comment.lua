return {
  -- Plugin: Comment.nvim
  -- URL: https://github.com/numToStr/Comment.nvim
  -- Description: Powerful commenting plugin (supports gc, gb, etc.)
  "numToStr/Comment.nvim",

  config = function()
    -- 1. Initialize the plugin
    require("Comment").setup({
      -- You can add advanced configuration here (e.g., custom hooks),
      -- but the defaults are generally excellent.
    })

    -- 2. VS Code Style Keybindings (Ctrl + /)
    -- =========================================================================
    -- THE "CTRL + /" TERMINAL QUIRK:
    -- In most terminals, pressing "Ctrl + /" actually sends the key code for
    -- "Ctrl + _" (Underscore). That is why we map <C-_> below.
    -- If this doesn't work for a user, they should try checking their terminal
    -- settings or map <C-/> explicitly.
    -- =========================================================================

    local api = require("Comment.api")

    -- NORMAL MODE: Toggle comment on current line
    vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { desc = "Toggle Comment" })

    -- INSERT MODE: Toggle comment on current line (and stay in Insert Mode)
    -- Note: This might feel slightly different than VS Code as it doesn't automatically
    -- move the cursor, but it works reliably.
    vim.keymap.set("i", "<C-_>", api.toggle.linewise.current, { desc = "Toggle Comment" })

    -- VISUAL MODE: Toggle comment on selected lines
    -- This looks complex because we must "Escape" visual mode via the API 
    -- to correctly identify the start and end of the selection.
    vim.keymap.set("v", "<C-_>", function()
      -- 1. Exit visual mode so Neovim can grab the selection marks
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
      -- 2. Apply the comment toggle to the visual selection
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle Comment Selection" })
  end,
}
