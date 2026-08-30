return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			go = { "gofmt" },
			javascript = { "biome", stop_after_first = true },
			kotlin = { "ktlint" },
			markdown = { "prettierd" },
			python = { "ruff_format" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
