local servers = {
  "basedpyright",
  "bashls",
  "biome",
  "cssls",
  "glsl_analyzer",
  "gopls",
  "html",
  "htmx",
  "lua_ls",
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

      vim.lsp.config("clangd", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--function-arg-placeholders=0",
          "--header-insertion=iwyu",
          "--header-insertion-decorators",
        },
      })
      vim.lsp.enable({ "clangd" })

      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
        root_dir = nil,
        settings = {
          gopls = {
            completeUnimported = true,
          },
        },
      })

      vim.lsp.config("html", {
        filetypes = { "html", "templ" },
      })

      vim.lsp.config("htmx", {
        filetypes = { "html", "templ" },
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
        filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        init_options = { userLanguages = { templ = "html" } },
      })
    end,
  },
}
