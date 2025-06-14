return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "coq" }, -- Coq 文件类型
      root = { "*.v" }, -- Coq 文件通常以 .v 结尾
    })
  end,

  -- need to install pyvim
  {
    "whonore/Coqtail",
    config = function()
      vim.g.coqtail_noimap = 1
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        coq_lsp = {
          cmd = { "coq-lsp" }, -- 指定 LSP 可执行文件的命令
          filetypes = { "coq" }, -- 适用于 Coq 文件
          root_dir = function(fname)
            return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
          end,
          settings = {
            coq = {
              autoStart = true, -- 自动启动 Coq 检查
              proof = {
                workers = 2, -- 并行检查的工作线程数
              },
            },
          },
        },
      },
    },
  },

  -- 文件类型图标
  {
    "echasnovski/mini.icons",
    opts = {
      file = {
        [".v"] = { glyph = "λ", hl = "MiniIconsPurple" }, -- Coq 文件图标
      },
      filetype = {
        coq = { glyph = "λ", hl = "MiniIconsPurple" },
      },
    },
  },
}
