require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "ruff_format", "ruff_fix" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		go = { "goimports", "gofmt" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		fish = { "fish_indent" },
		bash = { "shfmt" },
		rust = { "rustfmt" },
		["*"] = { "trim_whitespace", "autocorrect" },
	},
	formatters = {
		clang_format = {
			command = "clang-format",
			prepend_args = { "--fallback-style=Google" },
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Key mapping for formatting
vim.api.nvim_set_keymap(
	"n", -- Use an empty string for mode to set the keymap for all modes
	"<leader>=", -- The key combination
	":lua require('conform').format({ async = true, lsp_fallback = true })<CR>", -- The command to execute
	{ noremap = true, silent = true, desc = "Format buffer" } -- Options for the keymap
)
