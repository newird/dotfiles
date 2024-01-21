vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        require('lazygit.utils').project_root_dir()
    end,
})
-- require("telescope").extensions.lazygit.lazygit()

vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':LazyGitFilter<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':LazyGitFilterCurrentFile<CR>', { noremap = true, silent = true })

