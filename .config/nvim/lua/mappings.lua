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

map("n", "<leader>`", "<C-^>", { desc = "switch to previous buffer" })

-- Telescope keybindings
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '--glob', '!.git/*'} })<CR>",
	{ desc = "telescope find files" }
)
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "display code actions" })
map("n", "<C-p>", "<cmd>Telescope projects<CR>", { desc = "find projects" })

-- Neotree keybindings
map("n", "<C-b>", "<cmd>Neotree toggle<CR>", { desc = "toggle neotree" })

-- Debugger keybindings
map("n", "<leader>db", "<cmd>DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd>DapContinue <CR>", { desc = "Start or continue the debugger" })

-- ChatGPT keybindings
map("n", "<C-c>", "<cmd>ChatGPT<CR>", { desc = "Add breakpoint at line" })

-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})
