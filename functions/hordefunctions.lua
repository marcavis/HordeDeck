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
    -- if pokermon isn't in a family, return false
    if not found_family then return false end
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