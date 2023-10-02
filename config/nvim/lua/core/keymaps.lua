-- this file was mostly translate from 
-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
-- Navigate vim panes better
vim.keymap.set("n", "<C-j>", "<Esc>")
vim.keymap.set("i", "<C-j>", "<Esc>")
vim.keymap.set("v", "<C-j>", "<Esc>")
vim.keymap.set("s", "<C-j>", "<Esc>")
vim.keymap.set("x", "<C-j>", "<Esc>")
vim.keymap.set("c", "<C-j>", "<C-c>")
vim.keymap.set("o", "<C-j>", "<Esc>")
vim.keymap.set("l", "<C-j>", "<Esc>")
vim.keymap.set("t", "<C-j>", "<Esc>")

vim.keymap.set("n", "<C-k>", "<Esc>")
vim.keymap.set("i", "<C-k>", "<Esc>")
vim.keymap.set("v", "<C-k>", "<Esc>")
vim.keymap.set("s", "<C-k>", "<Esc>")
vim.keymap.set("x", "<C-k>", "<Esc>")
vim.keymap.set("c", "<C-k>", "<C-c>")
vim.keymap.set("o", "<C-k>", "<Esc>")
vim.keymap.set("l", "<C-k>", "<Esc>")
vim.keymap.set("t", "<C-k>", "<Esc>")

-- No arrow keys --- force yourself to use the home row
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

-- Left and right can switch buffers
vim.keymap.set("n", "<left>", ":bp<CR>")
vim.keymap.set("n", "<right>", ":bn<CR>")

-- Move by line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- <leader><leader> toggles between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- use system  clipboard
-- Visual mode mappings
vim.keymap.set("v", "<Leader>y", "+y")
vim.keymap.set("v", "<Leader>d", "+d")

-- Normal mode mappings
vim.keymap.set("n", "<Leader>p", "+p")
vim.keymap.set("n", "<Leader>P", "+P")

-- Visual mode mappings (again, for completeness)
vim.keymap.set("v", "<Leader>p", "+p")
vim.keymap.set("v", "<Leader>P", "+P")

-- magic search
-- fzf 
vim.keymap.set("n", "<Leader>f", "<Esc>:Files<Cr>")
vim.keymap.set("n", "<Leader>g", "<Esc>:GFiles<Cr>")
vim.keymap.set("n", "<Leader>b", "<Esc>:Buffers<Cr>")
vim.keymap.set("n", "<C-f>", ":Rg! ")
--save
vim.keymap.set("n", "<Leader>w", "<Esc>:w<Cr>")
vim.keymap.set("n", "<Leader>q", "<Esc>:q<Cr>")
vim.keymap.set("n", "<Leader>s", "<Esc>:wq<Cr>")

-- Search results centered please
vim.keymap.set("n", "<silent> n", "nzz")
vim.keymap.set("n", "<silent> N", "Nzz")
vim.keymap.set("n", "<silent> *", "*zz")
vim.keymap.set("n", "<silent> #", "#zz")
vim.keymap.set("n", "<silent> g*", "g*zz")

