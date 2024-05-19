require('lualine').setup({
  sections = {
    lualine_x = {
      {
        require('noice').api.statusline.mode.get,
        cond = require('noice').api.statusline.mode.has,
        color = { fg = '#ff9e64' },
      },
    },
  },
  routes = {
    {
      filter = {
        event = 'lsp',
        kind = 'progress',
        cond = function(message)
          local client = vim.tbl_get(message.opts, 'progress', 'client')
          return client == 'lua_ls'
        end,
      },
      opts = { skip = true },
    },
  },
})
