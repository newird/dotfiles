return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "julia" },
      root = { "Project.toml" },
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "julia" } },
  },
  "stevearc/conform.nvim",
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          -- Language server configs can go here
          cmd = {
            "julia",
            "--startup-file=no",
            "--history-file=no",
            "-e",
            [[
            using LanguageServer
            using LanguageServer.SymbolServer
            runserver()
          ]],
          },
        },
      },
    },
  },
}
