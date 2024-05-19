local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'wbthomason/packer.nvim',
  'ellisonleao/gruvbox.nvim',
  'rebelot/kanagawa.nvim',
  'pteroctopus/faster.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  {
    dir = '~/git/fileman',
    name = 'fileman',
    dependencies = { { 'junegunn/fzf.vim' } },
  },
  { dir = '/home/newird/lession/cs6120/bril/bril-vim' },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'mbbill/undotree',
  { 'folke/neodev.nvim', opts = {} },
  'nvim-lualine/lualine.nvim',
  'vim-test/vim-test',
  'lewis6991/gitsigns.nvim',
  'preservim/vimux',
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
  'tpope/vim-fugitive',
  'tpope/vim-commentary',

  --fzf
  'airblade/vim-rooter',
  { 'junegunn/fzf', dir = '~/.fzf', name = 'fzf', build = './install --all' },
  'junegunn/fzf.vim',

  -- debugger
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  { 'rcarriga/nvim-dap-ui', dependencies = 'mfussenegger/nvim-dap' },
  { 'nvim-neotest/nvim-nio' },
  'leoluz/nvim-dap-go',
  -- competitive
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
  },
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',

      'nvim-treesitter/nvim-treesitter',
      'rcarriga/nvim-notify',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- configuration goes here
    },
  },
  -- rust babyyyyyyy
  'rust-lang/rust.vim',
  'nvim-lua/plenary.nvim',
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  -- python
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    opts = {
      name = 'venv',
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  },
  {
    'saecki/crates.nvim',
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },

  -- ts
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'ts', 'js' },
    opts = {},
  },

  -- go
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  --image preview
  { 'edluffy/hologram.nvim' },
  -- markdown
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  --latex
  'lervag/vimtex',
  'evesdropper/luasnip-latex-snippets.nvim',

  -- terminal
  {
    -- amongst your other plugins
    { 'akinsho/toggleterm.nvim', version = '*', config = true },
  },
  --lazygit
  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
  },
  -- completion
  'jiangmiao/auto-pairs',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-emoji',
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  '/lvimuser/lsp-inlayhints.nvim',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'github/copilot.vim',
  'williamboman/mason.nvim',
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
  },
  --{ -- Collection of various small independent plugins/modules
  --  'echasnovski/mini.nvim',
  --  config = function()
  --    -- Better Around/Inside textobjects
  --    --
  --    -- Examples:
  --    --  - va)  - [V]isually select [A]round [)]paren
  --    --  - yinq - [Y]ank [I]nside [N]ext [']quote
  --    --  - ci'  - [C]hange [I]nside [']quote
  --    require('mini.ai').setup({ n_lines = 500 })

  --    -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --    --
  --    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  --    -- - sd'   - [S]urround [D]elete [']quotes
  --    -- - sr)'  - [S]urround [R]eplace [)] [']
  --    require('mini.surround').setup()

  --    -- Simple and easy statusline.
  --    --  You could remove this setup call if you don't like it,
  --    --  and try some other statusline plugin
  --    local statusline = require('mini.statusline')
  --    -- set use_icons to true if you have a Nerd Font
  --    statusline.setup({ use_icons = vim.g.have_nerd_font })

  --    -- You can configure sections in the statusline by overriding their
  --    -- default behavior. For example, here we set the section for
  --    -- cursor location to LINE:COLUMN
  --    ---@diagnostic disable-next-line: duplicate-set-field
  --    statusline.section_location = function()
  --      return '%2l:%-2v'
  --    end

  --    -- ... and there is more!
  --    --  Check out: https://github.com/echasnovski/mini.nvim
  --  end,
  --},
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-context',
  'glepnir/lspsaga.nvim',
  -- refactor
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup()
    end,
  },
  -- format
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>-', '<cmd>Oil<cr>' },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {},
  },
}

local opts = {}

require('lazy').setup(plugins, opts)
