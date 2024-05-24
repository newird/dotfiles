local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "
opt.clipboard = "unnamedplus"

opt.inccommand = "split"
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = "LspAttach_inlayhints",
-- 	callback = function(args)
-- 		if not (args.data and args.data.client_id) then
-- 			return
-- 		end
-- 		local bufnr = args.buf
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		require("lsp-inlayhints").on_attach(client, bufnr)
-- 	end,
-- })

-- for neovide
if vim.g.neovide then
	local alpha = function()
		return string.format("%x", 0.9)
	end
	vim.g.neovide_transparency = 0.8
	vim.g.transparency = 0.6
	vim.g.neovide_background_color = "#0f1117" .. alpha()
end
--  set opacity
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

-- relevate line
vim.wo.number = true
vim.wo.relativenumber = true

-- undo
opt.undodir = os.getenv("HOME") .. "/.vim/vimdid"
opt.undofile = true

opt.backspace = "2"
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.autochdir = true
-- use spaces for tabs and whatnot
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 8
