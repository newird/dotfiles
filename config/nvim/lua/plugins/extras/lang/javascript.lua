-- lua/lazyvim/extras/lang/typescript.lua

if lazyvim_docs then
  -- LSP Server to use for JavaScript/TypeScript.
  vim.g.lazyvim_js_lsp = "tsserver"
end

local lsp = vim.g.lazyvim_js_lsp or "tsserver"

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      root = {
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        ".eslintrc.js",
        ".eslintrc.cjs",
        "vite.config.js",
        "vite.config.ts",
        "next.config.js",
        "remix.config.js",
      },
    })
  end,

  -- 1. Treesitter: 确保 JS/TS 相关解析器已安装
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "javascript", "typescript", "tsx", "json" },
    },
  },

  -- 2. LSP: 配置 Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 确保 tsserver 处于活动状态
      servers = {
        -- tsserver 是 JS/TS 的核心 LSP
        tsserver = {},
        -- eslint 也可以作为 LSP，但我们更倾向于使用 nvim-lint 来进行 linting
        -- 如果您想用 eslint-lsp, 在这里配置它
        -- eslint = {},
      },
      -- 这是一个很好的实践，可以为特定 LSP 自定义 on_attach 行为
      setup = {
        [lsp] = function()
          LazyVim.lsp.on_attach(function(client, buffer)
            -- 在这里可以为 tsserver 添加特定的 on_attach 逻辑
            -- 例如，禁用 tsserver 的格式化功能，全权交给 prettier
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            -- 如果您有自定义键位，也可以在这里设置
            -- local map = function(keys, func, desc)
            --   vim.keymap.set("n", keys, func, { buffer = buffer, desc = "LSP: " .. desc })
            -- end
            -- map("<leader>co", vim.lsp.buf.code_action, "Code Action")
          end, lsp)
        end,
      },
    },
  },

  -- 3. Linter: 使用 nvim-lint 和 eslint_d
  -- LazyVim 默认会加载 nvim-lint, 这里我们为其配置 linter
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },

  -- 4. Formatter: 使用 conform.nvim 和 prettier
  -- LazyVim 默认会加载 conform.nvim, 这里我们为其配置 formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },

  -- 5. Debugger: 配置 nvim-dap
  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   -- 确保 js-debug-adapter 已通过 mason 安装
  --   dependencies = {
  --     "mason:js-debug-adapter",
  --   },
  --   config = function()
  --     local dap = require("dap")
  --     -- 为 JavaScript 和 TypeScript 添加调试配置
  --     -- js-debug-adapter 会自动识别项目类型 (e.g., CRA, Vite, Next.js)
  --     -- 但我们也可以添加一个通用的 "Launch file" 配置
  --     if not dap.configurations.javascript then
  --       dap.configurations.javascript = {}
  --     end
  --     table.insert(dap.configurations.javascript, {
  --       type = "node2",
  --       request = "launch",
  --       name = "Launch Current File",
  --       program = "${file}",
  --       cwd = "${workspaceFolder}",
  --       sourceMaps = true,
  --       protocol = "inspector",
  --       console = "integratedTerminal",
  --     })
  --
  --     -- TypeScript 使用与 JavaScript 相同的配置
  --     dap.configurations.typescript = dap.configurations.javascript
  --     dap.configurations.javascriptreact = dap.configurations.javascript
  --     dap.configurations.typescriptreact = dap.configurations.javascript
  --   end,
  -- },
  --
  -- 6. Testing: 配置 neotest 和 jest 适配器
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-jest",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          -- 推荐使用项目本地的 jest runner
          jestCommand = "npm test --",
          -- jestCommand = "yarn test",
          -- jestCommand = "pnpm test",

          -- jest.config.js 的路径 (如果不在根目录)
          jestConfigFile = function()
            return LazyVim.root.get({ "jest.config.js", "jest.config.ts" })
          end,

          -- 其他 neotest-jest 选项...
          -- 例如，在运行测试时传递特定环境变量
          env = { CI = true },
        },
      },
    },
  },

  -- 增强 nvim-cmp 的体验
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      -- 为 JS/TS/JSX/TSX 启用自动括号补全
      opts.auto_brackets = opts.auto_brackets or {}
      vim.list_extend(opts.auto_brackets, { "javascript", "typescript", "javascriptreact", "typescriptreact" })
    end,
  },
}
