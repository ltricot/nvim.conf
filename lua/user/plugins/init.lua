require "user.plugins.packer"

local plugins = {
  "colorscheme", "telescope", "treesitter", -- "chadtree",
  "lsp", "gitsigns",
}

local dir = "user.plugins."
for _, plugin in ipairs(plugins) do
  require(dir .. plugin)
end
