local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'wbthomason/packer.nvim',
  'ellisonleao/gruvbox.nvim',
  'rebelot/kanagawa.nvim',
  {
    'dracula/vim',
    lazy = false,
  },
  {
    dir = "~/git/fileman",
    name = "fileman",
    dependencies = { { 'junegunn/fzf.vim' } },
  },
  { dir = "/home/newird/lession/cs6120/bril/bril-vim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'mbbill/undotree',
  { "folke/neodev.nvim", opts = {} },
  'nvim-lualine/lualine.nvim',
  'vim-test/vim-test',
  'lewis6991/gitsigns.nvim',
  'preservim/vimux',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',

  --fzf
  'airblade/vim-rooter',
  { "junegunn/fzf",      dir = "~/.fzf", name = "fzf", build = "./install --all" },
  'junegunn/fzf.vim',

  -- debugger
  'theHamsta/nvim-dap-virtual-text',
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = "mfussenegger/nvim-dap" },

  -- rust babyyyyyyy
  'rust-lang/rust.vim',
  'nvim-lua/plenary.nvim',
  {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {"ts", 'js'},
    opts = {},
  },

  -- go
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },


  -- terminal
  {
    -- amongst your other plugins
    { 'akinsho/toggleterm.nvim', version = "*", config = true }
  },
  -- completion
  'jiangmiao/auto-pairs',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  "L3MON4D3/LuaSnip",
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  "github/copilot.vim",
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/nvim-treesitter-refactor',
  "glepnir/lspsaga.nvim",
  -- format
  'google/vim-maktaba',
  {
    'google/vim-codefmt',
    dependencies = {'google/vim-maktaba'},
  },
  {
    'google/vim-glaive',
    dependencies = {'google/vim-maktaba'},
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  }

}

local opts = {}

require("lazy").setup(plugins, opts)
