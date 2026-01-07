-- =============================================================================
--  Keybindings Configuration
-- =============================================================================
--  Modes: n=Normal, i=Insert, v=Visual, t=Terminal, c=Command

vim.g.mapleader = " "

-- =============================================================================
--  1. File Operations & Custom Save
-- =============================================================================

local function Save_file()
  -- Check if buffer is writeable
  if not vim.bo.modifiable then
    vim.notify("  Buffer is read-only", vim.log.levels.WARN, { title = "System" })
    return
  end
  
  -- Perform the save
  vim.cmd("silent write")
  
  -- IMPROVED NOTIFICATION:
  -- 1. Title: "File Saved" (Bold Peach)
  -- 2. Message: We add "  " (2 spaces) at the start to give it that left padding.
  -- 3. Icon: We use a clean checkmark "✔" instead of the green emoji.
  local filename = vim.fn.expand("%:t") 
  vim.notify(filename .. " Saved ✔", vim.log.levels.INFO, { title = "File Saved" })
end

-- Ctrl + s to Save
vim.keymap.set({ "n", "i", "v" }, "<C-s>", Save_file, { silent = true, desc = "Save file" })

-- Ctrl + q to Quit
vim.keymap.set("n", "<C-q>", ":q<CR>", { desc = "Quit" })


-- =============================================================================
--  2. Window Navigation (Alt + hjkl)
-- =============================================================================
-- Navigate splits quickly without pressing escape

-- Normal Mode
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Insert Mode (Instant navigation while typing)
vim.keymap.set("i", "<A-h>", "<Esc><C-w>h", { desc = "Go Left from Insert" })
vim.keymap.set("i", "<A-j>", "<Esc><C-w>j", { desc = "Go Down from Insert" })
vim.keymap.set("i", "<A-k>", "<Esc><C-w>k", { desc = "Go Up from Insert" })
vim.keymap.set("i", "<A-l>", "<Esc><C-w>l", { desc = "Go Right from Insert" })

-- Terminal Mode (Escape terminal easily)
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Go Left from Terminal" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Go Down from Terminal" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Go Up from Terminal" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Go Right from Terminal" })

-- Alternative: Ctrl + Arrow Keys
vim.keymap.set("n", "<C-Left>",  "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-Down>",  "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-Up>",    "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window" })

vim.keymap.set("i", "<C-Left>",  "<Esc><C-w>h", { desc = "Go Left from Insert" })
vim.keymap.set("i", "<C-Down>",  "<Esc><C-w>j", { desc = "Go Down from Insert" })
vim.keymap.set("i", "<C-Up>",    "<Esc><C-w>k", { desc = "Go Up from Insert" })
vim.keymap.set("i", "<C-Right>", "<Esc><C-w>l", { desc = "Go Right from Insert" })

vim.keymap.set("t", "<C-Left>",  [[<C-\><C-n><C-w>h]], { desc = "Go Left from Terminal" })
vim.keymap.set("t", "<C-Down>",  [[<C-\><C-n><C-w>j]], { desc = "Go Down from Terminal" })
vim.keymap.set("t", "<C-Up>",    [[<C-\><C-n><C-w>k]], { desc = "Go Up from Terminal" })
vim.keymap.set("t", "<C-Right>", [[<C-\><C-n><C-w>l]], { desc = "Go Right from Terminal" })


-- =============================================================================
--  3. Window Resizing
-- =============================================================================
vim.keymap.set("n", "<C-S-Up>",    ":resize -2<CR>",          { desc = "Resize Height -" })
vim.keymap.set("n", "<C-S-Down>",  ":resize +2<CR>",          { desc = "Resize Height +" })
vim.keymap.set("n", "<C-S-Left>",  ":vertical resize -2<CR>", { desc = "Resize Width -" })
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", { desc = "Resize Width +" })


-- =============================================================================
--  4. Editing & Productivity
-- =============================================================================

-- Duplicate Lines (Ctrl+d)
vim.keymap.set("n", "<C-d>", "yyp", { desc = "Duplicate line down" })
vim.keymap.set("i", "<C-d>", "<Esc>yypji", { desc = "Duplicate line down" })
vim.keymap.set("v", "<C-d>", "y'>p", { desc = "Duplicate selection down" })

-- Move Lines (Alt + Arrows)
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Undo/Redo
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo in Insert Mode" })
vim.keymap.set("n", "<C-S-z>", "<C-r>", { desc = "Redo" })
vim.keymap.set("i", "<C-S-z>", "<C-o><C-r>", { desc = "Redo in Insert Mode" })
vim.keymap.set({ "v", "s" }, "<C-z>", "<Esc>u", { desc = "Undo in Visual/Select Mode" })

-- Insert New Line (Ctrl+Enter)
vim.keymap.set("i", "<C-Enter>", "<Esc>o", { desc = "New line below" })
vim.keymap.set("n", "<C-Enter>", "o<Esc>", { desc = "New line below" })

-- Visual Indentation
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Un-indent selection" })

-- Insert Un-indent
vim.keymap.set("i", "<S-Tab>", "<C-d>", { desc = "un-indent line" })

-- Delete without Copying (Black Hole)
vim.keymap.set("n", "<C-S-k>", '"_dd', { desc = "Delete line (Black Hole)" })
vim.keymap.set("i", "<C-S-k>", '<C-o>"_dd', { desc = "Delete line (Black Hole)" })
vim.keymap.set("v", "<C-S-k>", '"_d', { desc = "Delete selection (Black Hole)" })

-- =============================================================================
--  5. System Fixes
-- =============================================================================

-- Disable Suspend (Ctrl+z) in Terminals
vim.keymap.set("c", "<C-z>", "<Nop>", { desc = "Disable Suspend" })
vim.keymap.set("t", "<C-z>", "<Nop>", { desc = "Disable Suspend" })
