local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"bash",
		"css",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"graphql",
		"html",
		"htmldjango",
		"ini",
		"javascript",
		"json",
		"json5",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"sql",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	-- auto install above language parsers
	auto_install = true,
})
