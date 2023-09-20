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

-- magic search
-- fzf 
vim.keymap.set("n", "<Leader>f", "<Esc>:Files<Cr>")
vim.keymap.set("n", "<Leader>g", "<Esc>:GFiles<Cr>")
vim.keymap.set("n", "<Leader>b", "<Esc>:Buffers<Cr>")
vim.keymap.set("n", "<C-f>", ":Rg! ")
--save
vim.keymap.set("n", "<Leader>w", "<Esc>:w<Cr>")
vim.keymap.set("i", "<Leader>w", "<Esc>:w<Cr>")
vim.keymap.set("v", "<Leader>w", "<Esc>:w<Cr>")
vim.keymap.set("s", "<Leader>w", "<Esc>:w<Cr>")


vim.keymap.set("n", "<Leader>q", "<Esc>:q<Cr>")
vim.keymap.set("i", "<Leader>q", "<Esc>:q<Cr>")
vim.keymap.set("v", "<Leader>q", "<Esc>:q<Cr>")
vim.keymap.set("s", "<Leader>q", "<Esc>:q<Cr>")


vim.keymap.set("n", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("i", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("v", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("s", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("x", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("c", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("o", "<Leader>s", "<Esc>:wq<Cr>")
vim.keymap.set("l", "<Leader>s", "<Esc>:wq<Cr>")


-- <leader><leader> toggles between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Neat ,p will paste clipboard into buffer
-- ,c will copy entire buffer into clipboard
vim.keymap.set("n", "<leader>p", ":read !wl-paste<cr>")
vim.keymap.set("n", "<leader>c", ":w !wl-copy<cr><cr>")

-- Search results centered please
vim.keymap.set("n", "<silent> n", "nzz")
vim.keymap.set("n", "<silent> N", "Nzz")
vim.keymap.set("n", "<silent> *", "*zz")
vim.keymap.set("n", "<silent> #", "#zz")
vim.keymap.set("n", "<silent> g*", "g*zz")

