return {
    "hrsh7th/nvim-cmp",
    name = 'cmp',
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
    },
    config = function(plugin, opts)
      vim.cmd([[set shortmess+=c]])

      local cmp = require("cmp")
      cmp.setup({
      preselect = 'item',
      completion = {
          completeopt = 'menuone,noinsert,menu'
      },
      snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
      },
        mapping = {
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
     },
         sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
        },
      })
    end
}
