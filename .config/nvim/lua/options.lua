local opt = vim.opt
local o = vim.o
local g = vim.g

-- Indenting options
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.expandtab = true

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
	virtual_text = {
		prefix = "",
		spacing = 2,
	},
})

-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})
