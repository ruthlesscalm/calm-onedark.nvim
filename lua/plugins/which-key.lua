return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        spelling = true,
      },
    })

    wk.add({
      { "<leader>e",  "<cmd>NvimTreeToggle<CR>",       desc = "Explorer" },

      { "<leader>f",  group = "Files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Help" },

      {
        "<leader>fm",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        desc = "Format File",
      },

      { "<leader>o", "<cmd>Outline<CR>", desc = "Outline" },
    })
  end,
}
