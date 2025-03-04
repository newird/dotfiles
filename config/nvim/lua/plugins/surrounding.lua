return {

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        vim.cmd("echo 'hello'"),
        -- Configuration here, or leave empty to use defaults
        -- use z instead of s avoid conflicting with leap
        keymaps = {
          insert = "<C-g>z",
          insert_line = "<C-g>Z",
          normal = "yz",
          normal_cur = "yzz",
          normal_line = "yZ",
          normal_cur_line = "yZZ",
          visual = "Z",
          visual_line = "gZ",
          delete = "dz",
          change = "cz",
          change_line = "cZ",
        },
      })
    end,
  },
}
