--
-- local M = {}
--
-- ---@param opts conform.setupOpts
-- function M.setup(_, opts)
--   for _, key in ipairs({ "format_on_save", "format_after_save" }) do
--     if opts[key] then
--       local msg = "Don't set `opts.%s` for `conform.nvim`.\n**LazyVim** will use the conform formatter automatically"
--       LazyVim.warn(msg:format(key))
--       ---@diagnostic disable-next-line: no-unknown
--       opts[key] = nil
--     end
--   end
--   ---@diagnostic disable-next-line: undefined-field
--   if opts.format then
--     LazyVim.warn("**conform.nvim** `opts.format` is deprecated. Please use `opts.default_format_opts` instead.")
--   end
--   require("conform").setup(opts)
-- end
return {

  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    init = function()
      -- Install the conform formatter on VeryLazy
      LazyVim.on_very_lazy(function()
        LazyVim.format.register({
          name = "conform.nvim",
          priority = 100,
          primary = true,
          format = function(buf)
            require("conform").format({ bufnr = buf })
          end,
          sources = function(buf)
            local ret = require("conform").list_formatters(buf)
            ---@param v conform.FormatterInfo
            return vim.tbl_map(function(v)
              return v.name
            end, ret)
          end,
        })
      end)
    end,
    opts = function()
      ---@type conform.setupOpts
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "ruff_format" },
          -- Use a sub-list to run only the first available formatter
          javascript = { "biome" },
          ["javascriptreact"] = { "biome" },
          ["typescript"] = { "biome" },
          ["typescriptreact"] = { "biome" },
          ["jsonc"] = { "biome" },
          go = { "goimports", "gofmt" },
          cpp = { "clang_format" },
          c = { "clang_format" },
          fish = { "fish_indent" },
          asm = { "asmfmt" },
          bib = { "bibtext-tidy" },
          latex = { "llf" },
          json = { "jq" },
          just = { "just" },
          bash = { "shfmt" },
          rust = { "rustfmt" },
          gleam = { "gleam" },
          md = { "markdownlint" },
          ["*"] = { "trim_whitespace" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
          clang_format = {
            command = "/usr/local/bin/clang-format",
            prepend_args = { "--fallback-style=Google" },
          },
        },
        -- format_on_save = {
        --   -- I recommend these options. See :help conform.format for details.
        --   lsp_format = "fallback",
        --   timeout_ms = 500,
        -- },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      }
      return opts
    end,
  },
}
