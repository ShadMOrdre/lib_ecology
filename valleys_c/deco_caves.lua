----------------------
-- Cave Decorations --
----------------------

-- Mushrooms and Speleothems
--  These are instantiated by voxel.lua since the decoration manager
--   only works at the surface of the world.

local light_max = 9

minetest.register_node("lib_ecology:huge_mushroom_cap", {
	description = "Huge Mushroom Cap",
	tiles = {"vmg_mushroom_giant_cap.png", "vmg_mushroom_giant_under.png", "vmg_mushroom_giant_cap.png"},
	is_ground_content = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", 
		fixed = {
			{-0.5, -0.5, -0.33, 0.5, -0.33, 0.33}, 
			{-0.33, -0.5, 0.33, 0.33, -0.33, 0.5}, 
			{-0.33, -0.5, -0.33, 0.33, -0.33, -0.5}, 
			{-0.33, -0.33, -0.33, 0.33, -0.17, 0.33}, 
		} },
	light_source = 4,
	groups = {fleshy=1, dig_immediate=3, flammable=2, plant=1, leafdecay=1},
})

minetest.register_node("lib_ecology:giant_mushroom_cap", {
	description = "Giant Mushroom Cap",
	tiles = {"vmg_mushroom_giant_cap.png", "vmg_mushroom_giant_under.png", "vmg_mushroom_giant_cap.png"},
	is_ground_content = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", 
		fixed = {
			{-0.4, -0.5, -0.4, 0.4, 0.0, 0.4},
			{-0.75, -0.5, -0.4, -0.4, -0.25, 0.4},
			{0.4, -0.5, -0.4, 0.75, -0.25, 0.4},
			{-0.4, -0.5, -0.75, 0.4, -0.25, -0.4},
			{-0.4, -0.5, 0.4, 0.4, -0.25, 0.75},
		} },
	light_source = 8,
	groups = {fleshy=1, dig_immediate=3, flammable=2, plant=1, leafdecay=1},
})

minetest.register_node("lib_ecology:giant_mushroom_stem", {
	description = "Giant Mushroom Stem",
	tiles = {"vmg_mushroom_giant_stem.png", "vmg_mushroom_giant_stem.png", "vmg_mushroom_giant_stem.png"},
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2, plant=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", fixed = { {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, }},
})

-- Mushroom stems can be used as wood, ala Journey to the Center of the Earth.
minetest.register_craft({
	output = "default:wood",
	recipe = {
		{"lib_ecology:giant_mushroom_stem"}
	}
})

-- Caps can be cooked and eaten.
minetest.register_node("lib_ecology:mushroom_steak", {
	description = "Mushroom Steak",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"vmg_mushroom_steak.png"},
	inventory_image = "vmg_mushroom_steak.png",
	on_use = minetest.item_eat(4),
	groups = {dig_immediate = 3, attached_node = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:mushroom_steak",
	recipe = "lib_ecology:huge_mushroom_cap",
	cooktime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:mushroom_steak 2",
	recipe = "lib_ecology:giant_mushroom_cap",
	cooktime = 2,
})

--[[
-- -- Glowing fungal stone provides an eerie light.
-- minetest.register_node("lib_ecology:glowing_fungal_stone", {
	-- description = "Glowing Fungal Stone",
	-- tiles = {"default_stone.png^vmg_glowing_fungal.png",},
	-- is_ground_content = true,
	-- light_source = 8,
	-- groups = {cracky=3, stone=1},
	-- drop = {items={ {items={"default:cobble"},}, {items={"lib_ecology:glowing_fungus",},},},},
	-- sounds = default.node_sound_stone_defaults(),
-- })

-- minetest.register_node("lib_ecology:glowing_fungus", {
	-- description = "Glowing Fungus",
	-- drawtype = "plantlike",
	-- paramtype = "light",
	-- tiles = {"vmg_glowing_fungus.png"},
	-- inventory_image = "vmg_glowing_fungus.png",
	-- groups = {dig_immediate = 3, attached_node = 1},
-- })

-- -- The fungus can be made into juice and then into glowing glass.
-- minetest.register_node("lib_ecology:moon_juice", {
	-- description = "Moon Juice",
	-- drawtype = "plantlike",
	-- paramtype = "light",
	-- tiles = {"vmg_moon_juice.png"},
	-- inventory_image = "vmg_moon_juice.png",
	-- groups = {dig_immediate = 3, attached_node = 1},
	-- sounds = default.node_sound_glass_defaults(),
-- })

-- minetest.register_node("lib_ecology:moon_glass", {
	-- description = "Moon Glass",
	-- drawtype = "glasslike",
	-- tiles = {"default_glass.png",},
	-- inventory_image = minetest.inventorycube("default_glass.png"),
	-- is_ground_content = true,
	-- light_source = default.LIGHT_MAX,
	-- groups = {cracky=3},
	-- sounds = default.node_sound_glass_defaults(),
-- })

-- minetest.register_craft({
	-- output = "lib_ecology:moon_juice",
	-- recipe = {
		-- {"lib_ecology:glowing_fungus", "lib_ecology:glowing_fungus", "lib_ecology:glowing_fungus"},
		-- {"lib_ecology:glowing_fungus", "lib_ecology:glowing_fungus", "lib_ecology:glowing_fungus"},
		-- {"lib_ecology:glowing_fungus", "vessels:glass_bottle", "lib_ecology:glowing_fungus"},
	-- },
-- })

-- minetest.register_craft({
	-- output = "lib_ecology:moon_glass",
	-- type = "shapeless",
	-- recipe = {
		-- "lib_ecology:moon_juice",
		-- "lib_ecology:moon_juice",
		-- "default:glass",
	-- },
-- })
--]]

