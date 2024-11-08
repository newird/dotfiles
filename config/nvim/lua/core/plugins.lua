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
  { import = 'custom/plugins' },

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
  { 'folke/neodev.nvim', opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  'preservim/vimux',
  'tpope/vim-fugitive',

  'nvim-lua/plenary.nvim',

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
  { 'edluffy/hologram.nvim' },
}

local opts = {}

require('lazy').setup(plugins, opts)

