return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        if vim.fn.argc() > 0 then
          vim.cmd([[Neotree]])
        end
      end,
    })
  end,
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    buffers = {
      follow_current_file = {
        enable = true,
      },
    },
    window = {
      position = "left",
    },
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "@boolean" }),
  },
}
