return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fa",
      LazyVim.pick("files", {
        hidden = true,
        file_ignore_patterns = { "%.git/", "%.DS_Store$" },
      }),
      desc = "Find All Files (including hidden)",
    },
  },
}
