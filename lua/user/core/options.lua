local M = {}

function M.setopt(key, val)
  vim.opt[key] = val
end

function M.setopts(opts)
  for key, val in pairs(opts) do
    M.setopt(key, val)
  end
end

return M
