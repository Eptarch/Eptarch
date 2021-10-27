local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- plugin manager
	use("nvim-lua/plenary.nvim") -- lua functions that other plugins use
	use({ "catppuccin/nvim", as = "catppuccin" }) -- colorscheme
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximize and restore split window
	use("tpope/vim-surround") -- surround your text with symbols like ys2w"
	use("vim-scripts/ReplaceWithRegister") -- replace text with one in a register
	use("numToStr/Comment.nvim") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("nvim-tree/nvim-web-devicons") -- icons
	use("nvim-lualine/lualine.nvim") -- status line
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- fuzzy find plugin for telescope
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- powerful search tool
	use("hrsh7th/nvim-cmp") -- autocompletion
	use("hrsh7th/cmp-buffer") -- source that allows nvim-cmp to recommend text from current buffer
	use("hrsh7th/cmp-path") -- source for filepaths
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- source for snippets
	use("rafamadriz/friendly-snippets") -- snippets collection
	use("williamboman/mason.nvim") -- managing and installing LSP servers, linters & formatters
	use("williamboman/mason-lspconfig") -- bridge between mason and lspconfig
	use("neovim/nvim-lspconfig") -- configuring LSP servers
	use("hrsh7th/cmp-nvim-lsp") -- configure lsp server to appear in autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp UIs
	use("jose-elias-alvarez/typescript.nvim") -- add funtionality to typescript server
	use("onsails/lspkind.nvim") -- add vscode-like icons to autocompletion
	use("jose-elias-alvarez/null-ls.nvim") -- formatting & linting
	use("jay-babu/mason-null-ls.nvim") -- bridge between mason and null-ls

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("windwp/nvim-autopairs") -- autoclose parentheses, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)
