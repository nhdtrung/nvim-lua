local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- Colorschemes
use 'mhartington/oceanic-next'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  --  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "windwp/nvim-ts-autotag" -- auto close tags

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Markdown
  use "ellisonleao/glow.nvim"

  -- FZF search
  use { 'junegunn/fzf', run = './install --bin', }
  use { 'ibhagwan/fzf-lua',  requires = { 'kyazdani42/nvim-web-devicons' } }

-- Markdown review
-- install without yarn or npm
use({
  "iamcco/markdown-preview.nvim",
  run = function() vim.fn["mkdp#util#install"]() end,
})

-- Search text 
use "windwp/nvim-spectre"
use 'jremmen/vim-ripgrep'

-- Toggle term
use "akinsho/toggleterm.nvim"

-- Git blame
use 'f-person/git-blame.nvim'

--  nvim-dap debugger
use 'theHamsta/nvim-dap-virtual-text'
use { 'mfussenegger/nvim-dap', tag = '0.1.0'}
use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }

-- hop EasyMotion-like
use "phaazon/hop.nvim"

-- Auto format code
use 'prettier/vim-prettier'

-- PHP PSR support
use 'stephpy/vim-php-cs-fixer'

-- Show list methods
use {
    'simrat39/symbols-outline.nvim',
    config = 'require("symbols-outline").setup()',  -- optional call for configurating non-default filetypes etc
}

-- Session manage
use({
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "persistence",
  config = function()
    require("persistence").setup()
  end,
})

use "b0o/schemastore.nvim"
use "github/copilot.vim"

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

end)
