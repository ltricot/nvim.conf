-- key mappings
local M = {}

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local all = {
  [","] = "<NOP>",
}

local normal = {
  ["<TAB>"] = "%", -- bracket jump

  -- screen vs line up / down
  ["j"] = "gj",
  ["k"] = "gk",

  ["<LEADER><SPACE>"] = "<CMD>noh<CR>", -- fast no highlight

  -- splits
  ["<LEADER>w"] = "<C-w>v<C-w>l",
  ["<C-n>"] = "<C-w>v<C-w>l",
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",

  ["<LEADER>v"] = "<CMD>CHADopen<CR>", -- open file tree
}

local insert = {
  ["jk"] = "<ESC>",
}

local visual = {
  ["<TAB>"] = "%", -- bracket jump
  ["p"] = '"_dP', -- paste without yanking
}

local allmodes = {
  [""] = all,
  n =  normal,
  i = insert,
  v = visual,
}


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

for mode, mappings in pairs(allmodes) do
  M.mapmode(mode, mappings)
end

return M
