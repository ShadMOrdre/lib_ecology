
local S = lib_ecology.intllib

-- Bamboo Sprout
minetest.register_node("lib_ecology:bamboo_sprout", {
	description = S("Bamboo Sprout"),
	drawtype = "plantlike",
	tiles = {"bamboo_sprout.png"},
	inventory_image = "bamboo_sprout.png",
	wield_image = "bamboo_sprout.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {
		snappy = 3, attached_node = 1, flammable = 2,
		dig_immediate = 3, lib_ecology_sapling = 1
	},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 0, 4 / 16}
	},
	on_use = minetest.item_eat(-2),
	grown_height = 11,
})

-- Register Saplings
lib_ecology.register_sapling = function(name, desc, texture, height)

	minetest.register_node(name .. "_sapling", {
		description = S(desc .. " Tree Sapling"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {texture .. ".png"},
		inventory_image = texture .. ".png",
		wield_image = texture .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			lib_ecology_sapling = 1, attached_node = 1
		},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,
	})
end

lib_ecology.register_sapling("lib_ecology:willow", "Willow", "willow_sapling", 14)
lib_ecology.register_sapling("lib_ecology:yellow_tree", "Healing", "yellow_tree_sapling", 19)
lib_ecology.register_sapling("lib_ecology:big_tree", "Big", "ethereal_big_tree_sapling", 7)
lib_ecology.register_sapling("lib_ecology:banana_tree", "Banana", "banana_tree_sapling", 8)
lib_ecology.register_sapling("lib_ecology:frost_tree", "Frost", "ethereal_frost_tree_sapling", 19)
lib_ecology.register_sapling("lib_ecology:mushroom", "Mushroom", "ethereal_mushroom_sapling", 11)
lib_ecology.register_sapling("lib_ecology:palm", "Palm", "moretrees_palm_sapling", 9)
lib_ecology.register_sapling("lib_ecology:redwood", "Redwood", "redwood_sapling", 31)
lib_ecology.register_sapling("lib_ecology:orange_tree", "Orange", "orange_tree_sapling", 6)
lib_ecology.register_sapling("lib_ecology:birch", "Birch", "moretrees_birch_sapling", 7)

lib_ecology.add_tree = function (pos, ofx, ofy, ofz, schem)
	-- check for schematic
	if not schem then
		print (S("Schematic not found"))
		return
	end
	-- remove sapling and place schematic
	minetest.swap_node(pos, {name = "air"})
	minetest.place_schematic(
		{x = pos.x - ofx, y = pos.y - ofy, z = pos.z - ofz},
		schem, 0, nil, false)
end

--local path = minetest.get_modpath("lib_ecology").."/schematics/"

-- grow tree functions
function lib_ecology.grow_yellow_tree(pos)
	lib_ecology.add_tree(pos, 4, 0, 4, lib_ecology.path .. "/schematics/yellowtree.mts")
end

function lib_ecology.grow_big_tree(pos)
	lib_ecology.add_tree(pos, 4, 0, 4, lib_ecology.path .. "/schematics/bigtree.mts")
end

function lib_ecology.grow_banana_tree(pos)
	lib_ecology.add_tree(pos, 3, 0, 3, lib_ecology.bananatree)
end

function lib_ecology.grow_frost_tree(pos)
	lib_ecology.add_tree(pos, 4, 0, 4, lib_ecology.path .. "/schematics/frosttrees.mts")
end

function lib_ecology.grow_mushroom_tree(pos)
	lib_ecology.add_tree(pos, 4, 0, 4, lib_ecology.path .. "/schematics/mushroomone.mts")
end

function lib_ecology.grow_palm_tree(pos)
	lib_ecology.add_tree(pos, 4, 0, 4, lib_ecology.path .. "/schematics/palmtree.mts")
end

function lib_ecology.grow_willow_tree(pos)
	lib_ecology.add_tree(pos, 5, 0, 5, lib_ecology.path .. "/schematics/willow.mts")
end

