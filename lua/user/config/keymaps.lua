local keymaps = require "user.core.keymaps"

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local all = {
  [","] = "<NOP>",
}

local normal = {
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

  -- chadtree
  ["<LEADER>v"] = "<CMD>CHADopen<CR>", -- open file tree

  -- quickfix
  ["<LEADER>q"] = function()
    -- thank you Riesling-Schorle
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win["quickfix"] == 1 then
        qf_exists = true
      end
    end
    if qf_exists == true then
      vim.cmd "cclose"
      return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
      vim.cmd "copen"
    end
  end,
  ["<LEADER>;"] = "<CMD>cnext<CR>",
  ["<LEADER>,"] = "<CMD>cprev<CR>",
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
  n = normal,
  i = insert,
  v = visual,
}

for mode, mappings in pairs(allmodes) do
  keymaps.mapmode(mode, mappings)
end
