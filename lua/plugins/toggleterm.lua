return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- Load keys immediately so you can toggle the terminal even if plugin isn't fully loaded yet
  keys = { [[<C-\>]] },
  cmd = { "ToggleTerm" },

  config = function()
    require("toggleterm").setup({
      -- Key to toggle the terminal
      open_mapping = [[<C-\>]],

      -- Appearance
      direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
      shade_terminals = true,

      -- Floating window sizing
      float_opts = {
        border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ...
        width = 100,
        height = 30,
        winblend = 3,
      },

      -- Persistence
      persist_size = true,
      persist_mode = true, -- remember previous terminal mode (insert/normal)

      -- Shell (defaults to your system shell, usually zsh/bash/powershell)
      -- shell = vim.o.shell,
    })

    -- === Terminal Window Navigation & Escaping === --
    -- This function allows you to move in/out of terminal easily
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Press Esc to go to Normal mode in terminal
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

      -- Use Ctrl+h/j/k/l to move between windows (even from the terminal)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- Apply these mappings only when a terminal is opened
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
}
