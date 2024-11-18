if vim.g.neovide then
  return {}
else
  return {
    {
      '3rd/image.nvim',
      event = 'VeryLazy',
      dependencies = {
        {
          'leafo/magick',
          'vhyrro/luarocks.nvim',
          'nvim-treesitter/nvim-treesitter',
        },
      },
      opts = {

        backend = 'kitty',
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { 'norg' },
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        kitty_method = 'normal',
      },
    },
  }
end

