local opt		= vim.opt
local o			= vim.o
local g			= vim.g

-- Colour options
vim.opt.termguicolors = true
vim.opt.background    = "dark"

-- Indenting options
o.tabstop           = 2
o.softtabstop       = 2
o.shiftwidth        = 2
o.autoindent        = true
o.smartindent       = false
o.expandtab         = true
vim.cmd([[filetype plugin indent on]])

-- Fold options
o.foldcolumn        = '0'
o.foldlevel         = 99
o.foldlevelstart    = 99
o.foldenable        = true

-- Numbers
o.number            = true
o.numberwidth       = 4
o.ruler             = false

-- Enable sign column
o.signcolumn        = "yes"

-- Cursor line
o.cursorline        = true

-- Save undo history
opt.undofile        = true

-- Enable clipboard
opt.clipboard       = "unnamedplus"

-- Diagnostics options
vim.diagnostic.config({
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN]  = " ",
			[vim.diagnostic.severity.HINT]  = " ",
			[vim.diagnostic.severity.INFO]  = " ",
		},
	},
	virtual_text = false,
})
