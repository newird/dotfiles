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
        coqlsp = {
          -- opam install coq-lsp
          cmd = { "coq-lsp" }, -- 假设系统中已安装 coq-lsp
          filetypes = { "coq" },
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
      setup = {},
    },
  },
  -- 确保 Coq 工具安装 (通过 Mason)
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "coq-lsp" } }, -- Mason 支持安装 coq-lsp
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
