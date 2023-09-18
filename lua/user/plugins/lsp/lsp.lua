-- must be done in this order, before loading lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "clangd" },
})

local lsp = require "lspconfig"
local coq = require "coq"
local chad = require "chadtree"

local function ensure_capabilities(cfg)
  cfg = coq.lsp_ensure_capabilities(cfg)
  cfg = chad.lsp_ensure_capabilities(cfg)
  return cfg
end

local allsettings = {
  pyright = {},

  lua_ls = {
    settings = {
      Lua = { diagnostics = { globals = { "vim" } } }
    }
  }
}

for server, conf in pairs(allsettings) do
  lsp[server].setup(ensure_capabilities(conf))
end

local keymaps = require "user.core.keymaps"

keymaps.mapmode("n", {
  ["<SPACE>e"] = vim.diagnostic.open_float,
  ["[d"] = vim.diagnostic.goto_prev,
  ["]d"] = vim.diagnostic.goto_next,
  ["<SPACE>q"] = vim.diagnostic.setloclist,
})
