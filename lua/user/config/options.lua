local M = {}

function M.setopt(key, val)
  vim.opt[key] = val
end

-- I like spaces
local tabs = {
  expandtab = true,
  shiftwidth = 4,
  softtabstop = 4,
  tabstop = 4,

  autoindent = true,
}

local editor = {
  relativenumber = true,
  number = true,
  cursorline = true,
  ruler = true,
  rulerformat = '%l,%c%V%=%P',
  laststatus = 0,
  scrolloff = 5,
  sidescroll = 10,

  -- strange thing happens because of a plugin (chadtree)
  -- this fixes it
  signcolumn = "no",

  undofile = true,

  wrap = true,
  textwidth = 80,
  colorcolumn = "+1",
  formatoptions = "qrn1",

  foldenable = true,
  foldmethod = "indent",   -- automatically create folds for indented text
  foldlevel = 100,         -- open all folds
  foldcolumn = "0",

  showtabline = 2,

  termguicolors = true,
  shortmess = "I",
}

local theme = {
  background = "dark",
}

local search = {
  hlsearch = false,  -- I use this as a movement method, not a highlighter
  incsearch = true,
  showmatch = true,

  wrapscan = false,

  ignorecase = true,
  smartcase = true,
}

local substitution = {
  gdefault = true,
}

local groups = {
  tabs,
  editor,
  theme,
  search,
  substitution,
}

for _, grp in pairs(groups) do
  for opt, val in pairs(grp) do
    M.setopt(opt, val)
  end
end

return M
