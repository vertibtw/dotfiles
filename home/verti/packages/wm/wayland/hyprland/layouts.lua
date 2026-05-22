local M = {}

function M.init()
  hl.config({
    general.layout = "master",
    master.new_status = "master",
  })
end

return M
