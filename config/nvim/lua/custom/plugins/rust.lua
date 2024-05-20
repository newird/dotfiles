return {
  -- rust babyyyyyyy
  'rust-lang/rust.vim',
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          -- on_attach = function(client, bufnr)
          --   -- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          --   vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled())
          -- end,
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                command = 'clippy',
                extraArgs = { '--no-deps' },
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },

  {
    'saecki/crates.nvim',
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()

      local crates = require('crates')
      local opts = { silent = true }
      vim.keymap.set('n', '<leader>cgt', crates.toggle, opts)
      vim.keymap.set('n', '<leader>cgr', crates.reload, opts)
      vim.keymap.set('n', '<leader>cgv', crates.show_versions_popup, opts)
      vim.keymap.set('n', '<leader>cgf', crates.show_features_popup, opts)
      vim.keymap.set('n', '<leader>cgd', crates.show_dependencies_popup, opts)
      vim.keymap.set('n', '<leader>cgu', crates.update_crate, opts)
      vim.keymap.set('n', '<leader>cge', crates.expand_plain_crate_to_inline_table, opts)
      vim.keymap.set('n', '<leader>cgH', crates.open_homepage, opts)
      vim.keymap.set('n', '<leader>cgR', crates.open_repository, opts)
      vim.keymap.set('n', '<leader>cgD', crates.open_documentation, opts)
      vim.keymap.set('n', '<leader>cgC', crates.open_crates_io, opts)
    end,
  },
}
