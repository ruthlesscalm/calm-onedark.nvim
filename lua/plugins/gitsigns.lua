return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    current_line_blame = false,
    signcolumn = true,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
