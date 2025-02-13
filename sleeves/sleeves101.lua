-- Pokemon Sleeve
local hordesleeve = {
    key = 'hordesleeve',
    name = 'Horde Sleeve',
    prefix_config = {},
    atlas = "hordesleeves",
    pos = { x = 0, y = 0 },
    config = {consumables = {'c_pokehorde_repeatball'}},
    loc_vars = function(self, info_queue, center)
        return {vars = {}}
    end,
}

local slist = {hordesleeve}

return {Name = "Sleeve",
            init = init,
            list = slist
}