local M = {}

local fn = vim.fn

function M.ensure_installed()
  local path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(path)) > 0 then
    return M.install(path)
  end
end

function M.install(path)
    local bootstrap = fn.system({
      "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim",
      path,
    })

    print("Installing packer: close and reopen.")
    vim.cmd([[packadd packer.nvim]])

    return bootstrap
end

function M.packer()
  local bootstrap = M.ensure_installed()
  local packer = require("packer")

  packer.init({
    display = {
      open_fn = function()
        return require("packer.util").float()
      end,
    },
  })

  return packer, bootstrap
end

function M.reload_on_write()
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  local packer_user_config = augroup("packer_user_config", { clear = true })

  autocmd("BufWritePost", {
    pattern = "packer.lua",
    callback = function()
      vim.cmd([[source <afile> | PackerSync]])
    end,
    group = packer_user_config,
  })
end

function M.plugins(packer, bootstrap)
  return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- apparently used by other plugins
    use {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    }

    -- language server
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- completions
    -- must run:
    --  `brew uninstall ctags && brew install universal-ctags`
    use {
      "ms-jpq/coq_nvim",
      "ms-jpq/coq.artifacts",
      "ms-jpq/coq.thirdparty",
    }

    -- file manager
    -- requires a nerd font for icons
    use {
      "ms-jpq/chadtree",
      branch = "chad",
    }

    -- telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { "nvim-lua/plenary.nvim" }
    }

    -- syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    -- colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- sets up configuration after cloning packer.nvim
    if bootstrap then
      require("packer").sync()
    end
  end)
end

M.reload_on_write()
return M.plugins(M.packer())
