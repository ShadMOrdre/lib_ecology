
local S = lib_ecology.intllib

-- wild onion
minetest.register_craftitem("lib_ecology:wild_onion_plant", {
	description = S("Wild Onion"),
	inventory_image = "wild_onion.png",
	wield_image = "wild_onion.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "lib_ecology:wild_onion_1")
	end,
	on_use = minetest.item_eat(2),
})

-- Define Onion growth stages
local crop_def = {
	drawtype = "plantlike",
	tiles = {"ethereal_wild_onion_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
	},
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		growing = 1, not_in_creative_inventory = 1
	},
	sounds = default.node_sound_leaves_defaults(),
}

--stage 1
minetest.register_node("lib_ecology:onion_1", table.copy(crop_def))

--stage 2
crop_def.tiles = {"ethereal_wild_onion_2.png"}
minetest.register_node("lib_ecology:onion_2", table.copy(crop_def))

--stage 3
crop_def.tiles = {"ethereal_wild_onion_3.png"}
minetest.register_node("lib_ecology:onion_3", table.copy(crop_def))

--stage 4
crop_def.tiles = {"ethereal_wild_onion_4.png"}
crop_def.drop = {
	items = {
		{items = {"lib_ecology:wild_onion_plant"}, rarity = 1},
		{items = {"lib_ecology:wild_onion_plant 2"}, rarity = 3},
	}
}
minetest.register_node("lib_ecology:onion_4", table.copy(crop_def))

--stage 5
crop_def.tiles = {"ethereal_wild_onion_5.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {"lib_ecology:wild_onion_plant 2"}, rarity = 1},
		{items = {"lib_ecology:wild_onion_plant 3"}, rarity = 2},
	}
}
minetest.register_node("lib_ecology:onion_5", table.copy(crop_def))

-- growing routine if farming redo isn't present
if not farming or not farming.mod or farming.mod ~= "redo" then

minetest.register_abm({
	label = "lib_ecology grow onion",
	nodenames = {"lib_ecology:onion_1", "lib_ecology:onion_2", "lib_ecology:onion_3", "lib_ecology:onion_4"},
	neighbors = {"farming:soil_wet"},
	interval = 9,
	chance = 20,
	catch_up = false,
	action = function(pos, node)

		-- are we on wet soil?
		pos.y = pos.y - 1
		if minetest.get_item_group(minetest.get_node(pos).name, "soil") < 3 then
			return
		end
		pos.y = pos.y + 1
		
		-- do we have enough light?
		local light = minetest.get_node_light(pos)

		if not light
		or light < 13 then
			return
		end
		
		-- grow to next stage
		local num = node.name:split("_")[2]

		node.name = "lib_ecology:onion_" .. tonumber(num + 1)

		minetest.swap_node(pos, node)
	end
})

end -- END IF