function lib_ecology.grow_redwood_tree(pos)
	if math.random(1, 2) == 1 then
		lib_ecology.add_tree(pos, 9, 3, 9, lib_ecology.path .. "/schematics/redwood.mts") -- shinji
	else
		lib_ecology.add_tree(pos, 8, 6, 8, lib_ecology.path .. "/schematics/redwood_tree.mts") -- iska
	end
end

function lib_ecology.grow_orange_tree(pos)
	lib_ecology.add_tree(pos, 1, 0, 1, lib_ecology.orangetree)
end

function lib_ecology.grow_bamboo_tree(pos)
	lib_ecology.add_tree(pos, 1, 0, 1, lib_ecology.bambootree)
end

function lib_ecology.grow_birch_tree(pos)
	lib_ecology.add_tree(pos, 2, 0, 2, lib_ecology.birchtree)
end

-- check if sapling has enough height room to grow
local function enough_height(pos, height)

	local nod = minetest.line_of_sight(
		{x = pos.x, y = pos.y + 1, z = pos.z},
		{x = pos.x, y = pos.y + height, z = pos.z})

	if not nod then
		return false -- obstructed
	else
		return true -- can grow
	end
end

lib_ecology.grow_sapling = function (pos, node)

	local under =  minetest.get_node({
		x = pos.x,
		y = pos.y - 1,
		z = pos.z
	}).name

	if not minetest.registered_nodes[node.name] then
		return
	end

	local height = minetest.registered_nodes[node.name].grown_height

	-- do we have enough height to grow sapling into tree?
	if not height or not enough_height(pos, height) then
		return
	end

	-- Check if lib_ecology Sapling is growing on correct substrate
	if node.name == "lib_ecology:yellow_tree_sapling"
	and under == "default:dirt_with_snow" then
		lib_ecology.grow_yellow_tree(pos)

	elseif node.name == "lib_ecology:big_tree_sapling"
	and under == "lib_ecology:green_dirt" then
		lib_ecology.grow_big_tree(pos)

	elseif node.name == "lib_ecology:banana_tree_sapling"
	and under == "lib_ecology:grove_dirt" then
		lib_ecology.grow_banana_tree(pos)

	elseif node.name == "lib_ecology:frost_tree_sapling"
	and under == "lib_ecology:crystal_dirt" then
		lib_ecology.grow_frost_tree(pos)

	elseif node.name == "lib_ecology:mushroom_sapling"
	and under == "lib_ecology:mushroom_dirt" then
		lib_ecology.grow_mushroom_tree(pos)

	elseif node.name == "lib_ecology:palm_sapling"
	and under == "default:sand" then
		lib_ecology.grow_palm_tree(pos)

	elseif node.name == "lib_ecology:willow_sapling"
	and under == "lib_ecology:gray_dirt" then
		lib_ecology.grow_willow_tree(pos)

	elseif node.name == "lib_ecology:redwood_sapling"
	and under == "bakedclay:red" then
		lib_ecology.grow_redwood_tree(pos)

	elseif node.name == "lib_ecology:orange_tree_sapling"
	and under == "lib_ecology:prairie_dirt" then
		lib_ecology.grow_orange_tree(pos)

	elseif node.name == "lib_ecology:bamboo_sprout"
	and under == "lib_ecology:bamboo_dirt" then
		lib_ecology.grow_bamboo_tree(pos)

	elseif node.name == "lib_ecology:birch_sapling"
	and under == "lib_ecology:green_dirt" then
		lib_ecology.grow_birch_tree(pos)
	end

end

-- Grow saplings
minetest.register_abm({
	label = "lib_ecology grow sapling",
	nodenames = {"group:lib_ecology_sapling"},
	interval = 10,
	chance = 50,
	catch_up = false,
	action = function(pos, node)

		local light_level = minetest.get_node_light(pos)

		if not light_level or light_level < 13 then
			return
		end

		lib_ecology.grow_sapling(pos, node)
	end,
})

-- burn saplings
minetest.register_craft({
	type = "fuel",
	recipe = "group:lib_ecology_sapling",
	burntime = 10,
})
