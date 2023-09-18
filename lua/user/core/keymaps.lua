-- key mappings
local M = {}


local default_opts = { noremap = true, silent = true }

function M.keymap(mode, key, val, opts)
  vim.keymap.set(mode, key, val, opts)
end

function M.mapmode(mode, mappings, opts)
  opts = opts or default_opts

  for key, val in pairs(mappings) do
    M.keymap(mode, key, val, opts)
  end
end

return M
