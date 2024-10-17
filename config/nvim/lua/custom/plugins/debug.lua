return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Runs preLaunchTask / postDebugTask if present
      { 'stevearc/overseer.nvim', config = true },
      'nvim-telescope/telescope-dap.nvim',
      {
        'jbyuki/one-small-step-for-vimkind',
        module = 'osv',
      },
      'rcarriga/nvim-dap-ui',
      -- python
      { 'mfussenegger/nvim-dap-python' },
    },
    keys = {
      {
        '<leader>dq',
        function()
          require('dap').close()
        end,
        desc = 'Close DAP session',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle breakpoint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: '))
        end,
        desc = 'Set conditional breakpoint',
      },
      {
        '<F1>',
        function()
          require('dap').continue()
        end,
        desc = 'Continue debugging',
      },
      {
        '<F2>',
        function()
          require('dap').step_into()
        end,
        desc = 'Step into',
      },
      {
        '<F3>',
        function()
          require('dap').step_over()
        end,
        desc = 'Step over',
      },
      {
        '<F4>',
        function()
          require('dap').step_out()
        end,
        desc = 'Step out',
      },
      {
        '<F0>',
        function()
          require('dap').step_back()
        end,
        desc = 'Step back',
      },
      {
        '<F9>',
        function()
          require('dap').restart()
        end,
        desc = 'Restart debugging',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate debugging',
      },
    },
    config = function()
      -- Signs
      for _, group in pairs({
        'DapBreakpoint',
        'DapBreakpointCondition',
        'DapBreakpointRejected',
        'DapLogPoint',
      }) do
        vim.fn.sign_define(group, { text = '●', texthl = group })
      end

      -- Setup DAP
      -- require('dap').defaults.fallback.switchbuf = 'useopen,usetab'
      -- require('dap').defaults.fallback.open_command = 'edit' -- 添加这一行

      -- Adapters
      -- C, C++, Rust
      require('custom.plugins.dap.corelldb')
      -- Python
      require('custom.plugins.dap.debugpy')

      -- Setup DAP UI
      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'nvim-neotest/nvim-nio',

    opts = {
      controls = {
        enabled = false,
      },
      sidebar = {
        elements = {
          'scopes',
          'breakpoints',
          'stacks',
          'watches',
        },
        size = 40,
        position = 'left', -- 可以是 "left" 或 "right"
      },
      tray = {
        elements = {
          'repl',
          'console',
        },
        size = 10,
        position = 'bottom', -- 可以是 "bottom" 或 "top"
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = 'rounded',
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
      windows = { indent = 1 },
      render = {
        indent = 2,
        max_type_length = 0,
      },
    },
    -- config = function()
    --   require('neodev').setup({
    --     library = { plugins = { 'nvim-dap-ui' }, types = true },
    --   })
    -- end,
    keys = {
      {
        '<leader>dr',
        function()
          require('dapui').toggle({ reset = true })
        end,
        desc = 'Toggle DAP UI with reset',
      },
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle DAP UI ',
      },
      {

        '<leader>de',
        function()
          require('dapui').eval()
        end,
        desc = 'Evaluate expression',
      },
      {
        '<leader>dw',
        function()
          require('dapui').eval(vim.fn.input('Evaluate expression: '))
        end,
      },
    },
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      require('nvim-dap-virtual-text').setup {
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
        all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        display_callback = function(variable, buf, stackframe, node, options)
          -- by default, strip out new line characters
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value:gsub('%s+', ' ')
          else
            return variable.name .. ' = ' .. variable.value:gsub('%s+', ' ')
          end
        end,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

        -- experimental features:
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      }
    end,
  },
}

