local status, lualine = pcall(require, "lualine")
if not status then
	return
end

require("lualine").setup({
	options = {
		theme = "catppuccin",
		globalstatus = true,
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 4,
			},
		},
	},
})
