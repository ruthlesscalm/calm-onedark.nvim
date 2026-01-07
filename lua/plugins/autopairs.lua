return {
  -- Plugin: nvim-autopairs
  -- URL: https://github.com/windwp/nvim-autopairs
  -- Description: Automatically closes brackets, quotes, and parenthesis.
  --              e.g., Typing '(' automatically inserts ')'
  "windwp/nvim-autopairs",

  -- Optimization: Only load this plugin when we enter Insert Mode (typing).
  event = "InsertEnter",

  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      -- Feature: Treesitter Integration
      -- Uses the syntax tree to decide if a pair should be inserted.
      -- (e.g., prevents inserting a closing quote inside a comment block)
      check_ts = true,
    })

    -- Feature: Completion Integration (nvim-cmp)
    -- This ensures that when you accept a function completion (like 'fmt.Println'),
    -- it automatically adds the parentheses '()' at the end.
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    
    -- Listener: When a completion item is confirmed/selected...
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
