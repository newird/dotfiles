vim.uv = vim.uv or vim.loop

local M = {}

---@param opts? LazyVimConfig
function M.setup(opts)
  require("config.lazy").setup(opts)
end

return M
