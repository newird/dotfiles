local dap = require('dap')
local mason_registry = require('mason-registry')

if not mason_registry.has_package('debugpy') then
  vim.notify('debugpy is not installed. Please install it via Mason.', vim.log.levels.ERROR)
  return
end

local debugpy_pkg = mason_registry.get_package('debugpy')
local debugpy_path = debugpy_pkg:get_install_path()
local python_path = debugpy_path .. '/venv/bin/python'

dap.adapters.python = {
  type = 'executable',
  command = python_path,
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    pythonPath = function()
      return 'python3'
    end,
  },
  {
    type = 'python',
    request = 'attach',
    name = 'Attach to process',
    processId = require('dap.utils').pick_process,
    pythonPath = function()
      return 'python3'
    end,
  },
}
require('dap-python').setup('python')
require('dap-python').test_runner = 'pytest'
local test_runners = require('dap-python').test_runners

-- `test_runners` is a table. The keys are the runner names like `unittest` or `pytest`.
-- The value is a function that takes two arguments:
-- The classnames and a methodname
-- The function must return a module name and the arguments passed to the module as list.

---@param classnames string[]
---@param methodname string?
test_runners.your_runner = function(classnames, methodname)
  local path = table.concat({
    table.concat(classnames, ':'),
    methodname,
  }, '::')
  return 'modulename', { '-s', path }
end

