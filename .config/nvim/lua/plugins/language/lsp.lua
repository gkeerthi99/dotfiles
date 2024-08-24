local servers = { "prettierd", "lua_ls", "pyright" }

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = servers,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local config = require("config.lsp_config")
			local on_attach = config.on_attach
			local capabilities = config.capabilities

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
					},
				},
			})

			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "clangd", "--header-insertion=iwyu" }, -- Auto include headers
			})
		end,
	},
}
