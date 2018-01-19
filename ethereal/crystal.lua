
local S = lib_ecology.intllib

-- Crystal Spike (Hurts if you touch it - thanks to ZonerDarkRevention for his DokuCraft DeviantArt crystal texture)
minetest.register_node("lib_ecology:crystal_spike", {
	description = S("Crystal Spike"),
	drawtype = "plantlike",
	tiles = { "crystal_spike.png" },
	inventory_image = "crystal_spike.png",
	wield_image = "crystal_spike.png",
	paramtype = "light",
	light_source = 7,
	sunlight_propagates = true,
	walkable = false,
	damage_per_second = 1,
	groups = {cracky = 1, falling_node = 1, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.41, 5 / 16},
	},
})

-- Crystal Ingot
minetest.register_craftitem("lib_ecology:crystal_ingot", {
	description = S("Crystal Ingot"),
	inventory_image = "crystal_ingot.png",
	wield_image = "crystal_ingot.png",
})

minetest.register_craft({
	output = "lib_ecology:crystal_ingot",
	recipe = {
		{"default:mese_crystal", "lib_ecology:crystal_spike"},
		{"lib_ecology:crystal_spike", "default:mese_crystal"},
	}
})

minetest.register_craft({
	output = "lib_ecology:crystal_ingot",
	recipe = {
		{"lib_ecology:crystal_spike", "default:mese_crystal"},
		{"default:mese_crystal", "lib_ecology:crystal_spike"},
	}
})

-- Crystal Block
minetest.register_node("lib_ecology:crystal_block", {
	description = S("Crystal Block"),
	tiles = {"crystal_block.png"},
	light_source = 9,
	is_ground_content = false,
	groups = {cracky = 1, level = 2, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "lib_ecology:crystal_block",
	recipe = {
		{"lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot"},
		{"lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot"},
		{"lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot"},
	}
})

minetest.register_craft({
	output = "lib_ecology:crystal_ingot 9",
	recipe = {
		{"lib_ecology:crystal_block"},
	}
})

-- Crystal Sword (Powerful wee beastie)
minetest.register_tool("lib_ecology:sword_crystal", {
	description = S("Crystal Sword"),
	inventory_image = "crystal_sword.png",
	wield_image = "crystal_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.70, [2] = 0.70, [3] = 0.25},
				uses = 50,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "lib_ecology:sword_crystal",
	recipe = {
		{"lib_ecology:crystal_ingot"},
		{"lib_ecology:crystal_ingot"},
		{"default:steel_ingot"},
	}
})

-- Crystal Axe
minetest.register_tool("lib_ecology:axe_crystal", {
	description = S("Crystal Axe"),
	inventory_image = "crystal_axe.png",
	wield_image = "crystal_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				times = {[1] = 2.00, [2] = 0.80, [3] = 0.40},
				uses = 40,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = 'lib_ecology:axe_crystal',
	recipe = {
		{'lib_ecology:crystal_ingot', 'lib_ecology:crystal_ingot'},
		{'lib_ecology:crystal_ingot', 'default:steel_ingot'},
		{'', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'lib_ecology:axe_crystal',
	recipe = {
		{'lib_ecology:crystal_ingot', 'lib_ecology:crystal_ingot'},
		{'default:steel_ingot', 'lib_ecology:crystal_ingot'},
		{'default:steel_ingot', ''},
	}
})

-- Crystal Pick (This will last a while)
minetest.register_tool("lib_ecology:pick_crystal", {
	description = S("Crystal Pickaxe"),
	inventory_image = "crystal_pick.png",
	wield_image = "crystal_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 3,
		groupcaps={
			cracky = {
				times = {[1] = 1.8, [2] = 0.8, [3] = 0.40},
				uses = 40,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "lib_ecology:pick_crystal",
	recipe = {
		{"lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot", "lib_ecology:crystal_ingot"},
		{"", "default:steel_ingot", ""},
		{"", "default:steel_ingot", ""},
	}
})

-- Crystal Shovel (with Soft Touch so player can dig up dirt with grass intact)
minetest.register_tool("lib_ecology:shovel_crystal", {
	description = S("Crystal (soft touch) Shovel"),
	inventory_image = "crystal_shovel.png",
	wield_image = "crystal_shovel.png^[transformR90",
	sound = {breaks = "default_tool_breaks"},
	on_use = function(itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then
			return
		end

		-- Check if node protected
		if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
			return
		end

		local pos = pointed_thing.under
		local nn = minetest.get_node(pos).name

		-- Is node dirt, sand or gravel
		if minetest.get_item_group(nn, "crumbly") > 0 then

			local inv = user:get_inventory()

			minetest.remove_node(pointed_thing.under)

			nodeupdate(pos)

			if minetest.setting_getbool("creative_mode") then

				if not inv:contains_item("main", {name = nn}) then
					inv:add_item("main", {name = nn})
				end
			else

				inv:add_item("main", {name = nn})
				itemstack:add_wear(65535 / 100) -- 111 uses
			end

			minetest.sound_play("default_dig_crumbly", {pos = pos, gain = 0.4})

			return itemstack
		end
	end,
})

minetest.register_craft({
	output = "lib_ecology:shovel_crystal",
	recipe = {
		{"lib_ecology:crystal_ingot"},
		{"default:steel_ingot"},
		{"default:steel_ingot"},
	}
})

-- Crystal Gilly Staff (replenishes air supply when used)
minetest.register_tool("lib_ecology:crystal_gilly_staff", {
	description = S("Crystal Gilly Staff"),
	inventory_image = "crystal_gilly_staff.png",
	wield_image = "crystal_gilly_staff.png",

	on_use = function(itemstack, user, pointed_thing)
		if user:get_breath() < 10 then
			user:set_breath(10)
		end
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:crystal_gilly_staff",
	recipe = {
		"lib_ecology:green_moss", "lib_ecology:gray_moss", "lib_ecology:fiery_moss",
		"lib_ecology:crystal_moss", "lib_ecology:crystal_ingot", "lib_ecology:mushroom_moss",
		"lib_ecology:crystal_ingot"
	},
})
