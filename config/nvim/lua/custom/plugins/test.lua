return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- Optional dependencies for specific testing needs
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-vim-test',
      -- Python testing adapter
      {
        'nvim-neotest/neotest-python',
      },
    },
    -- keys = {
    --   { '<leader>tr', function() require('neotest').run.run() end, desc = 'Run nearest test' },
    --   { '<leader>tc', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run current file tests' },
    --   { '<leader>td', function() require('neotest').run.run({ strategy = 'dap' }) end, desc = 'Run tests with DAP' },
    --   { '<leader>ts', function() require('neotest').run.stop() end, desc = 'Stop test' },
    --   { '<leader>ta', function() require('neotest').run.attach() end, desc = 'Attach to running test' },
    -- },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-python')({
            dap = { justMyCode = false },
          }),
          require('neotest-plenary'),
          require('neotest-vim-test')({
            ignore_file_types = { 'python', 'vim', 'lua' },
          }),
        },
      })
    end,
  },
}

