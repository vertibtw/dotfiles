local layouts = {}

function layouts.init()
  hl.config({
    general.layout = "master",
    master.new_status = "master",
  })
end

return layouts
