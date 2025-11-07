local M = {}

function M.setup()
	local diagnostics = {
		"diagnostics",
		always_visible = true,
		sections = { "error", "warn", "info" },
		symbols = {
			error = " ",
			warn = " ",
			info = " ",
		},
	}

	local diff = {
		"diff",
		source = function()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end,
		symbols = {
			added = " ",
			modified = " ",
			removed = " ",
		},
		colored = true,
		always_visible = false,
	}

	local mode = {
		"mode",
		separator = { left = "", right = "" },
		fmt = function(str)
			local initials = ""
			for part in str:gmatch("[^-]+") do
				initials = initials .. part:sub(1, 1) .. "-"
			end
			return initials:sub(1, -2)
		end,
	}

	local logo = {
		function()
			return ""
		end,
		color = { fg = "#a6e22e", bg = "#3b3c35" }, --Monokai Classic
	}

	local lualine = require("lualine")
	lualine.setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "snacks_dashboard" },
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { logo, mode },
			lualine_b = {},
			lualine_c = { "branch", diff },
			lualine_x = { diagnostics, { "filetype", icon_only = true } },
			lualine_y = { "fileformat" },
			lualine_z = {},
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
end

return M
