local hordedeck = {
	name = "hordedeck",
	key = "hordedeck",  
	order = 22,
  unlocked = true,
  discovered = true,
	config = {},
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,
	pos = { x = 0, y = 0 },
	atlas = "hordedeck",
} 

local feraldeck = {
	name = "feraldeck",
	key = "feraldeck",  
	order = 23,
  unlocked = true,
  discovered = true,
	config = {extra = {energy = 3, energy_limit = 3}},
  loc_vars = function(self, info_queue, center)
    return {vars = {self.config.extra.energy, self.config.extra.energy_limit}}
  end,
	pos = { x = 0, y = 0 },
	atlas = "feraldeck",
  apply = function(self)
    G.GAME.modifiers.feraldeck = true
  end
} 

local dList = {hordedeck, feraldeck}

return {name = "Back",
        -- init = init,
        list = dList
}