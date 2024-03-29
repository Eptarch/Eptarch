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
				newfile_status = true,
				path = 4,
				symbols = {
					modified = "🟡",
					readonly = "🔒",
					unnamed = "👀",
					newfile = "👶",
				},
			},
		},
	},
})
