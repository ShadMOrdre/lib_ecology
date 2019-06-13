

local S = lib_ecology.intllib


	minetest.register_node("lib_ecology:plant_bush_jungle_01", {
		description = S("Plant - Bush Jungle 01"),
		drawtype = "nodebox",
		tiles = {
			"lib_ecology_ground_grass.png",
			"lib_ecology_shrub_jungle.png",
		},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		-- drop = {
			-- max_items=2,
			-- items={
				-- {items={"lib_ecology:plant_test_plant_nodebox_01"}, rarity=1},
				-- {items={"default:dirt"}, rarity=1}
			-- }
		-- },
		node_box = {
			type='fixed',
			fixed={
				{-0.5, -0.5, -0.5, 0.5, -0.4995, 0.5},
				{-0.5, -0.5, -0.001, 0.5, 0.5, 0.001},
				{-0.001, -0.5, -0.5, 0.001, 0.5, 0.5},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.4875, 0.5},
		},
	})
	minetest.register_node("lib_ecology:plant_grass_reed", {
		description = S("Plant - Grass Reed"),
		drawtype = "nodebox",
		tiles = {
			"lib_ecology_ground_grass.png",
			"lib_ecology_shrub_lush_01.png",
		},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		-- drop = {
			-- max_items=2,
			-- items={
				-- {items={"lib_ecology:plant_test_plant_nodebox_01"}, rarity=1},
				-- {items={"default:dirt"}, rarity=1}
			-- }
		-- },
		node_box = {
			type='fixed',
			fixed={
				{-0.5, -0.5, -0.5, 0.5, -0.4995, 0.5},
				{-0.5, -0.5, -0.001, 0.5, 0.5, 0.001},
				{-0.001, -0.5, -0.5, 0.001, 0.5, 0.5},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.4875, 0.5},
		},
	})


-- lib_ecology_grass_jungle_4
-- lib_ecology_ground_grass.png
-- default_dirt.png
-- lib_ecology_plant_banana_plant.png
	
