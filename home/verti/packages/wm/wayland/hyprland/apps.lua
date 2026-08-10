local M = {}

M.terminal    = "kitty"
M.filemgr     = "dolphin"
M.menu        = "fuzzel"
M.clipboardmgr= "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
M.screenshot  = 'grim -g "$(slurp)" - | magick convert - -resize 200% png:- | swappy -f -'
M.lockscreen  = 'hyprlock'

return M
