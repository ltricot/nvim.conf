local keymap = require "user.core.keymaps"

-- 🐓 Coq completion settings
-- without this file, coq_nvim is a pain: don't set my keymaps!
vim.g.coq_settings = {
  auto_start = "shut-up",

  keymap = {
    recommended = true,

    manual_complete = "<CTRL-SPACE>",
    jump_to_mark = "<leader>h",
    ["repeat"] = "",
    bigger_preview = "",
    eval_snips = "<leader>j",
    manual_complete_insertion_only = false,
    pre_select = false,
  }
}

-- local function conditional(lhs, rhs)
--   return function()
--     if vim.fn.pumvisible() == 1 then
--       return rhs
--     else
--       return lhs
--     end
--   end
-- end
--
-- local opts = { silent = true, expr = true }
-- local maps = {
--   ["<Esc>"] = "<C-e><Esc>",
--   ["<C-c>"] = "<C-e><C-c>",
--   ["<BS>"] = "<C-e><BS>",
--   ["<CR>"] = "<C-e><CR>",
--   ["<Tab>"] = "<C-n>",
--   ["<S-Tab>"] = "<C-p>",
-- }
-- 
-- for lhs, rhs in pairs(maps) do
--   keymap.keymap("i", lhs, conditional(lhs, rhs), opts)
-- end

require "coq"
