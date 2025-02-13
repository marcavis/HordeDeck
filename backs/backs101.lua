local hordedeck = {
	name = "hordedeck",
	key = "hordedeck",  
	order = 22,
  unlocked = true,
  discovered = true,
	config = {},
	-- config = {},
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 0, y = 0 },
	atlas = "hordedeck",
} 

local dList = {hordedeck}

return {name = "Back",
        -- init = init,
        list = dList
}