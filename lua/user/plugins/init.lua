require "packer"

local plugins = {
  "colorscheme", "telescope", "treesitter", "chadtree",
  "lsp", "coq_3p", "gitsigns",
}

local dir = "user.plugins."
for _, plugin in ipairs(plugins) do
  require(dir .. plugin)
end
