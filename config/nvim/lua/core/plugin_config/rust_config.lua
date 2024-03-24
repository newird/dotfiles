
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
      vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
         vim.keymap.set("n", "<leader>m", function() if vim.lsp.inlay_hint.is_enabled() then vim.lsp.inlay_hint.enable(0, false) else vim.lsp.inlay_hint.enable(0, true) end end, { desc = "Toggle Inlay Hints" })

    end,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}
