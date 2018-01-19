
local S = lib_ecology.intllib

-- Bamboo Flooring
minetest.register_node("lib_ecology:bamboo_floor", {
	description = S("Bamboo Floor"),
	drawtype = 'nodebox',
	tiles = { "bamboo_floor.png" },
	wield_image = "bamboo_floor.png",
	inventory_image = "bamboo_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = true,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
		wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
		wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
	},
	selection_box = {type = "wallmounted"},
	groups = {snappy = 3, choppy = 3 , flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

-- Craft Bamboo into Bamboo Flooring
minetest.register_craft({
	output = "lib_ecology:bamboo_floor 2",
	recipe = {
		{"lib_ecology:bamboo", "lib_ecology:bamboo", "lib_ecology:bamboo"},
		{"lib_ecology:bamboo", "lib_ecology:bamboo", "lib_ecology:bamboo"},
		{"lib_ecology:bamboo", "lib_ecology:bamboo", "lib_ecology:bamboo"},
	}
})

-- Craft Bamboo into Paper
minetest.register_craft({
	output = "default:paper 6",
	recipe = {
		{"lib_ecology:bamboo", "lib_ecology:bamboo"},
		{"lib_ecology:bamboo", "lib_ecology:bamboo"},
		{"lib_ecology:bamboo", "lib_ecology:bamboo"},
	}
})

if lib_ecology.xcraft == true then

-- X pattern craft recipes (5x 'a' in X pattern gives 5 of 'b')
local cheat = {
	{"default:cobble", "default:gravel", 5},
	{"default:gravel", "default:dirt", 5},
	{"default:dirt", "default:sand", 5},
	{"default:ice", "default:snow", 20},
	{"lib_ecology:dry_dirt", "default:desert_sand", 5},
}

for n = 1, #cheat do

	minetest.register_craft({
		output = cheat[n][2] .. " " .. cheat[n][3],
		recipe = {
			{cheat[n][1], "", cheat[n][1]},
			{"", cheat[n][1], ""},
			{cheat[n][1], "", cheat[n][1]},
		}
	})
end

end -- END if

-- Paper (2x3 string = 4 paper)
minetest.register_craft({
	output = "default:paper 4",
	recipe = {
		{"farming:string", "farming:string"},
		{"farming:string", "farming:string"},
		{"farming:string", "farming:string"},
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

-- Paper Wall
minetest.register_node("lib_ecology:paper_wall", {
	drawtype = "nodebox",
	description = S("Paper Wall"),
	tiles = {"paper_wall.png"},
	inventory_image_image = "paper_wall.png",
	wield_image = "paper_wall.png",
	paramtype = "light",
	groups = {snappy = 3},
	sounds = default.node_sound_wood_defaults(),
	walkable = true,
	is_ground_content = false,
	sunlight_propagates = true,
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 5/11, 0.5, 0.5, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, 5/11, 0.5, 0.5, 8/16 }
		}
	},
})

minetest.register_craft({
	output = "lib_ecology:paper_wall",
	recipe = {
		{"default:stick", "default:paper", "default:stick"},
		{"default:stick", "default:paper", "default:stick"},
		{"default:stick", "default:paper", "default:stick"},
	}
})

-- Glostone (A little bit of light decoration)
minetest.register_node("lib_ecology:glostone", {
	description = S("Glo Stone"),
	tiles = {"glostone.png"},
	groups = {cracky = 3},
	light_source = 13,
	drop = "lib_ecology:glostone",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:glostone",
	recipe = {"default:torch", "default:stone", "dye:yellow"}
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

-- Staff of Light (by Xanthin)
minetest.register_tool("lib_ecology:light_staff", {
	description = S("Staff of Light"),
	inventory_image = "light_staff.png",
	wield_image = "light_staff.png",
	sound = {breaks = "default_tool_breaks"},
	stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then
			return
		end

		local pos = pointed_thing.under
		local pname = user:get_player_name()

		if minetest.is_protected(pos, pname) then
			minetest.record_protection_violation(pos, pname)
			return
		end

		local node = minetest.get_node(pos).name

		if node == "default:stone"
		or node == "default:desert_stone" then

			minetest.swap_node(pos, {name = "lib_ecology:glostone"})

			if not minetest.setting_getbool("creative_mode") then
				itemstack:add_wear(65535 / 149) -- 150 uses
			end

			return itemstack
		end

	end,
})

minetest.register_craft({
	output = "lib_ecology:light_staff",
	recipe = {
		{"lib_ecology:illumishroom", "default:mese_crystal", "lib_ecology:illumishroom"},
		{"lib_ecology:illumishroom2", "default:steel_ingot", "lib_ecology:illumishroom2"},
		{"lib_ecology:illumishroom3", "default:steel_ingot", "lib_ecology:illumishroom3"}
	}
})
