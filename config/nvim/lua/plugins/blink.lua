return {
  {
    "saghen/blink.cmp",
    opts = {
      cmdline = {
        enabled = true,
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      sources = {
        default = { "lsp", "snippets", "path", "omni", "buffer", "avante" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {},
          },
        },
      },
    },
  },
  -- {
  --   "saghen/blink.cmp",
  --   dependencies = {
  --     {
  --       "giuxtaposition/blink-cmp-copilot",
  --       dependencies = {
  --         {
  --           "zbirenbaum/copilot.lua",
  --           require("copilot").setup({
  --             suggestion = { enabled = false },
  --             panel = { enabled = false },
  --           }),
  --         },
  --       },
  --     },
  --   },
  --   opts = {
  --     sources = {
  --       default = { "copilot" },
  --       providers = {
  --         copilot = {
  --           name = "copilot",
  --           module = "blink-cmp-copilot",
  --           score_offset = 80,
  --           enabled = true,
  --           async = true,
  --           transform_items = function(_, items)
  --             local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
  --             local kind_idx = #CompletionItemKind + 1
  --             CompletionItemKind[kind_idx] = "Copilot"
  --             for _, item in ipairs(items) do
  --               item.kind = kind_idx
  --             end
  --             return items
  --           end,
  --         },
  --       },
  --     },
  --     appearance = {
  --       -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
  --       kind_icons = {
  --         Copilot = "",
  --         Text = "󰉿",
  --         Method = "󰊕",
  --         Function = "󰊕",
  --         Constructor = "󰒓",
  --
  --         Field = "󰜢",
  --         Variable = "󰆦",
  --         Property = "󰖷",
  --
  --         Class = "󱡠",
  --         Interface = "󱡠",
  --         Struct = "󱡠",
  --         Module = "󰅩",
  --
  --         Unit = "󰪚",
  --         Value = "󰦨",
  --         Enum = "󰦨",
  --         EnumMember = "󰦨",
  --
  --         Keyword = "󰻾",
  --         Constant = "󰏿",
  --
  --         Snippet = "󱄽",
  --         Color = "󰏘",
  --         File = "󰈔",
  --         Reference = "󰬲",
  --         Folder = "󰉋",
  --         Event = "󱐋",
  --         Operator = "󰪚",
  --         TypeParameter = "󰬛",
  --       },
  --     },
  --   },
  -- },
}
