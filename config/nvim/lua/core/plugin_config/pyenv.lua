local venv_selector = require("venv-selector")

venv_selector.setup({
	-- Keymap to open VenvSelector to pick a venv.
	vim.api.nvim_set_keymap("n", "<leader>vs", "<cmd>VenvSelect<cr>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { noremap = true, silent = true }),
})
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Auto select virtualenv Nvim open",
	pattern = "*",
	callback = function()
		local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
		if venv ~= "" then
			require("venv-selector").retrieve_from_cache()
		end
	end,
	once = true,
})
