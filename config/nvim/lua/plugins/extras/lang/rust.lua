return {
  {
    "saecki/crates.nvim",
    tag = "v0.4.0",
    dependencies = { "nvim-lua/plenary.nvim" },

    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
    config = function()
      require("crates").setup()

      local crates = require("crates")
      vim.keymap.set("n", "<leader>cgt", crates.toggle, { silent = true, desc = "Toggle crates popup" })
      vim.keymap.set("n", "<leader>cgr", crates.reload, { silent = true, desc = "Reload crates popup" })
      vim.keymap.set("n", "<leader>cgv", crates.show_versions_popup, { silent = true, desc = "Show versions popup" })
      vim.keymap.set("n", "<leader>cgf", crates.show_features_popup, { silent = true, desc = "Show features popup" })
      vim.keymap.set(
        "n",
        "<leader>cgd",
        crates.show_dependencies_popup,
        { silent = true, desc = "Show dependencies popup" }
      )
      vim.keymap.set("n", "<leader>cgu", crates.update_crate, { silent = true, desc = "Update crate" })
      vim.keymap.set(
        "n",
        "<leader>cge",
        crates.expand_plain_crate_to_inline_table,
        { silent = true, desc = "Expand plain crate to inline table" }
      )
      vim.keymap.set("n", "<leader>cgH", crates.open_homepage, { silent = true, desc = "Open homepage" })
      vim.keymap.set("n", "<leader>cgR", crates.open_repository, { silent = true, desc = "Open repository" })
      vim.keymap.set("n", "<leader>cgD", crates.open_documentation, { silent = true, desc = "Open documentation" })
      vim.keymap.set("n", "<leader>cgC", crates.open_crates_io, { silent = true, desc = "Open crates.io" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.configurations.rust = {
        {
          name = "Launch Rust file without args",
          type = "codelldb",
          request = "launch",
          program = function()
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return vim.fn.getcwd() .. "/target/debug/" .. project_name
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        },
        {
          name = "Launch Rust file with args",
          type = "codelldb",
          request = "launch",
          program = function()
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return vim.fn.getcwd() .. "/target/debug/" .. project_name
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = function()
            local input = vim.fn.input("Program arguments : ")
            return vim.split(input, " ")
          end,
          runInTerminal = false,
        },
      }
    end,
  },
  -- recommended = function()
  --   return LazyVim.extras.wants({
  --     ft = "rust",
  --     root = { "Cargo.toml", "rust-project.json" },
  --   })
  -- end,
  --
  -- -- Add Rust & related to treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = { ensure_installed = { "rust", "ron" } },
  -- },
  --
  -- -- Ensure Rust debugger is installed
  -- {
  --   "mason-org/mason.nvim",
  --   optional = true,
  --   opts = { ensure_installed = { "codelldb" } },
  -- },
  --
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
  --   ft = { "rust" },
  --   opts = {
  --     server = {
  --       on_attach = function(_, bufnr)
  --         vim.keymap.set("n", "<leader>cR", function()
  --           vim.cmd.RustLsp("codeAction")
  --         end, { desc = "Code Action", buffer = bufnr })
  --         vim.keymap.set("n", "<leader>dr", function()
  --           vim.cmd.RustLsp("debuggables")
  --         end, { desc = "Rust Debuggables", buffer = bufnr })
  --       end,
  --       default_settings = {
  --         -- rust-analyzer language server configuration
  --         ["rust-analyzer"] = {
  --           cargo = {
  --             allFeatures = true,
  --             loadOutDirsFromCheck = true,
  --             buildScripts = {
  --               enable = true,
  --             },
  --           },
  --           -- Add clippy lints for Rust.
  --           checkOnSave = true,
  --           procMacro = {
  --             enable = true,
  --             ignored = {
  --               ["async-trait"] = { "async_trait" },
  --               ["napi-derive"] = { "napi" },
  --               ["async-recursion"] = { "async_recursion" },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
  --     if vim.fn.executable("rust-analyzer") == 0 then
  --       LazyVim.error(
  --         "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
  --         { title = "rustaceanvim" }
  --       )
  --     end
  --   end,
  -- },
  --
  -- formatting
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     formatters_by_ft = { rust = { "rustfmt" } },
  --   },
  -- },

  -- Correctly setup lspconfig for Rust 🚀
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       rust_analyzer = { enabled = false },
  --     },
  --   },
  -- },

  -- {
  --   "nvim-neotest/neotest",
  --   optional = true,
  --   opts = {
  --     adapters = {
  --       ["rustaceanvim.neotest"] = {},
  --     },
  --   },
  -- },
}
