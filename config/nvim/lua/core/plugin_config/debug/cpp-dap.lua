
local dap = require('dap')

dap.adapters.cpp = {
  type = 'executable',
  command = 'lldb-vscode',  -- Adjust to 'gdb', 'gdbserver', etc., if needed
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch executable",
    type = "cpp",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}