--
-- Register lib_ecology nodes
--
--
--
-- Define constants that can be used in csv

-- Define constants that can be used in csv
local heights = {
	ocean_depth = lib_ecology.ocean_depth,
	beach_depth = lib_ecology.beach_depth,
	sea_level = lib_ecology.sea_level,
	beach = lib_ecology.maxheight_beach,
	coastal = lib_ecology.maxheight_coastal,
	lowland = lib_ecology.maxheight_lowland,
	shelf = lib_ecology.maxheight_shelf,
	highland = lib_ecology.maxheight_highland,
	mountain = lib_ecology.maxheight_mountain,
	snow_min = lib_ecology.minheight_snow,
	snow_max = lib_ecology.maxheight_snow,
	strato = lib_ecology.maxheight_strato,
}

local temperatures = {
	hot = lib_ecology.temperature_hot,
	warm = lib_ecology.temperature_warm,
	temperate = lib_ecology.temperature_temperate,
	cool = lib_ecology.temperature_cool,
	cold = lib_ecology.temperature_cold,
}

local humidities = {
	humid = lib_ecology.humidity_humid,
	semihumid = lib_ecology.humidity_semihumid,
	temperate = lib_ecology.humidity_temperate,
	semiarid = lib_ecology.humidity_semiarid,
	arid = lib_ecology.humidity_arid,
}

local add_schem = function(a, b, c, d, e, f, g)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - lib_ecology.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + lib_ecology.biome_vertical_blend),
		schematic = lib_ecology.schematics.select(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "random",
	})
end

local new_add_schem = function(a, b, c, d, e, f, g)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - lib_ecology.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + lib_ecology.biome_vertical_blend),
		schematic = lib_ecology.schem(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "random",
	})
end

local add_tree = function(a, b, c, d, e, f, g)

	for t_idx,tree in pairs(f:split(";", true)) do

		local t_tree
		local t_replace

		if string.find(tree, "-") then
			t_tree, t_replace = unpack(tree:split("-", true))
		else
			t_tree = tree
		end

		minetest.register_decoration({
			deco_type = "schematic",
			place_on = a,
			sidelen = 16,
			fill_ratio = tonumber(b),
			biomes = c,
			y_min = tonumber(d) or (heights[d] - lib_ecology.biome_vertical_blend),
			y_max = tonumber(e) or (heights[e] + lib_ecology.biome_vertical_blend),
			schematic = lib_ecology.schem(t_tree, t_replace),
			flags = g or "place_center_x, place_center_z",
			rotation = "random",
		})

	end
end

local add_plant = function(a, b, c, d, e, f, g, h, i)

	local decos

	if string.find(f, ";") then
		decos = {}
		for p_idx,plant in pairs(f:split(";", true)) do
			decos[p_idx] = "lib_ecology:" .. plant .. ""
		end
	else
		decos = f
	end

	--minetest.log("[MOD] lib_ecology:  PLACE_ON: " .. a .. ";     DECO: " .. f .. ";")

	minetest.register_decoration({
		deco_type = "simple",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - lib_ecology.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + lib_ecology.biome_vertical_blend),
		--decoration = f,
		decoration = decos,						--f:split(";", true),
		height_max = tonumber(g),
		spawn_by = h,
		num_spawn_by = tonumber(i),
	})
end

local add_schem_no_rot = function(a, b, c, d, e, f, g)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - lib_ecology.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + lib_ecology.biome_vertical_blend),
		schematic = lib_ecology.schematics.select(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "0",
	})
end

local add_schem_water = function(a, b, c, d, e, f, g, h)

	--if h ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or heights[d],
		y_max = tonumber(e) or heights[e],
		schematic = lib_ecology.schematics.select(f),
		flags = g or "place_center_x, place_center_z",
		rotation = "0",
	})
end

local add_node = function(a, b, c, d, e, f, g, h, i)

	minetest.register_decoration({
		deco_type = "simple",
		place_on = a,
		sidelen = 16,
		fill_ratio = tonumber(b),
		biomes = c,
		y_min = tonumber(d) or (heights[d] - lib_ecology.biome_vertical_blend),
		y_max = tonumber(e) or (heights[e] + lib_ecology.biome_vertical_blend),
		decoration = f,
		height_max = tonumber(g),
		spawn_by = h,
		num_spawn_by = tonumber(i),
	})
end

local add_water_node = function(a, b, c, d, e, f, g, h, i)

	local t_biomes
	local t_decoration

	if string.find(c, ",") then
		t_biomes = c:split(",", true)
	else
		t_biomes = c
	end

	if string.find(f, ",") then
		t_decoration = f:split(",", true)
	else
		t_decoration = f
	end

	minetest.register_decoration({
		name = "lib_ecology:corals_" .. tostring(f) .. "",
		deco_type = "simple",
		place_on = a,
		place_offset_y = -1,
		sidelen = 4,
		--fill_ratio = tonumber(b),
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = 0.7,
		},
		biomes = t_biomes,
		y_min = tonumber(d) or heights[d],
		y_max = tonumber(e) or heights[e],
		flags = "force_placement",
		decoration = f,
		param2 = 48,
		param2_max = 96,
	})
