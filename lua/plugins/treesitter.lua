return {
  -- Plugin: Nvim-Treesitter
  -- URL: https://github.com/nvim-treesitter/nvim-treesitter
  -- Description: The engine that parses code into an Abstract Syntax Tree (AST).
  --              It provides superior syntax highlighting, indentation, and folding
  --              compared to standard Regex-based highlighting.
  "nvim-treesitter/nvim-treesitter",
  
  -- Build Command:
  -- Whenever you update plugins, this runs ":TSUpdate" to compile the new parsers.
  build = ":TSUpdate",
  
  dependencies = {
    -- Plugin: Autotag
    -- URL: https://github.com/windwp/nvim-ts-autotag
    -- Description: Uses Treesitter to automatically close HTML/JSX tags.
    --              e.g., Type '<div>' -> it automatically adds '</div>'
    "windwp/nvim-ts-autotag", 
  },
  
  config = function()
    -- There is a known issue where we must require the compiler before setup
    -- in some edge cases, but standard requiring is usually fine.
    local configs = require("nvim-treesitter")

    configs.setup({
      -- 1. PARSERS TO INSTALL (The Starter Pack)
      --    These are downloaded automatically when you first start Neovim.
      ensure_installed = { 
        "c", "lua", "vim", "vimdoc", "query", -- Essential for Neovim config itself
        "javascript", "typescript", "tsx",    -- Web Dev (React/TS)
        "html", "css", "json",                -- Web Standards
        "bash", "markdown", "markdown_inline" -- Docs & Scripts
      },

      -- 2. INSTALLATION BEHAVIOR
      --    sync_install = false: Don't block UI startup while installing parsers.
      --    auto_install = true: If you open a file (e.g., Python) and don't have
      --    the parser, it will ask to download it automatically.
      sync_install = false,
      auto_install = true,

      -- 3. HIGHLIGHTING (The Core Feature)
      highlight = {
        enable = true, -- MUST be true for decent highlighting
        
        -- Disable standard Vim regex syntax highlighting to save CPU?
        -- Generally keep this false unless a language is broken in Treesitter.
        additional_vim_regex_highlighting = false,
      },

      -- 4. INDENTATION
      --    Treesitter enables smarter indentation (e.g., inside 'if' blocks).
      --    Note: This is "experimental" in some languages but works great for most.
      indent = {
        enable = true, 
      },

      -- 5. AUTOTAG SETUP
      --    Configures the "windwp/nvim-ts-autotag" dependency we loaded above.
      autotag = {
        enable = true, -- Auto-close tags like <div></div>
      },
    })
  end,
}
