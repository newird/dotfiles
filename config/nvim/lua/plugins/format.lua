return {
  "stevearc/conform.nvim",

  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    vim.list_extend(opts.formatters_by_ft["*"] or {}, {
      "trim_whitespace",
      "trim_newlines",
      "codespell",
    })

    opts.formatters_by_ft["lua"] = { "stylua" }
    opts.formatters_by_ft["fish"] = { "fish_indent" }
    opts.formatters_by_ft["python"] = { "ruff_format" }
    opts.formatters_by_ft["c"] = { "clang-format" }
    opts.formatters_by_ft["cpp"] = { "clang-format" }
    opts.formatters_by_ft["tablegen"] = { "clang-format" }
    opts.formatters_by_ft["go"] = { "goimports", "gofmt" }
    opts.formatters_by_ft["rust"] = { "rustfmt", lsp_format = "fallback" }
    opts.formatters_by_ft["sh"] = { "shfmt" }

    return opts
  end,
}
