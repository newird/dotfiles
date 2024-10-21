return {
  --fzf
  'airblade/vim-rooter',
  { 'junegunn/fzf', dir = '~/.fzf', name = 'fzf', build = './install --all' },
  'junegunn/fzf.vim',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  ---@type LazySpec
  --- yazi
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>yy',
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>cd',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<leader>yy',
      },
    },
  },
  -- file
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>-', '<cmd>Oil<cr>' },
    },
  },
  -- tmux and vim
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}

