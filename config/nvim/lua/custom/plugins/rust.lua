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
      vim.keymap.set(
        'n',
        '<leader>cgt',
        crates.toggle,
        { silent = true, desc = 'Toggle crates popup' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgr',
        crates.reload,
        { silent = true, desc = 'Reload crates popup' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgv',
        crates.show_versions_popup,
        { silent = true, desc = 'Show versions popup' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgf',
        crates.show_features_popup,
        { silent = true, desc = 'Show features popup' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgd',
        crates.show_dependencies_popup,
        { silent = true, desc = 'Show dependencies popup' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgu',
        crates.update_crate,
        { silent = true, desc = 'Update crate' }
      )
      vim.keymap.set(
        'n',
        '<leader>cge',
        crates.expand_plain_crate_to_inline_table,
        { silent = true, desc = 'Expand plain crate to inline table' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgH',
        crates.open_homepage,
        { silent = true, desc = 'Open homepage' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgR',
        crates.open_repository,
        { silent = true, desc = 'Open repository' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgD',
        crates.open_documentation,
        { silent = true, desc = 'Open documentation' }
      )
      vim.keymap.set(
        'n',
        '<leader>cgC',
        crates.open_crates_io,
        { silent = true, desc = 'Open crates.io' }
      )
    end,
  },
}

