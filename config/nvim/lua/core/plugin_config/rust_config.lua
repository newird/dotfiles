vim.g.rustaceanvim = {
  server = {
    -- on_attach = function(client, bufnr)
    --   -- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    --   vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
    -- end,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          command = 'clippy',
          extraArgs = { '--no-deps' },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}
