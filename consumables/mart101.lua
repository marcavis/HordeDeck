local repeatball = {
    name = "repeatball",
    key = "repeatball",
    set = "Spectral",
    loc_vars = function(self, info_queue, center)
        --  info_queue[#info_queue+1] = {set = 'Other', key = 'basic'}
        return {vars = {}}
    end,
    pos = { x = 0, y = 0 },
    atlas = "hordeitems", --Thank you Sonfive!
    cost = 4,
    pokeball = true,
    hidden=true,
    soul_set = "Item",
    soul_rate = .005,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers then
            for i, v in ipairs(G.jokers.cards) do
                local basickey = get_lowest_evo(v)
                if v and basickey and G.P_CENTERS[basickey].rarity ~= 4 then return true end
            end
        else
            return false
        end
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            --   local _card = create_repeated_poke_joker("pokeball")
            local _card = create_repeated_poke_joker("pokeball")
            _card.sell_cost = 1
            _card:add_to_deck()
            G.jokers:emplace(_card)
            return true end }))
            delay(0.6)
        end,
    in_pool = function(self)
        if G.jokers and G.jokers.cards and #G.jokers.cards > 0 then
            return true
        else
            return false
        end
    end  
    }
    
    local list = {repeatball}
    
    return {name = "Mart 9",
    list = list
}