-- What's a cave without speleothems?
local spel = {
	{type1="stalactite", type2="stalagmite", tile="default_stone.png"},
	{type1="stalactite_slimy", type2="stalagmite_slimy", tile="default_stone.png^valc_algae.png"},
	{type1="stalactite_mossy", type2="stalagmite_mossy", tile="default_stone.png^valc_moss.png"},
	{type1="icicle_down", type2="icicle_up", desc="Icicle", tile="caverealms_thin_ice.png", drop="default:ice"},
}

for _, desc in pairs(spel) do
	minetest.register_node("lib_ecology:"..desc.type1, {
		description = (desc.desc or "Stalactite"),
		tiles = {desc.tile},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		--light_source = 14,
		drop = (desc.drop or "lib_ecology:stalactite"),
		drawtype = "nodebox",
		node_box = { type = "fixed", 
			fixed = {
				{-0.07, 0.0, -0.07, 0.07, 0.5, 0.07}, 
				{-0.04, -0.25, -0.04, 0.04, 0.0, 0.04}, 
				{-0.02, -0.5, -0.02, 0.02, 0.25, 0.02}, 
			} },
		groups = {rock=1, cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node("lib_ecology:"..desc.type2, {
		description = (desc.desc or "Stalagmite"),
		tiles = {desc.tile},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		--light_source = 14,
		drop = "lib_ecology:stalagmite",
		drawtype = "nodebox",
		node_box = { type = "fixed", 
			fixed = {
				{-0.07, -0.5, -0.07, 0.07, 0.0, 0.07}, 
				{-0.04, 0.0, -0.04, 0.04, 0.25, 0.04}, 
				{-0.02, 0.25, -0.02, 0.02, 0.5, 0.02}, 
			} },
		groups = {rock=1, cracky=3},
		sounds = default.node_sound_stone_defaults(),
	})
end

-- They can be made into cobblestone, to get them out of inventory.
minetest.register_craft({
	output = "default:cobble",
	recipe = {
		{"", "", ""},
		{"lib_ecology:stalactite", "lib_ecology:stalactite", ""},
		{"lib_ecology:stalactite", "lib_ecology:stalactite", ""},
	},
})

minetest.register_craft({
	output = "default:cobble",
	recipe = {
		{"", "", ""},
		{"lib_ecology:stalagmite", "lib_ecology:stalagmite", ""},
		{"lib_ecology:stalagmite", "lib_ecology:stalagmite", ""},
	},
})

--[[
-- minetest.register_node("lib_ecology:glowing_dirt", {
	-- description = "Glowing Dirt",
	-- tiles = {"default_dirt.png"},
	-- groups = {crumbly = 3, soil = 1},
	-- light_source = default.LIGHT_MAX,
	-- sounds = default.node_sound_dirt_defaults(),
	-- soil = {
		-- base = "lib_ecology:glowing_dirt",
		-- dry = "lib_ecology:glowing_soil",
		-- wet = "lib_ecology:glowing_soil_wet"
	-- },
-- })

-- minetest.register_node("lib_ecology:glowing_soil", {
	-- description = "Glowing Soil",
	-- tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	-- drop = "lib_ecology:glowing_dirt",
	-- groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	-- sounds = default.node_sound_dirt_defaults(),
	-- light_source = default.LIGHT_MAX,
	-- soil = {
		-- base = "lib_ecology:glowing_dirt",
		-- dry = "lib_ecology:glowing_soil",
		-- wet = "lib_ecology:glowing_soil_wet"
	-- },
-- })

-- minetest.register_node("lib_ecology:glowing_soil_wet", {
	-- description = "Wet Glowing Soil",
	-- tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	-- drop = "lib_ecology:glowing_dirt",
	-- groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	-- sounds = default.node_sound_dirt_defaults(),
	-- light_source = default.LIGHT_MAX,
	-- soil = {
		-- base = "lib_ecology:glowing_dirt",
		-- dry = "lib_ecology:glowing_soil",
		-- wet = "lib_ecology:glowing_soil_wet"
	-- },
-- })

-- minetest.register_craft({
	-- output = "lib_ecology:glowing_dirt",
	-- type = "shapeless",
	-- recipe = {
		-- "lib_ecology:moon_juice",
		-- "default:dirt",
	-- },
-- })
--]]

--thin (transparent) ice
minetest.register_node("lib_ecology:thin_ice", {
	description = "Thin Ice",
	tiles = {"caverealms_thin_ice.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
	use_texture_alpha = true,
	light_source = 1,
	drawtype = "glasslike",
	sunlight_propagates = true,
	freezemelt = "default:water_source",
	paramtype = "light",
})

minetest.register_node("lib_ecology:stone_with_moss", {
	description = "Cave Stone with Moss",
	tiles = {"default_stone.png^valc_moss.png"},
	is_ground_content = true,
	light_source = 1,
	groups = {stone=1, crumbly=3},
	drop = 'default:cobble',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("lib_ecology:stone_with_lichen", {
	description = "Cave Stone with Lichen",
	tiles = {"default_stone.png^valc_lichen.png"},
	is_ground_content = true,
	light_source = 1,
	groups = {stone=1, crumbly=3},
	drop = 'default:cobble',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("lib_ecology:stone_with_algae", {
	description = "Cave Stone with Algae",
	tiles = {"default_stone.png^valc_algae.png"},
	is_ground_content = true,
	light_source = 1,
	groups = {stone=1, crumbly=3},
	drop = 'default:cobble',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})

minetest.register_node("lib_ecology:stone_with_salt", {
	description = "Cave Stone with Salt",
	tiles = {"caverealms_salty2.png"},--{"caverealms_salty2.png^caverealms_salty.png", "caverealms_salty2.png", "caverealms_salty2.png^caverealms_salty_side.png"},
	light_source = 9,
	paramtype = "light",
	use_texture_alpha = true,
	drawtype = "glasslike",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {stone=1, crumbly=3},
	sounds = default.node_sound_glass_defaults(),
})

--[[
-- --Glow Obsidian
-- minetest.register_node("lib_ecology:glow_obsidian", {
	-- description = "Glowing Obsidian",
	-- tiles = {"caverealms_glow_obsidian.png"},
	-- is_ground_content = true,
	-- groups = {stone=2, crumbly=1},
	-- light_source = 7,
	-- sounds = default.node_sound_stone_defaults({
		-- footstep = {name="default_stone_footstep", gain=0.25},
	-- }),
-- })

-- --Glow Obsidian 2 - has traces of lava
-- minetest.register_node("lib_ecology:glow_obsidian_2", {
	-- description = "Hot Glow Obsidian",
	-- tiles = {"caverealms_glow_obsidian2.png"},
	-- is_ground_content = true,
	-- groups = {stone=2, crumbly=1, hot=1},
	-- damage_per_second = 1,
	-- light_source = 9,
	-- sounds = default.node_sound_stone_defaults({
		-- footstep = {name="default_stone_footstep", gain=0.25},
	-- }),
-- })

--minetest.register_node("lib_ecology:bright_air", {
--	drawtype = "glasslike",
--	tiles = {"technic_light.png"},
--	paramtype = "light",
--	groups = {not_in_creative_inventory=1},
--	drop = "",
--	walkable = false,
--	buildable_to = true,
--	sunlight_propagates = true,
--	light_source = LIGHT_MAX,
--	pointable = false,
--})
--]]

--define special flame so that it does not expire
minetest.register_node("lib_ecology:constant_flame", {
	description = "Fire",
	drawtype = "plantlike",
	tiles = {{
		name="fire_basic_flame_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	inventory_image = "fire_basic_flame.png",
	light_source = 14,
	groups = {igniter=2,dig_immediate=3,hot=3, not_in_creative_inventory=1},
	drop = '',
	walkable = false,
	buildable_to = true,
	damage_per_second = 4,
	
	--after_place_node = function(pos, placer)
	--	if pos.y > -7000 then
	--		minetest.remove_node(pos)
	--	end
	--end,
})

--Hot Cobble - cobble with lava instead of mortar XD
minetest.register_node("lib_ecology:hot_cobble", {
	description = "Hot Cobble",
	tiles = {"caverealms_hot_cobble.png"},
	is_ground_content = true,
	groups = {crumbly=2, hot=1},
	damage_per_second = 1,
	light_source = 3,
	sounds = default.node_sound_stone_defaults({
		footstep = {name="default_stone_footstep", gain=0.25},
	}),
})

--[[
-- -- mushroom growth
-- minetest.register_abm({
	-- nodenames = {"flowers:mushroom_brown", "flowers:mushroom_red"},
	-- interval = 50 * lib_ecology.time_factor,
	-- chance = 100,
	-- action = function(pos, node)
		-- if pos.y > -50 then
			-- return
		-- end
		-- local pos_up = {x=pos.x,y=pos.y+1,z=pos.z}
		-- local node_up = minetest.get_node_or_nil(pos_up)
		-- if not node_up then
			-- return
		-- end
		-- if node_up.name ~= "air" then
			-- return
		-- end
		-- local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		-- if not node_under then
			-- return
		-- end
		-- if minetest.get_item_group(node_under.name, "soil") ~= 0 and
				-- minetest.get_node_light(pos_up, nil) <= light_max then
			-- minetest.set_node(pos_up, {name = "lib_ecology:huge_mushroom_cap"})
			-- minetest.set_node(pos, {name = "lib_ecology:giant_mushroom_stem"})
		-- end
	-- end
-- })

-- -- mushroom growth
-- minetest.register_abm({
	-- nodenames = {"lib_ecology:huge_mushroom_cap"},
	-- interval = 100 * lib_ecology.time_factor,
	-- chance = 150,
	-- action = function(pos, node)
		-- if minetest.get_node_light(pos, nil) >= 14 then
			-- minetest.set_node(pos, {name = "air"})
			-- return
		-- end
		-- local pos_up = {x=pos.x,y=pos.y+1,z=pos.z}
		-- local node_up = minetest.get_node_or_nil(pos_up)
		-- if not node_up then
			-- return
		-- end
		-- if node_up.name ~= "air" then
			-- return
		-- end
		-- local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		-- if not node_under or node_under.name ~= "lib_ecology:giant_mushroom_stem" then
			-- return
		-- end
		-- node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 2, z = pos.z})
		-- if not node_under then
			-- return
		-- end
		-- if minetest.get_item_group(node_under.name, "soil") ~= 0 and
				-- minetest.get_node_light(pos_up, nil) <= light_max then
			-- minetest.set_node(pos_up, {name = "lib_ecology:giant_mushroom_cap"})
			-- minetest.set_node(pos, {name = "lib_ecology:giant_mushroom_stem"})
		-- end
	-- end
-- })

-- -- mushroom growth
-- minetest.register_abm({
	-- nodenames = {"lib_ecology:giant_mushroom_stem"},
	-- interval = 5 * lib_ecology.time_factor,
	-- chance = 5,
	-- action = function(pos, node)
		-- local pos_up = {x=pos.x,y=pos.y+1,z=pos.z}
		-- local node_up = minetest.get_node_or_nil(pos_up)
		-- if not node_up then
			-- return
		-- end
		-- if node_up.name ~= "air" then
			-- return
		-- end
		-- if minetest.get_node_light(pos_up, nil) <= light_max then
			-- minetest.set_node(pos_up, {name = "lib_ecology:huge_mushroom_cap"})
		-- end
	-- end
-- })

-- -- mushroom spread
-- minetest.register_abm({
	-- nodenames = {"lib_ecology:giant_mushroom_cap", "lib_ecology:huge_mushroom_cap"},
	-- interval = 3 * lib_ecology.time_factor,
	-- chance = 40,
	-- action = function(pos, node)
		-- if minetest.get_node_light(pos, nil) >= 14 then
			-- minetest.set_node(pos, {name = "air"})
			-- return
		-- end
		-- local pos_down = pos
		-- pos_down.y = pos_down.y - 1
		-- local pos1, count = minetest.find_nodes_in_area_under_air(vector.subtract(pos_down, 4), vector.add(pos_down, 4), {"group:soil"})
		-- if #pos1 < 1 then
			-- return
		-- end
		-- local random = pos1[math.random(1, #pos1)]
		-- random.y = random.y + 1
		-- local mushroom_type
		-- if math.random(1,2) == 1 then
			-- mushroom_type = "flowers:mushroom_red"
		-- else
			-- mushroom_type = "flowers:mushroom_brown"
		-- end
		-- if minetest.get_node_light(random, nil) <= light_max then
			-- minetest.set_node(random, {name = mushroom_type})
		-- end
	-- end
-- })
--]]