require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
  -- add any options here, or leave empty to use the default settings
})
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
require('lspsaga').setup({
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

local opts = { silent = true, noremap = true }
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>fmt", function() vim.lsp.buf.format { async = false } end, opts)
vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.open_float({scope="line"}) end, opts)

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.solargraph.setup {
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  capabilities = capabilities,
}
lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
  filetypes = {"rust"} ,
  root_dir = util.root_pattern("Cargo.toml") ,
  settings = {
    ['rust_analysizer'] = {
      cargo = {
        allFeatures = true ,
      },
    },
  },
}
