

local S = lib_ecology.intllib

local dpath = minetest.get_modpath("default") .. "/schematics/"

local schem_temp = {}

local add_schem = function(a, b, c, d, e, f, g, h)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = b,
		fill_ratio = c,
		biomes = d,
		y_min = e - lib_ecology.biome_vertical_blend, -- - lib_materials.biome_vertical_blend,
		y_max = f + lib_ecology.biome_vertical_blend, -- + lib_materials.biome_vertical_blend,
		schematic = g,
		flags = h or "place_center_x, place_center_z",
		rotation = "random",
	})
end

local add_schem_offset = function(a, b, c, d, e, f, g, h, i)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = b,
		fill_ratio = c,
		biomes = d,
		y_min = e,
		y_max = f,
		schematic = g,
		place_offset_y = h,
		flags = i or "place_center_x, place_center_z",
		rotation = "random",
	})
end

local add_schem_no_rot = function(a, b, c, d, e, f, g, h)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = b,
		fill_ratio = c,
		biomes = d,
		y_min = e,
		y_max = f,
		schematic = g,
		flags = h or "place_center_x, place_center_z",
		rotation = "0",
	})
end

local add_schem_water = function(a, b, c, d, e, f, g, h)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = b,
		fill_ratio = c,
		biomes = d,
		y_min = e, -- - lib_materials.biome_vertical_blend,
		y_max = f, -- + lib_materials.biome_vertical_blend,
		schematic = g,
		flags = h or "place_center_x, place_center_z",
		rotation = "random",
	})
end

local add_schem_with_relace = function(a, b, c, d, e, f, g, h)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = b,
		fill_ratio = c,
		biomes = d,
		y_min = e,
		y_max = f,
		schematic = g,
		flags = "place_center_x, place_center_z",
		replacements = h,
		rotation = "random",
	})
end

local add_schem_with_replace = function(a, b, c, d, e, f, g, h, i)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = b,
		fill_ratio = c,
		biomes = d,
		y_min = e,
		y_max = f,
		schematic = g,
		flags =  h or "place_center_x, place_center_z",
		replacements = i or nil,
		rotation = "random",
	})
end

local add_node = function(a, b, c, d, e, f, g, h, i, j)

	minetest.register_decoration({
		deco_type = "simple",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d - lib_ecology.biome_vertical_blend,
		y_max = e + lib_ecology.biome_vertical_blend,
		decoration = f,
		height_max = g,
		spawn_by = h,
		num_spawn_by = i,
	})
end



