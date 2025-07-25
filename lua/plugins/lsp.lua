return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").rust_analyzer.setup({
      on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- LSP actions
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, opts)
      end,

      settings = {
        ["rust-analyzer"] = {
          inlayHints = {
            bindingModeHints = { enable = true },
            chainingHints = { enable = true },
            closingBraceHints = { enable = true },
            parameterHints = { enable = true },
            reborrowHints = { enable = "always" },
            typeHints = { enable = true },
          },
          checkOnSave = { commands = { "clippy" } },
          check = { comman = "clippy" },
        },
      },
    })
  end,
}
