local M = {}

M.terminal    = "kitty"
M.filemgr     = "dolphin"
--M.menu        = "fuzzel"
M.menu        = "tofi-drun"
M.menu_args   = "--fuzzy-match true | bash"
M.screenshot  = 'grim -g "$(slurp)" - | magick convert - -resize 200% png:- | swappy -f -'

return M
