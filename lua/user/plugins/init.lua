local dir = "user.plugins."

require(dir .. "packer")

local plugins = {
  "colorscheme", "telescope", "treesitter", "chadtree",
  "lsp", "coq_3p",
}
for _, plugin in ipairs(plugins) do
  require(dir .. plugin)
end
