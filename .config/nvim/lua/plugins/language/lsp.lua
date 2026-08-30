local servers = {
	"basedpyright",
	"biome",
	"cssls",
	"glsl_analyzer",
	"gopls",
	"html",
	"htmx",
	"kotlin_lsp",
	"ktlint",
	"luacheck",
	"lua_ls",
	"prettierd",
	"ruff",
	"rust_analyzer",
	"tailwindcss",
	"templ",
	"ts_ls",
}

return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = servers,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local config = require("config.lsp_config")
			local on_attach = config.on_attach
			local capabilities = config.capabilities

			vim.lsp.config("*", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						disableOrganizeImports = true, -- ruff organizes imports
						-- analysis = { ignore = { '*' } }, -- ruff does linting
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
							typeCheckingMode = "basic",
							diagnosticSeverityOverrides = {
								reportOptionalMemberAccess = false, -- "warning"
							},
						},
					},
				},
			})

			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--function-arg-placeholders=0",
					"--header-insertion=iwyu",
					"--header-insertion-decorators",
				},
			})
			vim.lsp.enable("clangd")

			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_markers = { "go.work", "go.mod", ".git" },
				root_dir = nil,
				settings = {
					gopls = {
						completeUnimported = true,
						semanticTokens = true,
					},
				},
			})

			vim.lsp.config("html", {
				filetypes = { "html", "templ" },
			})

			vim.lsp.config("htmx", {
				filetypes = { "html", "templ" },
			})

			vim.lsp.config("kotlin_lsp", {
				root_markers = {
					"settings.gradle.kts",
					"settings.gradle",
					"build.gradle.kts",
					"build.gradle",
					"pom.xml",
					"gradlew",
					"mvnw",
					".git",
				},
			})

			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						lint = {
							enable = false, -- use basedpyright for linting, ruff for formatting
						},
					},
				},
			})

			vim.lsp.config("rust_analyzer", {
				filetypes = { "rust" },
				root_markers = { "Cargo.toml" },
				root_dir = nil,
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			vim.lsp.config("tailwindcss", {
				filetypes = { "templ", "astro", "javascript", "typescript" },
				init_options = { userLanguages = { templ = "html" } },
			})

			vim.lsp.enable(servers)
		end,
	},
}
