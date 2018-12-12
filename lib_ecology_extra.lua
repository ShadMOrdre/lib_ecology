


local S = lib_ecology.intllib



minetest.register_node("lib_ecology:logpile", {
	description = "Log Pile",
	tiles = {
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree.png^[transformR90",
		"default_tree_top.png",
		"default_tree_top.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, -0.5, -0.0625, -0.125, 0.5}, -- NodeBox1
			{0.0625, -0.4375, -0.5, 0.5, -0.125, 0.5}, -- NodeBox2
			{0.125, -0.5, -0.5, 0.4375, -0.0625, 0.5}, -- NodeBox3
			{-0.4375, -0.5, -0.5, -0.125, -0.0625, 0.5}, -- NodeBox4
			{-0.125, -0.0625, -0.5, 0.1875, 0.375, 0.5}, -- NodeBox5
			{-0.1875, 0, -0.5, 0.25, 0.3125, 0.5}, -- NodeBox6
		}
	},
	groups = {choppy=3, oddly_breakable_by_hand=1, flammable=1, falling_node=1},
	drop = "default:tree 3",
})

minetest.register_craft( {
	output = "lib_ecology:logpile 1",
	recipe = {
		{ "", "default:tree", "" },
		{ "default:tree", "", "default:tree" }
	}
})


-- Food recipes!

	local flour
	if minetest.registered_nodes["farming:flour"] then
		flour = "farming:flour"
	else
		flour = "lib_ecology:food_acorn_muffin_batter"
	end


	minetest.register_craftitem("lib_ecology:food_banana_bread", {
		description = S("Banana Bread"),
		inventory_image = "lib_ecology_food_banana_bread.png",
		on_use = minetest.item_eat(6),
	})
	minetest.register_craftitem("lib_ecology:food_banana_dough", {
		description = S("Banana Dough"),
		inventory_image = "lib_ecology_food_banana_dough.png",
		wield_image = "lib_ecology_food_banana_dough.png",
	})
	minetest.register_craft({
		type = "shapeless",
		output = "lib_ecology:food_banana_dough",
		recipe = {"farming:flour", "lib_ecology:fruit_banana_01"}
	})
	minetest.register_craft({
		type = "cooking",
		cooktime = 14,
		output = "lib_ecology:food_banana_bread",
		recipe = "lib_ecology:food_banana_dough"
	})


minetest.register_craftitem("lib_ecology:food_coconut_milk", {
	description = S("Coconut Milk"),
	inventory_image = "lib_ecology_food_coconut_milk_inv.png",
	on_use = minetest.item_eat(2),
})
minetest.register_craftitem("lib_ecology:food_raw_coconut", {
	description = S("Raw Coconut"),
	inventory_image = "lib_ecology_food_coconut_raw.png",
	on_use = minetest.item_eat(4),
})
minetest.register_craftitem("lib_ecology:food_coconut_slice", {
	description = S("Coconut Slice"),
	inventory_image = "lib_ecology_food_coconut_slice.png",
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:food_coconut_milk",
	recipe = {
		"lib_ecology:fruit_coconut",
		"vessels:drinking_glass",
	},
	replacements = {
		{ "lib_ecology:fruit_coconut", "lib_ecology:food_raw_coconut" },
	}
})
minetest.register_craft({
	output = 'lib_ecology:food_coconut_slice 4',
	recipe = {
		{'lib_ecology:fruit_coconut'},
	}
})



minetest.register_craftitem("lib_ecology:food_date", {
	description = S("Date"),
	inventory_image = "lib_ecology_food_date.png",
	on_use = minetest.item_eat(1),
})
minetest.register_craftitem("lib_ecology:food_date_nut_batter", {
	description = S("Date-nut cake batter"),
	inventory_image = "lib_ecology_food_date_nut_batter.png",
})
minetest.register_craftitem("lib_ecology:food_date_nut_cake", {
	description = S("Date-nut cake"),
	inventory_image = "lib_ecology_food_date_nut_cake.png",
	on_use = minetest.item_eat(32),
})
minetest.register_craftitem("lib_ecology:food_date_nut_bar", {
	description = S("Date-nut energy bar"),
	inventory_image = "lib_ecology_food_date_nut_bar.png",
	on_use = minetest.item_eat(4),
})
minetest.register_craftitem("lib_ecology:food_date_nut_snack", {
	description = S("Date & nut snack"),
	inventory_image = "lib_ecology_food_date_nut_snack.png",
	on_use = minetest.item_eat(4),
})
-- The date-nut cake is an exceptional food item due to its highly
-- concentrated nature (32 food units). Because of that, it requires
-- many different ingredients, and, starting from the base ingredients
-- found or harvested in nature, it requires many steps to prepare.
minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:food_date_nut_batter",
	recipe = {
		"lib_ecology:food_date_nut_snack",
		"lib_ecology:food_date_nut_snack",
		"lib_ecology:food_date_nut_snack",
		"lib_ecology:food_coconut_milk",
		"lib_ecology:food_date_nut_snack",
		"lib_ecology:food_raw_coconut",
		"lib_ecology:food_coconut_milk",
		flour,
		"lib_ecology:food_raw_coconut",
	},
	replacements = {
		{ "lib_ecology:food_coconut_milk", "vessels:drinking_glass 2" }
	}
})
minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:food_date_nut_cake",
	recipe = "lib_ecology:food_date_nut_batter",
})
minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:food_date_nut_bar 8",
	recipe = {"lib_ecology:food_date_nut_cake"},
})
minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:food_date_nut_snack",
	recipe = {
		"lib_ecology:food_date",
		"lib_ecology:food_date",
		"lib_ecology:food_date",
		"lib_ecology:food_spruce_nuts",
		"lib_ecology:food_cedar_nuts",
		"lib_ecology:food_fir_nuts",
	}
})

