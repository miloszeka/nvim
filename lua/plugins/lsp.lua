return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Navigation & Definitions
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)       -- Jump to definition
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)      -- Jump to declaration
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)   -- Jump to implementation
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)       -- List references
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)  -- Jump to type definition

        -- Information & Diagnostics
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, opts)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = ev.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 2000 })
              end,
            })
          end,
        })

    vim.lsp.config("rust_analyzer", {
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
