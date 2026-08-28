return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, opts)
      end,
    })

    vim.lsp.config("rust_analyzer", {
      -- Force rustup wrapper so rust-analyzer and cargo versions match
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
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
          checkOnSave = true,
          check = { command = "clippy" },
        },
      },
    })

    vim.lsp.enable("rust_analyzer")
  end,
}
