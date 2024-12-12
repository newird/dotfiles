return {
  {
    -- amongst your other plugins
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = function()
        require('toggleterm').setup({
          -- size can be a number or function which is passed the current terminal
          size = 10,
          open_mapping = [[<F5>]],
          hide_numbers = true,
          shade_filetypes = {},
          shade_terminals = true,
          start_in_insert = true,
          insert_mappings = false,
          persist_size = true,
          direction = 'horizontal',
          close_on_exit = true,
        })
      end,
    },
  },
}
