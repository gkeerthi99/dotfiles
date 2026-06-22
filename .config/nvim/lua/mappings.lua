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
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "toggle breakpoint" })
map("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "set conditional breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "start or continue debugger" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "step into" })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "step over" })
map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "step out" })
map("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, { desc = "toggle debugger REPL" })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "terminate debugger" })
map("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "toggle debugger UI" })
map("n", "<leader>dus", function()
	local widgets = require("dap.ui.widgets")
	widgets.sidebar(widgets.scopes).open()
end, { desc = "open debugger scopes" })

-- Go debugger commands
map("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end, { desc = "debug nearest Go test" })
map("n", "<leader>dgl", function()
	require("dap-go").debug_last_test()
end, { desc = "debug last Go test" })

-- ChatGPT keybindings
map("n", "<C-c>", "<cmd>ChatGPT<CR>", { desc = "open ChatGPT UI" })
map("i", "<C-H>", "<C-w>", { noremap = true, silent = true })
