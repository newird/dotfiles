return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Add custom filetype for .cj extension
      vim.filetype.add({
        extension = {
          cj = "cangjie",
        },
      })

      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      -- Define the CJ LSP if it doesn't exist
      if not configs.cj_lsp then
        configs.cj_lsp = {
          default_config = {
            cmd = { "/home/newird/.local/bin/cj_lsp" },
            filetypes = { "cangjie" }, -- Match the filetype defined above
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname) or vim.fs.dirname(fname)
            end,
          },
        }
      end

      -- Now that cj_lsp is defined in configs, call setup on it
      lspconfig.cj_lsp.setup({})
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      vim.filetype.add({
        extension = {
          cj = "cangjie",
        },
      }),
      formatters = {
        cjfmt = {
          command = "cjfmt",
          args = function(self, ctx)
            return {
              "-f",
              ctx.filename,
              "-o",
              ctx.filename,
            }
          end,
          stdin = false,
        },
      },
      formatters_by_ft = {
        cangjie = { "cjfmt" },
      },
    },
  },
  -- Treesitter for syntax highlighting
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     require('nvim-treesitter.configs').setup({
  --       ensure_installed = { "lua" }, -- Add "cj" once available
  --       highlight = { enable = true },
  --     })
  --   end,
  -- },

  -- Completion
}
