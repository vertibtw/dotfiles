local M = {}

M.terminal    = "kitty"
M.filemgr     = "dolphin"
M.menu        = "fuzzel"
M.screenshot  = 'grim -g "$(slurp)" - | magick convert - -resize 200% png:- | swappy -f -'

return M
