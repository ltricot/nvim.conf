local keymaps = require "user.core.keymaps"

-- must be done in this order, before loading lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "clangd" },
})

local lsp = require "lspconfig"
local coq = require "coq"
local chad = require "chadtree"

local function on_attach(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymaps.mapmode("n", {
      ['gD'] = vim.lsp.buf.declaration,
      ['gd'] = vim.lsp.buf.definition,
      ['gi'] = vim.lsp.buf.implementation,
      ['K'] = vim.lsp.buf.hover,
      ['<C-k>'] = vim.lsp.buf.signature_help,
      ['<space>wa'] = vim.lsp.buf.add_workspace_folder,
      ['<space>wr'] = vim.lsp.buf.remove_workspace_folder,
      ['<space>wl'] = function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      ['<space>D'] = vim.lsp.buf.type_definition,
      ['<space>rn'] = vim.lsp.buf.rename,
      ['<space>ca'] = vim.lsp.buf.code_action,
      ['gr'] = vim.lsp.buf.references,
      ['<space>f'] = function()
        vim.lsp.buf.format { async = true }
      end,
    }, opts)

    keymaps.keymap("v", "<SPACE>ca", vim.lsp.buf.code_action, opts)
  end

local function ensure_capabilities(cfg)
  cfg.on_attach = on_attach
  cfg = coq.lsp_ensure_capabilities(cfg)
  cfg = chad.lsp_ensure_capabilities(cfg)
  return cfg
end

local allsettings = {
  pyright = {},

  -- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
  ruff_lsp = {
    init_options = {
      settings = {
        -- Any extra CLI arguments for `ruff` go here.
        args = {},
      }
    }
  },

  lua_ls = {
    settings = {
      Lua = { diagnostics = { globals = { "vim" } } }
    }
  },

  clangd = {},
}

for server, conf in pairs(allsettings) do
  lsp[server].setup(ensure_capabilities(conf))
end

keymaps.mapmode("n", {
  ["<SPACE>e"] = vim.diagnostic.open_float,
  ["[d"] = vim.diagnostic.goto_prev,
  ["]d"] = vim.diagnostic.goto_next,
  ["<SPACE>q"] = vim.diagnostic.setloclist,
})
