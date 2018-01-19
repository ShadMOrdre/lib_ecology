
local S = lib_ecology.intllib

-- willow trunk
minetest.register_node(":ethereal:willow_trunk", {
	description = S("Willow Trunk"),
	tiles = {
		"willow_trunk_top.png",
		"willow_trunk_top.png",
		"willow_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- willow wood
minetest.register_node("lib_ecology:willow_wood", {
	description = S("Willow Wood"),
	tiles = {"willow_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:willow_wood 4",
	recipe = {{"lib_ecology:willow_trunk"}}
})

-- redwood trunk
minetest.register_node(":ethereal:redwood_trunk", {
	description = S("Redwood Trunk"),
	tiles = {
		"redwood_trunk_top.png",
		"redwood_trunk_top.png",
		"redwood_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- redwood wood
minetest.register_node("lib_ecology:redwood_wood", {
	description = S("Redwood Wood"),
	tiles = {"redwood_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:redwood_wood 4",
	recipe = {{"lib_ecology:redwood_trunk"}},
})

-- frost trunk
minetest.register_node(":ethereal:frost_tree", {
	description = S("Frost Tree"),
	tiles = {
		"ethereal_frost_tree_top.png",
		"ethereal_frost_tree_top.png",
		"ethereal_frost_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- frost wood
minetest.register_node("lib_ecology:frost_wood", {
	description = S("Frost Wood"),
	tiles = {"frost_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:frost_wood 4",
	recipe = {{"lib_ecology:frost_tree"}}
})

-- healing trunk
minetest.register_node(":ethereal:yellow_trunk", {
	description = S("Healing Tree Trunk"),
	tiles = {
		"yellow_tree_top.png",
		"yellow_tree_top.png",
		"yellow_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- healing wood
minetest.register_node("lib_ecology:yellow_wood", {
	description = S("Healing Tree Wood"),
	tiles = {"yellow_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:yellow_wood 4",
	recipe = {{"lib_ecology:yellow_trunk"}}
})

-- palm trunk (thanks to VanessaE for palm textures)
minetest.register_node(":ethereal:palm_trunk", {
	description = S("Palm Trunk"),
	tiles = {
		"moretrees_palm_trunk_top.png",
		"moretrees_palm_trunk_top.png",
		"moretrees_palm_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- palm wood
minetest.register_node("lib_ecology:palm_wood", {
	description = S("Palm Wood"),
	tiles = {"moretrees_palm_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:palm_wood 4",
	recipe = {{"lib_ecology:palm_trunk"}}
})

-- banana trunk
minetest.register_node("lib_ecology:banana_trunk", {
	description = S("Banana Trunk"),
	tiles = {
		"banana_trunk_top.png",
		"banana_trunk_top.png",
		"banana_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- banana wood
minetest.register_node("lib_ecology:banana_wood", {
	description = S("Banana Wood"),
	tiles = {"banana_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:banana_wood 4",
	recipe = {{"lib_ecology:banana_trunk"}}
})

-- scorched trunk
minetest.register_node("lib_ecology:scorched_tree", {
	description = S("Scorched Tree"),
	tiles = {
		"scorched_tree_top.png",
		"scorched_tree_top.png",
		"scorched_tree.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

minetest.register_craft({
	output = "lib_ecology:scorched_tree 8",
	recipe = {
		{"group:tree", "group:tree", "group:tree"},
		{"group:tree", "default:torch", "group:tree"},
		{"group:tree", "group:tree", "group:tree"},
	}
})

-- mushroom trunk
minetest.register_node(":ethereal:mushroom_trunk", {
	description = S("Mushroom"),
	tiles = {
		"mushroom_trunk_top.png",
		"mushroom_trunk_top.png",
		"mushroom_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- birch trunk (thanks to VanessaE for birch textures)
minetest.register_node("lib_ecology:birch_trunk", {
	description = S("Birch Trunk"),
	tiles = {
		"moretrees_birch_trunk_top.png",
		"moretrees_birch_trunk_top.png",
		"moretrees_birch_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})

-- birch wood
minetest.register_node("lib_ecology:birch_wood", {
	description = S("Birch Wood"),
	tiles = {"moretrees_birch_wood.png"},
	is_ground_content = false,
	groups = {wood = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:birch_wood 4",
	recipe = {{"lib_ecology:birch_trunk"}}
})

-- Bamboo (thanks to Nelo-slay on DeviantArt for the free Bamboo base image)
minetest.register_node("lib_ecology:bamboo", {
	description = S("Bamboo"),
	drawtype = "nodebox",
	tiles = {"bamboo.png^[transformR90^bamboo.png","bamboo.png^[transformR90^bamboo.png","bamboo.png","bamboo.png^[transformFX","bamboo.png^[transformFX","bamboo.png"},
	inventory_image = "bamboo.png",
	wield_image = "bamboo.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.25, 0.5, 0.25}, -- Stalk
			{-0.25, 0.3125, -0.0625, -0.1875, 0.4375, 0.125}, -- NodeBox2
			{-0.0625, 0.3125, -0.25, 0.125, 0.4375, -0.1875}, -- NodeBox3
			{0.25, 0.125, -0.0625, 0.3125, 0.4375, 0.125}, -- NodeBox4
			{-0.0625, 0.125, 0.25, 0.125, 0.4375, 0.3125}, -- NodeBox5
			{-0.25, -0.4375, -0.0625, -0.1875, -0.3125, 0.125}, -- NodeBox6
			{-0.0625, -0.4375, -0.25, 0.125, -0.3125, -0.1875}, -- NodeBox7
			{-0.375, -0.375, -0.0625, -0.25, -0.3125, 0.125}, -- NodeBox8
			{-0.0625, -0.375, -0.375, 0.125, -0.3125, -0.25}, -- NodeBox9
			{0.3125, 0.1875, -0.0625, 0.375, 0.25, 0.125}, -- NodeBox10
			{0.375, 0.25, -0.0625, 0.4375, 0.3125, 0.125}, -- NodeBox11
			{-0.0625, 0.1875, 0.3125, 0.125, 0.25, 0.375}, -- NodeBox12
			{-0.0625, 0.25, 0.375, 0.125, 0.3125, 0.4375}, -- NodeBox13
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.25, 0.5, 0.25}, -- Stalk
			{-0.25, 0.3125, -0.0625, -0.1875, 0.4375, 0.125}, -- NodeBox2
			{-0.0625, 0.3125, -0.25, 0.125, 0.4375, -0.1875}, -- NodeBox3
			{0.25, 0.125, -0.0625, 0.3125, 0.4375, 0.125}, -- NodeBox4
			{-0.0625, 0.125, 0.25, 0.125, 0.4375, 0.3125}, -- NodeBox5
			{-0.25, -0.4375, -0.0625, -0.1875, -0.3125, 0.125}, -- NodeBox6
			{-0.0625, -0.4375, -0.25, 0.125, -0.3125, -0.1875}, -- NodeBox7
			{-0.375, -0.375, -0.0625, -0.25, -0.3125, 0.125}, -- NodeBox8
			{-0.0625, -0.375, -0.375, 0.125, -0.3125, -0.25}, -- NodeBox9
			{0.3125, 0.1875, -0.0625, 0.375, 0.25, 0.125}, -- NodeBox10
			{0.375, 0.25, -0.0625, 0.4375, 0.3125, 0.125}, -- NodeBox11
			{-0.0625, 0.1875, 0.3125, 0.125, 0.25, 0.375}, -- NodeBox12
			{-0.0625, 0.25, 0.375, 0.125, 0.3125, 0.4375}, -- NodeBox13
		}
	},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_craft({
	type = "fuel",
	recipe = "lib_ecology:bamboo",
	burntime = 1,
})


minetest.register_node("lib_ecology:bamboo2", {
	description = S("Bamboo 2"),
	drawtype = "plantlike",
	tiles = {"bamboo.png"},
	inventory_image = "bamboo.png",
	wield_image = "bamboo.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
	sounds = default.node_sound_leaves_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_craft({
	type = "fuel",
	recipe = "lib_ecology:bamboo2",
	burntime = 1,
})
