return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "llvm", "mlir", "tablegen" })
      end
    end,
  },

  { "rhysd/vim-llvm", ft = { "llvm", "mir", "mlir", "tablegen" } },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mlir_lsp_server = {},
        tblgen_lsp_server = {},
      },
    },
  },
}
