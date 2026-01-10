return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    -- 1. THEME & BORDER CONFIG
    bind = true,
    handler_opts = {
      border = "rounded",
    },

    -- 2. HIGHLIGHTING
    hi_parameter = "LspSignatureActiveParameter",

    -- 3. VIRTUAL TEXT
    hint_enable = true,
    hint_prefix = "● ",
    hint_scheme = "Comment",

    -- 4. FLOATING WINDOW BEHAVIOR
    floating_window = true,
    floating_window_above_cur_line = true,

    -- [NEW] TOGGLE KEY
    -- Press Alt + e to manually close/open the window
    toggle_key = "<M-e>",

    -- 5. TIMING
    timer_interval = 200,

    -- 6. Z-INDEX
    zindex = 50,
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
