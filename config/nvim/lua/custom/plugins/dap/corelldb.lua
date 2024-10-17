local dap = require('dap')
local mason_registry = require('mason-registry')

if not mason_registry.has_package('codelldb') then
  vim.notify('codelldb is not installed. Please install it via Mason.', vim.log.levels.ERROR)
  return
end

local codelldb_pkg = mason_registry.get_package('codelldb')
local extension_path = codelldb_pkg:get_install_path() .. '/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = codelldb_path,
    args = { '--port', '${port}' },
    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

