return {
  "nvim-telescope/telescope.nvim",
  -- Removed tag = '0.1.8' to track master fixes for Neovim 0.12
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = "n", noremap = true, desc = "Run telescope" },
  },
}
