return {

  -- Oil
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      vim.keymap.set("n", "<leader>fm", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
      keymaps = {
        ["enter"] = "actions.select",
        ["C-p"] = "actions.parent",
        ["q"] = "actions.close",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  ---@type LazySpec
  --- yazi
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        -- Open in the current working directory
        "<leader>cwd",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<leader>yy",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = true,
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- windows
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      local picker = require("window-picker")
      picker.setup({
        -- type of hints you want to get
        -- following types are supported
        -- 'statusline-winbar' | 'floating-big-letter'
        -- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
        -- 'floating-big-letter' draw big letter on a floating window
        -- used
        hint = "floating-big-letter",

        -- when you go to window selection mode, status bar will show one of
        -- following letters on them so you can use that letter to select the window
        selection_chars = "FJDKSLA;CMRUEIWOQP",

        -- This section contains picker specific configurations
        picker_config = {
          statusline_winbar_picker = {
            -- You can change the display string in status bar.
            -- It supports '%' printf style. Such as `return char .. ': %f'` to display
            -- buffer file path. See :h 'stl' for details.
            selection_display = function(char, windowid)
              return "%=" .. char .. "%="
            end,

            -- whether you want to use winbar instead of the statusline
            -- "always" means to always use winbar,
            -- "never" means to never use winbar
            -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
            use_winbar = "never", -- "always" | "never" | "smart"
          },

          floating_big_letter = {
            -- window picker plugin provides bunch of big letter fonts
            -- fonts will be lazy loaded as they are being requested
            -- additionally, user can pass in a table of fonts in to font
            -- property to use instead

            font = "ansi-shadow", -- ansi-shadow |
          },
        },

        -- whether to show 'Pick window:' prompt
        show_prompt = true,

        -- prompt message to show to get the user input
        prompt_message = "Pick window: ",

        -- if you want to manually filter out the windows, pass in a function that
        -- takes two parameters. You should return window ids that should be
        -- included in the selection
        -- EX:-
        -- function(window_ids, filters)
        --    -- folder the window_ids
        --    -- return only the ones you want to include
        --    return {1000, 1001}
        -- end
        filter_func = nil,

        -- following filters are only applied when you are using the default filter
        -- defined by this plugin. If you pass in a function to "filter_func"
        -- property, you are on your own
        filter_rules = {
          -- when there is only one window available to pick from, use that window
          -- without prompting the user to select
          autoselect_one = true,

          -- whether you want to include the window you are currently on to window
          -- selection or not
          include_current_win = false,

          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "NvimTree", "neo-tree", "notify" },

            -- if the file type is one of following, the window will be ignored
            buftype = { "terminal" },
          },

          -- filter using window options
          wo = {},

          -- if the file path contains one of following names, the window
          -- will be ignored
          file_path_contains = {},

          -- if the file name contains one of following names, the window will be
          -- ignored
          file_name_contains = {},
        },

        -- You can pass in the highlight name or a table of content to set as
        -- highlight
        highlights = {
          statusline = {
            focused = {
              fg = "#ededed",
              bg = "#e35e4f",
              bold = true,
            },
            unfocused = {
              fg = "#ededed",
              bg = "#44cc41",
              bold = true,
            },
          },
          winbar = {
            focused = {
              fg = "#ededed",
              bg = "#e35e4f",
              bold = true,
            },
            unfocused = {
              fg = "#ededed",
              bg = "#44cc41",
              bold = true,
            },
          },
        },
      })
      local function focus_window()
        local window = picker.pick_window()
        vim.api.nvim_set_current_win(window)
      end

      vim.keymap.set("n", "<leader>fw", focus_window)
    end,
  },
}
