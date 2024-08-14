local servers = { "lua_ls", "pyright" }

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

      local config = require("config.lsp_config")
      local on_attach = config.on_attach
      local capabilities = config.capabilities

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "clangd", "--header-insertion=iwyu" }, -- Auto include headers
      })
    end,
  },
}
