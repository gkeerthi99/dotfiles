local opt = vim.opt
local o = vim.o
local g = vim.g

-- Indenting options
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = false
o.expandtab = true
vim.cmd([[filetype plugin indent on]])

-- Numbers
o.number = true
o.numberwidth = 4
o.ruler = false

-- Enable sign column
o.signcolumn = "yes"

-- Cursor line
o.cursorline = true

-- Save undo history
opt.undofile = true

-- Enable clipboard
opt.clipboard = "unnamedplus"

-- Diagnostics options
vim.diagnostic.config({
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	virtual_text = false,
})

-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})
