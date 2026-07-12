local M = {}

function M.init()
    hl.layer_rule({
        match = { namespace = "v.shell" },
        blur = true,
        ignore_alpha = 0.5,
    })

end
return M
