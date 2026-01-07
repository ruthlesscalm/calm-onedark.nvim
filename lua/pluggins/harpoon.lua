return {
  -- Plugin: Harpoon
  -- URL: https://github.com/ThePrimeagen/harpoon
  -- Description: A file navigation tool for "frequently visited files."
  --              Unlike tabs (which get messy), Harpoon lets you "mark" 4-5 files
  --              you are actively working on and jump between them instantly.
  "ThePrimeagen/harpoon",
  
  -- Version: We use 'harpoon2' which is the newer, more stable branch.
  branch = "harpoon2",
  
  dependencies = { 
    "nvim-lua/plenary.nvim",       -- Required library
    "nvim-telescope/telescope.nvim" -- For the search UI integration
  },
  
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- =========================================================================
    --  TELESCOPE INTEGRATION (Custom UI)
    -- =========================================================================
    --  By default, Harpoon has a very simple list UI. 
    --  This function forces Harpoon to use the beautiful Telescope UI instead,
    --  allowing you to preview files before jumping to them.
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      
      local conf = require("telescope.config").values
      local themes = require("telescope.themes")
      
      -- Style: 'ivy' (opens a drawer at the bottom of the screen)
      local opts = themes.get_ivy({ prompt_title = "Harpoon List" })

      require("telescope.pickers").new(opts, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),
      }):find()
    end

    -- Helper: Add file with notification
    local function mark_file()
      harpoon:list():add()
      vim.notify("󱡁  Added to Harpoon", vim.log.levels.INFO, { title = "Harpoon" })
    end

    -- =========================================================================
    --  KEYMAPS
    -- =========================================================================

    -- 1. ADD FILE (Alt + a)
    --    Press this to "stick" the current file to your Harpoon list.
    vim.keymap.set({"n", "i"}, "<A-a>", mark_file, { desc = "Harpoon Add File" })
    
    -- 2. QUICK MENU (Ctrl + e)
    --    Opens the simple Harpoon menu to drag-and-drop/reorder files.
    vim.keymap.set({"n", "i"}, "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
    
    -- 3. TELESCOPE SEARCH (Leader + h)
    --    Opens the fancy Telescope UI (defined above) to fuzzy search your marked files.
    vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon Telescope" })

    -- 4. NAVIGATION (Ctrl + Shift + P / N)
    --    Cycle through your marked files without opening a menu.
    vim.keymap.set("n", "<C-S-p>", function() harpoon:list():prev() end, { desc = "Harpoon Prev" })
    vim.keymap.set("n", "<C-S-n>", function() harpoon:list():next() end, { desc = "Harpoon Next" })
  end
}
