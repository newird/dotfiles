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
  'simrat39/rust-tools.nvim',
  'nvim-lua/plenary.nvim',
  {
    'saecki/crates.nvim',
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
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
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  }

}

local opts = {}

require("lazy").setup(plugins, opts)
