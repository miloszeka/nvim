return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", mode = "n", { noremap = true }, desc = "Run telescope" },
    },
}