end


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
		name = "lib_ecology:kelp_1",
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
		decoration = {"lib_ecology:plant_kelp_1"},
		param2 = 48,
		param2_max = 96,
	})
	minetest.register_decoration({
		name = "lib_ecology:kelp_2",
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
		decoration = {"lib_ecology:plant_kelp_2"},
		param2 = 48,
		param2_max = 96,
	})
	minetest.register_decoration({
		name = "lib_ecology:kelp_giant_brown",
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
		decoration = {"lib_ecology:plant_kelp_giant_brown"},
		param2 = 48,
		param2_max = 96,
	})
	minetest.register_decoration({
		name = "lib_ecology:seaweed_temperate",
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
		decoration = {"lib_ecology:plant_seaweed_temperate"},
		param2 = 48,
		param2_max = 96,
	})
	minetest.register_decoration({
		name = "lib_ecology:seaweed_tropical",
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
		decoration = {"lib_ecology:plant_seaweed_tropical"},
		param2 = 48,
		param2_max = 96,
	})
	minetest.register_decoration({
		name = "lib_ecology:sea_pickle",
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
		decoration = {"lib_ecology:plant_sea_pickle"},
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
			"warm_temperate_ocean",
			"warm_semiarid_ocean",
			"temperate_temperate_ocean",
			"temperate_semiarid_ocean",
			"cool_temperate_ocean",
			"cool_semiarid_ocean",
		},
		y_max = -5,
		y_min = -10,
		flags = "force_placement",
		decoration = {
			"lib_ecology:grass_sea_1", "lib_ecology:grass_sea_2",
			"lib_ecology:grass_sea_3", "lib_ecology:grass_sea_subtropical",
			"lib_ecology:grass_sea_temperate", "lib_ecology:grass_sea_tropical",
		},
		param2 = 48,
		param2_max = 96,
	})




	minetest.register_decoration({
		name = "lib_ecology:plant_waterlily",
		deco_type = "simple",
		place_on = {"lib_materials:liquid_water_source"},
		place_offset_y = 0,
		sidelen = 16,
		fill_ratio = 0.7,
--		noise_params = {
--			offset = -0.004,
--			scale = 0.1,
--			spread = {x = 200, y = 200, z = 200},
--			seed = 87112,
--			octaves = 3,
--			persist = 0.7
--		},
		biomes = {
			"deciduous_forest_swamp",
			"subtropical_rainforest_swamp",
			"temperate_rainforest_swamp"
		},
		y_max = 1,
		y_min = 0,
		flags = "force_placement",
		decoration = {"lib_ecology:plant_waterlily_pink", "lib_ecology:plant_waterlily_yellow"},
		param2 = 48,
		param2_max = 96,
	})


	minetest.register_decoration({
		name = "lib_ecology:reedmace_water",
		deco_type = "simple",
		place_on = {"lib_materials:dirt_mud_01"},
		place_offset_y = -1,
		sidelen = 16,
		fill_ratio = 0.7,
--		noise_params = {
--			offset = -0.004,
--			scale = 0.1,
--			spread = {x = 200, y = 200, z = 200},
--			seed = 87112,
--			octaves = 3,
--			persist = 0.7
--		},
		biomes = {
			"deciduous_forest_swamp",
			"subtropical_rainforest_swamp",
			"temperate_rainforest_swamp"
		},
		y_max = 1,
		y_min = 0,
		flags = "force_placement",
		decoration = {"lib_ecology:plant_reedmace_water", "lib_ecology:plant_reedmace_sapling_water"},
		param2 = 48,
		param2_max = 96,
	})


	minetest.register_decoration({
		name = "lib_ecology:mangroves",
		deco_type = "simple",
		place_on = {"lib_materials:dirt_silt_01"},
		place_offset_y = -1,
		sidelen = 16,
		fill_ratio = 0.7,
--		noise_params = {
--			offset = -0.004,
--			scale = 0.1,
--			spread = {x = 200, y = 200, z = 200},
--			seed = 87112,
--			octaves = 3,
--			persist = 0.7
--		},
		biomes = {
			"hot_humid_beach",
			"hot_semihumid_beach",
			"warm_humid_beach"
		},
		y_max = 1,
		y_min = 0,
		flags = "force_placement",
		decoration = {"lib_ecology:tree_mangrove_root"},
		param2 = 48,
		param2_max = 96,
	})



for i, deco in ipairs(lib_ecology.read_csv("|", lib_ecology.path .. "/decorations.csv")) do

	--#Deco_Type, Place_On, FillRatio, Biome, Y_Min, Y_Max, Deco_Node, HeightMax, SpawnBy, NumSpawnBy
	local decotype, placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby = unpack(deco)


	--minetest.log(S("[MOD] lib_ecology: " .. decotype .. "; " .. placeon .. "; " .. biome .. "; " .. deconode))


	if decotype then
		if decotype ~= "" then
			if decotype == "node" then
				add_node(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
			end

			if decotype == "water_node" then
				add_node(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
			end

			if decotype == "schem" then
				if heightmax == "" then
					add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					add_schem(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "newschem" then
				if heightmax == "" then
					new_add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					new_add_schem(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "trees" then
				if heightmax == "" then
					add_tree(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					add_tree(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "plants" then
				if heightmax == "" then
					add_plant(placeon, fillratio, biome, ymin, ymax, deconode, heightmax, spawnby, numspawnby)
				else
					add_plant(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end
			end

			if decotype == "no_rot" then
				if heightmax == "" then
					add_schem_no_rot(placeon, fillratio, biome, ymin, ymax, deconode)
				else
					add_schem_no_rot(placeon, fillratio, biome, ymin, ymax, deconode, heightmax)
				end

			if decotype == "water_schem" then
				add_schem(placeon, fillratio, biome, ymin, ymax, deconode)
			end

			end
		end
	end

end