minetest.register_craftitem("lib_ecology:food_acorn_muffin_batter", {
	description = S("Acorn Muffin batter"),
	inventory_image = "lib_ecology_food_acorn_muffin_batter.png",
})
minetest.register_craftitem("lib_ecology:food_acorn_muffin", {
	description = S("Acorn Muffin"),
	inventory_image = "lib_ecology_food_acorn_muffin.png",
	on_use = minetest.item_eat(4),
})
minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:food_acorn_muffin_batter",
	recipe = {
		"lib_ecology:fruit_acorn",
		"lib_ecology:fruit_acorn",
		"lib_ecology:fruit_acorn",
		"lib_ecology:fruit_acorn",
		"lib_ecology:food_coconut_milk",
	},
	replacements = {
		{ "lib_ecology:food_coconut_milk", "vessels:drinking_glass" }
	}
})
minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:food_acorn_muffin 4",
	recipe = "lib_ecology:food_acorn_muffin_batter",
})

minetest.register_craftitem("lib_ecology:food_cedar_nuts", {
	description = S("Roasted Cedar Cone Nuts"),
	inventory_image = "lib_ecology_food_cedar_nuts.png",
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:food_cedar_nuts 4",
	recipe = "lib_ecology:fruit_cedar_cone",
})

minetest.register_craftitem("lib_ecology:food_fir_nuts", {
	description = S("Roasted Fir Cone Nuts"),
	inventory_image = "lib_ecology_food_fir_nuts.png",
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:food_fir_nuts 4",
	recipe = "lib_ecology:fruit_fir_cone",
})

minetest.register_craftitem("lib_ecology:food_spruce_nuts", {
	description = S("Roasted Spruce Cone Nuts"),
	inventory_image = "lib_ecology_food_spruce_nuts.png",
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:food_spruce_nuts 4",
	recipe = "lib_ecology:fruit_spruce_cone",
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

-- Palm Wax
minetest.register_craftitem("lib_ecology:palm_wax", {
	description = S("Palm Wax"),
	inventory_image = "palm_wax.png",
	wield_image = "palm_wax.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "lib_ecology:palm_wax",
	recipe = "lib_ecology:palmleaves"
})

-- Candle from Wax and String/Cotton
minetest.register_node("lib_ecology:candle", {
	description = S("Candle"),
	drawtype = "plantlike",
	inventory_image = "candle_static.png",
	wield_image = "candle_static.png",
	tiles = {
		{
			name = "candle.png",
			animation={
				type="vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 1.0
			}
		},
	},	
	paramtype = "light",
	light_source = 11,
	sunlight_propagates = true,
	walkable = false,
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0, 0.15 }
	},
})

minetest.register_craft({
	output = "lib_ecology:candle 2",
	recipe = {
		{"farming:cotton"},
		{"lib_ecology:palm_wax"},
		{"lib_ecology:palm_wax"},
	}
})

-- Wooden Bowl
minetest.register_craftitem("lib_ecology:bowl", {
	description = S("Bowl"),
	inventory_image = "bowl.png",
})

minetest.register_craft({
	output = "lib_ecology:bowl",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""},
	}
})

-- stone Ladder
minetest.register_node("lib_ecology:stone_ladder", {
	description = S("Stone Ladder"),
	drawtype = "signlike",
	tiles = {"stone_ladder.png"},
	inventory_image = "stone_ladder.png",
	wield_image = "stone_ladder.png",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "wallmounted",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:stone_ladder 4",
	recipe = {
		{"group:stone", "", "group:stone"},
		{"group:stone", "group:stone", "group:stone"},
		{"group:stone", "", "group:stone"},
	}
})


-- Charcoal Lump
minetest.register_craftitem("lib_ecology:charcoal_lump", {
	description = S("Lump of Charcoal"),
	inventory_image = "charcoal_lump.png",
	wield_image = "charcoal_lump.png",
})

minetest.register_craft({
	output = "lib_ecology:charcoal_lump 2",
	recipe = {
		{"lib_ecology:scorched_tree"}
	}
})

minetest.register_craft({
	output = "lib_ecology:charcoal_lump 2",
	type = "cooking",
	recipe = "group:tree",
	cooktime = 4
})

minetest.register_craft({
	type = "fuel",
	recipe = "lib_ecology:charcoal_lump",
	burntime = 10,
})

-- Make Torch from Charcoal Lump
minetest.register_craft({
	output = "default:torch 4",
	recipe = {
		{"lib_ecology:charcoal_lump"},
		{"default:stick"},
	}
})

-- mushroom soup (Heals 1 heart)
minetest.register_craftitem("lib_ecology:mushroom_soup", {
	description = S("Mushroom Soup"),
	inventory_image = "mushroom_soup.png",
	on_use = minetest.item_eat(5, "lib_ecology:bowl"),
})

minetest.register_craft({
	output = "lib_ecology:mushroom_soup",
	recipe = {
		{"flowers:mushroom_brown"},
		{"flowers:mushroom_brown"},
		{"lib_ecology:bowl"},
	}
})

-- 4x red mushrooms make mushroom block
minetest.register_craft({
	output = "lib_ecology:mushroom",
	recipe = {
		{"flowers:mushroom_red", "flowers:mushroom_red"},
		{"flowers:mushroom_red", "flowers:mushroom_red"},
	}
})