--BUSHES / SHRUBS
	minetest.register_node("lib_ecology:bush_01_1", {
		description = "Bush - 01 - 1",
		drawtype = "plantlike",
		tiles = {"lib_ecology_bush_01_1.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = false, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:bush_01_2", {
		description = "Bush - 01 - 1",
		drawtype = "plantlike",
		tiles = {"lib_ecology_bush_01_2.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = false, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:bush_02_1", {
		description = "Bush - 01 - 1",
		drawtype = "plantlike",
		tiles = {"lib_ecology_bush_02_1.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = false, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:bush_02_2", {
		description = "Bush - 01 - 1",
		drawtype = "plantlike",
		tiles = {"lib_ecology_bush_02_2.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = false, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:bush_02_3", {
		description = "Bush - 01 - 1",
		drawtype = "plantlike",
		tiles = {"lib_ecology_bush_02_3.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = false, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:bush_trunk", {
		description = S("Bush - Trunk"),
		drawtype = "plantlike",
		visual_scale = 1.41,
		tiles = {"lib_ecology_bush_trunk.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		floodable = true,
		groups = {choppy = 2, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
		},
	})
	minetest.register_node("lib_ecology:shrub_crystal", {
		description = S("Shrub - Crystal"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_shrub_crystal.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 4,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:shrub_jungle", {
		description = S("Shrub - Jungle"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.69,
		tiles = {"lib_ecology_shrub_jungle.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 1.19, 7 / 16},
		},
	})
	minetest.register_node("lib_ecology:shrub_snowy", {
		description = S("Shrub - Snowy"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_shrub_snowy.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 4,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:shrub_dry", {
		description = S("Shrub - Dry"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_shrub_dry.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:shrub_fiery", {
		description = S("Shrub - Fiery"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_shrub_fiery.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:shrub_lush_01", {
		description = S("Shrub - Lush 01"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_shrub_lush_01.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = false,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		visual_scale = 1.2,
		sounds = lib_ecology.node_sound_leaves_defaults(),
		waving = 1,
		walkable = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.4, -0.4, 0.4, 0.4, 0.4}
		},
	})
	minetest.register_node("lib_ecology:shrub_lush_02", {
		description = "Shrub - Lush 02",
		drawtype = "plantlike",
		tiles = {"lib_ecology_shrub_lush_02.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:shrub_scorched", {
		description = S("Shrub - Scorched"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_shrub_scorched.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = false,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		visual_scale = 1.2,
		sounds = lib_ecology.node_sound_leaves_defaults(),
		waving = 1,
		walkable = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.4, -0.4, 0.4, 0.4, 0.4}
		},
	})
	minetest.register_node("lib_ecology:shrub_taiga", {
		description = "Shrub - Taiga",
		drawtype = "plantlike",
		tiles = {"lib_ecology_shrub_taiga.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
		},
	})
	minetest.register_node("lib_ecology:shrub_hog_peanut", {
		description = S("Shrub - Hog Peanut"),
		drawtype = "mesh",
		mesh = "shrub.obj",
		tiles = {"lib_ecology_shrub_hog_peanut.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		visual_scale = 0.5,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
		on_construct = function(pos, node)
			local node = minetest.get_node(pos)
			node.param2 = math.random(0,179)
		end,
	})
	minetest.register_node("lib_ecology:shrub_deciduous", {
		description = S("Shrub - Deciduous"),
		drawtype = "mesh",
		mesh = "shrub.obj",
		tiles = {"lib_ecology_shrub_deciduous.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		visual_scale = 0.5,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
		on_construct = function(pos, node)
			local node = minetest.get_node(pos)
			node.param2 = math.random(0,179)
		end,
	})

	minetest.register_node("lib_ecology:bush_hawthorne_leaves", {
		description = S("Bush - Hawthorne Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_bush_hawthorne_leaves.png"},
		paramtype = "light",
		visual_scale = 2.0,
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = lib_ecology.after_place_leaves,
	})
	minetest.register_node("lib_ecology:bush_rhodedendron_leaves_1", {
		description = S("Bush - Rhodedendron Leaves 1"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_bush_rhodedendron_leaves_1.png"},
		paramtype = "light",
		visual_scale = 1.5,
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(400)
			else
				minetest.set_node(pos, {name = "lib_ecology:bush_rhodedendron_leaves_2"})
			end
		end,

		after_place_node = lib_ecology.after_place_leaves,
	})
	minetest.register_node("lib_ecology:bush_rhodedendron_leaves_2", {
		description = S("Bush - Rhodedendron Leaves 2"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_bush_rhodedendron_leaves_2.png"},
		paramtype = "light",
		visual_scale = 1.5,
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "lib_ecology:bush_rhodedendron_leaves_3"})
			end
		end,

		after_place_node = lib_ecology.after_place_leaves,
	})
	minetest.register_node("lib_ecology:bush_rhodedendron_leaves_3", {
		description = S("Bush - Rhodedendron Leaves 3"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_bush_rhodedendron_leaves_3.png"},
		paramtype = "light",
		visual_scale = 1.5,
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "lib_ecology:bush_rhodedendron_leaves_1"})
			end
		end,

		after_place_node = lib_ecology.after_place_leaves,
	})

--CACTII
	minetest.register_node("lib_ecology:cactus_green_column", {
		description = S("Cactus - Green Column"),
		drawtype = "mesh",
		mesh = "cactus.b3d",
		paramtype = "light",
		tiles = {
			"lib_ecology_plant_cactus.png",
		},
		visual_scale = 0.5,
		selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
		},
		groups = {choppy = 1, oddly_breakable_by_hand = 1},
		sounds = lib_ecology.node_sound_wood_defaults()
	})
	minetest.register_node("lib_ecology:cactus_green_trunk", {
		description = S("Cactus - Green Trunk"),
		tiles = {"lib_ecology_cactus_green_trunk_top.png", "lib_ecology_cactus_green_trunk_top.png", "lib_ecology_cactus_green_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_purple_button", {
		description = S("Cactus - Purple Button"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_cactus_purple_trunk_top.png", "lib_ecology_cactus_purple_trunk_top.png", "lib_ecology_cactus_purple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = lib_ecology.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.25, 0.25, 0.0, 0.25}, -- Trunk
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.25, 0.25, 0.0, 0.25}, -- Trunk
			}
		},
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_purple_column", {
		description = S("Cactus - Purple Column"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_cactus_purple_trunk_top.png", "lib_ecology_cactus_purple_trunk_top.png", "lib_ecology_cactus_purple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = lib_ecology.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- Trunk
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- Trunk
			}
		},
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_purple_trunk", {
		description = S("Cactus - Purple Trunk"),
		tiles = {"lib_ecology_cactus_purple_trunk_top.png", "lib_ecology_cactus_purple_trunk_top.png", "lib_ecology_cactus_purple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_column_01", {
		description = S("Cactus - Column 01"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_cactus_column_01.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		walkable = false,
		floodable = true,
		sunlight_propagates = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:cactus_column_02", {
		description = S("Cactus - Column 02"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_cactus_column_02.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		damage_per_second = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:cactus_globe", {
		description = S("Cactus - Globe"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_cactus_globe.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:cactus_moonflower", {
		description = "Cactus - Moon Flower",
		drawtype = "plantlike",
		tiles = {"lib_ecology_cactus_moonflower.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:cactus_prickly_pear", {
		description = "Cactus - Prickly Pear",
		drawtype = "plantlike",
		tiles = {"lib_ecology_cactus_prickly_pear.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 4.0,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		groups = {choppy=1, oddly_breakable_by_hand=1, flammable=1, falling_node=1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 1, 0.5}
		},
		damage_per_second = 1,
		walkable = false,
	})
	minetest.register_node("lib_ecology:cactus_vine", {
		description = S("Cactus - Vine"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_cactus_vine.png"},
		visual_scale = 1.54,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:cactus_small_column_01", {
		description = S("Cactus - Small Column 01"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_cactus_column_01.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		buildable_to = true, 
		walkable = false,
		floodable = true,
		sunlight_propagates = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.0625, 0.1875, -0.0625, 0.0625, 0.25, 0.0625}, -- Trunk
				{-0.0625, -0.5, -0.125, 0.0625, 0.1875, 0.125}, -- Trunk
				{-0.125, -0.5, -0.0625, 0.125, 0.1875, 0.0625}, -- Trunk
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.25, 0.125}, -- Trunk
			}
		},
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_small_column_02", {
		description = S("Cactus - Small Column 02"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_cactus_column_02.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		damage_per_second = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.0625, 0.0625, -0.0625, 0.0625, 0.125, 0.0625}, -- Trunk
				{-0.0625, -0.5, -0.125, 0.0625, 0.0625, 0.125}, -- Trunk
				{-0.125, -0.5, -0.0625, 0.125, 0.0625, 0.0625}, -- Trunk
				{-0.0625, -0.5, -0.001, 0.0625, 0.0625, 0.001}, -- Trunk
				{-0.001, -0.5, -0.0625, 0.001, 0.0625, 0.0625}, -- Trunk
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.125, -0.5, -0.125, 0.125, 0.125, 0.125}, -- Trunk
			}
		},
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_small_globe", {
		description = S("Cactus - Small Globe"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_cactus_globe.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.0625, 0.1875, 0.125, 0.0625}, -- Trunk
				{-0.25, -0.3125, -0.0625, 0.25, 0.0625, 0.0625}, -- Trunk
				{-0.3125, -0.375, -0.0625, 0.3125, 0.0, 0.0625}, -- Trunk
				{-0.125, 0.125, -0.0625, 0.125, 0.1875, 0.0625}, -- Trunk
				{-0.0625, 0.1875, -0.0625, 0.0625, 0.25, 0.0625}, -- Trunk
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.5, -0.0625, 0.3125, 0.25, 0.0625}, -- Trunk
			}
		},
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:cactus_01_seedling", {
		description = S("Cactus - Green Seedling"),
		drawtype = "plantlike",
		tiles = {"default_large_cactus_seedling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {
				-5 / 16, -0.5, -5 / 16,
				5 / 16, 0.5, 5 / 16
			}
		},
		groups = {choppy = 3, dig_immediate = 3, attached_node = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:cactus_01_seedling",
				{x = -2, y = -1, z = -2},
				{x = 2, y = 5, z = 2},
				4)

			return itemstack
		end,

		on_construct = function(pos)
			-- Normal cactus farming adds 1 cactus node by ABM,
			-- interval 12s, chance 83.
			-- Consider starting with 5 cactus nodes. We make sure that growing a
			-- large cactus is not a faster way to produce new cactus nodes.
			-- Confirmed by experiment, when farming 5 cacti, on average 1 new
			-- cactus node is added on average every
			-- 83 / 5 = 16.6 intervals = 16.6 * 12 = 199.2s.
			-- Large cactus contains on average 14 cactus nodes.
			-- 14 * 199.2 = 2788.8s.
			-- Set random range to average to 2789s.
			minetest.get_node_timer(pos):start(math.random(1859, 3719))
		end,

		on_timer = function(pos)
			local node_under = minetest.get_node_or_nil(
				{x = pos.x, y = pos.y - 1, z = pos.z})
			if not node_under then
				-- Node under not yet loaded, try later
				minetest.get_node_timer(pos):start(300)
				return
			end

			if minetest.get_item_group(node_under.name, "sand") == 0 then
				-- Seedling dies
				minetest.remove_node(pos)
				return
			end

			local light_level = minetest.get_node_light(pos)
			if not light_level or light_level < 13 then
				-- Too dark for growth, try later in case it's night
				minetest.get_node_timer(pos):start(300)
				return
			end

			minetest.log("action", "A large cactus seedling grows into a large" ..
				"cactus at ".. minetest.pos_to_string(pos))
			--default.grow_large_cactus(pos)

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_cactus_01, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,
	})

--FERNS
	minetest.register_node("lib_ecology:fern_big", {
		description = "Fern - Big",
		drawtype = "plantlike",
		tiles = {"lib_ecology_fern_big.png"},
		visual_scale = 2.0,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:fern_bluespike", {
		description = "Fern - BlueSpike",
		drawtype = "plantlike",
		tiles = {"lib_ecology_fern_bluespike.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_boston", {
		description = S("Fern - Boston Fern"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_boston.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_boston_02"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_broadleaf_fern", {
		description = S("Fern - Broad Leaf Fern"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_broadleaf.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = false,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_broadleaf_fern2", {
		description = S("Fern - Broad Leaf Fern2"),
		drawtype = "plantlike",
		visual_scale = 1.5,
		tiles = {"lib_ecology_fern_broadleaf.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_dicksonia", {
		description = S("Fern - Dicksonia"),
		drawtype = "mesh",
		mesh = "dicksonia.b3d",
		tiles = {"lib_ecology_fern_dicksonia.png",},
		paramtype = "light",
		waving = 1,
		groups = {choppy = 1, oddly_breakable_by_hand = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_fern", {
		description = "Fern - Fern",
		drawtype = "plantlike",
		tiles = {"lib_ecology_fern_fern.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_fiddlehead", {
		description = S("Fern - Fiddlehead"),
		drawtype = "plantlike",
		visual_scale = 0.5,
		tiles = {"lib_ecology_fern_fiddlehead.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_horsetail_1", {
		description = "Fern - Young Horsetail (Equisetum)",
		drawtype = "plantlike",
		paramtype = "light",
		tiles = { "lib_ecology_fern_horsetail_1.png" },
		walkable = false,
		buildable_to = true,
		groups = {snappy=3,flammable=2,attached_node=1,horsetail=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		on_use = minetest.item_eat(1), -- young ones edible https://en.wikipedia.org/wiki/Equisetum,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_horsetail_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_horsetail_2", {
		description = "Fern - Horsetail (Equisetum)",
		drawtype = "plantlike",
		paramtype = "light",
		tiles = { "lib_ecology_fern_horsetail_2.png" },
		walkable = false,
		buildable_to = true,
		groups = {snappy=3,flammable=2,attached_node=1,horsetail=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_horsetail_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_horsetail_3", {
		description = "Fern - Horsetail (Equisetum)",
		drawtype = "plantlike",
		paramtype = "light",
		tiles = { "lib_ecology_fern_horsetail_3.png" },
		walkable = false,
		buildable_to = true,
		groups = {snappy=3,flammable=2,attached_node=1,horsetail=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_horsetail_4"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_horsetail_4", {
		description = "Fern - Horsetail (Equisetum)",
		drawtype = "plantlike",
		paramtype = "light",
		tiles = { "lib_ecology_fern_horsetail_4.png" },
		walkable = false,
		buildable_to = true,
		groups = {snappy=3,flammable=2,attached_node=1,horsetail=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:fern_horsetails", {
		description = S("Fern - Horsetails"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_horsetails.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_horsetail_02", {
		description = S("Fern - Horsetail 02"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_horsetail_4.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_ladyfern", {
		description = S("Fern - Ladyfern"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_lady.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = false,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_ladyfern2", {
		description = S("Fern - Ladyfern2"),
		drawtype = "plantlike",
		visual_scale = 1.5,
		tiles = {"lib_ecology_fern_lady.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=1, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_large_1", {
		description = S("Fern - Fern Large 1"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_large_1.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, growing = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_large_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_large_2", {
		description = S("Fern - Fern Large 2"),
		drawtype = "plantlike",
		visual_scale = 1.2,
		tiles = {"lib_ecology_fern_large_2.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, growing = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_4"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_large_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_large_3", {
		description = S("Fern - Fern Large 3"),
		drawtype = "plantlike",
		visual_scale = 2.0,
		tiles = {"lib_ecology_fern_large_3.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_large_4"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_small_1", {
		description = S("Fern - Fern Small 1"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_small_1.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, growing = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_small_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_small_2", {
		description = S("Fern - Fern Small 2"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_small_2.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, plant = 1, growing = 1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_3"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:fern_small_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:fern_small_3", {
		description = S("Fern - Fern Small 3"),
		drawtype = "plantlike",
		visual_scale = 4.0,
		tiles = {"lib_ecology_fern_small_3.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand=1, flammable=2, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_small"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_spike", {
		description = "Fern - Spike",
		drawtype = "plantlike",
		tiles = {"lib_ecology_fern_spike.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, oddly_breakable_by_hand=1, flammable=1, leaves=1, attached_node = 1, flora=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})

--FLOWERS
	minetest.register_node("lib_ecology:flower_allium_purple", {
		description = S("Flower - Allium Purple"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_allium_purple.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_big", {
		description = "Flower - Big",
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_big.png"},
		visual_scale = 1.2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:flower_bird_of_paradise", {
		description = S("Flower - Bird of Paradise"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_bird_of_paradise.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_blue", {
		description = "Flower - Blue",
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_blue.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:flower_calla_lily", {
		description = S("Flower - Calla Lily"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_calla_lily.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_white = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_cave", {
		description = "Flower - Cave",
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_cave.png"},
		visual_scale = 1,
		light_source = 5,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:flower_chrysanthemum_green", {
		description = S("Flower - Chrysanthemum Green"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_chrysanthemum_green.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_green = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_daisy_oxeye", {
		description = S("Flower - Daisy Oxeye"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_daisy_oxeye.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_dandelion_white", {
		description = S("Flower - Dandelion White"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_dandelion_white.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_white = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_dandelion_yellow", {
		description = S("Flower - Dandelion Yellow"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_dandelion_yellow.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_yellow = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 4 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_dandelions_yellow", {
		description = S("Flower - Dandelions Yellow"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_dandelions_yellow.png"},
		visual_scale = 2.0,
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_yellow = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 4 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_delphinium", {
		description = S("Flower - Delphinium Blue"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_delphinium.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_cyan = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_fire", {
		description = S("Flower - Fire"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_fire.png"},
		paramtype = "light",
		is_ground_content = false,
		waving = 1,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:flower_fire_02", {
		description = "Flower - Fire 02",
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_fire_02.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
		},
	})
	minetest.register_node("lib_ecology:flower_flame_lily", {
		description = S("Flower - Flame Lily"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_flame_lily.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_foxglove_pink", {
		description = S("Flower - Foxglove Pink"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_foxglove_pink.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_foxglove_purple", {
		description = S("Flower - Foxglove Purple"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_foxglove_purple.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_geranium_blue", {
		description = S("Flower - Geranium Blue"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_geranium_blue.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_blue = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 2 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_gerbera", {
		description = S("Flower - Gerbera"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_gerbera.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_pink = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_ground_blue", {
		description = S("Flower - Ground Blue"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_flower_ground_blue.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:flower_ground_pink", {
		description = S("Flower - Ground Pink"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_flower_ground_pink.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:flower_ground_red", {
		description = S("Flower - Ground Red"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_flower_ground_red.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:flower_hibiscus", {
		description = S("Flower - Hibiscus"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_hibiscus.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_white = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_jungle", {
		description = "Flower - Jungle",
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_jungle.png"},
		visual_scale = 1.1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.4, 0.4}
		},
	})
	minetest.register_node("lib_ecology:flower_lantana", {
		description = S("Flower - Lantana"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_lantana.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_lavender", {
		description = S("Flower - Lavender"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_lavender.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_lazarus_bell", {
		description = S("Flower - Lazarus Bell"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_lazarus_bell.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_pink = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_lobelia", {
		description = S("Flower - Lobelia"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_lobelia.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_medium", {
		description = "Flower - Medium",
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_medium.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_use = minetest.item_eat(1),
	})
	minetest.register_node("lib_ecology:flower_orchid", {
		description = S("Flower - Orchid"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_orchid.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_white = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_pansy_blue", {
		description = S("Flower - Pansy Blue"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_pansy_blue.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_pansy_purple", {
		description = S("Flower - Pansy Purple"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_pansy_purple.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_petunia_blue", {
		description = S("Flower - Petunia Blue"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_petunia_blue.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_petunia_pink", {
		description = S("Flower - Petunia Pink"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_petunia_pink.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_petunia_white", {
		description = S("Flower - Petunia White"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_petunia_white.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_rose", {
		description = S("Flower - Rose"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_rose.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_red = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_rose_frozen", {
		description = S("Flower - Rose Frozen"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_rose_frozen.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_roses", {
		description = S("Flower - Roses"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_roses.png"},
		visual_scale = 2.0,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_red = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_thistle", {
		description = S("Flower - Thistle"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_thistle.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_magenta = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_tulip_black", {
		description = S("Flower - Tulip Black"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_tulip_black.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_black = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 3 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_tulip_orange", {
		description = S("Flower - Tulip Orange"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_tulip_orange.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_orange = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 3 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_viola", {
		description = S("Flower - Viola"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_viola.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})

--FRUITS / FOODS
--[[
	-- minetest.register_craftitem("lib_ecology:fruit_pineapple", {
		-- description = S("Fruit - Pineapple"),
		-- inventory_image = "lib_ecology_fruit_pineapple.png",
		-- on_use = minetest.item_eat(4)
	-- })
	-- minetest.register_craftitem("lib_ecology:fruit_fern_tubers", {
		-- description = S("Fern Tubers"),
		-- inventory_image = "lib_ecology_food_fern_tubers.png",
		-- on_use = minetest.item_eat(1),
	-- })
	-- minetest.register_craftitem("lib_ecology:fruit_fern_tuber", {
		-- description = S("Fern Tuber"),
		-- inventory_image = "lib_ecology_food_fern_tuber.png",
		-- on_use = minetest.item_eat(1),
	-- })
	-- minetest.register_craftitem("lib_ecology:food_fern_tuber_roasted", {
		-- description = S("Fern Tuber - Roasted"),
		-- inventory_image = "lib_ecology_food_fern_tuber_roasted.png",
		-- on_use = minetest.item_eat(1),
	-- })
	-- minetest.register_craftitem("lib_ecology:food_fiddlehead_roasted", {
		-- description = S("Fiddlehead - Roasted"),
		-- inventory_image = "lib_ecology_food_fiddlehead_roasted.png",
		-- on_use = minetest.item_eat(1),
	-- })
	-- minetest.register_craftitem("lib_ecology:fruit_strawberry", {
		-- description = S("Fruit - Strawberry"),
		-- inventory_image = "lib_ecology_fruit_strawberry.png",
		-- on_place = function(itemstack, placer, pointed_thing)
			-- return farming.place_seed(itemstack, placer, pointed_thing, "lib_ecology:plant_strawberry_1")
		-- end,
		-- on_use = minetest.item_eat(1),
	-- })
	-- minetest.register_craftitem("lib_ecology:fruit_wild_onion", {
		-- description = S("Wild Onion"),
		-- inventory_image = "lib_ecology_fruit_wild_onion.png",
		-- wield_image = "lib_ecology_fruit_wild_onion.png",
		-- on_place = function(itemstack, placer, pointed_thing)
			-- return farming.place_seed(itemstack, placer, pointed_thing, "lib_ecology:plant_wild_onion_1")
		-- end,
		-- on_use = minetest.item_eat(2),
	-- })
--]]
	minetest.register_node("lib_ecology:fruit_blueberries", {
	description = S("Fruit - Blueberries"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_fruit_blueberries.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:fruit_blueberries",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(1),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:fruit_blueberries", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:fruit_pineapple", {
	description = S("Fruit - Pineapple"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_fruit_pineapple.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:fruit_pineapple",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(4),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:fruit_pineapple", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:fruit_fern_tubers", {
	description = S("Fruit - Fern Tubers"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_food_fern_tubers.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:fruit_fern_tubers",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(1),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:fruit_fern_tubers", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:fruit_fern_tuber", {
	description = S("Fruit - Fern Tuber"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_food_fern_tuber.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:fruit_fern_tuber",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(1),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:fruit_fern_tuber", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:food_fern_tuber_roasted", {
	description = S("Food - Roasted Fern Tuber"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_food_fern_tuber_roasted.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:food_fern_tuber_roasted",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(1),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:food_fern_tuber_roasted", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:food_fiddlehead_roasted", {
	description = S("Fruit - Roasted Fiddlehead"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_food_fiddlehead_roasted.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:food_fiddlehead_roasted",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(1),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:food_fiddlehead_roasted", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:fruit_strawberry", {
	description = S("Fruit - Strawberry"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_fruit_strawberry.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:fruit_strawberry",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "lib_ecology:plant_strawberry_1")
	end,
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:fruit_strawberry", param2=1})
		end
	end,
})
	minetest.register_node("lib_ecology:fruit_wild_onion", {
	description = S("Fruit - Wild Onion"),
	drawtype = "plantlike",
	tiles = { "lib_ecology_fruit_wild_onion.png" },
	visual_scale = 1.0,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
	sounds = lib_ecology.node_sound_leaves_defaults(),
	drop = "lib_ecology:fruit_wild_onion",
	selection_box = {
		type = "fixed",
			fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
		},
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "lib_ecology:plant_wild_onion_1")
	end,
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lib_ecology:fruit_wild_onion", param2=1})
		end
	end,
})
	minetest.register_craftitem("lib_ecology:fruit_curlyfruit", {
		description = "Curly Fruit",
		inventory_image = "lib_ecology_fruit_curly.png",
		on_use = minetest.item_eat(1),
	})
	minetest.register_craftitem("lib_ecology:fruit_eye", {
		description = "Eyeball",
		inventory_image = "lib_ecology_fruit_eye.png"
	})

--GRASS
	minetest.register_node("lib_ecology:grass_1", {
		description = S("Grass - 1"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_1.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, grass = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_2"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("lib_ecology:grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_2", {
		description = S("Grass - 2"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_2.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, grass = 1, flammable = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_3"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("lib_ecology:grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_3", {
		description = S("Grass - 3"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_3.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, grass = 1, flammable = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_4"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("lib_ecology:grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_4", {
		description = S("Grass - 4"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_4.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, grass = 1, flammable = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_5"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("lib_ecology:grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_5", {
		description = S("Grass - 5"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_5.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, grass = 1, flammable = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random grass node
			local stack = ItemStack("lib_ecology:grass_" .. math.random(1,5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_bamboo", {
		description = S("Grass - Bamboo"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_bamboo.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_clover", {
		description = "Grass - Clover",
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_clover.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
		},
	})
	minetest.register_node("lib_ecology:grass_dead_1", {
		description = S("Grass - Dead 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_dead_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		drop = "lib_ecology:grass_dead_1",
	})
	minetest.register_node("lib_ecology:grass_dead_2", {
		description = S("Grass - Dead 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_dead_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		drop = "lib_ecology:grass_dead_2",
	})
	minetest.register_node("lib_ecology:grass_dead_3", {
		description = S("Grass - Dead 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_dead_3.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		drop = "lib_ecology:grass_dead_3",
	})
	minetest.register_node("lib_ecology:grass_dead_4", {
		description = S("Grass - Dead 4"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_dead_4.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		drop = "lib_ecology:grass_dead_4",
	})
	minetest.register_node("lib_ecology:grass_dead_5", {
		description = S("Grass - Dead 5"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_dead_5.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_dead_5",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		on_construct = function(pos)
			local num = math.random(1,5)
			minetest.env:set_node(pos, {name="lib_ecology:grass_dead_"..num})
		end
	})
	minetest.register_node("lib_ecology:grass_dry_1", {
		description = S("Grass - Dry 1"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_dry_1.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, dry_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random dry grass node
			local stack = ItemStack("default:dry_grass_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("default:dry_grass_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_dry_2", {
		description = S("Grass - Dry 2"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_dry_2.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, dry_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random dry grass node
			local stack = ItemStack("lib_ecology:grass_dry_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_dry_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_dry_3", {
		description = S("Grass - Dry 3"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_dry_3.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, dry_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random dry grass node
			local stack = ItemStack("lib_ecology:grass_dry_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_dry_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_dry_4", {
		description = S("Grass - Dry 4"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_dry_4.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, dry_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random dry grass node
			local stack = ItemStack("lib_ecology:grass_dry_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_dry_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_dry_5", {
		description = S("Grass - Dry 5"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_dry_5.png"},
		paramtype = "light",
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, dry_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random dry grass node
			local stack = ItemStack("lib_ecology:grass_dry_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_dry_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_giant", {
		description = S("Grass - Giant"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_giant.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 4,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_golden_1", {
		description = S("Grass - Golden 1"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_golden_1.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, golden_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_golden_2"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random golden grass node
			local stack = ItemStack("lib_ecology:grass_golden_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_golden_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_golden_2", {
		description = S("Grass - Golden 2"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_golden_2.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, golden_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_golden_3"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random golden grass node
			local stack = ItemStack("lib_ecology:grass_golden_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_golden_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_golden_3", {
		description = S("Grass - Golden 3"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_golden_3.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, golden_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_golden_4"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random golden grass node
			local stack = ItemStack("lib_ecology:grass_golden_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_golden_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_golden_4", {
		description = S("Grass - Golden 4"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_golden_4.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, golden_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_golden_5"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random golden grass node
			local stack = ItemStack("lib_ecology:grass_golden_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_golden_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_golden_5", {
		description = S("Grass - Golden 5"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_golden_5.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, golden_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random golden grass node
			local stack = ItemStack("lib_ecology:grass_golden_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_golden_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_green_1", {
		description = S("Grass - green 1"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_green_1.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, green_grass = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_green_2"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random green grass node
			local stack = ItemStack("lib_ecology:grass_green_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_green_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_green_2", {
		description = S("Grass - green 2"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_green_2.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, green_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_green_3"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random green grass node
			local stack = ItemStack("lib_ecology:grass_green_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_green_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_green_3", {
		description = S("Grass - green 3"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_green_3.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, green_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_green_4"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random green grass node
			local stack = ItemStack("lib_ecology:grass_green_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_green_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_green_4", {
		description = S("Grass - green 4"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_green_4.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, green_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_green_5"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random green grass node
			local stack = ItemStack("lib_ecology:grass_green_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_green_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_green_5", {
		description = S("Grass - green 5"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_grass_green_5.png"},
		paramtype = "light",
		visual_scale = 2.0,
		sunlight_propagates = true,
		floodable = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, plant = 1, attached_node = 1, growing = 1, green_grass = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random green grass node
			local stack = ItemStack("lib_ecology:grass_green_" .. math.random(1, 5))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_green_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_jungle_1", {
		description = S("Grass - Jungle 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_jungle_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_jungle_1",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_jungle_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_jungle_2", {
		description = S("Grass - Jungle 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_jungle_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_jungle_2",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_jungle_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_jungle_3", {
		description = S("Grass - Jungle 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_jungle_3.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_jungle_3",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_jungle_4"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_jungle_4", {
		description = S("Grass - Jungle 4"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_jungle_4.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_jungle_4",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_jungle_5"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_jungle_5", {
		description = S("Grass - Jungle 5"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_jungle_5.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_jungle_5",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		on_construct = function(pos)
			local num = math.random(1,5)
			minetest.env:set_node(pos, {name="lib_ecology:grass_jungle_"..num})
		end,
	})
	minetest.register_node("lib_ecology:grass_marram_1", {
		description = S("Grass - Marram 1"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_1.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3,  plant = 1, attached_node = 1, growing = 1,},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_marram_2"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- place a random marram grass node
			local stack = ItemStack("lib_ecology:grass_marram_" .. math.random(1, 3))
			local ret = minetest.item_place(stack, placer, pointed_thing)
			return ItemStack("lib_ecology:grass_marram_1 " ..
				itemstack:get_count() - (1 - ret:get_count()))
		end,
	})
	minetest.register_node("lib_ecology:grass_marram_2", {
		description = S("Grass - Marram 2"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_2.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, plant = 1, attached_node = 1, growing = 1, not_in_creative_inventory=1},
		drop = "lib_ecology:grass_marram_1",
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_marram_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_marram_3", {
		description = S("Grass - Marram 3"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_3.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, plant = 1, attached_node = 1, growing = 1, not_in_creative_inventory=1},
		drop = "lib_ecology:grass_marram_1",
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})
	minetest.register_node("lib_ecology:grass_sea_1", {
		description = S("Grass - Sea 1"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_grass_sea_1.png", tileable_vertical = true}},
		node_dig_prediction = "lib_ecology:grass_sea_1",
		node_placement_prediction = "lib_ecology:grass_sea_1",
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, sea=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			local num = math.random(1,3)
			minetest.env:set_node(pos, {name="lib_ecology:grass_sea_"..num})

			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_sea_2"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:grass_sea_1",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end,
	})
	minetest.register_node("lib_ecology:grass_sea_2", {
		description = S("Grass - Sea 2"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_grass_sea_2.png", tileable_vertical = true}},
		node_dig_prediction = "lib_ecology:grass_sea_2",
		node_placement_prediction = "lib_ecology:grass_sea_2",
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, sea=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_sea_3"})
		
		end,

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:grass_sea_2",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end,
	})
	minetest.register_node("lib_ecology:grass_sea_3", {
		description = S("Grass - Sea 3"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_grass_sea_3.png", tileable_vertical = true}},
		node_dig_prediction = "lib_ecology:grass_sea_3",
		node_placement_prediction = "lib_ecology:grass_sea_3",
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, sea=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		drop = "lib_ecology:grass_sea_1",
		walkable = false,

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:grass_sea_3",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end,
	})
	minetest.register_node("lib_ecology:grass_snow_1", {
		description = S("Grass - Snow 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_snow_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_snow_1",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_snow_2", {
		description = S("Grass - Snow 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_snow_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_snow_2",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_snow_3", {
		description = S("Grass - Snow 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_snow_3.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_snow_3",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_snow_4", {
		description = S("Grass - Snow 4"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_snow_4.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_snow_4",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_snow_5", {
		description = S("Grass - Snow 5"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_snow_5.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_snow_5",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_swamp_1", {
		description = S("Grass - Swamp 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_swamp_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_swamp_1",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, grass = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_swamp_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_swamp_2", {
		description = S("Grass - Swamp 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_swamp_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_swamp_2",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, grass = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_swamp_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_swamp_3", {
		description = S("Grass - Swamp 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_swamp_3.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_swamp_3",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, grass = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_swamp_4"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_swamp_4", {
		description = S("Grass - Swamp 4"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_swamp_4.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_swamp_4",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, grass = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:grass_swamp_5"})
		
		end,

	})
	minetest.register_node("lib_ecology:grass_swamp_5", {
		description = S("Grass - Swamp 5"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_swamp_5.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		drop = "lib_ecology:grass_swamp_5",
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, grass = 1, attached_node = 1, growing = 1, flora=1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
		on_construct = function(pos)
			local num = math.random(1,5)
			minetest.env:set_node(pos, {name="lib_ecology:grass_swamp_"..num})
		end,
	})
	minetest.register_node("lib_ecology:grass_tall", {
		description = S("Grass - Tall"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_long.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})

--GROUND COVER
	minetest.register_node("lib_ecology:ground_grass", {
		description = S("ground_grass"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_ground_grass.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:ground_grass_dry", {
		description = S("ground_grass_dry"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_ground_grass_dry.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:ground_leaf_litter", {
		description = S("ground_leaf_litter"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_ground_leaf_litter.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:ground_leaf_litter_2", {
		description = S("ground_leaf_litter_2"),
		drawtype = "nodebox",
		waving = 1,
		tiles = {"lib_ecology_ground_leaf_litter_2.png"},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})

--PLANTS
	minetest.register_node("lib_ecology:plant_aloe_vera", {
		description = S("Plant - Aloe Vera"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_aloe_vera.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_arrow_arum", {
		description = S("Arrow Arum"),
		drawtype = "plantlike",
		tiles = { "lib_ecology_plant_arrow_arum.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:plant_arrow_arum_water_sand", {
		description = S("Arrow Arum"),
		drawtype = "nodebox",
		tiles = { "default_sand.png", "lib_ecology_plant_arrow_arum.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = { max_items=2, items={{items={"lib_ecology:plant_arrow_arum"}, rarity=1}, {items={"default:sand"}, rarity=1}}},
		node_box = {
			type='fixed',
			fixed={{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, {-0.5, 0.5, -0.001, 0.5, 1.5, 0.001}, {-0.001, 0.5, -0.5, 0.001, 1.5, 0.5}}},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 11/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:plant_arrow_arum_water_soil", {
		description = S("Arrow Arum"),
		drawtype = "nodebox",
		tiles = { "default_dirt.png", "lib_ecology_plant_arrow_arum.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = { max_items=2, items={{items={"lib_ecology:plant_arrow_arum"}, rarity=1}, {items={"default:dirt"}, rarity=1}}},
		node_box = {
			type='fixed',
			fixed={{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, {-0.5, 0.5, -0.001, 0.5, 1.5, 0.001}, {-0.001, 0.5, -0.5, 0.001, 1.5, 0.5}}},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 11/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:plant_banana_1", {
		description = S("Plant - Banana 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_banana_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_banana_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_banana_2", {
		description = S("Plant - Banana 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_banana_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2.0,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,

		on_rightclick = function(pos, node)
		
			minetest.set_node(pos, {name="lib_ecology:plant_banana_1"})
			minetest.env:add_item(pos, "lib_ecology:fruit_banana_01")
			--minetest.add_item(pos, {"lib_ecology:fruit_banana_01"})
			
		end,

	})
	minetest.register_node("lib_ecology:plant_banana_tree_trunk_top", {
		description = S("Plant - Banana Tree Trunk Top"),
		drawtype = "plantlike_rooted",
		tiles = {
			"lib_ecology_tree_banana_01_trunk_top.png",
			"lib_ecology_tree_banana_01_trunk_top.png",
			"lib_ecology_tree_banana_01_trunk.png"
		},
		special_tiles = {{name = "lib_ecology_plant_banana_2.png", tileable_vertical = false}},
		visual_scale = 2.0,
		paramtype = "light",
		buildable_to = false, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = true,
		waving = 1,
		node_dig_prediction = "lib_ecology:plant_banana_tree_trunk",
		node_placement_prediction = "lib_ecology:plant_banana_tree_trunk",
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
		sounds = lib_ecology.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, -0.2, 0.3}
		},
	})
	minetest.register_node("lib_ecology:plant_banana_tree_trunk", {
		description = S("Plant - Banana Tree Trunk"),
		tiles = {
			"lib_ecology_tree_banana_01_trunk_top.png",
			"lib_ecology_tree_banana_01_trunk_top.png",
			"lib_ecology_tree_banana_01_trunk.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, wood=1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:plant_banana_tree_leaves", {
		description = S("Plant - Banana Tree Leaves"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		visual_scale = 1.2,--1.2, 2.0
		tiles = {"lib_ecology_plant_banana_2.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = false,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
	})
	minetest.register_node("lib_ecology:plant_bulrush", {
		description = S("Plant - Bulrush"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_bullrush.png"},
		visual_scale = 3.0,--1.3
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:plant_cattail", {
		description = S("Plant - Cattail"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_cattail.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_cattail_02", {
		description = S("Plant - Cattail 02"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_cattail_02.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_cattails_03", {
		description = S("Plant - Cattails 03"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_cattails_03.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_crabgrass", {
		description = S("Plant - Crabgrass"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_crabgrass.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_creeper", {
		description = S("Plant - Creeper"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_creeper.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_curly", {
		description = S("Plant - Curly flower"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_curly.png"},
		visual_scale = 1.1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = "lib_ecology:fruit_curlyfruit",
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.4, 0.3}
		},
	})
	minetest.register_node("lib_ecology:plant_heath_gold", {
		description = S("Plant - Heath Gold"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_heath_gold.png"},
		paramtype = "light",
		visual_scale = 2.0,
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_heath_green", {
		description = S("Plant - Heath Green"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_heath_green.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_heath_purple", {
		description = S("Plant - Heath Purple"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_heath_purple.png"},
		paramtype = "light",
		visual_scale = 2.0,
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_heath_red", {
		description = S("Plant - Heath Red"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_heath_red.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_heath_sandwort", {
		description = S("Plant - Heath Sandwort"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_heath_sandwort.png"},
		paramtype = "light",
		visual_scale = 2.0,
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_heath_saxifrage_purple", {
		description = S("Plant - Heath Saxifrage Purple"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_heath_saxifrage_purple.png"},
		paramtype = "light",
		visual_scale = 2.0,
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus", {
		description = S("Plant - Juncus"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus.png"},
		visual_scale = 2.0,
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus_1", {
		description = S("Plant - Juncus 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_juncus_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_juncus_2", {
		description = S("Plant - Juncus 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_2.png"},
		visual_scale = 4.0,
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_juncus_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_juncus_3", {
		description = S("Plant - Juncus 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_3.png"},
		visual_scale = 4.0,
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, plant = 1, attached_node = 1, growing = 1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_mangrove_fern", {
		description = S("Plant - Mangrove Fern"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_mangrove_fern.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_manna_reed", {
		description = S("Plant - Manna Reed"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_manna_reed.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_dark_green = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:plant_nettle_nettle", {
		description = S("Plant - Nettle"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.4,
		tiles = {"lib_ecology_plant_nettle_nettle.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		damage_per_second = 1,
		groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
		},
	})
	minetest.register_node("lib_ecology:plant_nettle_impatiens", {
		description = S("Plant - Impatiens"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.4,
		tiles = {"lib_ecology_plant_nettle_impatiens.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_nettle_cleavers", {
		description = S("Plant - Cleavers"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.2,
		tiles = {"lib_ecology_plant_nettle_cleavers.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		liquidtype = "source",
		liquid_alternative_flowing = "lib_ecology:plant_nettle_cleavers",
		liquid_alternative_source = "lib_ecology:plant_nettle_cleavers",
		liquid_renewable = false,
		liquid_range = 0,
		liquid_viscosity = 3,
		groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_nettle_carduus", {
		description = S("Plant - Carduus"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.2,
		tiles = {"lib_ecology_plant_nettle_carduus.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		damage_per_second = 1,
		groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_nettle_scotch_broom", {
		description = S("Plant - Scotch Broom"),
		drawtype = "mesh",
		mesh = "nettle_scotch_broom.obj",
		waving = 1,
		tiles = {"lib_ecology_plant_nettle_scotch_broom.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_nettle_giant_hogweed", {
		description = S("Plant - Giant Hogweed"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"lib_ecology_plant_nettle_giant_hogweed.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		damage_per_second = 2,
		on_punch = function(pos, node, player, pointed_thing)
			player:set_hp(player:get_hp() - 1)
		end,
		groups = {snappy = 2, flora = 1, attached_node = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_palmetto_01", {
		description = S("Plant - Palmetto 01"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_palmetto_01.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 1.2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_weed", {
		description = S("Plant - Weed"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_weed.png"},
		visual_scale = 1.1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:plant_weed_dead", {
		description = S("Plant - Dead Weed"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_weed_dead.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
		},
	})
	minetest.register_node("lib_ecology:plant_weed_eye", {
		description = S("Plant - Eye Weed"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_weed_eye.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = "lib_ecology:fruit_eye",
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:plant_umbrella", {
		description = S("Plant - Umbrella Weed"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_umbrella.png"},
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:plant_vine_ebony", {
		description = S("Vine - Ebony"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_ebony.png"},
		inventory_image = "lib_ecology_plant_vine_ebony.png",
		wield_image = "lib_ecology_plant_vine_ebony.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_ebony_leaves", {
		description = S("Vine - Ebony with Leaves"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_ebony_leaves.png"},
		inventory_image = "lib_ecology_plant_vine_ebony_leaves.png",
		wield_image = "lib_ecology_plant_vine_ebony_leaves.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_ebony_liana", {
		description = S("Vine - Ebony Liana"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_ebony_liana.png"},
		inventory_image = "lib_ecology_plant_vine_ebony_liana.png",
		wield_image = "lib_ecology_plant_vine_ebony_liana.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_mahogany", {
		description = S("Vine - Mahogany"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_mahogany.png"},
		inventory_image = "lib_ecology_plant_vine_mahogany.png",
		wield_image = "lib_ecology_plant_vine_mahogany.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_mahogany_flowers", {
		description = S("Vine - Mahogany Flowers"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_mahogany_flowers.png"},
		inventory_image = "lib_ecology_plant_vine_mahogany_flowers.png",
		wield_image = "lib_ecology_plant_vine_mahogany_flowers.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_mahogany_hanging", {
		description = S("Vine - Mahogany Hanging"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_mahogany_hanging.png"},
		inventory_image = "lib_ecology_plant_vine_mahogany_hanging.png",
		wield_image = "lib_ecology_plant_vine_mahogany_hanging.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_01", {
		description = S("Vine 01"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_01.png"},
		inventory_image = "lib_ecology_plant_vine_01.png",
		wield_image = "lib_ecology_plant_vine_01.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_02", {
		description = S("Vine 02"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_02.png"},
		inventory_image = "lib_ecology_plant_vine_02.png",
		wield_image = "lib_ecology_plant_vine_02.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:plant_vine_03", {
		description = S("Vine 03"),
		drawtype = "signlike",
		tiles = {"lib_ecology_plant_vine_03.png"},
		inventory_image = "lib_ecology_plant_vine_03.png",
		wield_image = "lib_ecology_plant_vine_03.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		waving = 1,
		floodable = true,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1, lib_ecology_plant = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})

	minetest.register_craft({
		output = "default:cactus 1",
		recipe = {
			{"lib_ecology:plant_cactus", "lib_ecology:plant_cactus", "lib_ecology:plant_cactus"},
			{"lib_ecology:plant_cactus", "lib_ecology:plant_cactus", "lib_ecology:plant_cactus"},
			{"lib_ecology:plant_cactus", "lib_ecology:plant_cactus",  "lib_ecology:plant_cactus"}
		}
	})
	minetest.register_craft({
		output = "default:paper 1",
		recipe = {
			{"lib_ecology:plant_weed", "lib_ecology:plant_weed", "lib_ecology:plant_weed"},
		}
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:plant_nettle_nettle",
		burntime = 3,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:plant_nettle_impatiens",
		burntime = 3,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:plant_nettle_cleavers",
		burntime = 3,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:plant_nettle_carduus",
		burntime = 3,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:plant_nettle_scotch_broom",
		burntime = 6,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:plant_nettle_giant_hogweed",
		burntime = 3,
	})

	minetest.register_craft({
		output = "lib_ecology:plant_vine_01 2",
		recipe = {
			{"group:leaves", "group:leaves"},
			{"group:leaves", "group:leaves"},
			{"group:leaves", "group:leaves"},
		}
	})

--MUSHROOMS
	minetest.register_node("lib_ecology:mushroom_blue_cave", {
		description = S("Mushroom - Blue Cave"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_mushroom_blue_cave.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
		on_use = minetest.item_eat(1),
	})
	minetest.register_node("lib_ecology:mushroom_brown", {
		description = S("Mushroom - Brown"),
		tiles = {"lib_ecology_mushroom_brown.png"},
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {food_mushroom = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		on_use = minetest.item_eat(1),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
		}
	})
	minetest.register_node("lib_ecology:mushroom_fire", {
		description = S("Mushroom - Fire"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_mushroom_fire.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:mushroom_glow_fungus", {
		description = S("Mushroom - Glow Fungus"),
		drawtype = "torchlike",
		tiles = {"lib_ecology_mushroom_glow_fungus.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		paramtype2 = "wallmounted",
		legacy_wallmounted = true,
		is_ground_content = false,
		buildable_to = true, 
		light_source = 14,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "wallmounted",
			wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
			wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
			wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
		},
	})
	minetest.register_node("lib_ecology:mushroom_ground_fungus", {
		description = S("Mushroom - Ground Fungus"),
		drawtype = "plantlike",--firelike
		tiles = {"lib_ecology_mushroom_ground_fungus.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
		},
	})
	minetest.register_node("lib_ecology:mushroom_pink", {
		description = S("Mushroom - Pink"),
		tiles = {
			"moreplants_mushroom_top.png",
			"moreplants_mushroom_top.png",
			"moreplants_mushroom_side.png",
			"moreplants_mushroom_side.png",
			"moreplants_mushroom_side.png",
			"moreplants_mushroom_side.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		light_source=2,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.0625, -0.5, -0.0625, 0.0625, -0.3125, 0.0625}, -- NodeBox1
				{-0.1875, -0.3125, -0.1875, 0.1875, -0.1875, 0.1875}, -- NodeBox2
				{-0.125, -0.1875, -0.125, 0.125, -0.125, 0.125}, -- NodeBox3
			}
		},
	})
	minetest.register_node("lib_ecology:mushroom_red", {
		description = S("Mushroom - Red"),
		tiles = {"lib_ecology_mushroom_red.png"},
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		on_use = minetest.item_eat(-5),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})
	minetest.register_node("lib_ecology:mushroom_red_large", {
		description = S("Mushroom - Red Large"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_mushroom_red_large.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:mushroom_stone", {
		description = S("Mushroom - Stone"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_mushroom_stone.png"},
		visual_scale = 1,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
		},
	})
	minetest.register_node("lib_ecology:mushroom_white", {
		description = S("Mushroom - White"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_mushroom_white.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})


--MISC.
	minetest.register_node("lib_ecology:plant_willow_01", {
		description = S("Plant - Willow 01"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_willow_01.png^[transformFY"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_willow_02", {
		description = S("Plant - Willow 01"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_willow_01.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})


--FRUIT TREES / PLANTS
	minetest.register_node("lib_ecology:bush_blueberry_leaves_with_berries", {
		description = "Bush - Blueberry Leaves with Berries",
		drawtype = "allfaces_optional",
		waving = 1,
		tiles = {"lib_ecology_bush_blueberry_leaves.png^lib_ecology_bush_blueberry_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		drop = "lib_ecology:fruit_blueberries",
		sounds = lib_ecology.node_sound_leaves_defaults(),
		node_dig_prediction = "lib_ecology:bush_blueberry_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "lib_ecology:bush_blueberry_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})
	minetest.register_node("lib_ecology:bush_blueberry_leaves", {
		description = "Bush - Blueberry Leaves",
		drawtype = "allfaces_optional",
		waving = 1,
		tiles = {"lib_ecology_bush_blueberry_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:bush_blueberry_sapling"}, rarity = 5},
				{items = {"lib_ecology:bush_blueberry_leaves"}}
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "lib_ecology:bush_blueberry_leaves_with_berries"})
			end
		end,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		after_place_node = lib_ecology.after_place_leaves,
	})
	minetest.register_node("lib_ecology:bush_blueberry_sapling", {
		description = "Bush - Blueberry Sapling",
		drawtype = "plantlike",
		tiles = {"lib_ecology_bush_blueberry_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = default.grow_sapling,
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:bush_blueberry_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	minetest.register_node("lib_ecology:plant_pineapple_plant_growing", {
		description = S("Plant - Pineapple Plant"),
		drawtype = "plantlike",
		paramtype = "light",
		visual_scale = 2,
		walkable = false,
		tiles = {
			"lib_ecology_plant_pineapple_plant_growing.png",
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2},
		},
		waving = 1,
		floodable = true,
		groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 1, dig_immediate = 1, flora = 1, not_in_creative_inventory=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_pineapple_plant"})
		
		end,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

	})
	-- minetest.register_abm({
		-- nodenames = {"lib_ecology:plant_pineapple_plant_growing"},
		-- interval = 30,
		-- chance = 2,
		-- action = function(pos, node)
			-- minetest.env:set_node(pos, {name="lib_ecology:plant_pineapple_plant"})
		-- end
	-- })
	minetest.register_node("lib_ecology:plant_pineapple_plant", {
		description = S("Plant - Pineapple Plant"),
		drawtype = "plantlike",
		paramtype = "light",
		visual_scale = 2,
		waving = 1,
		floodable = true,
		walkable = false,
		tiles = {
			"lib_ecology_plant_pineapple_plant.png",
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2},
		},
		groups = {snappy = 1, oddly_breakable_by_hand = 1, flammable = 1, dig_immediate = 1, flora = 1,},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_rightclick = function(pos, node)
		
			--minetest.env:set_node(pos, {name="lib_ecology:plant_pineapple_plant_growing"})
			minetest.set_node(pos, {name="lib_ecology:plant_pineapple_plant_growing"})
			
			minetest.env:add_item(pos, "lib_ecology:fruit_pineapple")
			--minetest.add_item(pos, {"lib_ecology:fruit_pineapple"})
			
			
		end,
	})
	minetest.register_node("lib_ecology:plant_wild_oat", {
		description = S("Plant - Wild Oat"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_oat.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_wild_oat_dry", {
		description = S("Plant - Dry Wild Oat"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_oat_dry.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_strawberry_1", {
		description = S("Plant - Strawberry 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_1.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_2", {
		description = S("Plant - Strawberry 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_2.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_3", {
		description = S("Plant - Strawberry 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_3.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_4"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_4", {
		description = S("Plant - Strawberry 4"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_4.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_5"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_5", {
		description = S("Plant - Strawberry 5"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_5.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_6"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_6", {
		description = S("Plant - Strawberry 6"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_6.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = {
			items = {
				{items = {"lib_ecology:strawberry 1"},rarity = 2},
				{items = {"lib_ecology:strawberry 2"},rarity = 3},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_7"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_7", {
		description = S("Plant - Strawberry 7"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_7.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = {
			items = {
				{items = {"lib_ecology:strawberry 1"},rarity = 1},
				{items = {"lib_ecology:strawberry 2"},rarity = 3},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_8"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_strawberry_8", {
		description = S("Plant - Strawberry 8"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_strawberry_8.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		drop = {
			items = {
				{items = {"lib_ecology:strawberry 2"},rarity = 1},
				{items = {"lib_ecology:strawberry 3"},rarity = 3},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 0},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_rightclick = function(pos, node)
		
			minetest.set_node(pos, {name="lib_ecology:plant_strawberry_1"})
			minetest.env:add_item(pos, "lib_ecology:fruit_strawberry")
			--minetest.add_item(pos, {"lib_ecology:fruit_strawberry"})
			
		end,

	})
	minetest.register_node("lib_ecology:plant_wild_onion_1", {
		description = S("Plant - Wild Onion 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_onion_1.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		waving = 1,
		floodable = true,
		groups = { snappy = 3, flammable = 2, plant = 1, attached_node = 1, growing = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_wild_onion_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_wild_onion_2", {
		description = S("Plant - Wild Onion 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_onion_2.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		waving = 1,
		floodable = true,
		groups = { snappy = 3, flammable = 2, plant = 1, attached_node = 1, growing = 1, not_in_creative_inventory = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_wild_onion_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_wild_onion_3", {
		description = S("Plant - Wild Onion 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_onion_3.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		waving = 1,
		floodable = true,
		groups = { snappy = 3, flammable = 2, plant = 1, attached_node = 1, growing = 1, not_in_creative_inventory = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_wild_onion_4"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_wild_onion_4", {
		description = S("Plant - Wild Onion 4"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_onion_4.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		waving = 1,
		floodable = true,
		groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1, growing = 1, not_in_creative_inventory = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			items = {
				{items = {"lib_ecology:fruit_wild_onion"}, rarity = 1},
				{items = {"lib_ecology:fruit_wild_onion 2"}, rarity = 3},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_wild_onion_5"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_wild_onion_5", {
		description = S("Plant - Wild Onion 5"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_wild_onion_5.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		waving = 1,
		floodable = true,
		groups = {snappy = 3, flammable = 2, plant = 1, attached_node = 1, growing = 0, not_in_creative_inventory = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		drop = {
			items = {
				{items = {"lib_ecology:fruit_wild_onion 2"}, rarity = 1},
				{items = {"lib_ecology:fruit_wild_onion 3"}, rarity = 2},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},

		on_rightclick = function(pos, node)
		
			--minetest.env:set_node(pos, {name="lib_ecology:plant_wild_onion_1"})
			minetest.set_node(pos, {name="lib_ecology:plant_wild_onion_1"})
			
			minetest.env:add_item(pos, "lib_ecology:fruit_wild_onion")
			--minetest.add_item(pos, {"lib_ecology:fruit_wild_onion"})
			
			
		end,

	})


--TREES
	minetest.register_node("lib_ecology:tree_bamboo_with_leaves", {
		description = S("Plant - Bamboo With Leaves"),
		tiles = {
		"lib_ecology_tree_bamboo_02_trunk_top.png",
		"lib_ecology_tree_bamboo_02_trunk_top.png",
		"lib_ecology_tree_bamboo_02_leaves.png^lib_ecology_tree_bamboo_02_trunk.png"
		},
		is_ground_content = false,
		sunlight_propagates = false,
		floodable = true,
		groups = {choppy=1, flammable=1, oddly_breakable_by_hand=1, tree=1, leaves=1},
		sounds = lib_ecology.node_sound_wood_defaults(),
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox1
				{-0.5, -0.5, 0, 0.5, 0.5, 0}, -- NodeBox2
				{0.00470524, -0.5, -0.5, 0.00470524, 0.5, 0.5}, -- NodeBox3
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875},
			}
		},
		drop = "lib_ecology:tree_bamboo_02_trunk"
	})
	minetest.register_node("lib_ecology:tree_bamboo_small", {
		description = S("Plant - Small Bamboo"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_bamboo_small.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:tree_bamboo_small_top", {
		description = S("Plant - Small Bamboo Top"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_bamboo_small_top.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		visual_scale = 2,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:tree_small_jungle", {
		description = S("Plant - Small Jungle Tree"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_jungletree.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 1, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:tree_desert_palm", {
		description = S("Plant - Desert Palm Tree"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_desert_palm.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 6.0,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 1, 0.2}
		},
		walkable = false,
	})

	minetest.register_node("lib_ecology:tree_palmetto_trunk", {
		description = "Palmetto trunk",
		tiles = {"lib_ecology_tree_palmetto_trunk_top.png", "lib_ecology_tree_palmetto_trunk_top.png", "lib_ecology_tree_palmetto_trunk.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.3125, -0.5, -0.375, 0.3125, 0.5, 0.375}, -- NodeBox1
				{-0.375, -0.5, -0.3125, 0.375, 0.5, 0.3125}, -- NodeBox2
			}
		},
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palmetto_leaves", {
		description = "palmetto leaves",
		drawtype = "plantlike",
		visual_scale = 2.5,
		tiles = {"lib_ecology_tree_palmetto_leaves.png"},
		use_texture_alpha = true,
		paramtype = "light",
		sunlight_propagates = false,
		walkable = false,
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, -0.2, 0.3}
		},
		groups = {cracky=3,dig_immediate=3},
	})
	minetest.register_node("lib_ecology:tree_palmetto_leaves2", {
		description = "palmetto leaves (2)",
		drawtype = "signlike",
		visual_scale = 4.0,
		tiles = {"lib_ecology_tree_palmetto_leaves2.png"},
		use_texture_alpha = true,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = false,
		walkable = false,
		is_ground_content = true,
		selection_box = {
			type = "wallmounted",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
		},
		groups = {cracky=3,dig_immediate=3},
	})
	minetest.register_node("lib_ecology:tree_palmetto", {
		description = "Tree - Palmetto",
		drawtype = "plantlike_rooted",
		tiles = {
			"lib_ecology_tree_palmetto_trunk_top.png",
			"lib_ecology_tree_palmetto_trunk_top.png",
			"lib_ecology_tree_palmetto_trunk.png",
			"lib_ecology_tree_palmetto_trunk.png",
			"lib_ecology_tree_palmetto_trunk.png",
			"lib_ecology_tree_palmetto_trunk.png",
		},
		special_tiles = {{name = "lib_ecology_tree_palmetto_leaves.png", tileable_vertical = false}},
		visual_scale = 8.0,
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:tree_palmetto",
		node_placement_prediction = "lib_ecology:tree_palmetto",
		groups = {cracky=3,dig_immediate=3},
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.7, 0.3}
		},
	})


--AQUATIC
	minetest.register_node("lib_ecology:plant_papyrus", {
		description = S("Papyrus"),
		drawtype = "nodebox",
		tiles = {
			"lib_ecology_plant_papyrus.png^(lib_ecology_plant_papyrus.png^[transformFX)",
			"lib_ecology_plant_papyrus.png^(lib_ecology_plant_papyrus.png^[transformFX)",
			"lib_ecology_plant_papyrus.png",
			"lib_ecology_plant_papyrus.png^[transformFX",
			"lib_ecology_plant_papyrus.png^[transformFX",
			"lib_ecology_plant_papyrus.png",
		},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4375, -0.5, -0.1875, -0.3125, 0.5, -0.0625}, -- NodeBox1
				{-0.1875, -0.5, 0.3125, -0.0625, 0.5, 0.4375}, -- NodeBox2
				{0.0625, -0.5, -0.4375, 0.1875, 0.5, -0.3125}, -- NodeBox3
				{0.3125, -0.5, 0.0625, 0.4375, 0.5, 0.1875}, -- NodeBox4
				{-0.5, 0.1875, -0.1875, -0.4375, 0.3125, -0.0625}, -- NodeBox5
				{-0.0625, -0.3125, 0.3125, 0, -0.1875, 0.4375}, -- NodeBox6
				{0, -0.0625, -0.4375, 0.0625, 0.0625, -0.3125}, -- NodeBox7
				{0.4375, 0.25, 0.0625, 0.5, 0.4375, 0.1875}, -- NodeBox8
				{0.0625, 0.1875, -0.5, 0.1875, 0.375, -0.4375}, -- NodeBox9
				{-0.4375, -0.3125, -0.0625, -0.3125, -0.1875, 0}, -- NodeBox10
				{0.3125, -0.0625, 0, 0.4375, 0.0625, 0.0625}, -- NodeBox11
				{-0.1875, 0.25, 0.4375, -0.0625, 0.4375, 0.5}, -- NodeBox12
			}
		},
		groups = {snappy = 3, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	--minetest.register_alias("default:papyrus", "lib_ecology:papyrus_3d")
	minetest.override_item("default:papyrus", {
		drawtype = "nodebox",
		tiles = {
			"default_papyrus.png^[transformR90^default_papyrus.png",
			"default_papyrus.png^[transformR90^default_papyrus.png",
			"default_papyrus.png",
			"default_papyrus.png^[transformFX",
			"default_papyrus.png^[transformFX",
			"default_papyrus.png",
		},
		inventory_image = nil,
		wield_image = nil,
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4375, -0.5, -0.1875, -0.3125, 0.5, -0.0625}, -- NodeBox1
				{-0.1875, -0.5, 0.3125, -0.0625, 0.5, 0.4375}, -- NodeBox2
				{0.0625, -0.5, -0.4375, 0.1875, 0.5, -0.3125}, -- NodeBox3
				{0.3125, -0.5, 0.0625, 0.4375, 0.5, 0.1875}, -- NodeBox4
				{-0.5, 0.1875, -0.1875, -0.4375, 0.3125, -0.0625}, -- NodeBox5
				{-0.0625, -0.3125, 0.3125, 0, -0.1875, 0.4375}, -- NodeBox6
				{0, -0.0625, -0.4375, 0.0625, 0.0625, -0.3125}, -- NodeBox7
				{0.4375, 0.25, 0.0625, 0.5, 0.4375, 0.1875}, -- NodeBox8
				{0.0625, 0.1875, -0.5, 0.1875, 0.375, -0.4375}, -- NodeBox9
				{-0.4375, -0.3125, -0.0625, -0.3125, -0.1875, 0}, -- NodeBox10
				{0.3125, -0.0625, 0, 0.4375, 0.0625, 0.0625}, -- NodeBox11
				{-0.1875, 0.25, 0.4375, -0.0625, 0.4375, 0.5}, -- NodeBox12
			}
		},
	})

	minetest.register_node("lib_ecology:plant_reedmace_1", {
		description = S("Plant - Reedmace 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_1.png"},
		paramtype = "light",
		visual_scale = 2,
		is_ground_content = false,
		sunlight_propagates = true,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_reedmace_2"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_reedmace_2", {
		description = S("Plant - Reedmace 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_2.png"},
		paramtype = "light",
		visual_scale = 2,
		is_ground_content = false,
		sunlight_propagates = true,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,

		on_construct = function(pos)
		
			minetest.get_node_timer(pos):start(math.random(60,120))
		
		end,

		on_timer = function(pos)

			minetest.set_node(pos, {name="lib_ecology:plant_reedmace_3"})
		
		end,

	})
	minetest.register_node("lib_ecology:plant_reedmace_3", {
		description = S("Plant - Reedmace 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_3.png"},
		paramtype = "light",
		visual_scale = 2,
		is_ground_content = false,
		sunlight_propagates = true,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_reedmace", {
		description = S("Plant - Reedmace"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_reedmace_bottom", {
		description = S("Plant - Reedmace Bottom"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_bottom.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		visual_scale = 1,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_reedmace_top", {
		description = S("Plant - Reedmace Top"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_top.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		visual_scale = 1,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_reedmace_spikes", {
		description = S("Plant - Reedmace Spikes"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_spikes.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		visual_scale = 1,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_reedmace_water", {
		description = S("Plant - Reedmace Water"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_dirt_mud_01.png"},
		special_tiles = {{name = "lib_ecology_plant_reedmace_water.png", tileable_vertical = true}},
		paramtype = "light",
		visual_scale = 1,
		paramtype2 = "leveled",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:plant_reedmace_water",
		node_placement_prediction = "lib_ecology:plant_reedmace_water",
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end
	})
	minetest.register_node("lib_ecology:plant_reedmace_water_dnu", {
		description = S("Plant - Reedmace Water **DNU**"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace_water.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		visual_scale = 1,
		waving = 1,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})

	minetest.register_node("lib_ecology:plant_waterlily_pink", {
		description = S("Waterlily with Pink Flower (no flower)"),
		drawtype = "mesh",
		mesh = "waterlily.b3d",
		paramtype = "light",
		paramtype2 = "facedir",
		visual_scale = 0.5,
		tiles = {"lib_ecology_plant_waterlily_pink_noflower.png",},
		liquids_pointable = true,
		walkable = false,
		buildable_to = true,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		node_dig_prediction = "lib_ecology:plant_waterlily_pink",
		node_placement_prediction = "lib_ecology:plant_waterlily_pink",
		groups = {snappy = 3, flower = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, -15 / 32, 7 / 16}
		},

		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			local node = minetest.get_node(pointed_thing.under).name
			local def = minetest.registered_nodes[node]
			local player_name = placer:get_player_name()

			if def and def.liquidtype == "source" and
					minetest.get_item_group(node, "water") > 0 then
				if not minetest.is_protected(pos, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_waterlily_pink", param2 = math.random(0, 3)})
					if not minetest.setting_getbool("creative_mode") then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end
	})
	minetest.register_node("lib_ecology:plant_waterlily_yellow", {
		description = S("Waterlily with Yellow Flower (no flower)"),
		drawtype = "mesh",
		mesh = "waterlily.b3d",
		paramtype = "light",
		paramtype2 = "facedir",
		visual_scale = 0.5,
		tiles = {"lib_ecology_plant_waterlily_yellow_noflower.png",},
		liquids_pointable = true,
		walkable = false,
		buildable_to = true,
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		node_dig_prediction = "lib_ecology:plant_waterlily_yellow",
		node_placement_prediction = "lib_ecology:plant_waterlily_yellow",
		groups = {snappy = 3, flower = 1, flammable = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, -15 / 32, 7 / 16}
		},

		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			local node = minetest.get_node(pointed_thing.under).name
			local def = minetest.registered_nodes[node]
			local player_name = placer:get_player_name()

			if def and def.liquidtype == "source" and
					minetest.get_item_group(node, "water") > 0 then
				if not minetest.is_protected(pos, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_waterlily_yellow", param2 = math.random(0, 3)})
					if not minetest.setting_getbool("creative_mode") then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end
	})


	minetest.register_node("lib_ecology:plant_anemone", {
		description = S("Plant - Anemone"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_plant_anemone.png", tileable_vertical = false}},
		inventory_image = "lib_ecology_plant_anemone.png",
		wield_image = "lib_ecology_plant_anemone.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_skeleton",
		node_placement_prediction = "",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:plant_anemone"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:plant_kelp_01", {
		description = S("Plant - Kelp 01"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_plant_kelp_01.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_plant_kelp_01.png",
		wield_image = "lib_ecology_plant_kelp_01.png",
		paramtype = "light",
		paramtype2 = "leveled",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_materials:sand",
		node_placement_prediction = "",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_sand_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
					{-2/16, 0.5, -2/16, 2/16, 3.5, 2/16},
			},
		},

		on_use = minetest.item_eat(1),

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end
	
			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end
	
			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()
	
			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_kelp_01",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end
	
			return itemstack
		end,
	
		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end

	})
	minetest.register_node("lib_ecology:plant_kelp_02_1", {
		description = S("Plant - Kelp 02 1"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_plant_kelp_02_1.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_plant_kelp_02_1.png",
		wield_image = "lib_ecology_plant_kelp_02_1.png",
		paramtype = "light",
		paramtype2 = "leveled",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_materials:sand",
		node_placement_prediction = "",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_sand_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},

		on_use = minetest.item_eat(1),

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_kelp_02_1",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end
	})
	minetest.register_node("lib_ecology:plant_kelp_02_2", {
		description = S("Plant - Kelp 02 2"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_plant_kelp_02_2.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_plant_kelp_02_2.png",
		wield_image = "lib_ecology_plant_kelp_02_2.png",
		paramtype = "light",
		paramtype2 = "leveled",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_materials:sand",
		node_placement_prediction = "",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_sand_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},

		on_use = minetest.item_eat(1),

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_kelp_02_2",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end
	})
	minetest.register_node("lib_ecology:plant_seaweed", {
		description = S("Plant - Seaweed"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_plant_seaweed.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_plant_seaweed.png",
		wield_image = "lib_ecology_plant_seaweed.png",
		paramtype = "light",
		paramtype2 = "leveled",
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		climbable = true,
		drowning = 1,
		post_effect_color = {a = 64, r = 100, g = 100, b = 200},
		node_dig_prediction = "lib_materials:sand",
		node_placement_prediction = "",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},

		on_use = minetest.item_eat(1),

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_seaweed",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end
	})
	minetest.register_node("lib_ecology:plant_seaweed2", {
		description = S("Plant - Seaweed2"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_plant_seaweed.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_plant_seaweed.png",
		wield_image = "lib_ecology_plant_seaweed.png",
		paramtype = "light",
		paramtype2 = "leveled",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		climbable = true,
		drowning = 1,
		post_effect_color = {a = 64, r = 100, g = 100, b = 200},
		node_dig_prediction = "lib_materials:sand",
		node_placement_prediction = "",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},

		on_use = minetest.item_eat(1),

		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:sand" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:plant_seaweed2",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end,
	})
	minetest.register_node("lib_ecology:plant_seaweed3", {
		description = S("Plant - Seaweed3"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_sand_default.png"},
		special_tiles = {{name = "lib_ecology_plant_seaweed.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_plant_seaweed.png",
		wield_image = "lib_ecology_plant_seaweed.png",
		paramtype = "light",
		paramtype2 = "leveled",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		climbable = true,
		drowning = 1,
		post_effect_color = {a = 64, r = 100, g = 100, b = 200},
		node_dig_prediction = "lib_ecology:plant_seaweed3",
		node_placement_prediction = "lib_ecology:plant_seaweed3",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
					{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_materials:sand" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:plant_seaweed3"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:sand"})
		end,
	})


	--The pillars are neat, but a huge fps killer en masse.
	local grid = {}
	local pillars = 5
	for x = 1,pillars do
		for z = 1,pillars do
			local d2 = (2 / (pillars + 2)) / (pillars - 1)
			local d1 = (1 + d2) / pillars
			local g = {}
			g[#g + 1] = (x - 1) * d1 - 0.5
			g[#g + 1] = -0.5 
			g[#g + 1] = (z - 1) * d1 - 0.5
			g[#g + 1] = x * d1 - d2 - 0.5
			g[#g + 1] = 0.5 - (math.random(1,4) + math.random(4)) * 0.1 
			g[#g + 1] = z * d1 - d2 - 0.5
			grid[#grid + 1] = g
		end
	end

	minetest.register_node("lib_ecology:coral_blue_01", {
		description = S("Coral - Blue 01"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_blue_01.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_blue_01.png",
		wield_image = "lib_ecology_coral_blue_01.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_blue_01",
		node_placement_prediction = "lib_ecology:coral_blue_01",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
					{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_blue_01"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_blue_02", {
		description = S("Coral - Blue 02"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_blue_02.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_blue_02.png",
		wield_image = "lib_ecology_coral_blue_02.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_blue_02",
		node_placement_prediction = "lib_ecology:coral_blue_02",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 1 / 4, 6 / 16},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_blue_02"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_blue_03", {
		description = S("Coral - Blue 03"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_blue_03.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_blue_03.png",
		wield_image = "lib_ecology_coral_blue_03.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_blue_03",
		node_placement_prediction = "lib_ecology:coral_blue_03",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_blue_03"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_brain", {
		description = S("Coral - Brain"),
		tiles = {"lib_ecology_coral_brain.png"},
		light_source = 4,
		drop = "lib_ecology:coral_skeleton",
		groups = {cracky = 3, stone=1, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults(),
	})
	minetest.register_node("lib_ecology:coral_brown", {
		description = S("Coral - Brown"),
		tiles = {"lib_ecology_coral_brown.png"},
		groups = {cracky = 3, stone=1, sea=1},
		drop = "lib_ecology:coral_skeleton",
		sounds = lib_ecology.node_sound_stone_defaults(),
	})
	minetest.register_node("lib_ecology:coral_dragon_eye", {
		description = S("Coral - Dragon Eye"),
		tiles = {"lib_ecology_coral_dragon_eye.png"},
		light_source = 4,
		drop = "lib_ecology:coral_skeleton",
		groups = {cracky = 3, stone=1, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults(),
	})
	minetest.register_node("lib_ecology:coral_green_01", {
		description = S("Coral - Green 01"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_green_01.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_green_01.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_green_01",
		node_placement_prediction = "lib_ecology:coral_green_01",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
					{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_green_01"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_green_02", {
		description = S("Coral - Green 02"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_green_02.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_green_02.png",
		wield_image = "lib_ecology_coral_green_02.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_green_02",
		node_placement_prediction = "lib_ecology:coral_green_02",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 3 / 16, 6 / 16},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_green_02"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_orange_01", {
		description = S("Coral - Orange 01"),
		tiles = {"lib_ecology_coral_orange_01.png"},
		groups = {cracky = 3, stone=1, sea=1},
		drop = "lib_ecology:coral_skeleton",
		sounds = lib_ecology.node_sound_stone_defaults(),
	})
	minetest.register_node("lib_ecology:coral_orange_02", {
		description = S("Coral - Orange 02"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_orange_02.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_orange_02.png",
		wield_image = "lib_ecology_coral_orange_02.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_orange_02",
		node_placement_prediction = "lib_ecology:coral_orange_02",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 1 / 4, 6 / 16},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_orange_02"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_orange_03", {
		description = S("Coral - Orange 03"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_orange_03.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_orange_03.png",
		wield_image = "lib_ecology_coral_orange_03.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_orange_03",
		node_placement_prediction = "lib_ecology:coral_orange_03",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_orange_03"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_pillar", {
		description = S("Coral - Pillar"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_coral_pillar.png"},
		paramtype = "light",
		light_source = 2,
		drop = "lib_ecology:coral_skeleton",
		groups = {cracky = 3, stone=1, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults(),
		node_box = {
			type = "fixed", 
			fixed = grid,
		},
		selection_box = {
			type = "fixed", 
			fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		},
	})
	minetest.register_node("lib_ecology:coral_pink_01", {
		description = S("Coral - Pink 01"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_pink_01.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_pink_01.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_pink_01",
		node_placement_prediction = "lib_ecology:coral_pink_01",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
					{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
			},
		},

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_pink_01"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_pink_02", {
		description = S("Coral - Pink 02"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_pink_02.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_pink_02.png",
		wield_image = "lib_ecology_coral_pink_02.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_pink_02",
		node_placement_prediction = "lib_ecology:coral_pink_02",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 8 / 16, 6 / 16},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_pink_02"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_pink_03", {
		description = S("Coral - Pink 03"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_pink_03.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_pink_03.png",
		wield_image = "lib_ecology_coral_pink_03.png",
		visual_scale = 2,
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_pink_03",
		node_placement_prediction = "lib_ecology:coral_pink_03",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_pink_03"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_red", {
		description = S("Coral - Red"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_red.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_red.png",
		wield_image = "lib_ecology_coral_red.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_red",
		node_placement_prediction = "lib_ecology:coral_red",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_red"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})
	minetest.register_node("lib_ecology:coral_skeleton", {
		description = S("Coral - Skeleton"),
		tiles = {"lib_ecology_coral_skeleton.png"},
		groups = {cracky = 3, stone=1, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults(),
	})
	minetest.register_node("lib_ecology:coral_staghorn", {
		description = S("Coral - Staghorn"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_ecology_coral_skeleton.png"},
		special_tiles = {{name = "lib_ecology_coral_staghorn.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_coral_staghorn.png",
		wield_image = "lib_ecology_coral_staghorn.png",
		paramtype = "light",
		buildable_to = true, 
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = false,
		waving = 1,
		node_dig_prediction = "lib_ecology:coral_staghorn",
		node_placement_prediction = "lib_ecology:coral_staghorn",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_stone_defaults({
			dig = {name = "default_dig_snappy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" or not placer then
				return itemstack
			end

			local player_name = placer:get_player_name()
			local pos_under = pointed_thing.under
			local pos_above = pointed_thing.above

			if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or
					minetest.get_node(pos_above).name ~= "default:water_source" then
				return itemstack
			end

			if minetest.is_protected(pos_under, player_name) or
					minetest.is_protected(pos_above, player_name) then
				minetest.chat_send_player(player_name, "Node is protected")
				minetest.record_protection_violation(pos_under, player_name)
				return itemstack
			end

			minetest.set_node(pos_under, {name = "lib_ecology:coral_staghorn"})
			if not (creative and creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
		end,
	})

	minetest.register_craft( {
		type = "shapeless",
		output = "dye:dark_green 3",
		recipe = {"lib_ecology:plant_seaweed",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:cyan 3",
		recipe = {"lib_ecology:coral_blue_02",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:orange 3",
		recipe = {"lib_ecology:coral_orange_02",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:pink 3",
		recipe = {"lib_ecology:coral_pink_02",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:green 3",
		recipe = {"lib_ecology:coral_green_02",},
	})



if not farming or not farming.mod or farming.mod ~= "redo" then

	minetest.register_abm({
		label = "lib_ecology grow crops",
		nodenames = {
			"lib_ecology:plant_strawberry_1", "lib_ecology:plant_strawberry_2", "lib_ecology:plant_strawberry_3", "lib_ecology:plant_strawberry_4", "lib_ecology:plant_strawberry_5", "lib_ecology:plant_strawberry_6", "lib_ecology:plant_strawberry_7",
			"lib_ecology:plant_wild_onion_1", "lib_ecology:plant_wild_onion_2", "lib_ecology:plant_wild_onion_3", "lib_ecology:plant_wild_onion_4"
		},
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

			if node.name == "lib_ecology:plant_strawberry_1" or node.name == "lib_ecology:plant_strawberry_2" or node.name == "lib_ecology:plant_strawberry_3" or node.name == "lib_ecology:plant_strawberry_4" or node.name == "lib_ecology:plant_strawberry_5" or node.name == "lib_ecology:plant_strawberry_6" or node.name == "lib_ecology:plant_strawberry_7" then
				node.name = "lib_ecology:plant_strawberry_" .. tonumber(num + 1)
			elseif node.name == "lib_ecology:plant_wild_onion_1" or node.name == "lib_ecology:plant_wild_onion_2" or node.name == "lib_ecology:plant_wild_onion_3" or node.name == "lib_ecology:plant_wild_onion_4" then
				node.name = "lib_ecology:plant_wild_onion_" .. tonumber(num + 1)
			else
			
			end

			minetest.swap_node(pos, node)
		end
	})

end -- END IF



--OLD CODE

--ETHEREAL PLANTS

-- light strings (glowing vine)
	minetest.register_node("lib_ecology:lightstring", {
		description = S("Light String Vine"),
		drawtype = "signlike",
		tiles = {"lightstring.png"},
		inventory_image = "lightstring.png",
		wield_image = "lightstring.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		light_source = 10,
		walkable = false,
		climbable = true,
		is_ground_content = false,
		selection_box = {
			type = "wallmounted",
		},
		groups = {choppy = 3, oddly_breakable_by_hand = 1},
		legacy_wallmounted = true,
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})

	minetest.register_craft({
		output = "lib_ecology:lightstring 8",
		recipe = {
			{"lib_ecology:vine", "lib_ecology:vine", "lib_ecology:vine"},
			{"lib_ecology:vine", "lib_ecology:fire_dust", "lib_ecology:vine"},
			{"lib_ecology:vine", "lib_ecology:vine", "lib_ecology:vine"},
		},
	})


