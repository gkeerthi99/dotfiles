local map = vim.keymap.set

-- Keybindings for navigating
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "switch window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "switch window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "switch window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "switch window up" })

-- Code keybindings
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "display code actions" })

-- Buffer keybindings
map("n", "<leader>`", "<C-^>", { desc = "switch to previous buffer" })
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>")
map("n", "<leader>c", "<Cmd>BufferWipeout<CR>", { desc = "close buffer" })

-- Neotree keybindings
map("n", "<C-t>", "<cmd>Neotree toggle<CR>", { desc = "toggle neotree" })

-- Debugger keybindings
map("n", "<leader>db", "<cmd>DapToggleBreakpoint <CR>", { desc = "add breakpoint at line" })
map("n", "<leader>ds", "<cmd>DapContinue <CR>", { desc = "start or continue the debugger" })
local getSidebar = function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end
map("n", "<leader>dus", function()
	getSidebar()
end, { desc = "start or continue the debugger" })

-- Go debugger commands
map("n", "<leader>dgt", "<cmd>lua require('dap-go').debug_test()<CR>", { desc = "start or continue the debugger" })
map("n", "<leader>dgl", "<cmd>lua require('dap-go').debug_last()<CR>", { desc = "start or continue the debugger" })

-- ChatGPT keybindings
map("n", "<C-c>", "<cmd>ChatGPT<CR>", { desc = "open ChatGPT UI" })
map("i", "<C-H>", "<C-w>", { noremap = true, silent = true })
