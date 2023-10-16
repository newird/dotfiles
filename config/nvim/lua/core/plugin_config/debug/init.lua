require("core.plugin_config.debug.python-dap")
require("core.plugin_config.debug.cpp-dap")
local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>dq", function() require"dap".close() end, opts)
vim.keymap.set("n", "<leader>dr", function() require"dapui".toggle({ reset = true }) end, opts)
vim.keymap.set("n", "<leader>db", function() require"dap".toggle_breakpoint() end, opts)
vim.keymap.set("n", "<leader>dt", function() require"dap".terminate() end, opts)
vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, opts)
