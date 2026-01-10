return {
  -- ===========================================================================
  --  Utility Plugins (Simple but Essential)
  -- ===========================================================================

  -- 1. Git Integration
  -- URL: https://github.com/tpope/vim-fugitive
  -- Description: The premier Git wrapper for Vim.
  --              Allows you to run :Git commands directly (blame, diff, commit, log).
  {
    'tpope/vim-fugitive',
  },

  -- 2. Undo History Visualizer
  -- URL: https://github.com/mbbill/undotree
  -- Description: Visualizes the undo history as a branching tree.
  --              Unlike standard editors, Neovim never loses history even if you
  --              undo/redo multiple times. This plugin lets you jump back to ANY state.
  -- Usage: Run :UndotreeToggle
  {
    'mbbill/undotree',
  },

  -- 3. Color Highlighting
  -- URL: https://github.com/brenoprata10/nvim-highlight-colors
  -- Description: Adds real-time color highlighting to hex codes and CSS variables.
  --              (e.g., "#ff0000" will actually appear Red in the editor).
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        -- render = 'background', -- Default: text background is colored
        -- render = 'foreground', -- Alternative: text color itself changes
        enable_tailwind = true,     -- Enable tailwind colors if you use it
      })
    end
  },

  -- 4. Incremental Rename
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()

      -- Replace the standard LSP rename with IncRename
      vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Incremental Rename" })
    end,
  }
}
