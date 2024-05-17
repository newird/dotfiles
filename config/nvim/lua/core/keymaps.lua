-- this file was mostly translate from
-- https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
-- Navigate vim panes better

vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
vim.keymap.set("s", "<C-c>", "<Esc>")
vim.keymap.set("x", "<C-c>", "<Esc>")
vim.keymap.set("c", "<C-c>", "<C-c>")
vim.keymap.set("o", "<C-c>", "<Esc>")
vim.keymap.set("l", "<C-c>", "<Esc>")
vim.keymap.set("t", "<C-c>", "<Esc>")

--for copilot

vim.keymap.set("i", "<C-x>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-N>", "<Plug>(copilot-next)", {})
vim.keymap.set("i", "<C-P>", "<Plug>(copilot-previous)", {})

--remove file
vim.keymap.set("n", "<Leader>rb", ":bdelete")
vim.keymap.set("n", "<Leader>rf", ":UseFZFToRemoveFiles")

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

--trigger terminal
vim.keymap.set("n", "<Leader>t", ":ToggleTerm<CR>")
-- markdown preview
vim.keymap.set("n", "<Leader>mp", ":MarkdownPreview<CR>")
vim.keymap.set("n", "<Leader>mc", ":MarkdownPreviewClose<CR>")
vim.keymap.set("n", "<Leader>mr", ":MarkdownPreviewRefresh<CR>")
vim.keymap.set("n", "<Leader>mt", ":MarkdownPreviewToggle<CR>")

-- Move by line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- use system  clipboard
-- Visual mode mappings
vim.keymap.set("v", "<Leader>y", "+y")
vim.keymap.set("v", "<Leader>d", "+d")

-- Visual mode mappings (again, for completeness)
vim.keymap.set("v", "<Leader>p", "+p")
vim.keymap.set("v", "<Leader>P", "+P")

-- select all
vim.keymap.set("n", "<Leader>a", "ggVG")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- magic search
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- fzf
vim.keymap.set("n", "<Leader>f", "<Esc>:Files<Cr>")
vim.keymap.set("n", "<Leader>g", "<Esc>:GFiles<Cr>")
vim.keymap.set("n", "<C-f>", ":Rg!<Cr> ")
--save
vim.keymap.set("n", "<Leader>w", "<Esc>:w<Cr>")
vim.keymap.set("n", "<Leader>q", "<Esc>:q<Cr>")

-- Search results centered please
vim.keymap.set("n", "<silent> n", "nzz")
vim.keymap.set("n", "<silent> N", "Nzz")
vim.keymap.set("n", "<silent> *", "*zz")
vim.keymap.set("n", "<silent> #", "#zz")
vim.keymap.set("n", "<silent> g*", "g*zz")
