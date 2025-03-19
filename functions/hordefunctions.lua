get_lowest_evo = function(card)
	local name = nil
	local found = nil
	if not card.name and card.ability.name then
		name = card.ability.name
	else
		name = card.name or "bulbasaur"
	end

	-- find the pokermon's family list
	local found_family = nil
	for _, v in ipairs(family) do
		for _, y in ipairs(v) do
			if ((type(y) == "table" and y.key) or y) == name then
				found_family = v
			end
		end
	end
	-- if pokermon isn't in a family, return its own key
	if not found_family then return card.config.center.key end
	return get_full_key(found_family[1])
end

get_full_key = function(name)
	for _, v in pairs(G.P_CENTERS) do
		if v.name == name then
			return v.key
		end
	end
	return 'j_poke_caterpie'
end


create_repeated_poke_joker = function(pseed, area, poketype)
	local poke_keys = {}
	local pokearea = area or G.jokers
	local poke_key
	local create_args = {set = "Joker", area = pokearea, key = ''}

	for k, v in pairs(G.jokers.cards) do
		local thisbase = get_lowest_evo(v)
		if thisbase and G.P_CENTERS[thisbase].rarity ~= 4 then
			table.insert(poke_keys, thisbase)
		--if it's a single stage pokemon, it's fine to add
		elseif v.config.center.rarity ~= 4 and v.config.center.rarity ~= "poke_mega" then
			table.insert(poke_keys, v.config.center.key)
		end
	end

	if #poke_keys > 0 then
		poke_key = pseudorandom_element(poke_keys, pseudoseed(pseed))
	else
		poke_key = "j_poke_caterpie"
	end
	create_args.key = poke_key

	return SMODS.create_card(create_args)
end

