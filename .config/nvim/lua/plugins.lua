local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    config = 'require("config/lsp")'
  }

  use {
    'folke/tokyonight.nvim',
    config = 'require("config/tokyonight")'
  }
  
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = 'require("config/neotree")'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = 'require("config/lualine")'
  }

  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    config = 'require("config/bufferline")'
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    config = 'require("config/mason")'
  }
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  },
  profile = {
    enable = true,
    threashold = 1
  }
}})
