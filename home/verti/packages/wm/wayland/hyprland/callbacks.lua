local M = {}

M.on = {
  -- this is for like quickshell and maybe some other stuff idk
  function workspace_change (ws)
    local f = io.open("/tmp/ws", "w") -- "w" replaces the whole file so it won't get too big
    if f then
      f:write(tostring(ws.id) .. "\n")
      f:close()
    end
  end
}

return M