require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>lg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gt', function() require("telescope").extensions.lazygit.lazygit() end, { noremap = true, silent = true })

