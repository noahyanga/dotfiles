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

return require('packer').startup(function(use)

  -- packer
  use 'wbthomason/packer.nvim'

  -- live server
 use({
  "aurum77/live-server.nvim",
    run = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  })


  -- icons
  use 'nvim-tree/nvim-web-devicons'

  -- nvim-tree
  use 'nvim-tree/nvim-tree.lua'

  -- lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

  -- colorscheme
-- use 'habamax/vim-gruvbit'
use 'kvrohit/rasmus.nvim'


  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use {
	  'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'
  }

  -- config for LSPs
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- Config for nvim lsp(s)
    }

    -- telescope (fuzzy finder)
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

-- startup
use { "mhinz/vim-startify" }

-- autocompletions
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
