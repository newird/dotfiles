return {
  {
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>' },
      { '<leader>gff', '<cmd>LazyGitFilter<cr>' },
      { '<leader>gfc', '<cmd>LazyGitFilterCurrentFile<cr>' },
    },
    config = function()
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*',
        callback = function()
          require('lazygit.utils').project_root_dir()
        end,
      })
    end,
  },
}
