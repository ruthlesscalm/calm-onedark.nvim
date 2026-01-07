return {
  {
    -- Plugin: Nvim-Tree
    -- URL: https://github.com/nvim-tree/nvim-tree.lua
    -- Description: A file explorer tree for neovim.
    "nvim-tree/nvim-tree.lua",
    
    config = function()
      
      -- =======================================================================
      --  CUSTOM KEYMAPPINGS (The "on_attach" function)
      -- =======================================================================
      --  This function runs every time you open the NvimTree window.
      --  It defines what keys do ONLY when inside the file tree.
      
      local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        -- Helper function to make creating keymaps cleaner
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- 1. Load Defaults: Start with the standard mappings (a, d, r, etc.)
        api.config.mappings.default_on_attach(bufnr)

        -- 2. CUSTOM ACTION: Change Root (Zoom In)
        --    When you press <Leader> + Enter on a folder, the tree "zooms in" 
        --    making that folder the new top-level root.
        local function change_root_to_node()
          local node = api.tree.get_node_under_cursor()
          if node.nodes then -- If it's a folder...
            api.tree.change_root_to_node(node)
            -- UX Improvement: Reset cursor to top of list after zooming
            vim.schedule(function() vim.cmd("normal! ggj") end)
          end
        end

        -- 3. CUSTOM ACTION: Go Up and Collapse (Zoom Out)
        --    When you press Backspace, go up one folder level and close open folders.
        local function up_and_collapse()
          api.tree.change_root_to_parent()
          vim.schedule(function()
            api.tree.collapse_all()
          end)
        end

        -- === KEYMAP ASSIGNMENTS === --

        -- <CR> (Enter): Standard VS Code behavior.
        -- Opens a file OR expands/collapses a folder.
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open / Expand"))

        -- <Leader> + <CR>: Zoom In (Change Root)
        vim.keymap.set("n", "<leader><CR>", change_root_to_node, opts("Change Root to Node"))

        -- <BS> (Backspace): Zoom Out (Go Up Directory)
        vim.keymap.set("n", "<BS>", up_and_collapse, opts("Go Up and Collapse"))
        
        -- Split Openings
        vim.keymap.set("n", "<leader>v", api.node.open.vertical, opts("Open Vertical Split"))
        vim.keymap.set("n", "<leader>h", api.node.open.horizontal, opts("Open Horizontal Split"))
      end

      -- =======================================================================
      --  PLUGIN SETUP
      -- =======================================================================
      require("nvim-tree").setup({
        -- Register our custom keymaps
        on_attach = my_on_attach,
        
        -- Behavior: Keep cursor on the filename text, not the little icon
        hijack_cursor = true, 

        -- Appearance: Icons and Indentation
        renderer = {
          indent_width = 2, 
          icons = {
            padding = "  ", -- Extra space between icon and filename (Cleaner look)
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            -- Custom Nerd Font Glyphs (Folder icons, etc.)
            glyphs = {
              default = "󰈚",
              symlink = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
            },
          },
        },

        -- BEHAVIOR FIX: Prevent "Jumping Root"
        -- If you open a file from Telescope, NvimTree normally tries to change 
        -- the root folder to match that file. This disables that annoyance.
        update_focused_file = {
          enable = true,       -- Highlight the file in the tree if it's open
          update_root = false, -- Keep the tree root stable!
        },

        actions = {
          open_file = {
            resize_window = true, -- Auto-resize tree when opening files
          },
        },
      })

      -- Global Toggle: Space + e
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    end,
  },
}
