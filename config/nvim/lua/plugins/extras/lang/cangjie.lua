return {
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
}
