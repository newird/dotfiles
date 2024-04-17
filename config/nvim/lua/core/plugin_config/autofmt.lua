require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    go = { "goimports", "gofmt" },
    -- google cpp style
    cpp  = {"clang_format -style=google "},
    c  = {"clang_format -style=google "},
    fish = {"fish_indent"},
    rust = {"rustfmt"},
    ["_"] = { "trim_whitespace" , "autocorrect"},
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})


-- Key mapping for formatting
vim.api.nvim_set_keymap(
  "n", -- Use an empty string for mode to set the keymap for all modes
  "<leader>=", -- The key combination
  ":lua require('conform').format({ async = true, lsp_fallback = true })<CR>", -- The command to execute
  { noremap = true, silent = true, desc = "Format buffer" } -- Options for the keymap
)
