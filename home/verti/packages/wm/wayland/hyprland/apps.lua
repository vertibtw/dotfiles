local M = {}

M.terminal    = "kitty"
M.filemgr     = "dolphin"
M.menu        = "fuzzel"
M.screenshot  = 'grim -g "$(slurp)" - | wl-copy'

function M.init ()
  -- this is needed because of the automated file inclusion
end

return M
