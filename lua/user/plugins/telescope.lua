local builtin = require('telescope.builtin')

local keymap = vim.keymap

keymap.set('n', '<LEADER>ff', builtin.find_files, {})
keymap.set('n', '<LEADER>fg', builtin.live_grep, {})
keymap.set('n', '<LEADER>fb', builtin.buffers, {})
keymap.set('n', '<LEADER>fh', builtin.help_tags, {})
