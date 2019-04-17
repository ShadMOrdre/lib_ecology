
local S = lib_ecology.intllib

-- -- Ice Brick
-- minetest.register_node("lib_ecology:icebrick", {
	-- description = S("Ice Brick"),
	-- tiles = {"brick_ice.png"},
	-- paramtype = "light",
	-- freezemelt = "default:water_source",
	-- is_ground_content = false,
	-- groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1},
	-- sounds = default.node_sound_glass_defaults(),
-- })

-- minetest.register_craft({
	-- output = 'lib_ecology:icebrick 4',
	-- recipe = {
		-- {'default:ice', 'default:ice'},
		-- {'default:ice', 'default:ice'},
	-- }
-- })

-- -- Snow Brick
-- minetest.register_node("lib_ecology:snowbrick", {
	-- description = S("Snow Brick"),
	-- tiles = {"brick_snow.png"},
	-- paramtype = "light",
	-- freezemelt = "default:water_source",
	-- is_ground_content = false,
	-- groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1},
	-- sounds = default.node_sound_dirt_defaults({
		-- footstep = {name = "default_snow_footstep", gain = 0.15},
		-- dug = {name = "default_snow_footstep", gain = 0.2},
		-- dig = {name = "default_snow_footstep", gain = 0.2},
	-- }),
-- })

-- minetest.register_craft({
	-- output = 'lib_ecology:snowbrick 4',
	-- recipe = {
		-- {'default:snowblock', 'default:snowblock'},
		-- {'default:snowblock', 'default:snowblock'},
	-- }
-- })

-- If Crystal Spike, Crystal Dirt, Snow near Water, change Water to Ice
minetest.register_abm({
	label = "lib_ecology freeze water",
	nodenames = {
		"lib_ecology:crystal_spike", "default:snow", "default:snowblock",
		"lib_ecology:snowbrick"
	},
	neighbors = {"default:water_source", "default:river_water_source"},
	interval = 15,
	chance = 4,
	catch_up = false,
	action = function(pos, node)

		local near = minetest.find_node_near(pos, 1,
			{"default:water_source", "default:river_water_source"})

		if near then
			minetest.swap_node(near, {name = "default:ice"})
		end
	end,
})

-- If Heat Source near Ice or Snow then melt
minetest.register_abm({
	label = "lib_ecology melt snow/ice",
	nodenames = {
		"default:ice", "default:snowblock", "default:snow",
		"default:dirt_with_snow", "lib_ecology:snowbrick", "lib_ecology:icebrick"
	},
	neighbors = {
		"fire:basic_fire", "default:lava_source", "default:lava_flowing",
		"default:furnace_active", "default:torch"
	},
	interval = 5,
	chance = 4,
	catch_up = false,
	action = function(pos, node)

		local water_node = "default:water"

		if pos.y > 2 then
			water_node = "default:river_water"
		end

		if node.name == "default:ice"
		or node.name == "default:snowblock"
		or node.name == "lib_ecology:icebrick"
		or node.name == "lib_ecology:snowbrick" then
			minetest.swap_node(pos, {name = water_node.."_source"})

		elseif node.name == "default:snow" then
			minetest.swap_node(pos, {name = water_node.."_flowing"})

		elseif node.name == "default:dirt_with_snow" then
			minetest.swap_node(pos, {name = "default:dirt_with_grass"})
		end

		--nodeupdate(pos)
	end,
})

-- If Water Source near Dry Dirt, change to normal Dirt
minetest.register_abm({
	label = "lib_ecology wet dry dirt",
	nodenames = {"lib_ecology:dry_dirt", "default:dirt_with_dry_grass"},
	neighbors = {"group:water"},
	interval = 15,
	chance = 2,
	catch_up = false,
	action = function(pos, node)

		if node == "lib_ecology:dry_dirt" then
			minetest.swap_node(pos, {name = "default:dirt"})
		else
			minetest.swap_node(pos, {name = "lib_ecology:dirt_with_grass"})
		end
	end,
})

-- If torch touching water then drop as item (when enabled)
if lib_ecology.torchdrop == true then

minetest.register_abm({
	label = "lib_ecology drop torch",
	nodenames = {"default:torch", "default:torch_wall", "default:torch_ceiling"},
	neighbors = {"group:water"},
	interval = 5,
	chance = 1,
	catch_up = false,
	action = function(pos, node)

		local num = #minetest.find_nodes_in_area(
			{x = pos.x - 1, y = pos.y, z = pos.z},
			{x = pos.x + 1, y = pos.y, z = pos.z},
			{"group:water"})
if num == 0 then
		num = num + #minetest.find_nodes_in_area(
			{x = pos.x, y = pos.y, z = pos.z - 1},
			{x = pos.x, y = pos.y, z = pos.z + 1},
			{"group:water"})
end
if num == 0 then
		num = num + #minetest.find_nodes_in_area(
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{"group:water"})
end
		if num > 0 then

			minetest.set_node(pos, {name = "air"})

			minetest.add_item(pos, {name = "default:torch"})
		end
	end,
})

end
