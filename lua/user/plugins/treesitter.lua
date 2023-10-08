local configs = require "nvim-treesitter.configs"

configs.setup({
  ensure_installed = { "python", "c", "cpp", "bash", "sql" },
  sync_install = false,
  ignore_install = { "" },

  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
  },
})
