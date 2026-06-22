local M = {}

M.terminal    = "kitty"
M.filemgr     = "dolphin"
--M.menu        = "fuzzel"
M.menu        = "tofi-drun"
M.menu_args   = "--fuzzy-match true | bash"
M.screenshot  = 'grim -g "$(slurp)" - | convert - -resize 200% png:- | wl-copy'

function M.init ()
  -- this is needed because of the automated file inclusion
end

return M
