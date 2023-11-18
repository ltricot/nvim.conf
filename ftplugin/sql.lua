-- I like spaces
local shiftwidth = 2

local tabs = {
  expandtab = true,
  shiftwidth = shiftwidth,
  softtabstop = shiftwidth,
  tabstop = shiftwidth,
}

local groups = {
  tabs,
}

for _, grp in pairs(groups) do
  for opt, val in pairs(grp) do
    vim.opt[opt] = val
  end
end
