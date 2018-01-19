
local S = lib_ecology.intllib

-- Banana (Heals one heart when eaten)
minetest.register_node("lib_ecology:banana", {
	description = S("Banana"),
	drawtype = "torchlike",
	visual_scale = 1.0,
	tiles = {"banana_single.png"},
	inventory_image = "banana_single.png",
	wield_image = "banana_single.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.31, -0.5, -0.31, 0.31, 0.5, 0.31}
	},
	groups = {
		fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 1, leafdecay_drop = 1
	},
	drop = "lib_ecology:banana",
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer)
		if placer:is_player() then
			minetest.set_node(pos, {name = "lib_ecology:banana", param2 = 1})
		end
	end,
})

-- Banana Dough
minetest.register_craftitem("lib_ecology:banana_dough", {
	description = S("Banana Dough"),
	inventory_image = "banana_dough.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:banana_dough",
	recipe = {"farming:flour", "lib_ecology:banana"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 14,
	output = "lib_ecology:banana_bread",
	recipe = "lib_ecology:banana_dough"
})

-- Orange (Heals 2 hearts when eaten)
minetest.register_node("lib_ecology:orange", {
	description = S("Orange"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"farming_orange.png"},
	inventory_image = "farming_orange.png",
	wield_image = "farming_orange.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.27, -0.37, -0.27, 0.27, 0.44, 0.27}
	},
	groups = {
		fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1
	},
	drop = "lib_ecology:orange",
	on_use = minetest.item_eat(4),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer)
		if placer:is_player() then
			minetest.set_node(pos, {name = "lib_ecology:orange", param2 = 1})
		end
	end,
})

-- Pine Nuts (Heals 1/2 heart when eaten)
minetest.register_craftitem("lib_ecology:pine_nuts", {
	description = S("Pine Nuts"),
	inventory_image = "pine_nuts.png",
	wield_image = "pine_nuts.png",
	on_use = minetest.item_eat(1),
})

-- Banana Loaf (Heals 3 hearts when eaten)
minetest.register_craftitem("lib_ecology:banana_bread", {
	description = S("Banana Loaf"),
	inventory_image = "banana_bread.png",
	wield_image = "banana_bread.png",
	on_use = minetest.item_eat(6),
})

-- Coconut (Gives 4 coconut slices, each heal 1/2 heart)
minetest.register_node(":ethereal:coconut", {
	description = S("Coconut"),
	drawtype = "plantlike",
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"moretrees_coconut.png"},
	inventory_image = "moretrees_coconut.png",
	wield_image = "moretrees_coconut.png",
	selection_box = {
		type = "fixed",
		fixed = {-0.31, -0.43, -0.31, 0.31, 0.44, 0.31}
	},
	groups = {
		snappy = 1, oddly_breakable_by_hand = 1, cracky = 1,
		choppy = 1, flammable = 1, leafdecay = 3, leafdecay_drop = 1
	},
	drop = "lib_ecology:coconut_slice 4",
	sounds = default.node_sound_wood_defaults(),
})

-- Coconut Slice (Heals half heart when eaten)
minetest.register_craftitem("lib_ecology:coconut_slice", {
	description = S("Coconut Slice"),
	inventory_image = "moretrees_coconut_slice.png",
	wield_image = "moretrees_coconut_slice.png",
	on_use = minetest.item_eat(1),
})

-- Golden Apple (Found on Healing Tree, heals all 10 hearts)
minetest.register_node(":ethereal:golden_apple", {
	description = S("Golden Apple"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_apple_gold.png"},
	inventory_image = "default_apple_gold.png",
	wield_image = "default_apple_gold.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.37, -0.2, 0.2, 0.31, 0.2}
	},
	groups = {
		fleshy = 3, dig_immediate = 3,
		leafdecay = 3,leafdecay_drop = 1
	},
	drop = ":ethereal:golden_apple",
	on_use = minetest.item_eat(20),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "lib_ecology:golden_apple", param2 = 1})
		end
	end,
})

-- Hearty Stew (Heals 5 hearts - thanks to ZonerDarkRevention for his DokuCraft DeviantArt bowl texture)
minetest.register_craftitem("lib_ecology:hearty_stew", {
	description = S("Hearty Stew"),
	inventory_image = "hearty_stew.png",
	wield_image = "hearty_stew.png",
	on_use = minetest.item_eat(10, "lib_ecology:bowl"),
})

minetest.register_craft({
	output = "lib_ecology:hearty_stew",
	recipe = {
		{"lib_ecology:wild_onion_plant","lib_ecology:mushroom_plant", "lib_ecology:fern_tubers"},
		{"","lib_ecology:mushroom_plant", ""},
		{"","lib_ecology:bowl", ""},
	}
})

-- Extra recipe for hearty stew
if farming and farming.mod and farming.mod == "redo" then
minetest.register_craft({
	output = "lib_ecology:hearty_stew",
	recipe = {
		{"lib_ecology:wild_onion_plant","lib_ecology:mushroom_plant", "farming:beans"},
		{"","lib_ecology:mushroom_plant", ""},
		{"","lib_ecology:bowl", ""},
	}
})
end

-- Bucket of Cactus Pulp
minetest.register_craftitem("lib_ecology:bucket_cactus", {
	description = S("Bucket of Cactus Pulp"),
	inventory_image = "bucket_cactus.png",
	wield_image = "bucket_cactus.png",
	stack_max = 1,
	on_use = minetest.item_eat(2, "bucket:bucket_empty"),
})

minetest.register_craft({
	output = "lib_ecology:bucket_cactus",
	recipe = {
		{"bucket:bucket_empty","default:cactus"},
	}
})
