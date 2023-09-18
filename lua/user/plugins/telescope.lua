local telescope = require "telescope"

telescope.setup({})
telescope.load_extension('fzf')

local builtin = require "telescope.builtin"
local keymaps = require "user.core.keymaps"

keymaps.mapmode("n", {
  -- basic
  ['<LEADER>ff'] = builtin.find_files,
  ['<LEADER>fg'] = builtin.live_grep,
  ['<LEADER>fb'] = builtin.buffers,
  ['<LEADER>fh'] = builtin.help_tags,

  -- jump lists
  ['<LEADER>fq'] = builtin.quickfix,
  ['<LEADER>fl'] = builtin.loclist,

  -- lsp & treesitter
  ['<LEADER>fr'] = builtin.lsp_references,
  ['<LEADER>fd'] = builtin.lsp_definitions,
  ['<LEADER>fs'] = builtin.treesitter,
  ['<LEADER>fe'] = builtin.diagnostics,
})
