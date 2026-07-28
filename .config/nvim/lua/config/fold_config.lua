local M = {}

local comment_patterns = {
  default    = { '^//', '^/%*' }, -- C-style
  python     = { '^#' },
  sh         = { '^#' },
  bash       = { '^#' },
  zsh        = { '^#' },
  ruby       = { '^#' },
  yaml       = { '^#' },
  toml       = { '^#' },
  perl       = { '^#' },
  dockerfile = { '^#' },
  conf       = { '^#' },
  make       = { '^#' },
  r          = { '^#' },
  elixir     = { '^#' },
  julia      = { '^#' },
  lua        = { '^%-%-' },
  haskell    = { '^%-%-' },
  vim        = { '^"' },
  html       = { '^<!%-%-' },
  xml        = { '^<!%-%-' },
  markdown   = { '^<!%-%-' },
  sql        = { '^%-%-' },
  matlab     = { '^%%' },
  tex        = { '^%%' },
  latex      = { '^%%' },
  clojure    = { '^;' },
  lisp       = { '^;' },
  scheme     = { '^;' },
  vimscript  = { '^"' },
  fortran    = { '^!' },
  ocaml      = { '^%(%*' },
  erlang     = { '^%%' },
}

local function get_patterns(filetype)
  return comment_patterns[filetype] or comment_patterns.default
end

function M.open_comment_folds()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  local patterns = get_patterns(filetype)
  local last_line = vim.api.nvim_buf_line_count(bufnr)
  local lnum = 1
  while lnum <= last_line do
    local fold_start = vim.fn.foldclosed(lnum)
    if fold_start ~= -1 then
      local trimmed = vim.trim(vim.fn.getline(fold_start))
      for _, pat in ipairs(patterns) do
        if trimmed:match(pat) then
          vim.cmd(fold_start .. 'foldopen')
          break
        end
      end
      lnum = vim.fn.foldclosedend(lnum) + 1
    else
      lnum = lnum + 1
    end
  end
end

function M.virt_text_handler(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('...          󰁂 %s'):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'Comment' })
  return newVirtText
end

function M.setup()
  vim.api.nvim_create_user_command('UfoOpenCommentFolds', M.open_comment_folds, {})
  vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function()
      vim.defer_fn(M.open_comment_folds, 100)
    end,
  })
end

return M
