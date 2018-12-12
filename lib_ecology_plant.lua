

local S = lib_ecology.intllib




	minetest.register_node("lib_ecology:plant_test_plant_01", {
		description = S("Plant - Test Juncus Plantlike Object"),
		drawtype = "mesh",
		mesh = "plantlike.obj",
		tiles = {"lib_ecology_plant_juncus_03.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_test_fern_01", {
		description = S("Plant - Test Old Fern Object"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_04.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})

	
	
	
--BUSHES / SHRUBS
	minetest.register_node("lib_ecology:plant_shrub_lush_01", {
		description = S("Shrub - Lush 01"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_plant_shrub_lush_01.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = false,
		groups = {snappy=3, flammable=1, oddly_breakable_by_hand=1, leaves=1},
		visual_scale = 1.2,
		sounds = default.node_sound_leaves_defaults(),
		waving = 1,
		walkable = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.4, -0.4, 0.4, 0.4, 0.4}
		},
	})
	minetest.register_node("lib_ecology:plant_shrub_dry", {
		description = S("Shrub - Dry"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_plant_shrub_dry.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, oddly_breakable_by_hand=1, attached_node = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:plant_shrub_fiery", {
		description = S("Shrub - Fiery"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_plant_shrub_fiery.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, oddly_breakable_by_hand=1, attached_node = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 4 / 16, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:plant_shrub_scorched", {
		description = S("Shrub - Scorched"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_plant_shrub_scorched.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = false,
		groups = {snappy=3, flammable=1, oddly_breakable_by_hand=1, leaves=1},
		visual_scale = 1.2,
		sounds = default.node_sound_leaves_defaults(),
		waving = 1,
		walkable = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.4, -0.4, 0.4, 0.4, 0.4}
		},
	})
	minetest.register_node("lib_ecology:plant_shrub_hog_peanut", {
		description = S("Shrub - Hog Peanut"),
		drawtype = "mesh",
		mesh = "shrub.obj",
		tiles = {"lib_ecology_plant_shrub1.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		visual_scale = 0.5,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
		on_construct = function(pos, node)
			local node = minetest.get_node(pos)
			node.param2 = math.random(0,179)
		end,
	})
	minetest.register_node("lib_ecology:plant_shrub_deciduous_forest", {
		description = S("Shrub - Deciduous Forest"),
		drawtype = "mesh",
		mesh = "shrub.obj",
		tiles = {"lib_ecology_plant_shrub2.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		visual_scale = 0.5,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
		on_construct = function(pos, node)
			local node = minetest.get_node(pos)
			node.param2 = math.random(0,179)
		end,
	})


--CACTII
	minetest.register_node("lib_ecology:plant_cactus_01", {
		description = S("Cactus - Green"),
		tiles = {"lib_ecology_plant_cactus_01_trunk_top.png", "lib_ecology_plant_cactus_01_trunk_top.png", "lib_ecology_plant_cactus_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:plant_cactus_02", {
		description = S("Cactus - Purple"),
		tiles = {"lib_ecology_plant_cactus_02_trunk_top.png", "lib_ecology_plant_cactus_02_trunk_top.png", "lib_ecology_plant_cactus_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:plant_cactus_03", {
		description = S("Cactus - Thorny"),
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
		sounds = default.node_sound_wood_defaults()
	})
	minetest.register_node("lib_ecology:plant_cactus_04", {
		description = S("Cactus - Purple Small"),
		drawtype = "nodebox",
		tiles = {"lib_ecology_plant_cactus_02_trunk_top.png", "lib_ecology_plant_cactus_02_trunk_top.png", "lib_ecology_plant_cactus_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),

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
	minetest.register_node("lib_ecology:plant_cactus_small_1", {
		description = S("Small Cactus 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_cactus_small_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		walkable = false,
		floodable = true,
		sunlight_propagates = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})
	minetest.register_node("lib_ecology:plant_cactus_small_2", {
		description = S("Small Cactus 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_cactus_small_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		walkable = false,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	})


--FERNS
	minetest.register_node("lib_ecology:fern_dicksonia", {
		description = S("Fern - Dicksonia"),
		drawtype = "mesh",
		mesh = "dicksonia.b3d",
		tiles = {"lib_ecology_fern_dicksonia.png",},
		paramtype = "light",
		waving = 1,
		groups = {choppy = 1, oddly_breakable_by_hand = 1},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_ladyfern", {
		description = S("Fern - Ladyfern"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_04.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_broadleaf_fern", {
		description = S("Fern - Broad Leaf Fern"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_05.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_ladyfern2", {
		description = S("Fern - Ladyfern2"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_04.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_broadleaf_fern2", {
		description = S("Fern - Broad Leaf Fern2"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_05.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})
	minetest.register_node("lib_ecology:fern_boston", {
		description = S("Fern - Boston Fern"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_01.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, oddly_breakable_by_hand=1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
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
	minetest.register_node("lib_ecology:fern_02", {
		description = S("Fern - Fern 02"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_02.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_02"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_03", {
		description = S("Fern - Fern 03"),
		drawtype = "plantlike",
		visual_scale = 1.2,
		tiles = {"lib_ecology_fern_03.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_03"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_large", {
		description = S("Fern - Fern Large"),
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"lib_ecology_fern_large.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_large"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_small", {
		description = S("Fern - Fern Small"),
		drawtype = "plantlike",
		visual_scale = 1.2,
		tiles = {"lib_ecology_fern_small.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
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
	minetest.register_node("lib_ecology:fern_fiddlehead", {
		description = S("Fern - Fiddlehead"),
		drawtype = "plantlike",
		visual_scale = 1.2,
		tiles = {"lib_ecology_fern_fiddlehead.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_tree_small", {
		description = S("Fern - Fern Tree Small"),
		drawtype = "plantlike",
		visual_scale = 1.2,
		tiles = {"lib_ecology_fern_tree_small.png"},
		paramtype = "light",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:fruit_fern_tubers"}, rarity = 6},
				{items = {"lib_ecology:fern_tree_small"}}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, 0.67, 5 / 16},
		},
	})
	minetest.register_node("lib_ecology:fern_horsetail_02", {
		description = S("Fern - Horsetail 02"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		tiles = {"lib_ecology_fern_horsetail_04.png",},
		paramtype = "light",
		paramtype2 = "degrotate",
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, oddly_breakable_by_hand = 1, flora = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.3, 0.3}
		},
	})


--FLOWERS
	minetest.register_node("lib_ecology:flower_allium_purple", {
		description = S("allium_purple"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_bird_of_paradise", {
		description = S("Bird of Paradise"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_bird_of_paradise.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_calla_lily", {
		description = S("Calla Lily"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_calla_lily.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_white = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_dandelion_white", {
		description = S("White dandelion"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_dandelion_yellow", {
		description = S("Yellow Dandelion"),
		drawtype = "plantlike",
		tiles = {"flowers_dandelion_yellow.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_yellow = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 4 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_fire_plant", {
		description = S("Fire Flower"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_fire_flower.png"},
		paramtype = "light",
		is_ground_content = false,
		waving = 1,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:flower_flame_lily", {
		description = S("flame_lily"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_foxglove_pink", {
		description = S("foxglove_pink"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_foxglove_purple", {
		description = S("foxglove_purple"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_frozen_rose", {
		description = S("frozen_rose"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_frozen_rose.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_geranium", {
		description = S("Blue Geranium"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_flower_geranium.png"},
		sunlight_propagates = true,
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_blue = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 2 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_gerbera", {
		description = S("Gerbera"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_gerbera.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_pink = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_hibiscus", {
		description = S("Hibiscus"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_hibiscus.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_white = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_lantana", {
		description = S("lantana"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_lavender", {
		description = S("lavender"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_lobelia", {
		description = S("lobelia"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_orchid", {
		description = S("Orchid"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_orchid.png"},
		waving = 1,
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, lib_ecology_plant = 1, flower = 1, color_white = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:flower_oxeye_daisy", {
		description = S("oxeye_daisy"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_oxeye_daisy.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_violet = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_pansy_blue", {
		description = S("pansy_blue"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_pansy_purple", {
		description = S("pansy_purple"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_petunia_blue", {
		description = S("petunia_blue"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_petunia_pink", {
		description = S("petunia_pink"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_petunia_white", {
		description = S("petunia_white"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_rose", {
		description = S("Rose"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_tulip", {
		description = S("Orange Tulip"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"lib_ecology_flower_tulip.png"},
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		floodable = true,
		groups = {color_orange = 1, flammable = 1, snappy = 3, attached_node = 1, flower = 1, flora = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 3 / 16, 2 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_viola", {
		description = S("Viola"),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -1 / 16, 5 / 16}
		}
	})
	minetest.register_node("lib_ecology:flower_ground_blue", {
		description = S("ground_blue"),
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
		sounds = default.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:flower_ground_pink", {
		description = S("ground_pink"),
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
		sounds = default.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
	})
	minetest.register_node("lib_ecology:flower_ground_red", {
		description = S("ground_red"),
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
		sounds = default.node_sound_leaves_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
			{-0.5,-0.5,-0.5,0.5,-0.49,0.5}
			}
		},
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
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
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
	sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_crystal", {
		description = S("Grass - Crystal"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_crystal.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 4,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flammable = 3, flora = 1,
			attached_node = 1, dry_grass = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flammable = 3, flora = 1,
			attached_node = 1, dry_grass = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flammable = 3, flora = 1,
			attached_node = 1, dry_grass = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flammable = 3, flora = 1,
			attached_node = 1, dry_grass = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flammable = 3, flora = 1,
			attached_node = 1, dry_grass = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_jungle", {
		description = S("Grass - Jungle"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 1.69,
		tiles = {"lib_ecology_grass_jungle.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 1.19, 7 / 16},
		},
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
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
	minetest.register_node("lib_ecology:grass_sea_1", {
		description = S("Grass - Sea 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_sea_1.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		drop = "lib_ecology:grass_sea_1",
		walkable = false,
		on_construct = function(pos)
			local num = math.random(1,3)
			minetest.env:set_node(pos, {name="lib_ecology:grass_sea_"..num})
		end,
	})
	minetest.register_node("lib_ecology:grass_sea_2", {
		description = S("Grass - Sea 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_sea_2.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		drop = "lib_ecology:grass_sea_1",
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_sea_3", {
		description = S("Grass - Sea 3"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_sea_3.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		drop = "lib_ecology:grass_sea_1",
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:grass_snowygrass", {
		description = S("Grass - Snowy"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_grass_snowygrass.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 4,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1, not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
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
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
		drop = { max_items=2, items={{items={"lib_ecology:plant_arrow_arum"}, rarity=1}, {items={"default:dirt"}, rarity=1}}},
		node_box = {
			type='fixed',
			fixed={{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, {-0.5, 0.5, -0.001, 0.5, 1.5, 0.001}, {-0.001, 0.5, -0.5, 0.001, 1.5, 0.5}}},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 11/16, 0.5},
		},
	})
	minetest.register_node("lib_ecology:plant_bananaplant", {
		description = S("Plant - Banana Plant"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_banana_plant.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_bananaplant2", {
		description = S("Plant - Banana Plant2"),
		drawtype = "mesh",
		mesh = "fern_old.b3d",
		visual_scale = 1.2,
		tiles = {"lib_ecology_plant_banana_plant.png"},
		paramtype = "light",
		paramtype2 = "degrotate",
		sunlight_propagates = true,
		waving = 1,
		walkable = false,
		floodable = true,
		buildable_to = true,
		groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 2},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
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
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus_01", {
		description = S("Plant - Juncus 01"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_01.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus_02", {
		description = S("Plant - Juncus 02"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_02.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus_03", {
		description = S("Plant - Juncus 03"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_03.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus_04", {
		description = S("Plant - Juncus 04"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_04.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_juncus_05", {
		description = S("Plant - Juncus 05"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_juncus_05.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_craft({
		output = "lib_ecology:plant_vine_01 2",
		recipe = {
			{"group:leaves", "group:leaves"},
			{"group:leaves", "group:leaves"},
			{"group:leaves", "group:leaves"},
		}
	})

	minetest.register_node("lib_ecology:plant_mushroom_red", {
		description = S("Plant - Mushroom Red"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_mushroom_sapling.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_mushroom_white", {
		description = S("Plant - Mushroom White"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_mushroom_white.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})

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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
		},
		walkable = false,
	})


--FRUIT TREES / PLANTS
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
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_abm({
		nodenames = {"lib_ecology:plant_pineapple_plant_growing"},
		interval = 30,
		chance = 2,
		action = function(pos, node)
			minetest.env:set_node(pos, {name="lib_ecology:plant_pineapple_plant"})
		end
	})
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
		sounds = default.node_sound_leaves_defaults(),
		on_rightclick = function(pos, node)
			minetest.env:set_node(pos, {name="lib_ecology:plant_pineapple_plant_growing"})
			minetest.env:add_item(pos, "lib_ecology:fruit_pineapple")
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		groups = {snappy = 3, flammable  =2, plant = 1, attached_node = 1, not_in_creative_inventory = 1, growing = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		groups = { snappy = 3, flammable = 2, plant = 1, attached_node = 1, growing = 1, not_in_creative_inventory = 1},
		sounds = default.node_sound_leaves_defaults(),
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
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
		sounds = default.node_sound_leaves_defaults(),
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
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
		sounds = default.node_sound_leaves_defaults(),
		drop = "",
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_wood_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		visual_scale = 2,
		wield_scale = {x=0.5, y=0.5, z=0.5},
		floodable = true,
		groups = {snappy=3, flammable=1, attatched_node=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 1, 0.2}
		},
		walkable = false,
	})

	minetest.register_node("lib_ecology:fern_giant_tree_crown", {
		description = S("Fern Giant Tree Crown (Dicksonia)"),
		drawtype = "plantlike",
		visual_scale = math.sqrt(8),
		wield_scale = {x=0.175, y=0.175, z=0.175},
		paramtype = "light",
		tiles = {"lib_ecology_fern_giant_tree_crown.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 2,
			items = {
				{
					-- occasionally, drop a second sapling instead of leaves
					-- (extra saplings can also be obtained by replanting and
					--  reharvesting leaves)
					items = {"lib_ecology:fern_giant_tree_sapling"},
					rarity = 10,
				},
				{
					items = {"lib_ecology:fern_giant_tree_sapling"},
				},
				{
					items = {"lib_ecology:fern_giant_tree_crown"},
				}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves", {
		description = "Fern Giant Tree Leaves",
		drawtype = "raillike",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_giant_tree_leaves.png",
		},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves_2", {
		description = "Fern Giant Tree Leaves 2",
		drawtype = "raillike",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_giant_tree_leaves2.png",
		},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves_end", {
		description = "Fern Giant Tree Leaves End",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = { "lib_ecology_fern_giant_tree_leaves_end.png" },
		walkable = false,
		node_box = {
			type = "fixed",
	--			    {left, bottom, front, right, top,   back }
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves_end_2", {
		description = "Fern Giant Tree Leaves End 2",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = { "lib_ecology_fern_giant_tree_leaves_end2.png" },
		walkable = false,
		node_box = {
			type = "fixed",
	--			    {left, bottom, front, right, top,   back }
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = default.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_trunk_top", {
		description = "Fern Giant Tree Trunk Top",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_giant_tree_trunk_top.png^lib_ecology_fern_giant_tree_leaves_cross.png",
			"lib_ecology_fern_giant_tree_trunk_top.png^lib_ecology_fern_giant_tree_leaves_cross.png",
			"lib_ecology_fern_giant_tree_trunk.png"
		},
		node_box = {
			type = "fixed",
	--			{left, bottom, front, right, top,   back }
			fixed = {
				{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
				{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		groups = {
			tree=1,
			choppy=2,
			oddly_breakable_by_hand=2,
			flammable=3,
			wood=1,
			not_in_creative_inventory=1,
			leafdecay=3 -- to support vines
		},
		drop = "lib_ecology:fern_giant_tree_trunk",
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_trunk", {
		description = "Fern Giant Tree Trunk",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_giant_tree_trunk_top.png",
			"lib_ecology_fern_giant_tree_trunk_top.png",
			"lib_ecology_fern_giant_tree_trunk.png"
		},
		node_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
		sounds = default.node_sound_wood_defaults(),
		--after_destruct = function(pos,oldnode)
			--local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
			--if node.name == "lib_ecology:fern_giant_tree_trunk" or node.name == "lib_ecology:fern_giant_tree_trunk_top" then 
				--minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, "air") 
				--minetest.add_item(pos,"lib_ecology:fern_giant_tree_trunk")
			--end
		--end,
	})
	minetest.register_node("lib_ecology:fern_giant_tree_sapling", {
		description = "Fern Giant Tree Sapling",
		drawtype = "plantlike",
		paramtype = "light",
		tiles = {"lib_ecology_fern_giant_tree_sapling.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves_big", {
		description = S("Fern Giant Tree Leaves"),
		drawtype = "allfaces_optional",
		visual_scale = 1.189,
		tiles = {
			"lib_ecology_fern_giant_tree_leaves.png",
			nil,
			"lib_ecology_fern_giant_tree_leaves_end.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 3, flammable = 2, leaves = 1, moretrees_leaves = 1, leafdecay = 1},
		sounds = default.node_sound_leaves_defaults(),

	})

	minetest.register_node("lib_ecology:fern_tree_leaves", {
		description = "Fern Tree Leaves",
		drawtype = "plantlike",
		visual_scale = 2,
		paramtype = "light",
		waving = 1,
		paramtype2 = "facedir",
		--tiles = {"[combine:32x32:0,0=top_left.png:0,16=bottom_left.png:16,0=top_right.png:16,16=bottom_right.png"},
		tiles = {"lib_ecology_fern_tree_leaves.png"},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 1,
			items = {
				{
					items = {"lib_ecology:fern_tree_sapling"},
					rarity = 20,
				},
				{
					items = {"lib_ecology:fern_tree_leaves"},
				}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:fern_tree_leaves_02", {
		description = "Fern Tree Leaves 02",
		drawtype = "plantlike",
		visual_scale = 2,
		paramtype = "light",
		waving = 1,
		tiles = {"lib_ecology_fern_tree_leaves_02.png"},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 1,
			items = {
				{
					items = {"lib_ecology:fern_tree_sapling"},
					rarity = 20,
				},
				{
					items = {"lib_ecology:fern_tree_leaves"},
				}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:fern_tree_trunk", {
		description = "Fern Tree Trunk",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_tree_trunk_top.png^lib_ecology_fern_giant_tree_leaves_cross2.png",
			"lib_ecology_fern_tree_trunk_top.png^lib_ecology_fern_giant_tree_leaves_cross2.png",
			"lib_ecology_fern_tree_trunk.png"
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
				{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
		},
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
		sounds = default.node_sound_wood_defaults(),
		-- after_destruct = function(pos,oldnode)
			-- local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
			-- if node.name == "lib_ecology:fern_tree_trunk" then 
				-- minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z}) 
				-- minetest.add_item(pos,"lib_ecology:fern_tree_trunk")
			-- end
		-- end,
	})
	minetest.register_node("lib_ecology:fern_tree_sapling", {
		description = "Fern Tree Sapling",
		drawtype = "plantlike",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = {"lib_ecology_fern_tree_sapling.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})


--WATER

	minetest.register_node("lib_ecology:plant_reedmace", {
		description = S("Plant - Reedmace"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_reedmace.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		floodable = true,
		groups = {snappy=1, flammable=1, oddly_breakable_by_hand=1, flora=1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})



	minetest.register_node("lib_ecology:plant_seaweed", {
		description = S("Plant - Seaweed"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_seaweed.png"},
		paramtype = "light",
		walkable = false,
		climbable = true,
		drowning = 1,
		post_effect_color = {a = 64, r = 100, g = 100, b = 200},
		groups = {snappy = 3},
		on_use = minetest.item_eat(1),
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
		},
		after_dig_node = function(pos, node, metadata, digger)
			default.dig_up(pos, node, digger)
		end,
	})
	minetest.register_node("lib_ecology:plant_coral2", {
		description = S("Plant - Coral Blue"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_coral2.png"},
		paramtype = "light",
		light_source = 3,
		groups = {snappy = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 1 / 4, 6 / 16},
		},
	})
	minetest.register_node("lib_ecology:plant_coral3", {
		description = S("Plant - Coral Orange"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_coral3.png"},
		paramtype = "light",
		light_source = 3,
		groups = {snappy = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 1 / 4, 6 / 16},
		},
	})
	minetest.register_node("lib_ecology:plant_coral4", {
		description = S("Plant - Coral Pink"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_coral4.png"},
		paramtype = "light",
		light_source = 3,
		groups = {snappy = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 8 / 16, 6 / 16},
		},
	})
	minetest.register_node("lib_ecology:plant_coral5", {
		description = S("Plant - Coral Green"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_coral5.png"},
		paramtype = "light",
		light_source = 3,
		groups = {snappy = 3},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 3 / 16, 6 / 16},
		},
	})

	minetest.register_craft( {
		type = "shapeless",
		output = "dye:dark_green 3",
		recipe = {"lib_ecology:plant_seaweed",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:cyan 3",
		recipe = {"lib_ecology:plant_coral2",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:orange 3",
		recipe = {"lib_ecology:plant_coral3",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:pink 3",
		recipe = {"lib_ecology:plant_coral4",},
	})
	minetest.register_craft( {
		type = "shapeless",
		output = "dye:green 3",
		recipe = {"lib_ecology:plant_coral5",},
	})

	minetest.register_node("lib_ecology:plant_big_coral", {
		description = S("Plant - Big Pink Coral"),
		drawtype = "plantlike",
		visual_scale = 2,
		tiles = {"lib_ecology_plant_big_coral.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_pink_coral", {
		description = S("Plant - Pink Coral"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_pink_coral.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_orange_coral", {
		description = S("Plant - Orange Coral"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_orange_coral.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_blue_coral", {
		description = S("Plant - Blue Coral"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_blue_coral.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_anemone", {
		description = S("Plant - Anemone"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_anemone.png"},
		paramtype = "light",
		is_ground_content = false,
		buildable_to = true, 
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_kelp1", {
		description = S("Plant - Kelp 1"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_kelp_01.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})
	minetest.register_node("lib_ecology:plant_kelp2", {
		description = S("Plant - Kelp 2"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_plant_kelp_02.png"},
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		waving = 1,
		groups = {snappy=3, flammable=1, attatched_node=1, sea=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}
		},
		walkable = false,
	})

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
		sounds = default.node_sound_leaves_defaults(),
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
		node_placement_prediction = "",
		groups = {snappy = 3, flower = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		node_placement_prediction = "",
		groups = {snappy = 3, flower = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
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
		sounds = default.node_sound_leaves_defaults(),
	})

	minetest.register_craft({
		output = "lib_ecology:lightstring 8",
		recipe = {
			{"lib_ecology:vine", "lib_ecology:vine", "lib_ecology:vine"},
			{"lib_ecology:vine", "lib_ecology:fire_dust", "lib_ecology:vine"},
			{"lib_ecology:vine", "lib_ecology:vine", "lib_ecology:vine"},
		},
	})










	----------------------------
	-- HORSETAIL  (EQUISETUM) --
	-- A true living fossil!  --
	----------------------------

	local node_names = {}

	for i = 1, 4 do
		local node_name = "lib_ecology:horsetail_" .. string.format("%02d", i)
		local node_img = "lib_ecology_fern_horsetail_" .. string.format("%02d", i) .. ".png"
		local node_desc
		local node_on_use = nil
		local node_drop = "lib_ecology:horsetail_04"

		if i == 1 then
			node_desc = "Young Horsetail (Equisetum)"
			node_on_use = minetest.item_eat(1) -- young ones edible https://en.wikipedia.org/wiki/Equisetum
			node_drop = node_name
		else
			node_desc = "Horsetail (Equisetum)"
		end

		node_names[i] = node_name

		minetest.register_node(node_name, {
			description = node_desc,
			drawtype = "plantlike",
			paramtype = "light",
			tiles = { node_img },
			inventory_image = node_img,
			walkable = false,
			buildable_to = true,
			groups = {snappy=3,flammable=2,attached_node=1,horsetail=1, lib_ecology_plant = 1},
			sounds = default.node_sound_leaves_defaults(),
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			on_use = node_on_use,
			drop = node_drop,
		})

		minetest.register_decoration({
			deco_type = "simple",
			decoration = node_name,
			sidelen = 80,
			place_on = {"default:dirt_with_grass", "default:mossycobble", "default:sand", "default:jungletree", "default:gravel",},
			fill_ratio = 0.003,
			biomes = {"lib_ecology_taiga", "lib_ecology_coniferous_forest", "lib_ecology_deciduous_forest", "lib_ecology_savanna", "lib_ecology_savanna_swamp", "lib_ecology_rainforest", "lib_ecology_rainforest_swamp", "lib_ecology_desertstone_grassland", },
		})
	end

