--[[  HOT BIOMES
	minetest.log(S("[MOD] lib_ecology:  Decorating Hot Biomes"))
--]]
	--minetest.log(S("[MOD] lib_ecology:  Decorating Hot Humid Biomes"))
	lib_ecology.add_decorations_hot_humid_ocean = function()
	-- hot_humid_ocean

	end

	lib_ecology.add_decorations_hot_humid_beach = function()
	-- HOT_HUMID_BEACH						"lib_materials:dirt_silt_02"								-2, 2
		--trees
			minetest.register_decoration({
				name = "lib_ecology:mangroves",
				deco_type = "simple",
				place_on = {"lib_materials:dirt_silt_01"},
				place_offset_y = -1,
				sidelen = 80,
				fill_ratio = 0.08,
				biomes = {"hot_humid_beach"},
				y_max = 2,
				y_min = -2,
				flags = "force_placement",
				decoration = {"lib_ecology:tree_mangrove_root"},
				param2 = 48,
				param2_max = 96,
			})
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_01)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_02)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_03)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_04)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_05)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_06)
		--saplings
			add_node({"lib_materials:dirt_silt_01"}, 0.008, {"hot_humid_beach"}, 1, 2, {"lib_ecology:tree_mangrove_sapling"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_hot_humid_coastal = function()
	-- HOT_HUMID_COASTAL					lib_materials:dirt_with_grass_hot_humid_coastal			0, 30
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_03_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_03_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_04)
			
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_04)

			add_schem({"lib_materials:dirt_clayey_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_01_03)
			add_schem({"lib_materials:dirt_clayey_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_04)
			add_schem({"lib_materials:dirt_clayey_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_01_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_05)
			add_schem({"lib_materials:dirt_sandy_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_silty_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_01_01)
			add_schem({"lib_materials:dirt_silty_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_03)
			add_schem({"lib_materials:dirt_silty_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_03)
			add_schem({"lib_materials:dirt_silty_with_litter_rainforest"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_04)

			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_03_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_03_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_rubber_04)

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_03)
			
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_jungle_01_01)
			
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 2, lib_materials.maxheight_coastal, lib_ecology.plant_tree_palmetto)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 80, 0.012, {"hot_humid_coastal"}, 2, lib_materials.maxheight_coastal, lib_ecology.plant_tree_palm_small)

		--grasses

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_tall"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		-- ferns

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_coastal"}, 0.02, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_lantana"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_orchid"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_orchid"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_coastal"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:shrub_jungle"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_coastal"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_humid_lowland = function()
	-- HOT_HUMID_LOWLAND					lib_materials:dirt_with_grass_hot_humid_lowland		lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_03_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_03_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_rubber_04)
			
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_rubber_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_rubber_04)

			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_09)

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_01_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_01_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_03_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_jungle_03_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_04)
			
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_08)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_09)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_08)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_09)
			
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.plant_tree_palmetto)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 80, 0.012, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.plant_tree_palm_small)

		--grasses

			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_tall"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		-- ferns

			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.02, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_lantana"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_orchid"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_orchid"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_lowland"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_orchid"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_lowland"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_lowland"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.004, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_humid_shelf = function()
	-- HOT_HUMID_SHELF						lib_materials:dirt_with_grass_hot_humid_shelf		lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_small_01)
			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_01_01)
			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_01_02)
			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_01_03)
			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_02_01)
			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_02_02)
			-- add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.008, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_bamboo_02_03)
			
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_jungle_03_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_jungle_03_02)

			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_09)
			
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_09)

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_desert_01_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_desert_01_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_desert_03_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_desert_03_02)
			
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_08)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_09)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_08)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_09)
			
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 80, 0.012, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.plant_tree_palm_small)

		--grasses

			--add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_bamboo"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		-- ferns

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_shelf"}, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_shelf"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_lantana"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_orchid"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_orchid"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_shelf"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.003, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			
	end

	lib_ecology.add_decorations_hot_humid_highland = function()
	-- HOT_HUMID_HIGHLAND					lib_materials:dirt_with_grass_hot_humid_highland					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_jungle_03_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_jungle_03_02)

			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_brown_with_litter_rainforest"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_09)

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_desert_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_desert_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_desert_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 80, 0.012, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_palm_desert_04)

		--grasses

			--add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_bamboo"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		-- ferns

			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.003, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.002, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.002, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.big_tree_fern)

			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_humid_highland"}, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.003, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.003, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_orchid"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.003, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_impatiens"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.003, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_jungle"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_hot_humid_highland"}, 0.003, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)
			
	end

	lib_ecology.add_decorations_hot_humid_mountain = function()
	-- HOT_HUMID_MOUNTAIN
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Hot SemiHumid Biomes"))
	lib_ecology.add_decorations_hot_semihumid_ocean = function()
	-- HOT_SEMIHUMID_OCEAN

	end

	lib_ecology.add_decorations_hot_semihumid_beach = function()
	-- HOT_SEMIHUMID_BEACH
		--trees
			minetest.register_decoration({
				name = "lib_ecology:mangroves",
				deco_type = "simple",
				place_on = {"lib_materials:dirt_silt_01"},
				place_offset_y = -1,
				sidelen = 80,
				fill_ratio = 0.08,
				biomes = {"hot_semihumid_beach"},
				y_max = 2,
				y_min = -2,
				flags = "force_placement",
				decoration = {"lib_ecology:tree_mangrove_root"},
				param2 = 48,
				param2_max = 96,
			})
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_semihumid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_01)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_semihumid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_02)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_semihumid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_03)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_semihumid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_04)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_semihumid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_05)
			add_schem({"lib_materials:dirt_silt_01"}, 80, 0.06, {"hot_semihumid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_06)
		--saplings
			add_node({"lib_materials:dirt_silt_01"}, 0.008, {"hot_semihumid_beach"}, 1, 2, {"lib_ecology:tree_mangrove_sapling"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semihumid_coastal = function()
	-- HOT_SEMIHUMID_COASTAL				lib_materials:dirt_with_grass_hot_semihumid_coastal			3, 30
		--trees
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_02_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_02_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_03_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_03_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_01_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_01_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_03_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_palm_03_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_08)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_09)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_08)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.006, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_09)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.005, {"hot_semihumid_coastal"}, 2, lib_materials.maxheight_coastal, lib_ecology.plant_tree_palmetto)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 80, 0.005, {"hot_semihumid_coastal"}, 2, lib_materials.maxheight_coastal, lib_ecology.plant_tree_palm_small)
		--grasses
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
		-- ferns
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_coastal"}, 80, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fern_giant)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_coastal"}, 80, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fern_giant_2)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_coastal"}, 80, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fern_giant)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_coastal"}, 80, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fern_giant_2)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_coastal"}, 0.002, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:tree_fern_giant_sapling"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_coastal"}, 0.002, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:tree_fern_sapling"}, nil, nil, nil)

		--flowers
			add_node({"lib_materials:dirt_brown_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_lantana"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_orchid"}, nil, nil, nil)

		--plants
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 80, 0.002, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.plant_banana_tree_01)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_coastal"}, 0.01, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:shrub_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:plant_banana_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_coastal"}, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:plant_banana_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_coastal"}, 0.003, {"hot_semihumid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semihumid_lowland = function()
	-- HOT_SEMIHUMID_LOWLAND				lib_materials:dirt_with_grass_hot_semihumid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_02_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_02_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_03_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_03_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_01_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_01_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_03_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_palm_03_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_08)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_09)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_08)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_09)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.plant_tree_palmetto)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 80, 0.005, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.plant_tree_palm_small)
		--grasses
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_lowland"}, 0.01, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 0.01, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 0.01, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 0.01, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 0.01, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 0.01, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
		-- ferns
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_lowland"}, 80, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_lowland"}, 80, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.giant_tree_fern_2)

		--flowers
			add_node({"lib_materials:dirt_brown_with_grass_hot_semihumid_lowland"}, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_lantana"}, nil, nil, nil)

		--plants
			--add_schem({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 80, 0.002, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.plant_banana_tree_01)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_banana_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_lowland"}, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_banana_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_lowland"}, 0.003, {"hot_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semihumid_shelf = function()
	-- HOT_SEMIHUMID_SHELF					lib_materials:dirt_with_grass_hot_semihumid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_02)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_04)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_05)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_06)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_07)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_08)
			add_schem({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_09)

			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_09)

			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_palm_01_01)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_palm_01_02)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_palm_02_01)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_palm_02_02)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_palm_03_01)
			add_schem({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 80, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_palm_03_02)

		--grasses

			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_shelf"}, 0.01, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 0.01, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 0.01, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 0.01, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 0.01, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 0.01, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		-- ferns

			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 80, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 80, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern_2)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.004, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_dicksonia"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_boston_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_boston_02"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:horsetail_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:horsetail_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:horsetail_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:horsetail_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_hot_semihumid_shelf"}, 0.001, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		-- ferns

			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.big_tree_fern)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_shelf"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_shelf"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_shelf"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_shelf"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_shelf"}, 0.002, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_brown_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_lantana"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_banana_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_banana_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_shelf"}, 0.003, {"hot_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semihumid_highland = function()
	-- HOT_SEMIHUMID_HIGHLAND				lib_materials:dirt_with_grass_hot_semihumid_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_09)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_08)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 80, 0.004, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_09)
		--grasses
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.01, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		-- ferns
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.003, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.big_tree_fern)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semihumid_highland"}, 0.002, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers
		
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.003, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			
		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_highland"}, 0.003, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_banana_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_semihumid_highland"}, 0.003, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_banana_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semihumid_highland"}, 0.003, {"hot_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semihumid_mountain = function()
	-- -- HOT_SEMIHUMID_MOUNTAIN

	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Hot Temperate Biomes"))
	lib_ecology.add_decorations_hot_temperate_ocean = function()
	-- HOT_TEMPERATE_OCEAN
		--coral
			-- add_node({"lib_materials:sand"}, 0.05, {"hot_temperate_ocean"}, -8, -1, {"lib_ecology:grass_sea_1", "lib_ecology:grass_sea_2", "lib_ecology:grass_sea_3", }, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.05, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_brain"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.05, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_brown"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.05, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_orange_01"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.02, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_dragon_eye"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.02, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_blue_02"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.02, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_green_02"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.02, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_orange_02"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.02, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_pink_02"}, 4, nil, nil)
			-- add_node({"lib_materials:sand"}, 0.02, {"hot_temperate_ocean"}, -18, -2, {"lib_ecology:coral_red"}, 4, nil, nil)

	end

	lib_ecology.add_decorations_hot_temperate_beach = function()
	-- HOT_TEMPERATE_BEACH						lib_materials:sand_volcanic							-4, 4
		--trees
			add_schem({"lib_materials:sand_volcanic",}, 80, 0.002, {"hot_temperate_beach"}, 1, 2, lib_ecology.tree_palm_01_01)
			add_schem({"lib_materials:sand_volcanic",}, 80, 0.002, {"hot_temperate_beach"}, 1, 2, lib_ecology.tree_palm_01_02)

	end

	lib_ecology.add_decorations_hot_temperate_coastal = function()
	-- HOT_TEMPERATE_COASTAL				lib_materials:dirt_with_grass_hot_temperate_coastal					lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_coastal",}, 80, 0.012, {"hot_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_jungle_03_01)
		--grasses
			add_node({"lib_materials:dirt_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_brown_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_lantana"}, nil, nil, nil)

		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_coastal"}, 0.01, {"hot_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_temperate_lowland = function()
	-- HOT_TEMPERATE_LOWLAND				lib_materials:dirt_with_grass_hot_temperate_lowland						lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_01_08)

			add_schem({"lib_materials:dirt_brown_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_banana_01)

			add_schem({"lib_materials:dirt_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_lowland",}, 80, 0.004, {"hot_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_jungle_03_01)
		--grasses
			add_node({"lib_materials:dirt_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_brown_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_lantana"}, nil, nil, nil)

		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_lowland"}, 0.01, {"hot_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_temperate_shelf = function()
	-- HOT_TEMPERATE_SHELF					lib_materials:dirt_with_grass_hot_temperate_shelf				lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_06)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_07)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_01_08)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_shelf",}, 80, 0.008, {"hot_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_jungle_03_01)
		--grasses
			add_node({"lib_materials:dirt_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_brown_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_lantana"}, nil, nil, nil)

		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_shelf"}, 0.01, {"hot_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_temperate_highland = function()
	-- HOT_TEMPERATE_HIGHLAND				lib_materials:dirt_with_grass_hot_temperate_highland						lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_01_05)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_01)
			add_schem({"lib_materials:dirt_with_grass_hot_temperate_highland",}, 80, 0.008, {"hot_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_01)
		--grasses
			add_node({"lib_materials:dirt_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
		
		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_hot_temperate_highland"}, 0.01, {"hot_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_hot_temperate_mountain = function()
	-- -- HOT_TEMPERATE_MOUNTAIN
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Hot SemiArid Biomes"))
	lib_ecology.add_decorations_hot_semiarid_ocean = function()
	-- HOT_SEMIARID_OCEAN
	end

	lib_ecology.add_decorations_hot_semiarid_beach = function()
	-- HOT_SEMIARID_BEACH
	end

	lib_ecology.add_decorations_hot_semiarid_coastal = function()
	-- HOT_SEMIARID_COASTAL					lib_materials:dirt_with_grass_hot_semiarid_coastal					lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal", }, 80, 0.008, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal", }, 80, 0.008, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal", }, 80, 0.008, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal", }, 80, 0.008, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_coastal", }, 80, 0.004, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_coastal", }, 80, 0.004, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_coastal", }, 80, 0.004, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_coastal", }, 80, 0.004, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_coastal", }, 80, 0.006, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_coastal", }, 80, 0.006, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_coastal", }, 80, 0.006, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_coastal", }, 80, 0.006, {"hot_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

		--grasses

			add_node({"lib_materials:dirt_with_grass_hot_semiarid_coastal"}, 0.004, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_coastal"}, 0.004, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_coastal"}, 0.004, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_coastal"}, 0.004, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_coastal"}, 0.004, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_coastal"}, 0.008, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_coastal"}, 0.008, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_coastal"}, 0.008, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_coastal"}, 0.008, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_coastal"}, 0.008, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal"}, 0.006, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal"}, 0.006, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal"}, 0.006, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal"}, 0.006, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_coastal"}, 0.006, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_sandy_with_grass_hot_semiarid_coastal"}, 0.004, {"hot_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semiarid_lowland = function()
	-- HOT_SEMIARID_LOWLAND					lib_materials:dirt_with_grass_hot_semiarid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.004, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.004, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.004, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.004, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland", }, 80, 0.008, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_05)

			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_01)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_02)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_03)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_04)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland", }, 80, 0.006, {"hot_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_date_05)

		--grasses

			add_node({"lib_materials:dirt_with_grass_hot_semiarid_lowland"}, 0.004, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_lowland"}, 0.004, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_lowland"}, 0.004, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_lowland"}, 0.004, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_lowland"}, 0.004, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland"}, 0.008, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland"}, 0.008, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland"}, 0.008, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland"}, 0.008, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_lowland"}, 0.008, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland"}, 0.006, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland"}, 0.006, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland"}, 0.006, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland"}, 0.006, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_lowland"}, 0.006, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_sandy_with_grass_hot_semiarid_lowland"}, 0.004, {"hot_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semiarid_shelf = function()
	-- HOT_SEMIARID_SHELF					lib_materials:dirt_with_grass_hot_semiarid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_shelf", }, 80, 0.004, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_shelf", }, 80, 0.004, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_shelf", }, 80, 0.004, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_shelf", }, 80, 0.004, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_01)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_02)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_03)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_04)
			add_schem({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf", }, 80, 0.008, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_05)

			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_01)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_02)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_03)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_04)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf", }, 80, 0.006, {"hot_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_palm_date_05)

		--grasses

			add_node({"lib_materials:dirt_with_grass_hot_semiarid_shelf"}, 0.004, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_shelf"}, 0.004, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_shelf"}, 0.004, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_shelf"}, 0.004, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_shelf"}, 0.004, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf"}, 0.008, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf"}, 0.008, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf"}, 0.008, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf"}, 0.008, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_shelf"}, 0.008, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf"}, 0.006, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf"}, 0.006, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf"}, 0.006, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf"}, 0.006, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_shelf"}, 0.006, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_sandy_with_grass_hot_semiarid_shelf"}, 0.004, {"hot_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_aloe_vera"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semiarid_highland = function()
	-- HOT_SEMIARID_HIGHLAND				lib_materials:dirt_with_grass_hot_semiarid_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland", }, 80, 0.006, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland", }, 80, 0.006, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland", }, 80, 0.006, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland", }, 80, 0.006, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_highland", }, 80, 0.004, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_highland", }, 80, 0.004, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_highland", }, 80, 0.004, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_hot_semiarid_highland", }, 80, 0.004, {"hot_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

		--grasses

			add_node({"lib_materials:dirt_with_grass_hot_semiarid_highland"}, 0.003, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_highland"}, 0.003, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_highland"}, 0.003, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_highland"}, 0.003, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_hot_semiarid_highland"}, 0.003, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_highland"}, 0.006, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_highland"}, 0.006, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_highland"}, 0.006, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_highland"}, 0.006, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_hot_semiarid_highland"}, 0.006, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland"}, 0.004, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland"}, 0.004, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland"}, 0.004, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland"}, 0.004, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_hot_semiarid_highland"}, 0.004, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_sandy_with_grass_hot_semiarid_highland"}, 0.003, {"hot_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_gold"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_hot_semiarid_mountain = function()
	-- -- HOT_SEMIARID_MOUNTAIN
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Hot Arid Biomes"))
	lib_ecology.add_decorations_hot_arid_ocean = function()
	-- HOT_ARID_OCEAN
	end

	lib_ecology.add_decorations_hot_arid_beach = function()
	-- HOT_ARID_BEACH
		--grasses
			add_node({"lib_materials:sand_white"}, 0.01, {"hot_arid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_green_1"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_hot_arid_coastal = function()
	-- HOT_ARID_COASTAL
		--grasses
			add_node({"lib_materials:stone_sandstone_white_gravel"}, 0.01, {"hot_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_hot_arid_lowland = function()
	-- HOT_ARID_LOWLAND
		--grasses
			add_node({"lib_materials:stone_sandstone_white_gravel"}, 0.01, {"hot_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_hot_arid_shelf = function()
	-- HOT_ARID_SHELF
		--grasses
			add_node({"lib_materials:stone_sandstone_white_gravel"}, 0.01, {"hot_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_hot_arid_highland = function()
	-- HOT_ARID_HIGHLAND
		--grasses
			add_node({"lib_materials:stone_sandstone_white_gravel"}, 0.01, {"hot_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_hot_arid_mountain = function()
	-- -- HOT_ARID_MOUNTAIN
	end


--[[  WARM BIOMES
	minetest.log(S("[MOD] lib_ecology:  Decorating Warm Biomes"))
--]]
	--minetest.log(S("[MOD] lib_ecology:  Decorating Warm Humid Biomes"))
	lib_ecology.add_decorations_warm_humid_ocean = function()
	-- WARM_HUMID_OCEAN
			add_node({"lib_materials:sand"}, 0.004, {"warm_humid_ocean"}, -35, -2, {"lib_ecology:plant_kelp_01"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_warm_humid_beach = function()
	-- WARM_HUMID_BEACH
		--trees
			minetest.register_decoration({
				name = "lib_ecology:mangroves",
				deco_type = "simple",
				place_on = {"lib_materials:dirt_silt_01"},
				place_offset_y = -1,
				sidelen = 80,
				fill_ratio = 0.1,
				biomes = {"warm_humid_beach"},
				y_max = 2,
				y_min = -2,
				flags = "force_placement",
				decoration = {"lib_ecology:tree_mangrove_root"},
				param2 = 48,
				param2_max = 96,
			})
			add_schem({"lib_ecology:tree_mangrove_root"}, 80, 0.08, {"warm_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_01)
			add_schem({"lib_ecology:tree_mangrove_root"}, 80, 0.08, {"warm_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_02)
			add_schem({"lib_ecology:tree_mangrove_root"}, 80, 0.08, {"warm_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_03)
			add_schem({"lib_ecology:tree_mangrove_root"}, 80, 0.08, {"warm_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_04)
			add_schem({"lib_ecology:tree_mangrove_root"}, 80, 0.08, {"warm_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_05)
			add_schem({"lib_ecology:tree_mangrove_root"}, 80, 0.08, {"warm_humid_beach"}, -2, 2, lib_ecology.schem_tree_mangrove_06)
		--saplings
			add_node({"lib_ecology:tree_mangrove_root"}, 0.008, {"warm_humid_beach"}, 0, 2, {"lib_ecology:tree_mangrove_sapling"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_humid_coastal = function()
	-- WARM_HUMID_COASTAL					lib_materials:dirt_with_grass_warm_humid_coastal					-3, 30
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cypress_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cypress_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_mahogany)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_big_03_tree)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_lemon)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_schem_vinetree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_02_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_02_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_02_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_07)

			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 80, 0.014, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 80, 0.014, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 80, 0.014, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, lib_ecology.big_tree_fern)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_coastal",}, 80, 0.015, {"warm_humid_coastal", }, 3, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_07)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		-- ferns

			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_coastal"}, 0.025, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_coastal"}, 0.008, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			--add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.03, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)
			--add_node({"lib_materials:dirt_with_grass_warm_humid_coastal"}, 0.01, {"warm_humid_coastal"}, 3, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_humid_lowland = function()
	-- WARM_HUMID_LOWLAND					lib_materials:dirt_with_grass_warm_humid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cypress_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cypress_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_mahogany)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_deciduous_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_big_03_tree)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_lemon)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.014, {"warm_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_vinetree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_02_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_02_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_02_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_07)

			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 80, 0.014, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 80, 0.014, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 80, 0.014, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.big_tree_fern)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_lowland",}, 80, 0.015, {"warm_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_07)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		-- ferns

			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_lowland"}, 0.025, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.008, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_lowland"}, 0.01, {"warm_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_palmetto_01"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_warm_humid_shelf = function()
	-- WARM_HUMID_SHELF						lib_materials:dirt_with_grass_warm_humid_shelf			lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cypress_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cypress_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_deciduous_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_big_03_tree)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_vinetree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_01_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_01_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_02_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_02_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_bamboo_02_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_05)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf",}, 80, 0.015, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_palm_02_07)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		-- ferns

			add_schem_no_rot({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 80, 0.012, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 80, 0.012, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 80, 0.012, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.big_tree_fern)

			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_humid_shelf"}, 0.025, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.008, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_schem_offset({"lib_materials:dirt_with_grass_warm_humid_shelf",}, 80, 0.014, {"warm_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.plant_test_fern, -1)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_shelf"}, 0.01, {"warm_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_palmetto_01"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_warm_humid_highland = function()
	-- WARM_HUMID_HIGHLAND					lib_materials:dirt_with_grass_warm_humid_highland					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_deciduous_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_04)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_04)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_02_05)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_04)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_05)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_08)

			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_01)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_humid_highland",}, 80, 0.015, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_jungle_03_02)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_humid_highland",}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		--ferns

			add_schem_no_rot({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 80, 0.012, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 80, 0.012, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 80, 0.012, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.big_tree_fern)

			add_node({"lib_materials:dirt_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_humid_highland"}, 0.02, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_humid_highland"}, 0.006, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_schem_offset({"lib_materials:dirt_with_grass_warm_humid_highland",}, 80, 0.014, {"warm_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.plant_test_fern, -2)
			add_node({"lib_materials:dirt_with_grass_warm_humid_highland"}, 0.01, {"warm_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_palmetto_01"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_warm_humid_mountain = function()
	-- WARM_HUMID_MOUNTAIN
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Warm SemiHumid Biomes"))
	lib_ecology.add_decorations_warm_semihumid_ocean = function()
	-- WARM_SEMIHUMID_OCEAN
	end

	lib_ecology.add_decorations_warm_semihumid_beach = function()
	-- WARM_SEMIHUMID_BEACH
	end

	lib_ecology.add_decorations_warm_semihumid_coastal = function()
	-- WARM_SEMIHUMID_COASTAL				lib_materials:dirt_with_grass_warm_semihumid_coastal				lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 8, lib_materials.maxheight_coastal, lib_ecology.schem_tree_eucalyptus_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 8, lib_materials.maxheight_coastal, lib_ecology.schem_tree_eucalyptus_large_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_03)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_ebony)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_03)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_orange)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.012, {"warm_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_schem_vinetree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_01_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_02_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_02_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_bamboo_02_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_05)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_07)

			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 80, 0.012, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 80, 0.012, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 80, 0.012, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.big_tree_fern)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal",}, 80, 0.014, {"warm_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_palm_02_07)
		--grasses
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
		-- ferns
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 0.02, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.008, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants
			--add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_coastal"}, 0.01, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_banana_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_coastal"}, 0.008, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_coastal"}, 0.008, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_bush"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_coastal"}, 0.008, {"warm_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_palmetto_01"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semihumid_lowland = function()
	-- WARM_SEMIHUMID_LOWLAND				lib_materials:dirt_with_grass_warm_semihumid_lowland						lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_eucalyptus_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_eucalyptus_large_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_03)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_ebony)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_deciduous_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_deciduous_03)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_orange)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_bigtree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_big_03_tree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.008, {"warm_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_vinetree)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_01_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_02_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_02_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_bamboo_02_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_01_07)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_07)

			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 80, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 80, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 80, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.big_tree_fern)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_05)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland",}, 80, 0.01, {"warm_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_palm_02_07)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		-- ferns

			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 0.02, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spikefern"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			--add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_lowland"}, 0.01, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_banana_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_lowland"}, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_lowland"}, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_bush"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_lowland"}, 0.008, {"warm_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_palmetto_01"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semihumid_shelf = function()
	-- warm_semihumid_shelf					lib_materials:dirt_with_grass_warm_semihumid_shelf				lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf",}, 80, 0.008, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_eucalyptus_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf",}, 80, 0.008, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_eucalyptus_large_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf",}, 80, 0.008, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_teak_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf",}, 80, 0.008, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_teak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_deciduous_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_04)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf",}, 80, 0.012, {"warm_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_02)
		--grasses
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_shelf"}, 0.02, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		--ferns
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.01, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.01, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.giant_tree_fern_2)
			add_schem_no_rot({"lib_materials:dirt_black_with_litter_rainforest"}, 80, 0.01, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.big_tree_fern)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_rainforest"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.015, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spikefern"}, nil, nil, nil)



		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.006, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants
			add_node({"lib_materials:dirt_silty_with_grass_warm_semihumid_shelf"}, 0.008, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_shelf"}, 0.008, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_bush"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_shelf"}, 0.008, {"warm_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_palmetto_01"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semihumid_highland = function()
	-- warm_semihumid_highland				lib_materials:dirt_with_grass_warm_semihumid_highland					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees	
			--oak/pine highland forest - Dirt Sandy with Coniferous Litter - Oak, Pine, Cypress, 
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_pine_01_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_pine_02_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_02)
			
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_highland",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_eucalyptus_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_highland",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_eucalyptus_large_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_highland",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semihumid_highland",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_01)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_deciduous_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland",}, 80, 0.012, {"warm_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_03)
			
		--grasses
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semihumid_highland"}, 0.02, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)


		--ferns


		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_semihumid_highland"}, 0.006, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants
			add_node({"lib_materials:dirt_with_grass_warm_semihumid_highland"}, 0.006, {"warm_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_bush"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semihumid_mountain = function()
	-- warm_semihumid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Warm Temperate Biomes"))
	lib_ecology.add_decorations_warm_temperate_ocean = function()
	-- warm_temperate_ocean
	end

	lib_ecology.add_decorations_warm_temperate_beach = function()
	-- warm_temperate_beach					"lib_materials:sand"									-4, 4
		--trees
			add_schem({"lib_materials:sand_beach",}, 80, 0.002, {"warm_temperate_beach"}, 1, 2, lib_ecology.tree_palm_01_01)
			add_schem({"lib_materials:sand_beach",}, 80, 0.002, {"warm_temperate_beach"}, 1, 2, lib_ecology.tree_palm_01_02)
			add_schem({"lib_materials:sand_beach",}, 80, 0.002, {"warm_temperate_beach"}, 1, 2, lib_ecology.tree_palm_01_03)

	end

	lib_ecology.add_decorations_warm_temperate_coastal = function()
	-- warm_temperate_coastal				lib_materials:dirt_with_grass_warm_temperate_coastal				lib_materials.maxheight_beach, lib_materials.maxheight_coastal

		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_eucalyptus_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_eucalyptus_large_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_mirabelle)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_03)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_teak_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_ebony)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.tree_schem_deciduous_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_02)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.tree_schem_greytrees)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal",}, 80, 0.012, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tall_tree)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal",}, 80, 0.012, {"warm_temperate_coastal", }, 8, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal",}, 80, 0.012, {"warm_temperate_coastal", }, 8, lib_materials.maxheight_coastal, lib_ecology.tree_schem_tree_04)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal",}, 80, 0.01, {"warm_temperate_coastal", }, 6, lib_materials.maxheight_coastal, lib_ecology.schem_tree_palm_desert_03_01)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_coastal"}, 0.02, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		--ferns



		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_coastal"}, 0.002, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_silty_with_grass_warm_temperate_coastal"}, 0.004, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_coastal"}, 0.004, {"warm_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_weed"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_temperate_lowland = function()
	-- warm_temperate_lowland				lib_materials:dirt_with_grass_warm_temperate_lowland					lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			--add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_lowland"}, 80, 0.01, {"warm_temperate_lowland"}, 35, 42, lib_ecology.tree_banana_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_eucalyptus_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_eucalyptus_large_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_mirabelle)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_03)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_teak_04)
			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_ebony)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_lowland",}, 80, 0.005, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_lowland",}, 80, 0.005, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_greytrees)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_small_tree)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tall_tree)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland",}, 80, 0.01, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_schem_tree_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland",}, 80, 0.008, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_ipe_yellow)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland",}, 80, 0.012, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland",}, 80, 0.012, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland",}, 80, 0.012, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland",}, 80, 0.012, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland",}, 80, 0.012, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland",}, 80, 0.012, {"warm_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_palm_desert_03_01)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.015, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_lowland"}, 0.02, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_lowland"}, 0.002, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_silty_with_grass_warm_temperate_lowland"}, 0.004, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_lowland"}, 0.004, {"warm_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_weed"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_temperate_shelf = function()
	-- warm_temperate_shelf					lib_materials:dirt_with_grass_warm_temperate_shelf			lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_shelf", }, 80, 0.01, {"warm_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_greytrees)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_shelf", }, 80, 0.012, {"warm_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tall_tree)

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_shelf",}, 80, 0.012, {"warm_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_01)

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_shelf",}, 80, 0.012, {"warm_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_schem_tree_03)

			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_shelf",}, 80, 0.008, {"warm_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_ipe_yellow)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_temperate_shelf"}, 0.02, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		--ferns



		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_shelf"}, 0.002, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_silty_with_grass_warm_temperate_shelf"}, 0.004, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_shelf"}, 0.004, {"warm_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_weed"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_temperate_highland = function()
	-- warm_temperate_highland				lib_materials:dirt_with_grass_warm_temperate_highland					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_warm_temperate_highland", }, 80, 0.01, {"warm_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_greytrees)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_temperate_highland", }, 80, 0.012, {"warm_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_temperate_highland", }, 80, 0.012, {"warm_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tree_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_temperate_highland", }, 80, 0.012, {"warm_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_schem_tall_tree)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.015, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.015, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_temperate_highland"}, 0.015, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_tallgrass"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_temperate_highland"}, 0.02, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_swamp_5"}, nil, nil, nil)

		--ferns



		--flowers

			add_node({"lib_materials:dirt_black_with_grass_warm_temperate_highland"}, 0.001, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_hibiscus"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_with_grass_warm_temperate_highland"}, 0.004, {"warm_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_weed"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_temperate_mountain = function()
	-- warm_temperate_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Warm SemiArid Biomes"))
	lib_ecology.add_decorations_warm_semiarid_ocean = function()
	-- warm_semiarid_ocean
	end

	lib_ecology.add_decorations_warm_semiarid_beach = function()
	-- warm_semiarid_beach
	end

	lib_ecology.add_decorations_warm_semiarid_coastal = function()
	-- warm_semiarid_coastal				lib_materials:dirt_with_grass_warm_semiarid_coastal					lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal", }, 80, 0.008, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal", }, 80, 0.008, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal", }, 80, 0.008, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal", }, 80, 0.008, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_coastal", }, 80, 0.004, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_coastal", }, 80, 0.004, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_coastal", }, 80, 0.004, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_coastal", }, 80, 0.004, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_coastal", }, 80, 0.006, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_coastal", }, 80, 0.006, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_coastal", }, 80, 0.006, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_coastal", }, 80, 0.006, {"warm_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_semiarid_coastal"}, 0.004, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_coastal"}, 0.004, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_coastal"}, 0.004, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_coastal"}, 0.004, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_coastal"}, 0.004, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_coastal"}, 0.008, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_coastal"}, 0.008, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_coastal"}, 0.008, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_coastal"}, 0.008, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_coastal"}, 0.008, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal"}, 0.006, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal"}, 0.006, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal"}, 0.006, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal"}, 0.006, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_coastal"}, 0.006, {"warm_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semiarid_lowland = function()
	-- warm_semiarid_lowland				lib_materials:dirt_with_grass_warm_semiarid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_lowland", }, 80, 0.004, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_lowland", }, 80, 0.004, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_lowland", }, 80, 0.004, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_lowland", }, 80, 0.004, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_lowland", }, 80, 0.006, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_lowland", }, 80, 0.006, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_lowland", }, 80, 0.006, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_lowland", }, 80, 0.006, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_baobab_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_baobab_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland", }, 80, 0.008, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_baobab_04)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland", }, 80, 0.006, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_baobab_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland", }, 80, 0.006, {"warm_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_baobab_02)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_semiarid_lowland"}, 0.004, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_lowland"}, 0.004, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_lowland"}, 0.004, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_lowland"}, 0.004, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_lowland"}, 0.004, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland"}, 0.008, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland"}, 0.008, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland"}, 0.008, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland"}, 0.008, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_lowland"}, 0.008, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland"}, 0.006, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland"}, 0.006, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland"}, 0.006, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland"}, 0.006, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_lowland"}, 0.006, {"warm_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semiarid_shelf = function()
	-- warm_semiarid_shelf					lib_materials:dirt_with_grass_warm_semiarid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_shelf", }, 80, 0.004, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_shelf", }, 80, 0.004, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_shelf", }, 80, 0.004, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_warm_semiarid_shelf", }, 80, 0.004, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_01)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_02)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_03)
			add_schem({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf", }, 80, 0.008, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_04)

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf", }, 80, 0.006, {"warm_semiarid_shelf", },lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_baobab_04)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf"}, 0.008, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf"}, 0.008, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf"}, 0.008, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf"}, 0.008, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_shelf"}, 0.008, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf"}, 0.006, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf"}, 0.006, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf"}, 0.006, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf"}, 0.006, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_shelf"}, 0.006, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_giant_hogweed"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semiarid_shelf"}, 0.004, {"warm_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_red"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semiarid_highland = function()
	-- warm_semiarid_highland				lib_materials:dirt_with_grass_warm_semiarid_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.006, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.006, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.006, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.006, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")

			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_baobab_01)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_baobab_02)
			add_schem({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland", }, 80, 0.004, {"warm_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_baobab_04)

		--grasses

			add_node({"lib_materials:dirt_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_highland"}, 0.006, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_highland"}, 0.006, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_highland"}, 0.006, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_highland"}, 0.006, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_warm_semiarid_highland"}, 0.006, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland"}, 0.004, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland"}, 0.004, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland"}, 0.004, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland"}, 0.004, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_warm_semiarid_highland"}, 0.004, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_giant_hogweed"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_warm_semiarid_highland"}, 0.003, {"warm_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_red"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_warm_semiarid_mountain = function()
	-- warm_semiarid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Warm Arid Biomes"))
	lib_ecology.add_decorations_warm_arid_ocean = function()
	-- warm_arid_ocean
	end

	lib_ecology.add_decorations_warm_arid_beach = function()
	-- warm_arid_beach
	end

	lib_ecology.add_decorations_warm_arid_coastal = function()
	-- warm_arid_coastal
	end

	lib_ecology.add_decorations_warm_arid_lowland = function()
	-- warm_arid_lowland
	end

	lib_ecology.add_decorations_warm_arid_shelf = function()
	-- warm_arid_shelf
	end

	lib_ecology.add_decorations_warm_arid_highland = function()
	-- warm_arid_highland
	end

	lib_ecology.add_decorations_warm_arid_mountain = function()
	-- warm_arid_mountain
	end


