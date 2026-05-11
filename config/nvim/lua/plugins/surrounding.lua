return {

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    init = function()
      -- Disable default keymaps (use z instead of s to avoid conflicting with leap)
      vim.g.nvim_surround_no_mappings = true
    end,
    config = function()
      require("nvim-surround").setup({})
      -- In v4, keymaps are configured via <Plug> mappings, not in .setup()
      -- See :h nvim-surround.migrating.v3_to_v4
      vim.keymap.set("n", "yz", "<Plug>(nvim-surround-normal)", { desc = "Add surrounding pair around motion" })
      vim.keymap.set("n", "yzz", "<Plug>(nvim-surround-normal-cur)", { desc = "Add surrounding pair around current line" })
      vim.keymap.set("n", "yZ", "<Plug>(nvim-surround-normal-line)", { desc = "Add surrounding pair around motion (new lines)" })
      vim.keymap.set("n", "yZZ", "<Plug>(nvim-surround-normal-cur-line)", { desc = "Add surrounding pair around current line (new lines)" })
      vim.keymap.set("n", "dz", "<Plug>(nvim-surround-delete)", { desc = "Delete surrounding pair" })
      vim.keymap.set("n", "cz", "<Plug>(nvim-surround-change)", { desc = "Change surrounding pair" })
      vim.keymap.set("n", "cZ", "<Plug>(nvim-surround-change-line)", { desc = "Change surrounding pair (new lines)" })
      vim.keymap.set("x", "Z", "<Plug>(nvim-surround-visual)", { desc = "Add surrounding pair around visual selection" })
      vim.keymap.set("x", "gZ", "<Plug>(nvim-surround-visual-line)", { desc = "Add surrounding pair around visual selection (new lines)" })
      vim.keymap.set("i", "<C-g>z", "<Plug>(nvim-surround-insert)", { desc = "Add surrounding pair around cursor (insert)" })
      vim.keymap.set("i", "<C-g>Z", "<Plug>(nvim-surround-insert-line)", { desc = "Add surrounding pair around cursor (insert, new lines)" })
    end,
  },
}
