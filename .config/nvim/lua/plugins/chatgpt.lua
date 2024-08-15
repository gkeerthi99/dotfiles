return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "pass show api/openai/chatgpt.lua",
    })
  end,
  dependencies = {
    "folke/trouble.nvim",
  },
}
