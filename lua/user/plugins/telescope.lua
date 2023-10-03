local telescope = require "telescope"

telescope.setup({})
telescope.load_extension('fzf')

local builtin = require "telescope.builtin"
local keymaps = require "user.core.keymaps"

keymaps.mapmode("n", {
  -- basic
  [',ff'] = builtin.find_files,
  [',fg'] = builtin.live_grep,
  [',fb'] = builtin.buffers,
  [',fh'] = builtin.help_tags,

  -- fjump lists
  [',fq'] = builtin.quickfix,
  [',fl'] = builtin.loclist,

  -- flsp & treesitter
  [',fr'] = builtin.lsp_references,
  [',fd'] = builtin.lsp_definitions,
  [',fs'] = builtin.treesitter,
  [',fe'] = builtin.diagnostics,
})
