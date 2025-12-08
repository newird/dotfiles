return {
  "stevearc/conform.nvim",

  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    opts.formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      python = { "ruff_format" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt", lsp_format = "fallback" },
      sh = { "shfmt" },
      ["*"] = {
        "trim_whitespace",
        "trim_newlines",
        "codespell",
      },
    }
    return opts
  end,
}
