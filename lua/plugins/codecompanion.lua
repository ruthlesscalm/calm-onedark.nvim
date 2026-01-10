return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },

  cmd = { "CodeCompanion", "CodeCompanionChat" },

  opts = {
    display = {
      action_palette = { provider = "telescope" },
      chat = { window = { border = "rounded" } },
    },

    opts = {
      log_level = "WARN",
    },

    adapters = {
      copilot = {
        name = "copilot",
        -- must exist even if empty
        schema = {},
      },
    },

    interactions = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
      cmd = {
        adapter = "copilot",
      },
    },
  },
}
