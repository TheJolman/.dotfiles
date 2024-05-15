require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "palenight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", { "diff", colored = true } },
		lualine_c = {
			{
				"buffers",
				mode = 0,
				use_mode_colors = true,

				buffers_color = {
					-- Same values as the general color option can be used here.
					active = { bg = "#f5bde6", fg = "#1e2030" }, -- catppuccin pink and mantle
					inactive = { bg = "lualine_c_inactive" }, -- Color for inactive buffer.
				},

				symbols = { modified = "", readonly = "", alternate_file = "" },
			},
		},

		lualine_x = { "diagnostics", "filetype" }, -- removed encoding and fileformat
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