--[[  TEMPERATE BIOMES
	minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Biomes"))
--]]
	--minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Humid Biomes"))
	lib_ecology.add_decorations_temperate_humid_ocean = function()
	-- temperate_humid_ocean
			add_node({"lib_materials:dirt_silt_01"}, 0.004, {"temperate_humid_ocean"}, -35, -2, {"lib_ecology:plant_seaweed"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_temperate_humid_beach = function()
	-- temperate_humid_beach
			add_node({"lib_materials:sand_beach"}, 0.004, {"temperate_humid_beach"}, 1, 4, {"lib_ecology:grass_marram_1"}, nil, nil, nil)
			add_node({"lib_materials:sand_beach"}, 0.004, {"temperate_humid_beach"}, 1, 4, {"lib_ecology:grass_marram_2"}, nil, nil, nil)
			add_node({"lib_materials:sand_beach"}, 0.004, {"temperate_humid_beach"}, 1, 4, {"lib_ecology:grass_marram_3"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_temperate_humid_coastal = function()
	-- temperate_humid_coastal				lib_materials:dirt_with_grass_temperate_humid_coastal						lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_ash_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_ash_02)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_01)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_pine_01_05)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_03)

			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_03)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal",}, 80, 0.015, {"temperate_humid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_03)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.03, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_small_3"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_arrow_arum"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_coastal"}, 0.02, {"temperate_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_humid_lowland = function()
	-- temperate_humid_lowland				lib_materials:dirt_with_grass_temperate_humid_lowland				lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_ash_01)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland",}, 80, 0.012, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland",}, 80, 0.012, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland",}, 80, 0.012, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_01)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_pine_01_05)

			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_04)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_05)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland",}, 80, 0.015, {"temperate_humid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_03)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.03, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_small_3"}, nil, nil, nil)


		--flowers

		--plants

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_lowland"}, 0.02, {"temperate_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_humid_shelf = function()
	-- temperate_humid_shelf				lib_materials:dirt_with_grass_temperate_humid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.012, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_shelf",}, 80, 0.012, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_shelf",}, 80, 0.012, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_lavender)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)

			add_schem({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf",}, 80, 0.012, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_southern_01)

			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_pine_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_shelf",}, 80, 0.015, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_pine_01_05)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf",}, 80, 0.012, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_shelf",}, 80, 0.012, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_shelf",}, 80, 0.008, {"temperate_humid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_01)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_3"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_large_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.03, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_small_3"}, nil, nil, nil)

		--flowers

		--plants

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_shelf"}, 0.02, {"temperate_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_humid_highland = function()
	-- temperate_humid_highland				lib_materials:dirt_with_grass_temperate_humid_highland						lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_highland",}, 80, 0.015, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.015, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_highland",}, 80, 0.012, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_01_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_highland",}, 80, 0.012, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_lavender)

			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.015, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_pine_01_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_highland",}, 80, 0.015, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_03)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_highland",}, 80, 0.012, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_sequoia_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_highland",}, 80, 0.012, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_sequoia_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_highland",}, 80, 0.012, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_sequoia_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.003, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_giant_sequoia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.003, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_giant_sequoia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.003, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_giant_sequoia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.003, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_giant_sequoia_04)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_humid_highland",}, 80, 0.015, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_humid_highland",}, 80, 0.015, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_humid_highland",}, 80, 0.012, {"temperate_humid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_01)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_03"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_tree_small"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_03"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_tree_small"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_03"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_humid_highland"}, 0.02, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_tree_small"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_03"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_large"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_highland"}, 0.03, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_tree_small"}, nil, nil, nil)

		--flowers

		--plants

			add_node({"lib_materials:dirt_black_with_grass_temperate_humid_highland"}, 0.004, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_hog_peanut"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_humid_highland"}, 0.004, {"temperate_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_temperate_humid_mountain = function()
	-- temperate_humid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Semihumid Biomes"))
	lib_ecology.add_decorations_temperate_semihumid_ocean = function()
	-- temperate_semihumid_ocean
	end

	lib_ecology.add_decorations_temperate_semihumid_beach = function()
	-- temperate_semihumid_beach
			add_node({"lib_materials:sand_beach"}, 0.05, {"temperate_semihumid_beach"}, 1, 4, {"lib_ecology:grass_marram_1"}, nil, nil, nil)
			add_node({"lib_materials:sand_beach"}, 0.05, {"temperate_semihumid_beach"}, 1, 4, {"lib_ecology:grass_marram_2"}, nil, nil, nil)
			add_node({"lib_materials:sand_beach"}, 0.05, {"temperate_semihumid_beach"}, 1, 4, {"lib_ecology:grass_marram_3"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_temperate_semihumid_coastal = function()
	-- temperate_semihumid_coastal			lib_materials:dirt_with_grass_temperate_semihumid_coastal			lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_ash_01)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.01, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.01, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry_blossom_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)
			
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_03)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_03)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_02)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_pine_02_06)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.012, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_02)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal"}, 0.025, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal"}, 0.025, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal"}, 0.025, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal"}, 0.025, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal"}, 0.025, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_coastal"}, 0.02, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers


		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_coastal",}, 80, 0.01, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_coastal",}, 80, 0.01, {"temperate_semihumid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_bush_hawthorne)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_coastal"}, 0.015, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_arrow_arum"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_coastal"}, 0.015, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_coastal"}, 0.015, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.015, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_coastal"}, 0.015, {"temperate_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_semihumid_lowland = function()
	-- temperate_semihumid_lowland			lib_materials:dirt_with_grass_temperate_semihumid_lowland				lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_ash_01)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry_blossom_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_02)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_clementine)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)
			
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_03)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_pine_02_06)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland"}, 0.025, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland"}, 0.025, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland"}, 0.025, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland"}, 0.025, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland"}, 0.025, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_lowland"}, 0.02, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers

		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_hawthorne)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_lowland",}, 80, 0.01, {"temperate_semihumid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_lowland"}, 0.015, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_lowland"}, 0.015, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.015, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_lowland"}, 0.015, {"temperate_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_semihumid_shelf = function()
	-- temperate_semihumid_shelf			lib_materials:dirt_with_grass_temperate_semihumid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cherry)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cherry_blossom_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_02)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_clementine)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.012, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_pine_02_06)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf"}, 0.025, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf"}, 0.025, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf"}, 0.025, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf"}, 0.025, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf"}, 0.025, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_shelf"}, 0.02, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers


		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_hawthorne)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_shelf",}, 80, 0.01, {"temperate_semihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_shelf"}, 0.015, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_shelf"}, 0.015, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.015, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_shelf"}, 0.015, {"temperate_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_semihumid_highland = function()
	--Oak-Heath Forest - Dirt Clayey with Vine Litter - Oak, Chestnut, Heath, Blueberry, Rhodedendron
	-- temperate_semihumid_highland			lib_materials:dirt_with_grass_temperate_semihumid_highland					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_cherry)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_cherry_blossom_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_chestnut_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_chestnut_02)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_conifer_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.014, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_01)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_pine_02_06)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland"}, 0.015, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland"}, 0.015, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland"}, 0.015, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland"}, 0.015, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semihumid_highland"}, 0.015, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers


		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_hawthorne)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semihumid_highland",}, 80, 0.01, {"temperate_semihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_hog_peanut"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semihumid_highland"}, 0.02, {"temperate_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_semihumid_mountain = function()
	-- temperate_semihumid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Temperate Biomes"))
	lib_ecology.add_decorations_temperate_temperate_ocean = function()
	-- temperate_temperate_ocean
	end

	lib_ecology.add_decorations_temperate_temperate_beach = function()
	-- temperate_temperate_beach
			add_node({"lib_materials:sand_beach"}, 0.05, {"temperate_temperate_beach"}, 1, 4, {"lib_ecology:grass_marram_1"}, nil, nil, nil)
			add_node({"lib_materials:sand_beach"}, 0.05, {"temperate_temperate_beach"}, 1, 4, {"lib_ecology:grass_marram_2"}, nil, nil, nil)
			add_node({"lib_materials:sand_beach"}, 0.05, {"temperate_temperate_beach"}, 1, 4, {"lib_ecology:grass_marram_3"}, nil, nil, nil)
	end

	lib_ecology.add_decorations_temperate_temperate_coastal = function()
	-- temperate_temperate_coastal			lib_materials:dirt_with_grass_temperate_temperate_coastal				lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_chestnut_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_chestnut_02)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_02)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_southern_02)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal",}, 80, 0.008, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_pine_03_01)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_willow_03_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_willow_03_01)

		--grasses

			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal"}, 0.02, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal"}, 0.02, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal"}, 0.02, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal"}, 0.02, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal"}, 0.02, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal"}, 0.015, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_temperate_coastal"}, 0.004, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_lavender"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_oxeye_daisy"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_petunia_blue"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_petunia_pink"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_petunia_white"}, nil, nil, nil)

		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_coastal",}, 80, 0.008, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_coastal",}, 80, 0.012, {"temperate_temperate_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_bush_hawthorne)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_coastal"}, 0.01, {"temperate_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_temperate_lowland = function()
	-- temperate_temperate_lowland			lib_materials:dirt_with_grass_temperate_temperate_lowland					lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_chestnut_02)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_01)
			add_schem({"lib_materials:dirt_silty_with_grass_temperate_temperate_lowland",}, 80, 0.01, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_southern_02)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_pine_03_01)

		--grasses

			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.01, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.01, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.01, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.01, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.01, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland"}, 0.02, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland"}, 0.02, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland"}, 0.02, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland"}, 0.02, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland"}, 0.02, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_temperate_lowland"}, 0.006, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_lavender"}, nil, nil, nil)


		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.012, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_hawthorne)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_lowland",}, 80, 0.008, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_lowland",}, 80, 0.012, {"temperate_temperate_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_lowland"}, 0.015, {"temperate_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_temperate_shelf = function()
	-- temperate_temperate_shelf			lib_materials:dirt_with_grass_temperate_temperate_shelf			lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.01, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_apple_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.01, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.01, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf",}, 80, 0.01, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf",}, 80, 0.01, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_chestnut_02)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_01_05)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_tall"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_golden_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_golden_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_golden_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_golden_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_golden_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.01, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.01, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.01, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.01, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.01, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf"}, 0.015, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_temperate_shelf"}, 0.004, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_lavender"}, nil, nil, nil)


		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf",}, 80, 0.008, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_hawthorne)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_shelf",}, 80, 0.008, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_shelf",}, 80, 0.012, {"temperate_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_cleavers"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_shelf"}, 0.02, {"temperate_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_temperate_highland = function()
	-- temperate_temperate_highland			lib_materials:dirt_with_grass_temperate_temperate_highland					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_cedar_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_apple_01)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_cherry_blossom_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_cherry_blossom_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_cherry_blossom_03)

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_02)

			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_08)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_09)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_highland"}, 0.02, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_highland"}, 0.02, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_highland"}, 0.02, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_highland"}, 0.02, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_temperate_highland"}, 0.02, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland"}, 0.015, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland"}, 0.015, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland"}, 0.015, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland"}, 0.015, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland"}, 0.015, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns


		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_temperate_highland"}, 0.002, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_lavender"}, nil, nil, nil)


		--plants

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_highland",}, 80, 0.008, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_hawthorne)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_hawthorne)

			add_schem({"lib_materials:dirt_black_with_grass_temperate_temperate_highland",}, 80, 0.008, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_temperate_highland",}, 80, 0.012, {"temperate_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_silty_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_nettle"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_temperate_highland"}, 0.01, {"temperate_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_deciduous_forest"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_temperate_temperate_mountain = function()
	-- temperate_temperate_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Semiarid Biomes"))
	lib_ecology.add_decorations_temperate_semiarid_ocean = function()
	-- temperate_semiarid_ocean
	end

	lib_ecology.add_decorations_temperate_semiarid_beach = function()
	-- temperate_semiarid_beach
	end

	lib_ecology.add_decorations_temperate_semiarid_coastal = function()
	-- temperate_semiarid_coastal			lib_materials:dirt_with_grass_temperate_semiarid_coastal					lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_coastal",}, 80, 0.008, {"temperate_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_cedar_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_coastal",}, 80, 0.008, {"temperate_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal",}, 80, 0.008, {"temperate_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal",}, 80, 0.008, {"temperate_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_03_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_coastal",}, 80, 0.008, {"temperate_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_03_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_coastal",}, 80, 0.008, {"temperate_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_03_03)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.01, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.01, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.01, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.01, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.01, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_coastal"}, 0.003, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_spike"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal"}, 0.003, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_bird_of_paradise"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.003, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_dandelions_yellow"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal"}, 0.003, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_lavender"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.003, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_thistle"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_prickly_pear"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_purple_button"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_small_column_02"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_giant_hogweed"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_scotch_broom"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:tree_desert_palm"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_wild_onion_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_wild_onion_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_coastal"}, 0.004, {"temperate_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_wild_onion_5"}, nil, nil, nil)
		

	end

	lib_ecology.add_decorations_temperate_semiarid_lowland = function()
	-- temperate_semiarid_lowland			lib_materials:dirt_with_grass_temperate_semiarid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_lowland",}, 80, 0.005, {"temperate_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_cedar_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_lowland",}, 80, 0.005, {"temperate_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland",}, 80, 0.005, {"temperate_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland",}, 80, 0.005, {"temperate_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_03_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_lowland",}, 80, 0.005, {"temperate_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_03_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_lowland",}, 80, 0.005, {"temperate_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_03_03)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.01, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.01, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.01, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.01, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.01, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_lowland"}, 0.002, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_spike"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland"}, 0.002, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_bird_of_paradise"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.002, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_dandelions_yellow"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.002, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_geranium_blue"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland"}, 0.002, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_lavender"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.002, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:flower_thistle"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_prickly_pear"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_purple_button"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_small_column_02"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_giant_hogweed"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_scotch_broom"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:tree_desert_palm"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_wild_onion_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_wild_onion_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_lowland"}, 0.003, {"temperate_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_wild_onion_5"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_temperate_semiarid_shelf = function()
	-- temperate_semiarid_shelf				lib_materials:dirt_with_grass_temperate_semiarid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_shelf",}, 80, 0.005, {"temperate_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_cedar_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_shelf",}, 80, 0.005, {"temperate_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf",}, 80, 0.005, {"temperate_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf",}, 80, 0.005, {"temperate_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_03_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_shelf",}, 80, 0.005, {"temperate_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_03_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_shelf",}, 80, 0.005, {"temperate_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_03_03)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.01, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.01, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.01, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.01, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.01, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_shelf"}, 0.001, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_spike"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf"}, 0.001, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_bird_of_paradise"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.001, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_dandelions_yellow"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.001, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_geranium_blue"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf"}, 0.001, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_lavender"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.001, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_thistle"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_prickly_pear"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_small_column_02"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_purple_button"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_green"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_wild_onion_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_wild_onion_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_shelf"}, 0.002, {"temperate_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_wild_onion_4"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_temperate_semiarid_highland = function()
	-- temperate_semiarid_highland			lib_materials:dirt_with_grass_temperate_semiarid_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_cedar_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_01_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_02_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_02_05)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_02_06)
			add_schem({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_01)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_02)
			add_schem({"lib_materials:dirt_brown_with_grass_temperate_semiarid_highland",}, 80, 0.005, {"temperate_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_03_03)

		--grasses

			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.01, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.01, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.01, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.01, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.01, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_spike"}, nil, nil, nil)

		--flowers

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_bird_of_paradise"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_dandelions_yellow"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_delphinium"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_geranium_blue"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_lavender"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.001, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_tulip_orange"}, nil, nil, nil)

		--plants

			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_small_column_02"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_purple_button"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_gold"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_green"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_temperate_semiarid_highland"}, 0.002, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_highland"}, 0.003, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_wild_onion_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_highland"}, 0.003, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_wild_onion_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_temperate_semiarid_highland"}, 0.003, {"temperate_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_wild_onion_5"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_temperate_semiarid_mountain = function()
	-- temperate_semiarid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Arid Biomes"))
	lib_ecology.add_decorations_temperate_arid_ocean = function()
	-- temperate_arid_ocean
	end

	lib_ecology.add_decorations_temperate_arid_beach = function()
	-- temperate_arid_beach
	end

	lib_ecology.add_decorations_temperate_arid_coastal = function()
	-- temperate_arid_coastal				lib_materials:dirt_coarse
		--grasses
			add_node({"lib_materials:dirt_coarse"}, 0.005, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.005, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.005, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.005, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.005, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_coarse"}, 0.001, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_column_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.001, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.001, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_vine"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.001, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:cactus_purple_column"}, nil, nil, nil)
			add_node({"lib_materials:dirt_coarse"}, 0.001, {"temperate_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_scotch_broom"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_temperate_arid_lowland = function()
	-- temperate_arid_lowland				lib_materials:dirt_dry
		--grasses
			add_node({"lib_materials:dirt_dry"}, 0.005, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.005, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.005, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.005, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.005, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_dry"}, 0.001, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_column_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.001, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.001, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_vine"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.001, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:cactus_purple_column"}, nil, nil, nil)
			add_node({"lib_materials:dirt_dry"}, 0.001, {"temperate_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_scotch_broom"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_temperate_arid_shelf = function()
	-- temperate_arid_shelf					lib_materials:dirt_clayey
		--grasses
			add_node({"lib_materials:dirt_clayey"}, 0.005, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.005, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.005, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.005, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.005, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_clayey"}, 0.001, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_column_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.001, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.001, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_vine"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.001, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:cactus_purple_column"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey"}, 0.001, {"temperate_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_scotch_broom"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_temperate_arid_highland = function()
	-- temperate_arid_highland				lib_materials:sand_desert
		--grasses
			add_node({"lib_materials:dirt_sandy"}, 0.005, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.005, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.005, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.005, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.005, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_sandy"}, 0.001, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_column_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.001, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_globe"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.001, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_vine"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.001, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:cactus_purple_column"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy"}, 0.001, {"temperate_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_scotch_broom"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_temperate_arid_mountain = function()
	-- temperate_arid_mountain
	end


--[[  COOL BIOMES
	minetest.log(S("[MOD] lib_ecology:  Decorating Cool Biomes"))
--]]
	--minetest.log(S("[MOD] lib_ecology:  Decorating Cool Humid Biomes"))
	lib_ecology.add_decorations_cool_humid_ocean = function()
	-- cool_humid_ocean
	end

	lib_ecology.add_decorations_cool_humid_beach = function()
	-- cool_humid_beach
	end

	lib_ecology.add_decorations_cool_humid_coastal = function()
	-- cool_humid_coastal					lib_materials:dirt_with_grass_cool_humid_coastal			lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.01, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.014, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.01, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.012, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal",}, 80, 0.008, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_04)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_coastal",}, 80, 0.015, {"cool_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_05)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_coastal"}, 0.01, {"cool_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_cool_humid_lowland = function()
	-- cool_humid_lowland					lib_materials:dirt_with_grass_cool_humid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.01, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.014, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.01, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.012, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland",}, 80, 0.008, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_04)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_lowland",}, 80, 0.015, {"cool_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_05)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_lowland"}, 0.01, {"cool_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_cool_humid_shelf = function()
	-- cool_humid_shelf					lib_materials:dirt_with_grass_cool_humid_shelf			lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.01, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.014, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.01, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.012, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf",}, 80, 0.008, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_willow_01_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_willow_01_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_willow_01_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_poplar_small_04)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_humid_shelf",}, 80, 0.015, {"cool_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_poplar_small_05)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_shelf"}, 0.01, {"cool_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_humid_highland = function()
	-- cool_humid_highland					lib_materials:dirt_with_grass_cool_humid_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_black_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.01, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.01, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.014, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_large_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_large_02)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.014, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_litter_coniferous",}, 80, 0.01, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_large_01)

			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_coast_02)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_coast_03)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.012, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_humid_highland",}, 80, 0.008, {"cool_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_litter_coniferous"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_black_with_grass_cool_humid_highland"}, 0.01, {"cool_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_hog_peanut"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_humid_mountain = function()
	-- cool_humid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cool Semihumid Biomes"))
	lib_ecology.add_decorations_cool_semihumid_ocean = function()
	-- cool_semihumid_ocean
	end

	lib_ecology.add_decorations_cool_semihumid_beach = function()
	-- cool_semihumid_beach
	end

	lib_ecology.add_decorations_cool_semihumid_coastal = function()
	-- cool_semihumid_coastal					lib_materials:dirt_with_grass_cool_semihumid_coastal			lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.0082, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal",}, 80, 0.007, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_04)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal",}, 80, 0.0085, {"cool_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_poplar_small_05)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_coastal"}, 0.008, {"cool_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_semihumid_lowland = function()
	-- cool_semihumid_lowland					lib_materials:dirt_with_grass_cool_semihumid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.0082, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland",}, 80, 0.007, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_03)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_04)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland",}, 80, 0.0085, {"cool_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_poplar_small_05)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants

			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_lowland"}, 0.008, {"cool_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_lowland",}, 80, 0.008, {"cool_semihumid_lowland", }, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_lowland",}, 80, 0.008, {"cool_semihumid_lowland", }, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)

	end

	lib_ecology.add_decorations_cool_semihumid_shelf = function()
	-- cool_semihumid_shelf					lib_materials:dirt_with_grass_cool_semihumid_shelf			lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.0082, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf",}, 80, 0.007, {"cool_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants

			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_shelf"}, 0.008, {"cool_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_schem({"lib_materials:dirt_black_with_grass_cool_semisemihumid_shelf",}, 80, 0.0082, {"cool_semisemihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semisemihumid_shelf",}, 80, 0.0082, {"cool_semisemihumid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)

	end

	lib_ecology.add_decorations_cool_semihumid_highland = function()
	-- cool_semihumid_highland					lib_materials:dirt_with_grass_cool_semihumid_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_02)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_beech_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.0082, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland",}, 80, 0.007, {"cool_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_semihumid_highland"}, 0.008, {"cool_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_schem({"lib_materials:dirt_black_with_grass_cool_semisemihumid_highland",}, 80, 0.0084, {"cool_semisemihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_semisemihumid_highland",}, 80, 0.0084, {"cool_semisemihumid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)
			add_node({"lib_materials:dirt_black_with_grass_cool_semisemihumid_highland"}, 0.02, {"cool_semisemihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_hog_peanut"}, nil, nil, nil, lib_ecology.grassy)

	end

	lib_ecology.add_decorations_cool_semihumid_mountain = function()
	-- cool_semihumid_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cool Temperate Biomes"))
	lib_ecology.add_decorations_cool_temperate_ocean = function()
	-- cool_temperate_ocean
	end

	lib_ecology.add_decorations_cool_temperate_beach = function()
	-- cool_temperate_beach
	end

	lib_ecology.add_decorations_cool_temperate_coastal = function()
	-- cool_temperate_coastal					lib_materials:dirt_with_grass_cool_temperate_coastal			lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees



			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.0072, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal",}, 80, 0.006, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal",}, 80, 0.0075, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal",}, 80, 0.0075, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal",}, 80, 0.0075, {"cool_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_willow_02_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:flower_calla_lily"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:wild_oat_dry"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_coastal"}, 0.007, {"cool_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_temperate_lowland = function()
	-- cool_temperate_lowland					lib_materials:dirt_with_grass_cool_temperate_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry_blossom_03)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_cherry)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_sakura)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.0072, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland",}, 80, 0.0075, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_01)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland",}, 80, 0.0075, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_02)
			add_schem({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland",}, 80, 0.0075, {"cool_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_willow_02_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland", }, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_lowland",}, 80, 0.006, {"cool_temperate_lowland", }, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, {"lib_ecology:flower_calla_lily"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, {"lib_ecology:bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, {"lib_ecology:wild_oat_dry"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_lowland"}, 0.007, {"cool_temperate_lowland"}, lib_materials.maxheight_lowland, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_temperate_shelf = function()
	-- cool_temperate_shelf					lib_materials:dirt_with_grass_cool_temperate_shelf			lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.0072, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf",}, 80, 0.006, {"cool_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_oak_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_shelf",}, 80, 0.007, {"cool_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_shelf",}, 80, 0.007, {"cool_temperate_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:flower_calla_lily"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:wild_oat_dry"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_shelf"}, 0.007, {"cool_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_temperate_highland = function()
	-- cool_temperate_highland					lib_materials:dirt_with_grass_cool_temperate_highland			lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees

			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)

			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_05)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_06)
			add_schem({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_07)

			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_02)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_birch_04)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_maple_01)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_red_03)
			add_schem({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland",}, 80, 0.006, {"cool_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_oak_03)

		--grass

			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_clayey_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_green_5"}, nil, nil, nil)

		--ferns

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)

		--flowers


		--plants

			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_black_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_brown_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_brown"}, nil, nil, nil)

			add_schem({"lib_materials:dirt_black_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)
			add_schem({"lib_materials:dirt_brown_with_grass_cool_temperate_highland",}, 80, 0.0072, {"cool_temperate_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_bush_rhodedendron)

			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:flower_calla_lily"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:bush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:bush_02"}, nil, nil, nil, lib_ecology.grove)
			add_node({"lib_materials:dirt_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:wild_oat_dry"}, nil, nil, nil)

			add_node({"lib_materials:dirt_sandy_with_grass_cool_temperate_highland"}, 0.007, {"cool_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_temperate_mountain = function()
	-- cool_temperate_mountain
	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cool Semiarid Biomes"))
	lib_ecology.add_decorations_cool_semiarid_ocean = function()
	-- cool_semiarid_ocean
	end

	lib_ecology.add_decorations_cool_semiarid_beach = function()
	-- cool_semiarid_beach
	end

	lib_ecology.add_decorations_cool_semiarid_coastal = function()
	-- cool_semiarid_coastal				lib_materials:dirt_with_grass_cool_semiarid_coastal		lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_coastal", }, 80, 0.002, {"cool_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_01_01)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_coastal", }, 80, 0.002, {"cool_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_01_06)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_coastal", }, 80, 0.002, {"cool_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_01_03)
			-- add_schem({"lib_materials:dirt_with_grass_cool_semiarid_coastal", }, 80, 0.002, {"cool_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_01_05)
			-- add_schem({"lib_materials:dirt_with_grass_cool_semiarid_coastal", }, 80, 0.002, {"cool_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_01_07)
			-- add_schem({"lib_materials:dirt_with_grass_cool_semiarid_coastal", }, 80, 0.002, {"cool_semiarid_coastal", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.tree_pine_01_09)
		--grasses
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_coastal"}, 0.01, {"cool_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_semiarid_lowland = function()
	-- cool_semiarid_lowland				lib_materials:dirt_with_grass_cool_semiarid_lowland			lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_lowland", }, 80, 0.002, {"cool_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_01_03)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_lowland", }, 80, 0.002, {"cool_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_01_05)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_lowland", }, 80, 0.002, {"cool_semiarid_lowland", }, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.tree_pine_01_06)
		--grasses
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_lowland"}, 0.01, {"cool_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_semiarid_shelf = function()
	-- cool_semiarid_shelf					lib_materials:dirt_with_grass_cool_semiarid_shelf					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_shelf", }, 80, 0.002, {"cool_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_01_07)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_shelf", }, 80, 0.002, {"cool_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_01_08)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_shelf", }, 80, 0.002, {"cool_semiarid_shelf", }, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.tree_pine_01_09)
		--grasses
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_green"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_shelf"}, 0.01, {"cool_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_semiarid_highland = function()
	-- cool_semiarid_highland				lib_materials:dirt_with_grass_cool_semiarid_highland	lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_highland", }, 80, 0.002, {"cool_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_01_01)
			add_schem({"lib_materials:dirt_with_grass_cool_semiarid_highland", }, 80, 0.002, {"cool_semiarid_highland", }, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.tree_pine_01_02)
		--grasses
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_gold"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_green"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_purple"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_red"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_sandwort"}, nil, nil, nil)
			add_node({"lib_materials:dirt_sandy_with_grass_cool_semiarid_highland"}, 0.01, {"cool_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_saxifrage_purple"}, nil, nil, nil)


	end

	lib_ecology.add_decorations_cool_semiarid_mountain = function()
	-- cool_semiarid_mountain

	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cool Arid Biomes"))
	lib_ecology.add_decorations_cool_arid_ocean = function()
	-- cool_arid_ocean

	end

	lib_ecology.add_decorations_cool_arid_beach = function()
	-- cool_arid_beach

	end

	lib_ecology.add_decorations_cool_arid_coastal = function()
	-- cool_arid_coastal					
		--grasses
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1", "lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_arid_lowland = function()
	-- cool_arid_lowland					
		--grasses
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_dry_1", "lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_arid_shelf = function()
	-- cool_arid_shelf						
		--grasses
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_dry_1", "lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_arid_highland = function()
	-- cool_arid_highland					
		--grasses
			add_node({"lib_materials:dirt_clayey_with_litter_coniferous"}, 0.01, {"cool_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_dry_1", "lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cool_arid_mountain = function()
	-- cool_arid_mountain

	end



--[[  COLD BIOMES
	minetest.log(S("[MOD] lib_ecology:  Decorating Cold Biomes"))
--]]
	--minetest.log(S("[MOD] lib_ecology:  Decorating Cold Humid Biomes"))
	lib_ecology.add_decorations_cold_humid_ocean = function()
	-- cold_humid_ocean						lib_materials:sand_volcanic						-192, -4

	end

	lib_ecology.add_decorations_cold_humid_beach = function()
	-- cold_humid_beach						lib_materials:dirt_with_snow						-4, lib_materials.maxheight_beach
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_beach"}, 2, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_beach"}, 2, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_beach"}, 2, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_beach"}, 2, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_beach"}, 2, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_humid_beach"}, 1, lib_materials.maxheight_beach, {"lib_materials:shrub_snowy"}, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_beach"}, 1, lib_materials.maxheight_beach, {"lib_materials:stone_brown"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_humid_coastal = function()
	-- cold_humid_coastal					lib_materials:dirt_with_snow						lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_02)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_03)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_04)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_05)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_06)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_pine_02)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_taiga"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_humid_lowland = function()
	-- cold_humid_lowland					lib_materials:dirt_with_snow					lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_02)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_03)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_04)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_05)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_06)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_pine_02)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_taiga"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_humid_shelf = function()
	-- cold_humid_shelf						lib_materials:dirt_with_snow					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_02)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_03)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_04)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_05)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_06)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_pine_02)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_taiga"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_humid_highland = function()
	-- cold_humid_highland					lib_materials:dirt_with_snow								lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_02)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_03)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_04)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_05)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_06)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_07)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_03)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_coast_05)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_coast_06)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_05)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.001, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.001, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_02)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.001, {"cold_humid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_spruce_03)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_snowy"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_humid_mountain = function()
	-- cold_humid_mountain

	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cold SemiHumid Biomes"))
	lib_ecology.add_decorations_cold_semihumid_ocean = function()
	-- cold_semihumid_ocean					lib_materials:sand_volcanic					-192, -4

	end

	lib_ecology.add_decorations_cold_semihumid_beach = function()
	-- cold_semihumid_beach					lib_materials:sand_volcanic					-4, lib_materials.maxheight_beach
		--grasses
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_silty_with_snow"}, 0.01, {"cold_semihumid_beach"}, 1, lib_materials.maxheight_beach, {"lib_materials:stone_brown"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_semihumid_coastal = function()
	-- cold_semihumid_coastal				lib_materials:dirt_with_snow					lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_doug_04)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_carduus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_taiga"}, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_materials:stone_brown"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_semihumid_lowland = function()
	-- cold_semihumid_lowland				lib_materials:dirt_with_snow					lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_doug_04)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_carduus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_taiga"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_semihumid_shelf = function()
	-- cold_semihumid_shelf					lib_materials:dirt_with_snow								lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_doug_04)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_carduus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_snowy"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_semihumid_highland = function()
	-- cold_semihumid_highland				lib_materials:dirt_with_snow					lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_semihumid_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_doug_04)
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_5"}, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.01, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_carduus"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.001, {"cold_semihumid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:shrub_snowy"}, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_semihumid_mountain = function()
	-- cold_semihumid_mountain

	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cold Temperate Biomes"))
	lib_ecology.add_decorations_cold_temperate_ocean = function()
	-- cold_temperate_ocean				lib_materials:dirt_silt_01					-192, -4

	end

	lib_ecology.add_decorations_cold_temperate_beach = function()
	-- cold_temperate_beach				lib_materials:dirt_with_snow					-4, lib_materials.maxheight_beach
		--grasses
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_materials:stone_basalt_01", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_temperate_beach"}, 1, lib_materials.maxheight_beach, {"lib_materials:stone_gneiss_02", }, nil, nil, nil)
			
	end

	lib_ecology.add_decorations_cold_temperate_coastal = function()
	-- cold_temperate_coastal				lib_materials:dirt_with_snow					lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.005, {"cold_temperate_coastal",}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_fir_01)
		--grasses
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_snowy", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_taiga", }, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_temperate_lowland = function()
	-- cold_temperate_lowland				lib_materials:dirt_with_snow						lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.007, {"cold_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.007, {"cold_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_fir_01)
		--grasses
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_snowy", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_temperate_shelf = function()
	-- cold_temperate_shelf					lib_materials:dirt_with_snow					lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--trees
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.006, {"cold_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_with_snow",}, 80, 0.006, {"cold_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_fir_01)
		--grasses
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:shrub_snowy", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_temperate_highland = function()
	-- cold_temperate_highland				lib_materials:dirt_with_snow				lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--trees
			add_schem({"lib_materials:dirt_permafrost_with_snow",}, 80, 0.005, {"cold_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_conifer_01)
			add_schem({"lib_materials:dirt_permafrost_with_snow",}, 80, 0.005, {"cold_temperate_highland",}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_tree_fir_01)
		--grasses
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost_with_snow"}, 0.005, {"cold_temperate_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_temperate_mountain = function()
	-- cold_temperate_mountain

	end


	--minetest.log(S("[MOD] lib_ecology:  Decorating Cold SemiArid Biomes"))
	lib_ecology.add_decorations_cold_semiarid_ocean = function()
	-- cold_semiarid_ocean						lib_materials:sand_silver									-192, -4

	end

	lib_ecology.add_decorations_cold_semiarid_beach = function()
	-- cold_semiarid_beach						lib_materials:dirt_permafrost									-4, 4
		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_semiarid_beach"}, 1, 4, {"lib_ecology:grass_snow_1", "lib_ecology:grass_snow_2", "lib_ecology:grass_snow_3", "lib_ecology:grass_snow_4", "lib_ecology:grass_snow_5", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_semiarid_beach"}, 1, 4, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
		--other
		
	end

	lib_ecology.add_decorations_cold_semiarid_coastal = function()
	-- cold_semiarid_coastal					lib_materials:dirt_with_snow							lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--grasses
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:shrub_snowy", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_semiarid_lowland = function()
	-- cold_semiarid_lowland					lib_materials:dirt_with_snow							lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--grasses
			add_node({"lib_materials:dirt_permafrost"}, 0.0075, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.0075, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.0075, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.0075, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.0075, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:shrub_snowy", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_semiarid_shelf = function()
	-- cold_semiarid_shelf						lib_materials:dirt_permafrost							lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--grasses
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_stone", }, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_semiarid_highland = function()
	-- cold_semiarid_highland					lib_materials:dirt_permafrost							lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--grasses
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_1", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_2", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_3", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_4", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.01, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_heath_saxifrage_purple", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_semiarid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)

	end

	lib_ecology.add_decorations_cold_semiarid_mountain = function()
	-- cold_semiarid_mountain

	end

	--minetest.log(S("[MOD] lib_ecology:  Decorating Cold Arid Biomes"))
	lib_ecology.add_decorations_cold_arid_ocean = function()
	-- cold_arid_ocean

	end

	lib_ecology.add_decorations_cold_arid_beach = function()
	-- cold_arid_beach						lib_materials:dirt_with_snow									-4, 4
		--grasses
			--add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_beach"}, 1, 4, {"lib_ecology:grass_snow_1", "lib_ecology:grass_snow_2", "lib_ecology:grass_snow_3", "lib_ecology:grass_snow_4", "lib_ecology:grass_snow_5", }, nil, nil, nil)
		--plants
			--add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_beach"}, 1, 4, {"lib_ecology:plant_nettle_carduus", }, nil, nil, nil)
			--add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_beach"}, 1, 4, {"lib_ecology:plant_stoneweed", }, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_arid_beach"}, 1, 4, {"lib_materials:stone_basalt_01", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_arid_beach"}, 1, 4, {"lib_materials:stone_granite_01", }, nil, nil, nil)
			
	end

	lib_ecology.add_decorations_cold_arid_coastal = function()
	-- cold_arid_coastal					lib_materials:dirt_with_snow							lib_materials.maxheight_beach, lib_materials.maxheight_coastal
		--grasses

		--plants
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:mushroom_ground_fungus", }, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_materials:stone_basalt_01", }, nil, nil, nil)
			add_node({"lib_materials:dirt_with_snow"}, 0.005, {"cold_arid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_materials:stone_granite_01", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_arid_lowland = function()
	-- cold_arid_lowland					lib_materials:dirt_permafrost							lib_materials.maxheight_coastal, lib_materials.maxheight_lowland
		--grasses

		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_ecology:mushroom_ground_fungus", }, nil, nil, nil)
		--other
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_materials:stone_granite_01", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, {"lib_materials:stone_gabbro", }, nil, nil, nil)
		
	end

	lib_ecology.add_decorations_cold_arid_shelf = function()
	-- cold_arid_shelf						lib_materials:dirt_permafrost							lib_materials.maxheight_lowland, lib_materials.maxheight_shelf
		--grasses

		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_stone", }, nil, nil, nil)
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, {"lib_ecology:mushroom_ground_fungus", }, nil, nil, nil)
		--other

	end

	lib_ecology.add_decorations_cold_arid_highland = function()
	-- cold_arid_highland					lib_materials:dirt_permafrost							lib_materials.maxheight_shelf, lib_materials.maxheight_highland
		--grasses

		--plants
			add_node({"lib_materials:dirt_permafrost"}, 0.005, {"cold_arid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, {"lib_ecology:mushroom_ground_fungus", }, nil, nil, nil)
		--other

	end

	lib_ecology.add_decorations_cold_arid_mountain = function()
	-- cold_arid_mountain

	end


--[[  EXTRA BIOMES
--minetest.log(S("[MOD] lib_ecology:  Decorating Extra Biomes"))
--]]

	lib_ecology.add_decorations_coniferous_forest_dunes = function()

		--trees
			--add_schem({"lib_materials:sand_beach",}, 80, 0.05, {"lib_materials_coniferous_forest_dunes",}, 1, 5, lib_ecology.tree_fir_01)
			--add_schem({"lib_materials:sand_beach",}, 80, 0.05, {"lib_materials_coniferous_forest_dunes",}, 1, 5, lib_ecology.tree_fir_coast_02)
			--add_schem({"lib_materials:sand_beach",}, 80, 0.05, {"lib_materials_coniferous_forest_dunes",}, 1, 5, lib_ecology.tree_fir_coast_03)
			--add_schem({"lib_materials:sand_beach",}, 80, 0.05, {"lib_materials_coniferous_forest_dunes",}, 1, 5, lib_ecology.tree_fir_doug_04)
			--add_schem({"lib_materials:sand_beach",}, 80, 0.05, {"lib_materials_coniferous_forest_dunes",}, 1, 5, lib_ecology.tree_fir_doug_05)
			--add_schem({"lib_materials:sand_beach",}, 80, 0.05, {"lib_materials_coniferous_forest_dunes",}, 1, 5, lib_ecology.tree_fir_doug_06)
		--grass
			--add_node({"lib_materials:sand_beach"}, 0.1, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil)
		--plants
			--add_node({"lib_materials:sand_beach"}, 0.004, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:fern_broadleaf_fern"}, nil, nil, nil)
			--add_node({"lib_materials:sand_beach"}, 0.004, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:fern_ladyfern"}, nil, nil, nil)
			--add_node({"lib_materials:sand_beach"}, 0.02, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:fern_broadleaf_fern2"}, nil, nil, nil)
			--add_node({"lib_materials:sand_beach"}, 0.03, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:fern_ladyfern2"}, nil, nil, nil)
			--add_node({"lib_materials:sand_beach"}, 0.008, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:fern_fiddlehead"}, nil, nil, nil)
			--add_node({"lib_materials:sand_beach"}, 0.02, {"lib_materials_coniferous_forest_dunes"}, 1, 5, {"lib_ecology:shrub_hog_peanut"}, nil, nil, nil)

	end
	lib_ecology.add_decorations_deciduous_forest_swamp = function()

	--lib_ecology_deciduous_forest_swamp
		--plants
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.15, {"lib_ecology_deciduous_forest_swamp",}, 1, 2, lib_ecology.plant_reedmace)
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.012, {"lib_ecology_deciduous_forest_swamp",}, 1, 2, lib_ecology.plant_reedmace_with_flowers)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_ecology_deciduous_forest_swamp",}, -2, -2, lib_ecology.waterlily_pink)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_ecology_deciduous_forest_swamp",}, -2, -2, lib_ecology.waterlily_yellow)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_ecology_deciduous_forest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1)
		add_node({"lib_materials:dirt_mud_01"}, 0.008, {"lib_ecology_deciduous_forest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 3, "lib_materials:dirt_mud_01", 1)
		--add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_ecology_deciduous_forest_swamp"}, 1, 2, {"lib_ecology:plant_cattail"}, 1, nil, nil)
		--add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_ecology_deciduous_forest_swamp"}, 1, 2, {"lib_ecology:plant_bulrush"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_ecology_deciduous_forest_swamp"}, 1, 2, {"lib_ecology:plant_nettle_impatiens"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_ecology_deciduous_forest_swamp"}, 2, 4, {"lib_ecology:ground_grass"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_ecology_deciduous_forest_swamp"}, 2, 4, {"lib_ecology:grass_giant"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_ecology_deciduous_forest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_pink"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_ecology_deciduous_forest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_yellow"}, 1, nil, nil)

		-- add_node({"default:water_source"}, 0.1, {"lib_ecology_deciduous_forest_swamp", "lib_ecology_rainforest_swamp", "lib_ecology_savanna_swamp",}, -1, 1, {"lib_ecology:plant_papyrus"}, 4, nil, nil)
		-- add_node({"lib_materials:muddy_river_water_source"}, 0.1, nil, 1, 60, {"lib_ecology:plant_waterlily_pink"}, 4, nil, nil)
		-- add_node({"lib_materials:muddy_river_water_source"}, 0.1, nil, 1, 60, {"lib_ecology:plant_waterlily_yellow"}, 4, nil, nil)

	end

	lib_ecology.add_decorations_desert = function()

		add_schem({"lib_materials:stone_desert_gravel",}, 80, 0.008, {"cool_arid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_materials.schem_rock_desert_02_01)
		add_schem({"lib_materials:stone_desert_gravel",}, 80, 0.008, {"cool_arid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_materials.schem_rock_desert_02_02)
		add_schem({"lib_materials:stone_desert_gravel",}, 80, 0.008, {"cool_arid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_materials.schem_rock_desert_02_03)

		add_schem({"lib_materials:stone_desert_gravel",}, 80, 0.008, {"cool_arid_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_materials.schem_rock_desert_03_01)

	end
	lib_ecology.add_decorations_desertstone_grassland = function()



	end

	lib_ecology.add_decorations_sandstone_grassland = function()



	end
	lib_ecology.add_decorations_sandstone_grassland_dunes = function()



	end

	lib_ecology.add_decorations_savanna = function()

		--trees
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.003, {"lib_materials_savanna", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.003, {"lib_materials_savanna", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.003, {"lib_materials_savanna", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland", }, 80, 0.003, {"lib_materials_savanna", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")
		--grasses
			add_node({"lib_materials:dirt_clayey_with_grass_hot_semiarid_lowland"}, 0.008, {"lib_materials_savanna"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1", "lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil)

	end
	lib_ecology.add_decorations_savanna_swamp = function()

		--trees
			add_schem({"lib_materials:dirt_clayey", }, 80, 0.008, {"lib_materials_savanna_swamp", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_02)
			add_schem({"lib_materials:dirt_clayey", }, 80, 0.008, {"lib_materials_savanna_swamp", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_01)
			add_schem({"lib_materials:dirt_clayey", }, 80, 0.008, {"lib_materials_savanna_swamp", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_tree_acacia_03)
			add_schem({"lib_materials:dirt_clayey", }, 80, 0.008, {"lib_materials_savanna_swamp", }, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_log_acacia, "place_center_x, place_center_z")
		--grasses
			add_node({"lib_materials:dirt_clayey"}, 0.008, {"lib_materials_savanna_swamp"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, {"lib_ecology:grass_dry_1", "lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil)

	end

	lib_ecology.add_decorations_stone_grassland_dunes = function()



	end

	lib_ecology.add_decorations_tropical_rainforest = function()

		--trees
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_small_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_01_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_01_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_01_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_02_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_02_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest",}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_bamboo_02_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_jungle_palm_01_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_jungle_palm_01_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_jungle_palm_02_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_jungle_palm_02_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_jungle_palm_03_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_jungle_palm_03_02)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_palm_01_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_palm_01_03)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_palm_01_04)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_palm_02_06)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.tree_palm_02_08)
			-- add_schem_with_replace({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"hot_humid_shelf"}, 30, 180, lib_ecology.path .. "/schematics/junglepalm.mts", {["default:jungletree"] = "lib_ecology:tree_jungle_01_trunk", ["default:jungleleaves"] = "lib_ecology:tree_jungle_01_leaves", ["mapgen:plant_vine_01"] = "lib_ecology:plant_vine_01", ["air"] = "ignore", })
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.plant_tree_palmetto)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.plant_tree_palm_small)
		--grasses
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_jungle"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_bamboo"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_jungle_1"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_jungle_2"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_jungle_3"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_jungle_4"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.01, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:grass_jungle_5"}, nil, nil, nil)
		-- ferns
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.schem_tree_fern_small_01)
			add_schem({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.005, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.schem_tree_fern_small_02)
			add_schem_no_rot({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.003, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.schem_tree_fern)
			add_schem_no_rot({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.003, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.schem_tree_fern_giant)
			add_schem_no_rot({"lib_materials:dirt_with_litter_rainforest"}, 80, 0.002, {"lib_materials_tropical_rainforest"}, 30, 180, lib_ecology.schem_tree_fern_giant_2)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.002, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:tree_fern_giant_sapling"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.002, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:tree_fern_sapling"}, nil, nil, nil)
		--flowers
		--plants
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.003, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:shrub_lush_01"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.003, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:plant_pineapple_plant"}, nil, nil, nil)
			add_node({"lib_materials:dirt_with_litter_rainforest"}, 0.003, {"lib_materials_tropical_rainforest"}, 30, 180, {"lib_ecology:tree_small_jungle"}, nil, nil, nil)

	end
	lib_ecology.add_decorations_tropical_rainforest_swamp = function()

	--lib_materials_tropical_rainforest_swamp
		--plants
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.15, {"lib_materials_tropical_rainforest_swamp",}, 1, 2, lib_ecology.plant_reedmace)
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.012, {"lib_materials_tropical_rainforest_swamp",}, 1, 2, lib_ecology.plant_reedmace_with_flowers)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_materials_tropical_rainforest_swamp",}, -2, -2, lib_ecology.waterlily_pink)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_materials_tropical_rainforest_swamp",}, -2, -2, lib_ecology.waterlily_yellow)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_tropical_rainforest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1)
		add_node({"lib_materials:dirt_mud_01"}, 0.008, {"lib_materials_tropical_rainforest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 3, "lib_materials:dirt_mud_01", 1)
		--add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_tropical_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_cattail"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_tropical_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_bulrush"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_tropical_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_nettle_impatiens"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_tropical_rainforest_swamp"}, 2, 4, {"lib_ecology:ground_grass"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_tropical_rainforest_swamp"}, 2, 4, {"lib_ecology:grass_giant"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_materials_tropical_rainforest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_pink"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_materials_tropical_rainforest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_yellow"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.06, {"lib_materials_tropical_rainforest_swamp"}, -3, -1, {"lib_ecology:plant_reedmace_water", }, nil, nil, nil)

	end
	lib_ecology.add_decorations_subtropical_rainforest_swamp = function()

	--lib_materials_subtropical_rainforest_swamp
		--plants
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.15, {"lib_materials_subtropical_rainforest_swamp",}, 1, 2, lib_ecology.plant_reedmace)
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.012, {"lib_materials_subtropical_rainforest_swamp",}, 1, 2, lib_ecology.plant_reedmace_with_flowers)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_materials_subtropical_rainforest_swamp",}, -2, -2, lib_ecology.waterlily_pink)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_materials_subtropical_rainforest_swamp",}, -2, -2, lib_ecology.waterlily_yellow)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_subtropical_rainforest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1)
		add_node({"lib_materials:dirt_mud_01"}, 0.008, {"lib_materials_subtropical_rainforest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 3, "lib_materials:dirt_mud_01", 1)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_subtropical_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_cattail"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_subtropical_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_bulrush"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_subtropical_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_nettle_impatiens"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_subtropical_rainforest_swamp"}, 2, 4, {"lib_ecology:ground_grass"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_subtropical_rainforest_swamp"}, 2, 4, {"lib_ecology:grass_giant"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_materials_subtropical_rainforest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_pink"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_materials_subtropical_rainforest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_yellow"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.06, {"lib_materials_subtropical_rainforest_swamp"}, -3, -1, {"lib_ecology:plant_reedmace_water", }, nil, nil, nil)

	end
	lib_ecology.add_decorations_temperate_rainforest_swamp = function()

	--lib_materials_temperate_rainforest_swamp
		--plants
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.15, {"lib_materials_temperate_rainforest_swamp",}, 1, 2, lib_ecology.plant_reedmace)
		add_schem({"lib_materials:dirt_mud_01",}, 80, 0.012, {"lib_materials_temperate_rainforest_swamp",}, 1, 2, lib_ecology.plant_reedmace_with_flowers)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_materials_temperate_rainforest_swamp",}, -2, -2, lib_ecology.waterlily_pink)
		add_schem_water({"lib_materials:dirt_mud_01",}, 80, 0.05, {"lib_materials_temperate_rainforest_swamp",}, -2, -2, lib_ecology.waterlily_yellow)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_temperate_rainforest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1)
		add_node({"lib_materials:dirt_mud_01"}, 0.008, {"lib_materials_temperate_rainforest_swamp"}, -1, 1, {"lib_ecology:plant_papyrus"}, 3, "lib_materials:dirt_mud_01", 1)
		add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_temperate_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_cattail"}, 1, nil, nil)
		--add_node({"lib_materials:dirt_mud_01"}, 0.2, {"lib_materials_temperate_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_bulrush"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_temperate_rainforest_swamp"}, 1, 2, {"lib_ecology:plant_nettle_impatiens"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_temperate_rainforest_swamp"}, 2, 4, {"lib_ecology:ground_grass"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.1, {"lib_materials_temperate_rainforest_swamp"}, 2, 4, {"lib_ecology:grass_giant"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_materials_temperate_rainforest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_pink"}, 1, nil, nil)
		add_node({"default:water_source"}, 0.05, {"lib_materials_temperate_rainforest_swamp"}, 0, 0, {"lib_ecology:plant_waterlily_yellow"}, 1, nil, nil)
		add_node({"lib_materials:dirt_mud_01"}, 0.06, {"lib_materials_temperate_rainforest_swamp"}, -3, -1, {"lib_ecology:plant_reedmace_water", }, nil, nil, nil)

	end

	lib_ecology.add_decorations_ocean = function()

	-- Coral reefs
		minetest.register_decoration({
			name = "lib_ecology:corals_1",
			deco_type = "simple",
			place_on = {"lib_materials:sand", "lib_materials:dirt_silt_02", },
			place_offset_y = -1,
			sidelen = 4,
			noise_params = {
				offset = -4,
				scale = 4,
				spread = {x = 50, y = 50, z = 50},
				seed = 7013,
				octaves = 3,
				persist = 0.7,
			},
			biomes = {
				"warm_temperate_ocean",
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
			},
			y_max = -2,
			y_min = -12,
			flags = "force_placement",
			decoration = {
				"lib_ecology:coral_green_01", "lib_ecology:coral_pink_01",
				"lib_ecology:coral_blue_01", "lib_ecology:coral_brown",
				"lib_ecology:coral_orange_01", "lib_ecology:coral_skeleton",
				"lib_ecology:coral_blue_03", "lib_ecology:coral_red",
				"lib_ecology:coral_orange_03",
			},
		})

		minetest.register_decoration({
			name = "lib_ecology:corals_2",
			deco_type = "simple",
			place_on = {"lib_materials:sand", "lib_materials:dirt_silt_02", },
			place_offset_y = -1,
			sidelen = 4,
			noise_params = {
				offset = -4,
				scale = 4,
				spread = {x = 50, y = 50, z = 50},
				seed = 7013,
				octaves = 3,
				persist = 0.7,
			},
			biomes = {
				"warm_humid_ocean",
				"warm_semihumid_ocean",
			},
			y_max = -4,
			y_min = -14,
			flags = "force_placement",
			decoration = {
				"lib_ecology:coral_green_02", "lib_ecology:coral_pink_02",
				"lib_ecology:coral_blue_02", "lib_ecology:coral_dragon_eye",
				"lib_ecology:coral_orange_02", "lib_ecology:coral_skeleton",
				"lib_ecology:coral_brain", "lib_ecology:coral_staghorn",
				"lib_ecology:coral_pink_03", "lib_ecology:plant_anemone",
			},
		})

	-- Kelp
		minetest.register_decoration({
			name = "lib_ecology:kelp",
			deco_type = "simple",
			place_on = {"lib_materials:sand"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
				"cool_humid_ocean",
				"cool_semihumid_ocean",
				"cool_temperate_ocean"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:plant_kelp_01"},
			param2 = 48,
			param2_max = 96,
		})
		minetest.register_decoration({
			name = "lib_ecology:kelp_02_1",
			deco_type = "simple",
			place_on = {"lib_materials:sand"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
				"cool_humid_ocean",
				"cool_semihumid_ocean",
				"cool_temperate_ocean"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:plant_kelp_02_1"},
			param2 = 48,
			param2_max = 96,
		})
		minetest.register_decoration({
			name = "lib_ecology:kelp_02_2",
			deco_type = "simple",
			place_on = {"lib_materials:sand"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
				"cool_humid_ocean",
				"cool_semihumid_ocean",
				"cool_temperate_ocean"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:plant_kelp_02_2"},
			param2 = 48,
			param2_max = 96,
		})
		minetest.register_decoration({
			name = "lib_ecology:seaweed",
			deco_type = "simple",
			place_on = {"lib_materials:sand"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
				"cool_humid_ocean",
				"cool_semihumid_ocean",
				"cool_temperate_ocean"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:plant_seaweed"},
			param2 = 48,
			param2_max = 96,
		})
		minetest.register_decoration({
			name = "lib_ecology:seaweed2",
			deco_type = "simple",
			place_on = {"lib_materials:sand"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
				"cool_humid_ocean",
				"cool_semihumid_ocean",
				"cool_temperate_ocean"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:plant_seaweed2"},
			param2 = 48,
			param2_max = 96,
		})
		minetest.register_decoration({
			name = "lib_ecology:seaweed3",
			deco_type = "simple",
			place_on = {"lib_materials:sand"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"temperate_humid_ocean",
				"temperate_semihumid_ocean",
				"temperate_temperate_ocean",
				"cool_humid_ocean",
				"cool_semihumid_ocean",
				"cool_temperate_ocean"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:plant_seaweed3"},
			param2 = 48,
			param2_max = 96,
		})

	-- Sea Grass
		minetest.register_decoration({
			name = "lib_ecology:sea_grass",
			deco_type = "simple",
			place_on = {"lib_materials:sand", },
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"hot_semiarid_ocean",
				"warm_semiarid_ocean",
				"temperate_semiarid_ocean",
				"cool_semiarid_ocean",
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {
				"lib_ecology:grass_sea_1", "lib_ecology:grass_sea_2",
				"lib_ecology:grass_sea_3",
			},
			param2 = 48,
			param2_max = 96,
		})



	end

	lib_ecology.add_decorations_mangrove_forest = function()

		minetest.register_decoration({
			name = "lib_ecology:mangroves",
			deco_type = "simple",
			place_on = {"lib_materials:dirt_silt_01"},
			place_offset_y = -1,
			sidelen = 16,
			noise_params = {
				offset = -0.004,
				scale = 0.1,
				spread = {x = 200, y = 200, z = 200},
				seed = 87112,
				octaves = 3,
				persist = 0.7
			},
			biomes = {
				"hot_humid_beach",
				"hot_semihumid_beach",
				"warm_humid_beach"
			},
			y_max = -5,
			y_min = -10,
			flags = "force_placement",
			decoration = {"lib_ecology:tree_mangrove_root"},
			param2 = 48,
			param2_max = 96,
		})

	end

	lib_ecology.add_decorations_mushrooms = function()

		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_big)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_fat)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_large)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_short)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_tall)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_blue)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_green_spotted)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_green_dark)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.schem_mushroom_purple)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.mushroom_03_a)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_coastal"}, lib_materials.maxheight_beach, lib_materials.maxheight_coastal, lib_ecology.mushroom_03_b)

		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_big)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_fat)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_large)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_short)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_tall)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_blue)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_green_spotted)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_green_dark)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_mushroom_purple)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.mushroom_03_a)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_lowland"}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.mushroom_03_b)

		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_mushroom_big)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_mushroom_fat)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_mushroom_large)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_mushroom_short)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_mushroom_tall)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.mushroom_03_a)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_shelf"}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.mushroom_03_b)

		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_mushroom_big)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_mushroom_fat)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_mushroom_large)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_mushroom_short)
		--add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.005, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.schem_mushroom_tall)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.mushroom_03_a)
		add_schem({"lib_materials:dirt_black_with_litter_fungi"}, 80, 0.01, {"hot_humid_highland"}, lib_materials.maxheight_shelf, lib_materials.maxheight_highland, lib_ecology.mushroom_03_b)

	end



	lib_ecology.add_hot_decorations = function()

		-- minetest.log(S("[MOD] lib_ecology:  Decorating Hot Humid Biomes"))
		lib_ecology.add_decorations_hot_humid_ocean()
		lib_ecology.add_decorations_hot_humid_beach()
		lib_ecology.add_decorations_hot_humid_coastal()
		lib_ecology.add_decorations_hot_humid_lowland()
		lib_ecology.add_decorations_hot_humid_shelf()
		lib_ecology.add_decorations_hot_humid_highland()
		--lib_ecology.add_decorations_hot_humid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Hot SemiHumid Biomes"))
		lib_ecology.add_decorations_hot_semihumid_ocean()
		lib_ecology.add_decorations_hot_semihumid_beach()
		lib_ecology.add_decorations_hot_semihumid_coastal()
		lib_ecology.add_decorations_hot_semihumid_lowland()
		lib_ecology.add_decorations_hot_semihumid_shelf()
		lib_ecology.add_decorations_hot_semihumid_highland()
		--lib_ecology.add_decorations_hot_semihumid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Hot Temperate Biomes"))
		lib_ecology.add_decorations_hot_temperate_ocean()
		lib_ecology.add_decorations_hot_temperate_beach()
		lib_ecology.add_decorations_hot_temperate_coastal()
		lib_ecology.add_decorations_hot_temperate_lowland()
		lib_ecology.add_decorations_hot_temperate_shelf()
		lib_ecology.add_decorations_hot_temperate_highland()
		--lib_ecology.add_decorations_hot_temperate_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Hot SemiArid Biomes"))
		lib_ecology.add_decorations_hot_semiarid_ocean()
		lib_ecology.add_decorations_hot_semiarid_beach()
		lib_ecology.add_decorations_hot_semiarid_coastal()
		lib_ecology.add_decorations_hot_semiarid_lowland()
		lib_ecology.add_decorations_hot_semiarid_shelf()
		lib_ecology.add_decorations_hot_semiarid_highland()
		--lib_ecology.add_decorations_hot_semiarid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Hot Arid Biomes"))
		lib_ecology.add_decorations_hot_arid_ocean()
		lib_ecology.add_decorations_hot_arid_beach()
		lib_ecology.add_decorations_hot_arid_coastal()
		lib_ecology.add_decorations_hot_arid_lowland()
		lib_ecology.add_decorations_hot_arid_shelf()
		lib_ecology.add_decorations_hot_arid_highland()
		--lib_ecology.add_decorations_hot_arid_mountain()
		
	end

	lib_ecology.add_warm_decorations = function()
		
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Warm Humid Biomes"))
		lib_ecology.add_decorations_warm_humid_ocean()
		lib_ecology.add_decorations_warm_humid_beach()
		lib_ecology.add_decorations_warm_humid_coastal()
		lib_ecology.add_decorations_warm_humid_lowland()
		lib_ecology.add_decorations_warm_humid_shelf()
		lib_ecology.add_decorations_warm_humid_highland()
		--lib_ecology.add_decorations_warm_humid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Warm SemiHumid Biomes"))
		lib_ecology.add_decorations_warm_semihumid_ocean()
		lib_ecology.add_decorations_warm_semihumid_beach()
		lib_ecology.add_decorations_warm_semihumid_coastal()
		lib_ecology.add_decorations_warm_semihumid_lowland()
		lib_ecology.add_decorations_warm_semihumid_shelf()
		lib_ecology.add_decorations_warm_semihumid_highland()
		--lib_ecology.add_decorations_warm_semihumid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Warm Temperate Biomes"))
		lib_ecology.add_decorations_warm_temperate_ocean()
		lib_ecology.add_decorations_warm_temperate_beach()
		lib_ecology.add_decorations_warm_temperate_coastal()
		lib_ecology.add_decorations_warm_temperate_lowland()
		lib_ecology.add_decorations_warm_temperate_shelf()
		lib_ecology.add_decorations_warm_temperate_highland()
		--lib_ecology.add_decorations_warm_temperate_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Warm SemiArid Biomes"))
		lib_ecology.add_decorations_warm_semiarid_ocean()
		lib_ecology.add_decorations_warm_semiarid_beach()
		lib_ecology.add_decorations_warm_semiarid_coastal()
		lib_ecology.add_decorations_warm_semiarid_lowland()
		lib_ecology.add_decorations_warm_semiarid_shelf()
		lib_ecology.add_decorations_warm_semiarid_highland()
		--lib_ecology.add_decorations_warm_semiarid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Warm Arid Biomes"))
		lib_ecology.add_decorations_warm_arid_ocean()
		lib_ecology.add_decorations_warm_arid_beach()
		lib_ecology.add_decorations_warm_arid_coastal()
		lib_ecology.add_decorations_warm_arid_lowland()
		lib_ecology.add_decorations_warm_arid_shelf()
		lib_ecology.add_decorations_warm_arid_highland()
		--lib_ecology.add_decorations_warm_arid_mountain()
	end

	lib_ecology.add_temperate_decorations = function()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Humid Biomes"))
		lib_ecology.add_decorations_temperate_humid_ocean()
		lib_ecology.add_decorations_temperate_humid_beach()
		lib_ecology.add_decorations_temperate_humid_coastal()
		lib_ecology.add_decorations_temperate_humid_lowland()
		lib_ecology.add_decorations_temperate_humid_shelf()
		lib_ecology.add_decorations_temperate_humid_highland()
		--lib_ecology.add_decorations_temperate_humid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Temperate SemiHumid Biomes"))
		lib_ecology.add_decorations_temperate_semihumid_ocean()
		lib_ecology.add_decorations_temperate_semihumid_beach()
		lib_ecology.add_decorations_temperate_semihumid_coastal()
		lib_ecology.add_decorations_temperate_semihumid_lowland()
		lib_ecology.add_decorations_temperate_semihumid_shelf()
		lib_ecology.add_decorations_temperate_semihumid_highland()
		--lib_ecology.add_decorations_temperate_semihumid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Temperate Biomes"))
		lib_ecology.add_decorations_temperate_temperate_ocean()
		lib_ecology.add_decorations_temperate_temperate_beach()
		lib_ecology.add_decorations_temperate_temperate_coastal()
		lib_ecology.add_decorations_temperate_temperate_lowland()
		lib_ecology.add_decorations_temperate_temperate_shelf()
		lib_ecology.add_decorations_temperate_temperate_highland()
		--lib_ecology.add_decorations_temperate_temperate_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Temperate SemiArid Biomes"))
		lib_ecology.add_decorations_temperate_semiarid_ocean()
		lib_ecology.add_decorations_temperate_semiarid_beach()
		lib_ecology.add_decorations_temperate_semiarid_coastal()
		lib_ecology.add_decorations_temperate_semiarid_lowland()
		lib_ecology.add_decorations_temperate_semiarid_shelf()
		lib_ecology.add_decorations_temperate_semiarid_highland()
		--lib_ecology.add_decorations_temperate_semiarid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Temperate Arid Biomes"))
		lib_ecology.add_decorations_temperate_arid_ocean()
		lib_ecology.add_decorations_temperate_arid_beach()
		lib_ecology.add_decorations_temperate_arid_coastal()
		lib_ecology.add_decorations_temperate_arid_lowland()
		lib_ecology.add_decorations_temperate_arid_shelf()
		lib_ecology.add_decorations_temperate_arid_highland()
		--lib_ecology.add_decorations_temperate_arid_mountain()
	end

	lib_ecology.add_cool_decorations = function()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cool Humid Biomes"))
		lib_ecology.add_decorations_cool_humid_ocean()
		lib_ecology.add_decorations_cool_humid_beach()
		lib_ecology.add_decorations_cool_humid_coastal()
		lib_ecology.add_decorations_cool_humid_lowland()
		lib_ecology.add_decorations_cool_humid_shelf()
		lib_ecology.add_decorations_cool_humid_highland()
		--lib_ecology.add_decorations_cool_humid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cool SemiHumid Biomes"))
		lib_ecology.add_decorations_cool_semihumid_ocean()
		lib_ecology.add_decorations_cool_semihumid_beach()
		lib_ecology.add_decorations_cool_semihumid_coastal()
		lib_ecology.add_decorations_cool_semihumid_lowland()
		lib_ecology.add_decorations_cool_semihumid_shelf()
		lib_ecology.add_decorations_cool_semihumid_highland()
		--lib_ecology.add_decorations_cool_semihumid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cool Temperate Biomes"))
		lib_ecology.add_decorations_cool_temperate_ocean()
		lib_ecology.add_decorations_cool_temperate_beach()
		lib_ecology.add_decorations_cool_temperate_coastal()
		lib_ecology.add_decorations_cool_temperate_lowland()
		lib_ecology.add_decorations_cool_temperate_shelf()
		lib_ecology.add_decorations_cool_temperate_highland()
		--lib_ecology.add_decorations_cool_temperate_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cool SemiArid Biomes"))
		lib_ecology.add_decorations_cool_semiarid_ocean()
		lib_ecology.add_decorations_cool_semiarid_beach()
		lib_ecology.add_decorations_cool_semiarid_coastal()
		lib_ecology.add_decorations_cool_semiarid_lowland()
		lib_ecology.add_decorations_cool_semiarid_shelf()
		lib_ecology.add_decorations_cool_semiarid_highland()
		--lib_ecology.add_decorations_cool_semiarid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cool Arid Biomes"))
		lib_ecology.add_decorations_cool_arid_ocean()
		lib_ecology.add_decorations_cool_arid_beach()
		lib_ecology.add_decorations_cool_arid_coastal()
		lib_ecology.add_decorations_cool_arid_lowland()
		lib_ecology.add_decorations_cool_arid_shelf()
		lib_ecology.add_decorations_cool_arid_highland()
		--lib_ecology.add_decorations_cool_arid_mountain()
	end

	lib_ecology.add_cold_decorations = function()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cold Humid Biomes"))
		lib_ecology.add_decorations_cold_humid_ocean()
		lib_ecology.add_decorations_cold_humid_beach()
		lib_ecology.add_decorations_cold_humid_coastal()
		lib_ecology.add_decorations_cold_humid_lowland()
		lib_ecology.add_decorations_cold_humid_shelf()
		lib_ecology.add_decorations_cold_humid_highland()
		--lib_ecology.add_decorations_cold_humid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cold SemiHumid Biomes"))
		lib_ecology.add_decorations_cold_semihumid_ocean()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cold Temperate Biomes"))
		lib_ecology.add_decorations_cold_temperate_beach()
		lib_ecology.add_decorations_cold_temperate_coastal()
		lib_ecology.add_decorations_cold_temperate_lowland()
		lib_ecology.add_decorations_cold_temperate_shelf()
		lib_ecology.add_decorations_cold_temperate_highland()
		--lib_ecology.add_decorations_cold_temperate_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cold SemiArid Biomes"))
		lib_ecology.add_decorations_cold_semiarid_ocean()
		lib_ecology.add_decorations_cold_semiarid_beach()
		lib_ecology.add_decorations_cold_semiarid_coastal()
		lib_ecology.add_decorations_cold_semiarid_lowland()
		lib_ecology.add_decorations_cold_semiarid_shelf()
		lib_ecology.add_decorations_cold_semiarid_highland()
		--lib_ecology.add_decorations_cold_semiarid_mountain()
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Cold Arid Biomes"))
		lib_ecology.add_decorations_cold_arid_ocean()
		lib_ecology.add_decorations_cold_arid_beach()
		lib_ecology.add_decorations_cold_arid_coastal()
		lib_ecology.add_decorations_cold_arid_lowland()
		lib_ecology.add_decorations_cold_arid_shelf()
		lib_ecology.add_decorations_cold_arid_highland()
		--lib_ecology.add_decorations_cold_arid_mountain()

	end

	lib_ecology.add_extra_decorations = function()
	
	
	
		add_schem({"lib_materials:dirt_with_grass_gray",}, 80, 0.007, {"temperate_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_scorched_01)
		add_schem({"lib_materials:dirt_with_grass_gray",}, 80, 0.007, {"temperate_temperate_lowland",}, lib_materials.maxheight_coastal, lib_materials.maxheight_lowland, lib_ecology.schem_tree_scorched_02)
		add_schem({"lib_materials:dirt_with_grass_gray",}, 80, 0.007, {"temperate_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_scorched_01)
		add_schem({"lib_materials:dirt_with_grass_gray",}, 80, 0.007, {"temperate_temperate_shelf",}, lib_materials.maxheight_lowland, lib_materials.maxheight_shelf, lib_ecology.schem_tree_scorched_02)


		-- minetest.log(S("[MOD] lib_ecology:  Decorating Ocean and Mushroom Biomes"))
		lib_ecology.add_decorations_ocean()
		--lib_ecology.add_decorations_mangrove_forest()
		lib_ecology.add_decorations_mushrooms()
		
		-- minetest.log(S("[MOD] lib_ecology:  Decorating Valley_C Biomes"))
		lib_ecology.add_decorations_desert()
		--add_decorations_coniferous_forest_dunes()
		
		lib_ecology.add_decorations_deciduous_forest_swamp()
		
		--add_decorations_desertstone_grassland()
		
		--add_decorations_sandstone_grassland()
		--add_decorations_sandstone_grassland_dunes()
		
		--add_decorations_savanna()
		--add_decorations_savanna_swamp()
		
		--add_decorations_stone_grassland_dunes()
		
		lib_ecology.add_decorations_subtropical_rainforest_swamp()
		
		lib_ecology.add_decorations_temperate_rainforest_swamp()
		
		--add_decorations_tropical_rainforest()
		lib_ecology.add_decorations_tropical_rainforest_swamp()
		
	end

	lib_ecology.add_hot_decorations()
	lib_ecology.add_warm_decorations()
	lib_ecology.add_temperate_decorations()
	lib_ecology.add_cool_decorations()
	lib_ecology.add_cold_decorations()

	lib_ecology.add_extra_decorations()






	--TEMP and OLD Decorations
	--[[		replacements = {["oldname"] = "convert_to", ...},							{["oldname"] = "convert_to", ...},
	--swamp water
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "lib_materials:dirty_water_source",
		wherein         = {"lib_materials:dirt_silty_with_litter_coniferous","lib_materials:dirt_silty_with_litter_rainforest",},
		clust_scarcity  = 9 * 9 * 9,
		clust_size      = 8,
		y_min           = -31000,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})
	--]]
	--[[MORETREES L TREES Saplings for ABM Tree Placement.  NO ABMs!!!
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"lib_materials:dirt_dark_with_grass", "default:dirt_with_grass",},
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {"warm_temperate", "temperate_temperate",},
		y_min = 40,
		y_max = 31000,
		decoration = "lib_ecology:apple_tree_sapling",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"lib_materials:dirt_dark_with_grass", "default:dirt_with_grass",},
		sidelen = 80,
		fill_ratio = 0.001,
		biomes = {"warm_temperate", "temperate_temperate",},
		y_min = 5,
		y_max = 31000,
		decoration = "lib_ecology:beech_sapling",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"lib_materials:dirt_dark_with_grass", "default:dirt_with_grass",},
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {"warm_temperate", "temperate_temperate",},
		y_min = 5,
		y_max = 31000,
		decoration = "lib_ecology:oak_sapling",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"lib_materials:dirt_clay_red_with_litter_coniferous",},
		sidelen = 80,
		fill_ratio = 0.001,
		biomes = {"cool_semihumid_highland",},
		y_min = 5,
		y_max = 31000,
		decoration = "lib_ecology:tree_sequoia_sapling",
	})
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"lib_materials:dirt_clay_red_with_litter_coniferous",},
		sidelen = 80,
		fill_ratio = 0.001,
		biomes = {"cool_semihumid_highland",},
		y_min = 5,
		y_max = 31000,
		decoration = "lib_ecology:tree_spruce_sapling",
	})


	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"lib_materials:dirt_dark_with_dry_grass2",},
		sidelen = 80,
		fill_ratio = 0.002,
		biomes = {"warm_temperate_coastal",},
		y_min = 5,
		y_max = 31000,
		decoration = "lib_ecology:palm_03_sapling",
	})
	--]]
	--[[FARLANDS DECORATIONS
	--minetest.log(S("[MOD] lib_ecology:  Adding Farlands Decorations"))
	-- -- --Bamboo Tree Small
	-- -- minetest.register_decoration({
		-- -- deco_type = "simple",
		-- -- place_on = {"lib_materials:dirt_dark_with_grass",},
		-- -- sidelen = 16,
		-- -- fill_ratio = 0.002,
		-- -- fill_ratio = 0.05,
		-- -- biomes = {"cool_humid",},
		-- -- decoration = "lib_ecology:bamboo_small",
		-- -- height = 3,
	-- -- })
	-- -- --Bamboo Grass
	-- -- minetest.register_decoration({
		-- -- deco_type = "simple",
		-- -- place_on = {"lib_materials:dirt_sandy_with_litter_rainforest",},
		-- -- sidelen = 16,
		-- -- fill_ratio = 0.002,
		-- -- biomes = {"cool_humid",},
		-- -- decoration = "lib_ecology:bamboo_grass",
		-- -- height = 1,
	-- -- })
	-- -- --Bamboo Tree 01
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_sandy_with_litter_rainforest",},
		-- -- sidelen = 16,
		-- -- fill_ratio = 0.002,
		-- -- biomes = {"cool_humid",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = lib_ecology.path .. "/schematics/bamboo1.mts",
		-- -- flags = "place_center_x, place_center_z",
	-- -- })
	-- -- --Bamboo Tree 02
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_sandy_with_litter_rainforest",},
		-- -- sidelen = 16,
		-- -- fill_ratio = 0.002,
		-- -- biomes = {"cool_humid",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = minetest.get_modpath("lib_ecology") .. "/schematics/bamboo2.mts",
		-- -- flags = "place_center_x, place_center_z",
	-- -- })
	-- -- --Bamboo Tree 05
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_sandy_with_litter_rainforest",},
		-- -- sidelen = 16,
		-- -- fill_ratio = 0.002,
		-- -- biomes = {"cool_humid",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = minetest.get_modpath("lib_ecology") .. "/schematics/bamboo5.mts",
		-- -- flags = "place_center_x, place_center_z",
	-- -- })



	-- -- --Baobab Tree 01
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_dark_with_dry_grass", },
		-- -- sidelen = 80,
		-- -- fill_ratio = 0.001,
		-- -- biomes = {"warm_semiarid_lowland",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = minetest.get_modpath("lib_ecology") .. "/schematics/baobab.mts",
		-- -- replacements = {["mapgen:baobab_tree"] = "lib_ecology:tree_baobab_trunk", ["mapgen:baobab_leaves"] = "lib_ecology:tree_baobab_leaves", ["air"] = "ignore", },
		-- -- flags = "place_center_x, place_center_z",
		-- -- rotation = "random",
	-- -- })
	-- -- --Baobab Tree 02
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_dark_with_dry_grass" },
		-- -- sidelen = 80,
		-- -- fill_ratio = 0.001,
		-- -- biomes = {"warm_semiarid_lowland",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = minetest.get_modpath("lib_ecology") .. "/schematics/baobab1.mts",
		-- -- replacements = {["mapgen:baobab_tree"] = "lib_ecology:tree_baobab_trunk", ["mapgen:baobab_leaves"] = "lib_ecology:tree_baobab_leaves", ["air"] = "ignore", },
		-- -- flags = "place_center_x, place_center_z",
		-- -- rotation = "random",
	-- -- })
	-- -- --Baobab Tree 03
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_dark_with_dry_grass", },
		-- -- sidelen = 80,
		-- -- fill_ratio = 0.001,
		-- -- biomes = {"warm_semiarid_lowland",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = minetest.get_modpath("lib_ecology") .. "/schematics/baobab2.mts",
		-- -- replacements = {["mapgen:baobab_tree"] = "lib_ecology:tree_baobab_trunk", ["mapgen:baobab_leaves"] = "lib_ecology:tree_baobab_leaves", ["air"] = "ignore", },
		-- -- flags = "place_center_x, place_center_z",
		-- -- rotation = "random",
	-- -- })

	--Big Old Tree
	--add_schem({"lib_materials:dirt_clayey_with_litter_coniferous",}, 80, 0.005, {"hot_semihumid_shelf",}, 1, 100, lib_ecology.path .. "/schematics/big.mts")


	-- -- --Yellow Ipe Tree
	-- -- minetest.register_decoration({
		-- -- deco_type = "schematic",
		-- -- place_on = {"lib_materials:dirt_coarse_with_litter_rainforest","lib_materials:dirt_sandy_with_litter_rainforest"},
		-- -- sidelen = 80,
		-- -- fill_ratio = 0.002,
		-- -- biomes = {"cold_humid","cool_humid",},
		-- -- y_min = 1,
		-- -- y_max = 31000,
		-- -- schematic = minetest.get_modpath("lib_ecology") .. "/schematics/ipe.mts",
		-- -- replacements = {["mapgen:yellow_ipe_tree"] = "lib_ecology:yellow_ipe_trunk", ["mapgen:yellow_ipe_leaves"] = "lib_ecology:yellow_ipe_leaves", ["air"] = "ignore", },
		-- -- flags = "place_center_x, place_center_z",
		-- -- rotation = "random",
	-- -- })


	--oats
	-- minetest.register_decoration({
		-- deco_type = "simple",
		-- place_on = {"lib_materials:dirt_coarse_with_grass",},
		-- sidelen = 6,
		-- fill_ratio = 0.01,
		-- biomes = {"cool_temperate",},
		-- decoration = "lib_ecology:wild_oat_dry",
		-- height = 1,
	-- })

	-- Large cactus
	-- minetest.register_decoration({
		-- deco_type = "schematic",
		-- place_on = {"default:sand","lib_materials:dirt_dry_with_dry_grass",},
		-- sidelen = 16,
		-- fill_ratio = 0.002,
		-- biomes = {"warm_arid","temperate_arid",},
		-- y_min = 5,
		-- y_max = 31000,
		-- schematic = minetest.get_modpath("default") .. "/schematics/large_cactus.mts",
		-- flags = "place_center_x",
		-- rotation = "random",
	-- })

	-- Cactus
	-- minetest.register_decoration({
		-- deco_type = "simple",
		-- place_on = {"default:desert_sand","default:sand","lib_materials:dirt_dry_with_dry_grass",},
		-- sidelen = 16,
		-- fill_ratio = 0.002,
		-- biomes = {"hot_arid","warm_arid","temperate_arid",},
		-- y_min = 5,
		-- y_max = 31000,
		-- decoration = "default:cactus",
		-- height = 2,
		-- height_max = 5,
	-- })

	-- Papyrus
	-- minetest.register_decoration({
		-- deco_type = "schematic",
		-- place_on = {"lib_materials:dirt_silty_with_litter_rainforest","lib_materials:dirt_clayey_with_litter_rainforest","default:dirt_with_litter_rainforest","lib_materials:dirt_silty_with_grass"},
		-- sidelen = 16,
		-- fill_ratio = 0.002,
		-- biomes = {"hot_humid","hot_semihumid","warm_humid","warm_temperate",},
		-- y_min = 0,
		-- y_max = 0,
		-- schematic = minetest.get_modpath("default") .. "/schematics/papyrus.mts",
	-- })
	--]]
	--[[ETHEREAL DECORATIONS

	--minetest.log(S("[MOD] lib_ecology:  Adding Ethereal Decorations"))

	--= schematic decorations

	-- redwood tree
	--add_schem({"default:dirt_with_litter_coniferous",}, 80, 0.001, {"lib_ecology_coniferous_forest",}, 1, 100, lib_ecology.path .. "/schematics/redwood.mts", lib_ecology.mesa)
	--add_schem({"default:dirt_with_litter_coniferous",}, 80, 0.001, {"lib_ecology_coniferous_forest",}, 1, 100, lib_ecology.path .. "/schematics/redwood_tree.mts", lib_ecology.mesa)

	-- banana tree
	--add_schem({"lib_materials:dirt_with_grass_grove"}, 80, 0.01, {"grove"}, 1, 100, lib_ecology.tree_banana_01)

	-- healing tree
	--add_schem({"lib_materials:dirt_with_snow"}, 80, 0.008, {"alpine"}, 120, 140, lib_ecology.path .. "/schematics/yellowtree.mts", lib_ecology.alpine)
	--add_schem({"lib_materials:dirt_with_snow"}, 80, 0.008, {"alpine"}, 120, 140, lib_ecology.tree_yellow_healing)

	-- crystal frost tree
	--add_schem({"lib_materials:dirt_with_grass_crystal"}, 80, 0.008, {"frost"}, 1, 100, lib_ecology.path .. "/schematics/frosttrees.mts")
	--add_schem({"lib_materials:dirt_with_grass_crystal"}, 80, 0.008, {"frost"}, 1, 100, lib_ecology.tree_frost)

	-- giant mushroom
	--add_schem({"lib_materials:dirt_with_mushroom_grass"}, 80, 0.0025, {"mushroom"}, 1, 100, lib_ecology.path .. "/schematics/mushroomone.mts", lib_ecology.mushroom)

	-- small cinder cone
	--add_schem_with_relace({"default:stone"}, 80, 0.0001, {"cold_semiarid_volcanic"}, 150, 150, lib_ecology.path .. "/schematics/volcanom.mts", {["ethereal:fiery_dirt_top"] = "ignore", ["air"] = "ignore", })

	-- large lava crater
	--add_schem_with_relace({"default:stone"}, 80, 0.0001, {"cold_semiarid_volcanic"}, 150, 150, lib_ecology.path .. "/schematics/volcanol.mts", {["ethereal:fiery_dirt_top"] = "ignore", ["air"] = "ignore", })

	-- -- -- small lava crater
	-- -- add_schem({"ethereal:fiery_dirt"}, 0.01, {"fiery"}, 1, 100, lib_ecology.path .. "/schematics/volcanom.mts", lib_ecology.fiery)

	-- -- -- large lava crater
	-- -- add_schem({"ethereal:fiery_dirt"}, 0.01, {"fiery"}, 1, 100, lib_ecology.path .. "/schematics/volcanol.mts", lib_ecology.fiery)

	-- default jungle tree
	--add_schem({"lib_materials:dirt_with_grass_jungle_01"}, 80, 0.002, {"junglee"}, 1, 100, lib_ecology.path .. "/schematics/jungle_tree.mts")
	--add_schem({"lib_materials:dirt_with_grass_jungle_01"}, 80, 0.002, {"junglee"}, 1, 100, lib_ecology.tree_jungle_01_06)

	-- willow tree
	--add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.0025, {"lib_ecology_deciduous_forest_swamp",}, 1, 100, lib_ecology.path .. "/schematics/willow.mts", lib_ecology.grayness)
	--add_schem({"lib_materials:dirt_silty_with_litter_coniferous",}, 80, 0.0025, {"lib_ecology_deciduous_forest_swamp",}, 1, 100, lib_ecology.tree_willow_01_01)

	-- pine tree (default for lower elevation and lib_ecology for higher)
	-- add_schem({"lib_materials:dirt_with_grass_cold"}, 80, 0.008, {"snowy"}, 10, 40, lib_ecology.path .. "/schematics/pine_tree.mts", lib_ecology.snowy)
	-- add_schem({"lib_materials:dirt_with_snow"}, 80, 0.008, {"alpine"}, 40, 140, lib_ecology.path .. "/schematics/pinetree.mts", lib_ecology.alpine)
	--add_schem({"lib_materials:dirt_with_grass_cold"}, 80, 0.008, {"snowy"}, 10, 40, lib_ecology.tree_pine_01_01)
	--add_schem({"lib_materials:dirt_with_snow"}, 80, 0.008, {"alpine"}, 40, 140, lib_ecology.tree_pine_01_02)

	-- default apple tree
	-- add_schem_with_relace({"lib_materials:dirt_with_grass_green"}, 80, 0.001, {"jumble"}, 1, 100, lib_ecology.path .. "/schematics/apple_tree.mts", lib_ecology.grassy, {["default:tree"] = "lib_ecology:apple_tree_trunk", ["default:leaves"] = "lib_ecology:apple_tree_leaves",})
	-- add_schem_with_relace({"lib_materials:dirt_with_grass_green"}, 80, 0.001, {"grassy"}, 1, 100, lib_ecology.path .. "/schematics/apple_tree.mts", lib_ecology.grassy, {["default:tree"] = "lib_ecology:apple_tree_trunk", ["default:leaves"] = "lib_ecology:apple_tree_leaves",})

	-- big old tree
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.001, {"jumble"}, 1, 100, lib_ecology.path .. "/schematics/big.mts", lib_ecology.jumble)

	-- aspen tree
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.012, {"grassytwo"}, 1, 50, lib_ecology.tree_aspen_01, lib_ecology.jumble)
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.012, {"grassytwo"}, 1, 50, lib_ecology.tree_aspen_02, lib_ecology.jumble)
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.012, {"grassytwo"}, 1, 50, lib_ecology.tree_aspen_03, lib_ecology.jumble)
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.012, {"grassytwo"}, 1, 50, lib_ecology.tree_aspen_04, lib_ecology.jumble)

	-- birch tree
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.012, {"grassytwo"}, 50, 100, lib_ecology.birchtree, lib_ecology.grassytwo)

	-- orange tree
	-- add_schem({"lib_materials:dirt_with_grass_prairie"}, 80, 0.001, {"prairie"}, 1, 100, lib_ecology.tree_orange, lib_ecology.prairie)
	--add_schem({"lib_materials:dirt_with_grass_prairie"}, 80, 0.001, {"prairie"}, 1, 100, lib_ecology.tree_orange)

	-- default acacia tree
	-- add_schem({"lib_materials:dirt_with_dry_grass"}, 80, 0.004, {"savannah"}, 1, 100, lib_ecology.path .. "/schematics/acacia_tree.mts", lib_ecology.savannah)
	--add_schem({"lib_materials:dirt_with_dry_grass"}, 80, 0.004, {"savannah"}, 1, 100, lib_ecology.schem_tree_acacia_01)

	-- large cactus (by Paramat)
	-- if lib_ecology.desert == 1 then
	-- minetest.register_decoration({
		-- deco_type = "schematic",
		-- place_on = {"lib_materials:desert_sand"},
		-- sidelen = 80,
		-- noise_params = {
			-- offset = -0.0005,
			-- scale = 0.0015,
			-- spread = {x = 200, y = 200, z = 200},
			-- seed = 230,
			-- octaves = 3,
			-- persist = 0.6
		-- },
		-- biomes = {"desert"},
		-- y_min = 5,
		-- y_max = 31000,
		-- schematic = lib_ecology.path .. "/schematics/large_cactus.mts",
		-- flags = "place_center_x", --, place_center_z",
		-- rotation = "random",
	-- })
	-- end

	-- palm tree
	--add_schem({"default:sand"}, 80, 0.0025, {"desert_ocean"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.desert)
	--add_schem({"default:sand"}, 80, 0.0025, {"plains_ocean"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.plains)
	--add_schem({"default:sand"}, 80, 0.0025, {"sandclay"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.sandclay)
	--add_schem({"default:sand"}, 80, 0.0025, {"sandstone_ocean"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.sandstone)
	--add_schem({"default:sand"}, 80, 0.0025, {"mesa_ocean"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.mesa)
	--add_schem({"default:sand"}, 80, 0.0025, {"grove_ocean"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.grove)
	--add_schem({"default:sand"}, 80, 0.0025, {"grassy_ocean"}, 1, 4, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.grassy)

	-- bamboo tree
	-- add_schem({"lib_materials:dirt_with_grass_bamboo",}, 80, 0.005, {"bamboo", "bamboo_forest"}, 1, 100, lib_ecology.bambootree, lib_ecology.bamboo)

	-- bush
	-- add_schem({"lib_materials:dirt_with_grass_bamboo"}, 80, 0.012, {"bamboo"}, 1, 100, lib_ecology.bush, lib_ecology.bamboo)

	-- vine tree
	-- add_schem({"lib_materials:dirt_with_grass_green"}, 80, 0.002, {"swamp"}, 1, 100, lib_ecology.path .. "/schematics/vinetree.mts", lib_ecology.swamp)
	-- add_schem_with_relace({"lib_materials:dirt_with_grass_green"}, 80, 0.002, {"swamp"}, 1, 100, lib_ecology.path .. "/schematics/swamp_tree.mts", lib_ecology.grassy, {["default:acacia_tree"] = "lib_ecology:apple_tree_trunk", ["air"] = "ignore", })


	--=============================================
	--= simple decorations
	--=============================================
	-- scorched tree
	-- add_node({"lib_materials:dirt_with_grass_gray"}, 0.006, {"generic_burned"}, 130, 145, {"lib_ecology:scorched_trunk"}, 6, nil, nil, lib_ecology.plains)
	-- add_node({"lib_materials:dirt_with_grass_gray"}, 0.006, {"generic_volcanic"}, 145, 31000, {"lib_ecology:scorched_trunk"}, 6, nil, nil, lib_ecology.plains)
	-- add_node({"lib_materials:dirt_with_grass_gray"}, 0.006, {"grayness"}, 1, 100, {"lib_ecology:scorched_trunk"}, 6, nil, nil, lib_ecology.plains)
	-- add_node({"lib_materials:dirt_with_grass_gray"}, 0.006, {"grayness2"}, 40, 50, {"lib_ecology:scorched_trunk"}, 6, nil, nil, lib_ecology.plains)


	-- dry shrub
	-- add_node({"lib_materials:dry_dirt"}, 0.015, {"plains"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.plains)
	-- add_node({"lib_materials:sand"}, 0.015, {"grassy_ocean"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.grassy)
	-- add_node({"lib_materials:desert_sand"}, 0.015, {"desert"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.desert)
	-- add_node({"default:sandstone"}, 0.015, {"sandstone"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.sandstone)
	-- add_node({"bakedclay:red", "bakedclay:orange"}, 0.015, {"mesa"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.mesa)

	-- dry grass
	-- add_node({"lib_materials:dirt_with_dry_grass"}, 0.25, {"savannah"}, 1, 100, {"lib_ecology:grass_dry_2", "lib_ecology:grass_dry_3", "lib_ecology:grass_dry_4", "lib_ecology:grass_dry_5"}, nil, nil, nil, lib_ecology.savannah)

	-- flowers & strawberry
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.025, {"grassy"}, 1, 100, {"flowers:dandelion_white", "flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip",
		-- "flowers:viola", "lib_ecology:plant_strawberry_7"}, nil, nil, nil, lib_ecology.grassy)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.025, {"grassytwo"}, 1, 100, {"flowers:dandelion_white",
		-- "flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip",
		-- "flowers:viola", "lib_ecology:plant_strawberry_7"}, nil, nil, nil, lib_ecology.grassytwo)

	-- prairie flowers & strawberry
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:flower_dandelion_white"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:flower_dandelion_yellow"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:flower_geranium"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:flower_rose"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:flower_tulip"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:flower_viola"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:plant_strawberry_7"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.035, {"prairie"}, 1, 100, {"lib_ecology:plant_strawberry_7"}, nil, nil, nil, lib_ecology.prairie)

	-- crystal spike & crystal grass
	--add_node({"lib_materials:dirt_with_grass_crystal"}, 0.02, {"frost"}, 1, 100, {"lib_ecology:crystal_spike",	"lib_ecology:grass_crystal"}, nil, nil, nil, lib_ecology.frost)

	-- red shrub
	--add_node({"lib_materials:dirt_with_grass_fiery"}, 0.10, {"fiery"}, 1, 100, {"lib_ecology:dry_shrub"}, nil, nil, nil, lib_ecology.fiery)

	-- fire flower
	--add_node({"lib_ecology:fiery_dirt"}, 0.02, {"fiery"}, 1, 100, {"lib_ecology:fire_flower"}, nil, nil, nil, lib_ecology.fiery)

	-- snowy grass
	--add_node({"lib_materials:dirt_with_grass_gray"}, 0.05, {"grayness"}, 1, 100, {"lib_ecology:grass_snowygrass"}, nil, nil, nil)
	--add_node({"lib_materials:dirt_with_grass_cold"}, 0.05, {"snowy"}, 1, 100, {"lib_ecology:grass_snowygrass"}, nil, nil, nil)

	-- cactus
	--add_node({"default:sandstone"}, 0.0025, {"sandstone"}, 1, 100, {"default:cactus"}, 3, nil, nil, lib_ecology.sandstone)
	--add_node({"lib_materials:desert_sand"}, 0.005, {"desert"}, 1, 100, {"default:cactus"}, 4, nil, nil, lib_ecology.desert)

	-- wild red mushroom
	--add_node({"lib_materials:dirt_with_mushroom_grass"}, 0.01, {"mushroom"}, 1, 100, {"flowers:mushroom_fertile_red"}, nil, nil, nil, lib_ecology.mushroom)

	-- local list = {
		-- {"junglee", "lib_ecology:dirt_with_grass_jungle_01"},
		-- {"grassy", "lib_ecology:dirt_with_grass_green", lib_ecology.grassy},
		-- {"grassytwo", "lib_ecology:dirt_with_grass_green", lib_ecology.grassytwo},
		-- {"prairie", "lib_ecology:dirt_with_grass_prairie", lib_ecology.prairie},
		-- {"mushroom", "lib_ecology:dirt_with_mushroom_grass", lib_ecology.mushroom},
		-- {"swamp", "lib_ecology:dirt_with_grass_green", lib_ecology.swamp},
	-- }

	-- wild red and brown mushrooms
	-- for _, row in pairs(list) do

	-- if row[3] == 1 then
	-- minetest.register_decoration({
		-- deco_type = "simple",
		-- place_on = {row[2]},
		-- sidelen = 16,
		-- noise_params = {
			-- offset = 0,
			-- scale = 0.009,
			-- spread = {x = 200, y = 200, z = 200},
			-- seed = 2,
			-- octaves = 3,
			-- persist = 0.66
		-- },
		-- biomes = {row[1]},
		-- y_min = 1,
		-- y_max = 120,
		-- decoration = {"flowers:mushroom_brown", "flowers:mushroom_red"},
	-- })
	-- end

	-- end

	-- jungle grass
	-- add_node({"lib_materials:dirt_with_grass_jungle_01"}, 0.10, {"junglee"}, 1, 100, {"default:junglegrass"}, nil, nil, nil)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.15, {"jumble"}, 1, 100, {"default:junglegrass"}, nil, nil, nil, lib_ecology.jumble)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.25, {"swamp"}, 1, 100, {"default:junglegrass"}, nil, nil, nil, lib_ecology.swamp)

	-- grass
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.35, {"grassy"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil, lib_ecology.grassy)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.35, {"grassytwo"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil, lib_ecology.grassytwo)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.35, {"jumble"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil, lib_ecology.jumble)
	-- add_node({"lib_materials:dirt_with_grass_jungle_01"}, 0.35, {"junglee"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.35, {"prairie"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil, lib_ecology.prairie)
	-- add_node({"lib_materials:dirt_with_grass_grove"}, 0.35, {"grove"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil, lib_ecology.grove)
	-- add_node({"lib_materials:dirt_with_grass_bamboo"}, 0.35, {"bamboo"}, 1, 100, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3", "lib_ecology:grass_green_4", "lib_ecology:grass_green_5"}, nil, nil, nil, lib_ecology.bamboo)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.35, {"clearing", "swamp"}, 1, 100, {"lib_ecology:grass_green_3",	"lib_ecology:grass_green_4"}, nil, nil, nil, 1)

	-- grass on sand
	-- add_node({"lib_materials:sand"}, 0.25, {"sandclay"}, 3, 4, {"lib_ecology:grass_green_2", "lib_ecology:grass_green_3"}, nil, nil, nil, lib_ecology.sandclay)

	-- ferns
	-- add_node({"lib_materials:dirt_with_grass_grove"}, 0.2, {"grove"}, 1, 100, {"lib_ecology:fern_boston_01"}, nil, nil, nil, lib_ecology.grove)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.1, {"swamp"}, 1, 100, {"lib_ecology:fern_boston_01"}, nil, nil, nil, lib_ecology.swamp)

	-- snow
	-- add_node({"lib_materials:dirt_with_grass_cold"}, 0.8, {"snowy"}, 4, 40, {"default:snow"}, nil, nil, nil, lib_ecology.snowy)
	-- add_node({"lib_materials:dirt_with_snow"}, 0.8, {"alpine"}, 40, 140, {"default:snow"}, nil, nil, nil, lib_ecology.alpine)

	-- wild onion
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.25, {"grassy"}, 1, 100, {"lib_ecology:plant_wild_onion_4"}, nil, nil, nil, lib_ecology.grassy)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.25, {"grassytwo"}, 1, 100, {"lib_ecology:plant_wild_onion_4"}, nil, nil, nil, lib_ecology.grassytwo)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.25, {"jumble"}, 1, 100, {"lib_ecology:plant_wild_onion_4"}, nil, nil, nil, lib_ecology.jumble)
	-- add_node({"lib_materials:dirt_with_grass_prairie"}, 0.25, {"prairie"}, 1, 100, {"lib_ecology:plant_wild_onion_4"}, nil, nil, nil, lib_ecology.prairie)

	-- papyrus
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.1, {"grassy"}, 1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1, lib_ecology.grassy)
	-- add_node({"lib_materials:dirt_with_grass_jungle_01"}, 0.1, {"junglee"}, 1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1)
	-- add_node({"lib_materials:dirt_with_grass_green"}, 0.1, {"swamp"}, 1, 1, {"lib_ecology:plant_papyrus"}, 4, "default:water_source", 1, lib_ecology.swamp)

	--= Farming Redo plants

	-- if farming and farming.mod and farming.mod == "redo" then

	-- print ("[MOD] lib_ecology - Farming Redo detected and in use")

	-- -- potato
	-- add_node({"lib_ecology:dirt_with_grass_jungle_01"}, 0.035, {"junglee"}, 1, 100, {"farming:potato_3"}, nil, nil, nil)

	-- -- carrot, cucumber, potato, tomato, corn, coffee, raspberry, rhubarb
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.05, {"grassytwo"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
		-- "farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
		-- "farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.grassytwo)
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.05, {"grassy"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
		-- "farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
		-- "farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.grassy)
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.05, {"jumble"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
		-- "farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
		-- "farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.jumble)
	-- add_node({"lib_ecology:dirt_with_grass_prairie"}, 0.05, {"prairie"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
		-- "farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
		-- "farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.prairie)

	-- -- melon and pumpkin
	-- add_node({"lib_ecology:dirt_with_grass_jungle_01"}, 0.015, {"junglee"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1)
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.015, {"grassy"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.grassy)
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.015, {"grassytwo"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.grassytwo)
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.015, {"jumble"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.jumble)

	-- -- green beans
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.035, {"grassytwo"}, 1, 100, {"farming:beanbush"}, nil, nil, nil, lib_ecology.grassytwo)

	-- -- grape bushel
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.025, {"grassytwo"}, 1, 100, {"farming:grapebush"}, nil, nil, nil, lib_ecology.grassytwo)
	-- add_node({"lib_ecology:dirt_with_grass_green"}, 0.025, {"grassy"}, 1, 100, {"farming:grapebush"}, nil, nil, nil, lib_ecology.grassy)
	-- add_node({"lib_ecology:dirt_with_grass_prairie"}, 0.025, {"prairie"}, 1, 100, {"farming:grapebush"}, nil, nil, nil, lib_ecology.prairie)

	-- end

	-- place waterlily in beach areas
	-- local list = {
		-- {"desert_ocean", lib_ecology.desert},
		-- {"plains_ocean", lib_ecology.plains},
		-- {"sandclay", lib_ecology.sandclay},
		-- {"sandstone_ocean", lib_ecology.sandstone},
		-- {"mesa_ocean", lib_ecology.mesa},
		-- {"grove_ocean", lib_ecology.grove},
		-- {"grassy_ocean", lib_ecology.grassy},
		-- {"swamp_ocean", lib_ecology.swamp},
	-- }

	-- for _, row in pairs(list) do

		-- if row[2] == 1 then

		-- minetest.register_decoration({
			-- deco_type = "schematic",
			-- place_on = {"default:sand"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = -0.12,
				-- scale = 0.3,
				-- spread = {x = 200, y = 200, z = 200},
				-- seed = 33,
				-- octaves = 3,
				-- persist = 0.7
			-- },
			-- biomes = {row[1]},
			-- y_min = 0,
			-- y_max = 0,
			-- schematic = lib_ecology.waterlily,
			-- rotation = "random",
		-- })
		-- minetest.register_decoration({
			-- deco_type = "schematic",
			-- place_on = {"default:sand"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = -0.12,
				-- scale = 0.3,
				-- spread = {x = 200, y = 200, z = 200},
				-- seed = 33,
				-- octaves = 3,
				-- persist = 0.7
			-- },
			-- biomes = {row[1]},
			-- y_min = 0,
			-- y_max = 0,
			-- schematic = lib_ecology.waterlily_pink,
			-- rotation = "random",
		-- })
		-- minetest.register_decoration({
			-- deco_type = "schematic",
			-- place_on = {"default:sand"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = -0.12,
				-- scale = 0.3,
				-- spread = {x = 200, y = 200, z = 200},
				-- seed = 33,
				-- octaves = 3,
				-- persist = 0.7
			-- },
			-- biomes = {row[1]},
			-- y_min = 0,
			-- y_max = 0,
			-- schematic = lib_ecology.waterlily_yellow,
			-- rotation = "random",
		-- })

		-- end

	-- end


	-- Generate Illumishroom in caves next to coal
	minetest.register_on_generated(function(minp, maxp)

		if minp.y > -30 or maxp.y < -3000 then
			return
		end

		local bpos
		local coal = minetest.find_nodes_in_area_under_air(minp, maxp, "default:stone_with_coal")

		for n = 1, #coal do

			bpos = {x = coal[n].x, y = coal[n].y + 1, z = coal[n].z }

			if math.random(1, 2) == 1 then

				if bpos.y > -3000 and bpos.y < -2000 then
					minetest.swap_node(bpos, {name = "lib_ecology:illumishroom3"})

				elseif bpos.y > -2000 and bpos.y < -1000 then
					minetest.swap_node(bpos, {name = "lib_ecology:illumishroom2"})

				elseif bpos.y > -1000 and bpos.y < -30 then
					minetest.swap_node(bpos, {name = "lib_ecology:illumishroom"})
				end
			end
		end
	end)


	-- is baked clay mod active? add new flowers if so
	-- if minetest.get_modpath("bakedclay") then

		-- minetest.register_decoration({
			-- deco_type = "simple",
			-- place_on = {"lib_ecology:dirt_with_grass_prairie","lib_ecology:dirt_with_grass_green","lib_ecology:dirt_with_grass_grove"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = 0,
				-- scale = 0.004,
				-- spread = {x = 100, y = 100, z = 100},
				-- seed = 7133,
				-- octaves = 3,
				-- persist = 0.6
			-- },
			-- y_min = 10,
			-- y_max = 90,
			-- decoration = "bakedclay:delphinium",
		-- })

		-- minetest.register_decoration({
			-- deco_type = "simple",
			-- place_on = {"lib_ecology:dirt_with_grass_prairie","lib_ecology:dirt_with_grass_green","lib_ecology:dirt_with_grass_grove","lib_ecology:dirt_with_grass_bamboo"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = 0,
				-- scale = 0.004,
				-- spread = {x = 100, y = 100, z = 100},
				-- seed = 7134,
				-- octaves = 3,
				-- persist = 0.6
			-- },
			-- y_min = 15,
			-- y_max = 90,
			-- decoration = "bakedclay:thistle",
		-- })

		-- minetest.register_decoration({
			-- deco_type = "simple",
			-- place_on = {"lib_ecology:dirt_with_grass_jungle_01"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = 0,
				-- scale = 0.01,
				-- spread = {x = 100, y = 100, z = 100},
				-- seed = 7135,
				-- octaves = 3,
				-- persist = 0.6
			-- },
			-- y_min = 1,
			-- y_max = 90,
			-- decoration = "bakedclay:lazarus",
			-- spawn_by = "lib_ecology:tree_jungle_01_trunk",
			-- num_spawn_by = 1,
		-- })

		-- minetest.register_decoration({
			-- deco_type = "simple",
			-- place_on = {"lib_ecology:dirt_with_grass_green", "lib_materials:sand"},
			-- sidelen = 16,
			-- noise_params = {
				-- offset = 0,
				-- scale = 0.009,
				-- spread = {x = 100, y = 100, z = 100},
				-- seed = 7136,
				-- octaves = 3,
				-- persist = 0.6
			-- },
			-- y_min = 1,
			-- y_max = 15,
			-- decoration = "bakedclay:mannagrass",
			-- spawn_by = "group:water",
			-- num_spawn_by = 1,
		-- })

	-- end
	--]]


