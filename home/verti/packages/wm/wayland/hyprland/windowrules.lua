local M = {}

function M.init()
    hl.layer_rule({
        match = { namespace = "v.bar" },
        blur = true,
        ignore_alpha = 0.4,
    })
end
return M
