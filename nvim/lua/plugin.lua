-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  -- Packer can manage itself
use 'wbthomason/packer.nvim'

--- emmet 
use {'mattn/emmet-vim'}
-- nvim-tree
use { 'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)

}
-- dashboard
	 use { 'glepnir/dashboard-nvim'}
   --	 use { "lukas-reineke/indent-blankline.nvim",
    -- 	config = "require('blankline-config')",
   -- 		event = "BufRead"}
 --telescope 
	use {
  'nvim-telescope/telescope.nvim',
}

-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
	--	"hrsh7th/cmp-nvim-lsp-signature-help",
		"jose-elias-alvarez/null-ls.nvim",
	})

-- Completition


-- thema
	use {	'folke/tokyonight.nvim' }
-- treesiter
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	})

end)
