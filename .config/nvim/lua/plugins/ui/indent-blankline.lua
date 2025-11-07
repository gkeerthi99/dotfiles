return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			vim.api.nvim_set_hl(0, "IblScope", { link = "CmpItemAbbr" }),
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
				show_start = false,
			},
		},
	},
	{
		"RRethy/vim-illuminate",
	},
}
