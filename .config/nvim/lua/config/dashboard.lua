local M = {}

M.setup = function()
  return {
    width = 60,
    pane_gap = 4,
    preset = {
      header = [[ 
           .-;+$XHHHHHHX$+;-.           
        ,;X@@X%/;=----=:/%X@@X/,        
      =$@@%=.              .=+H@X:      
    -XMX:                      =XMX=    
   /@@:                          =H@+   
  %@X,                            .$@$  
 +@X.                               $@% 
-@@,                                .@@=
%@%                                  +@$
H@:                                  :@H
H@:         :HHHHHHHHHHHHHHHHHHX,    =@H
%@%         ;@M@@@@@@@@@@@@@@@@@H-   +@$
=@@,        :@@@@@@@@@@@@@@@@@@@@@= .@@:
 +@X        :@@@@@@@@@@@@@@@M@@@@@@:%@% 
  $@$,      ;@@@@@@@@@@@@@@@@@M@@@@@@$. 
   +@@HHHHHHH@@@@@@@@@@@@@@@@@@@@@@@+   
    =X@@@@@@@@@@@@@@@@@@@@@@@@@@@@X=    
      :$@@@@@@@@@@@@@@@@@@@M@@@@$:      
        ,;$@@@@@@@@@@@@@@@@@@X/-        
           .-;+$XXHHHHHX$+;-.           
      ]],
--       header = [[
-- ⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⣤⣄⠀⠀⠀⠀⠀⢀⣤⣶⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀
-- ⢴⣾⣿⣿⣿⣏⣉⣉⣉⣛⣛⣻⣿⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠙⢷⠀⠀⠀⢠⡟⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣾⣿⣛⣛⣋⣉⣉⣉⣿⣿⣿⣿⣶⠄
-- ⠀⠙⢿⣿⣿⣿⡁⠀⠀⣉⡿⠋⠉⠉⠙⠛⠻⢿⣦⣄⠀⠀⠀⠀⠘⣇⠀⢀⡟⠀⠀⠀⠀⢀⣤⣾⠿⠛⠋⠉⠉⠉⠻⣏⡉⠀⠈⣹⣿⣿⣿⠟⠁⠀
-- ⠀⠀⠀⠙⣿⣿⣟⠉⠉⣙⡇⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣦⡀⠀⠀⢹⠀⣸⠃⠀⠀⣠⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⢀⣿⡉⠉⠹⣿⣿⡟⠉⠀⠀⠀
-- ⠀⠀⠀⠀⠈⢿⣿⣟⠉⢉⣿⣦⣄⣀⣀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠸⡇⡿⠀⣠⣾⠟⠁⠀⠀⠀⠀⠀⢀⣀⣀⣤⣾⣍⠉⠙⣿⣿⡯⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠸⣿⣿⣿⠉⠀⠀⣀⣨⡟⠛⠛⠒⠒⠤⢄⣀⠀⠙⢿⣆⣷⣧⣾⠟⠁⠀⣀⠤⠄⠒⠚⠛⠛⣯⣀⡀⠀⠉⢹⣿⣿⡿⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⡟⠉⣀⡤⢷⡦⠄⠀⠀⠀⠀⠈⠙⠢⣌⣻⣿⣿⢋⠤⠚⠉⠀⠀⠀⠀⠀⠠⣶⠷⣄⡈⠙⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠸⠿⣿⣿⣿⣁⡤⠾⣷⣤⣴⠶⢶⣒⡻⠿⠿⢛⣿⣿⣿⣟⠛⠽⠿⢓⣲⠶⢶⣦⣴⡟⠦⣄⣹⣿⣿⡿⠿⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⣿⣿⣿⢛⣉⠥⠒⠉⠁⠀⣀⠔⢈⠔⣽⣿⣿⡝⢌⠒⢄⡀⠀⠉⠑⠢⢍⣙⢻⣿⣿⡟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠋⠀⠀⠀⢀⡤⠊⠀⡴⠋⣼⡟⣿⡟⢿⡄⠳⡄⠈⠢⣀⠀⠀⠀⠈⢻⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣯⢽⣀⠀⣀⣴⡏⠀⢀⡞⠁⣸⡿⠀⠉⠀⠘⣿⡀⠙⣆⠀⠘⣷⣄⡀⢀⡸⢯⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⣿⣿⡶⠋⡿⠋⣽⠷⣶⡟⠀⢰⣿⠃⠀⠀⠀⠀⢹⣧⠀⠘⣷⡖⢿⡍⠻⡏⠳⣶⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣷⡞⠀⢠⡇⢰⡟⠀⠀⣾⡏⠀⠀⠀⠀⠀⠈⣿⡆⠀⠘⣧⠀⣷⠈⠹⣶⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣶⡟⠙⣿⡀⠀⣰⡿⠀⠀⠀⠀⠀⠀⠀⠸⣷⡀⠀⣹⣟⠙⣷⣾⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⢿⣿⣿⣿⡿⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠿⣿⣿⣿⣿⠟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--       ]],
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua require('fff').find_files()" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys",   gap = 1, padding = 2 },
      { footer = '“The future is already here — it’s just not evenly distributed.” — William Gibson' },
    },
    -- Monokai Classic
    vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#a6e22e", bold = true }),
    vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#57584f", italic = true }),
  }
end

return M
