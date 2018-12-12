--
-- Register biomes
--

-- clear default mapgen biomes, decorations and ores
	minetest.clear_registered_biomes()
	--minetest.clear_registered_decorations()
	--minetest.clear_registered_ores()

local add_biome = function(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)

	minetest.register_biome({
		name = a,
		node_dust = b,
		node_top = c,
		depth_top = d,
		node_filler = e,
		depth_filler = f,
		node_stone = g,
		node_water_top = h,
		depth_water_top = i,
		node_water = j,
		node_river_water = k,
		y_min = l,
		y_max = m,
		heat_point = n,
		humidity_point = o,
	})
	
end


--TEMP BIOMES
--[[
--]]
--BIOME: hot_
local add_biomes_hot_humid = function()
	--BIOME: hot_humid
	--add_biome("hot_humid", nil, "lib_materials:dirt_clayey_with_rainforest_litter", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	--add_biome("hot_humid_generic", nil, "lib_materials:dirt_clayey_with_rainforest_litter", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	--add_biome("hot_humid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -1lib_ecology.humidity_temperate00, -192, lib_ecology.temperature_hot, lib_ecology.humidity_humid)

	add_biome("hot_humid_ocean", nil, "lib_materials:dirt_silt_02", 4, "lib_materials:dirt_silt_02", 6, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -192, -2, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	add_biome("hot_humid_beach", nil, "lib_materials:dirt_silt_02", 2, "lib_materials:dirt_silt_02", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -2, 2, lib_ecology.temperature_hot, lib_ecology.humidity_humid)

	add_biome("hot_humid_coastal", nil, "lib_materials:dirt_silt_02_with_rainforest_litter", 1, "lib_materials:dirt_silt_02", 6, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 2, lib_ecology.maxheight_coastal, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	add_biome("hot_humid_lowland", nil, "lib_materials:dirt_silty_with_rainforest_litter", 1, "lib_materials:dirt_silty", 5, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	add_biome("hot_humid_shelf", nil, "lib_materials:dirt_dark_with_rainforest_litter", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	add_biome("hot_humid_highland", nil, "lib_materials:dirt_with_rainforest_litter", 1, "lib_materials:dirt", 3, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_hot, lib_ecology.humidity_humid)

	add_biome("hot_humid_mountain", nil, "lib_materials:stone_brown", 10, "lib_materials:stone_basalt_01", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	add_biome("hot_humid_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_hot, lib_ecology.humidity_humid)

	--add_biome("hot_humid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", 20, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
	--add_biome("hot_humid_sky", nil, "lib_clouds:cloud_cirrus", 3, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_humid)
end

local add_biomes_hot_semihumid = function()
	--BIOME: hot_semihumid
	--add_biome("hot_semihumid", nil, "lib_materials:dirt_clayey_with_coniferous_litter", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	--add_biome("hot_semihumid_generic", nil, "lib_materials:dirt_clayey_with_coniferous_litter", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	--add_biome("hot_semihumid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -1lib_ecology.humidity_temperate00, -192, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)

	add_biome("hot_semihumid_ocean", nil, "lib_materials:dirt_silt_01", 4, "lib_materials:dirt_silt_02", 6, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -192, 0, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	--add_biome("hot_semihumid_beach", nil, "lib_materials:sand_volcanic", 2, "lib_materials:dirt_silt_01", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -3, 3, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)

	add_biome("hot_semihumid_coastal", nil, "lib_materials:dirt_silty_with_brown_grass5", 1, "lib_materials:dirt_silty", 6, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 0, lib_ecology.maxheight_coastal, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	add_biome("hot_semihumid_lowland", nil, "lib_materials:dirt_dark_with_brown_grass4", 1, "lib_materials:dirt_dark", 5, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	add_biome("hot_semihumid_shelf", nil, "lib_materials:dirt_dark_with_brown_grass3", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	add_biome("hot_semihumid_highland", nil, "lib_materials:dirt_coarse_with_brown_grass2", 1, "lib_materials:dirt_coarse", 3, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)

	add_biome("hot_semihumid_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	add_biome("hot_semihumid_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)

	--add_biome("hot_semihumid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", 20, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
	--add_biome("hot_semihumid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_semihumid)
end

local add_biomes_hot_temperate = function()
--BIOME: hot_temperate
--add_biome("hot_temperate", nil, "lib_materials:dirt_clayey_with_grass", 1, "lib_materials:dirt_clayey", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
--add_biome("hot_temperate_generic", nil, "lib_materials:dirt_clayey_with_grass", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
--add_biome("hot_temperate_underground", nil, nil, nil, nil, nil, "lib_materials:stone_brown", nil, nil, nil, nil, -10000, -192, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)

add_biome("hot_temperate_ocean", nil, "lib_materials:sand", 4, "lib_materials:dirt_silt_01", 6, "lib_materials:stone_brown", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
add_biome("hot_temperate_beach", nil, "lib_materials:sand_volcanic", 2, "lib_materials:dirt_silt_01", 4, "lib_materials:stone_brown", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)

add_biome("hot_temperate_coastal", nil, "lib_materials:dirt_dark_with_grass2", 1, "lib_materials:dirt_dark", 6, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
add_biome("hot_temperate_lowland", nil, "lib_materials:dirt_dark_with_grass3", 1, "lib_materials:dirt", 5, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
add_biome("hot_temperate_shelf", nil, "lib_materials:dirt_coarse_with_grass4", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
add_biome("hot_temperate_highland", nil, "lib_materials:dirt_clay_red_with_grass5", 1, "lib_materials:dirt_clay_red", 3, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)

add_biome("hot_temperate_mountain", nil, "lib_materials:stone_desert", 10, "default:stone_sand", 20, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
add_biome("hot_temperate_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)

--add_biome("hot_temperate_volcanic", nil, "lib_materials:stone_basalt_01_cobble", 1, "lib_materials:stone_basalt_01", 4, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
--add_biome("hot_temperate_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_temperate)
end

local add_biomes_hot_semiarid = function()
--BIOME: hot_semiarid
--add_biome("hot_semiarid", nil, "lib_materials:dirt_clayey_with_dry_grass", 1, "lib_materials:dirt_clayey", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
--add_biome("hot_semiarid_generic", nil, "lib_materials:dirt_clayey_with_dry_grass", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
--add_biome("hot_semiarid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_sand", nil, nil, nil, nil, -6000, -192, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)

add_biome("hot_semiarid_ocean", nil, "lib_materials:sand", 2, "lib_materials:sand", 4, "lib_materials:stone_sand", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
add_biome("hot_semiarid_beach", nil, "lib_materials:sand", 1, "lib_materials:dirt_clayey", 4, "lib_materials:stone_sand", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)

add_biome("hot_semiarid_coastal", nil, "lib_materials:dirt_dark_with_dry_grass4", 1, "lib_materials:dirt", 6, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
add_biome("hot_semiarid_lowland", nil, "lib_materials:dirt_coarse_with_dry_grass4", 1, "lib_materials:dirt_coarse", 5, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
add_biome("hot_semiarid_shelf", nil, "lib_materials:dirt_clay_red_with_dry_grass5", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
add_biome("hot_semiarid_highland", nil, "lib_materials:dirt_clayey_with_dry_grass5", 1, "lib_materials:dirt_clayey", 3, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)

add_biome("hot_semiarid_mountain", nil, "lib_materials:stone_sandstone_desert", 10, "lib_materials:stone_desert", 20, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
add_biome("hot_semiarid_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)

--add_biome("hot_semiarid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", 1, "lib_materials:stone_basalt_01", 4, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
--add_biome("hot_semiarid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_semiarid)
end

local add_biomes_hot_arid = function()
--BIOME: hot_arid
--add_biome("hot_arid", nil, "default:desert_sand", 1, "lib_materials:stone_brown", 4, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
--add_biome("hot_arid_generic", nil, "default:desert_sand", 1, "lib_materials:stone_brown", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
--add_biome("hot_arid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -1lib_ecology.humidity_temperate00, -192, lib_ecology.temperature_hot, lib_ecology.humidity_arid)

add_biome("hot_arid_ocean", nil, "lib_materials:sand", 2, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
add_biome("hot_arid_beach", nil, "lib_materials:sand", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_hot, lib_ecology.humidity_arid)

add_biome("hot_arid_coastal", nil, "lib_materials:dirt_coarse", 5, "lib_materials:stone_brown", 10, "lib_materials:stone_basalt_01", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
add_biome("hot_arid_lowland", nil, "lib_materials:dirt_clay_red", 10, "lib_materials:stone_sand", 15, "lib_materials:stone_brown", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
add_biome("hot_arid_shelf", nil, "lib_materials:dirt_clayey", 10, "lib_materials:stone_desert", 20, "lib_materials:stone_sand", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
add_biome("hot_arid_highland", nil, "lib_materials:sand_desert", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_desert", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_hot, lib_ecology.humidity_arid)

add_biome("hot_arid_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
add_biome("hot_arid_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_hot, lib_ecology.humidity_arid)

--add_biome("hot_arid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", 1, "lib_materials:stone_basalt_01", 4, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
--add_biome("hot_arid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_hot, lib_ecology.humidity_arid)
end



--BIOME: warm_
local add_biomes_warm_humid = function()
--BIOME: warm_humid
--add_biome("warm_humid", nil, "lib_materials:dirt_dark_with_rainforest_litter", 1, "lib_materials:dirt_dark", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
--add_biome("warm_humid_generic", nil, "lib_materials:dirt_dark_with_rainforest_litter", 1, "lib_materials:dirt_dark", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
--add_biome("warm_humid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -1lib_ecology.humidity_temperate00, -192, lib_ecology.temperature_warm, lib_ecology.humidity_humid)

add_biome("warm_humid_ocean", nil, "lib_materials:dirt_silt_01", 4, "lib_materials:dirt_silt_02", 6, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -192, -3, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
--add_biome("warm_humid_beach", nil, "default:silver_sand", 1, "lib_materials:sand_volcanic", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -3, 3, lib_ecology.temperature_warm, lib_ecology.humidity_humid)

add_biome("warm_humid_coastal", nil, "lib_materials:dirt_silt_02_with_brown_grass5", 1, "lib_materials:dirt_silt_02", 6, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -3, lib_ecology.maxheight_coastal, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
add_biome("warm_humid_lowland", nil, "lib_materials:dirt_silty_with_brown_grass4", 1, "lib_materials:dirt_silty", 5, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
add_biome("warm_humid_shelf", nil, "lib_materials:dirt_dark_with_brown_grass3", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
add_biome("warm_humid_highland", nil, "lib_materials:dirt_dark_with_brown_grass2", 1, "lib_materials:dirt", 3, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_warm, lib_ecology.humidity_humid)

add_biome("warm_humid_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
add_biome("warm_humid_strato", nil, "lib_materials:stone_sandstone_desert", 15, "lib_materials:stone_sand", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_warm, lib_ecology.humidity_humid)

--add_biome("warm_humid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", 1, "lib_materials:stone_basalt_01", 4, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
--add_biome("warm_semihumid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_humid)
end

local add_biomes_warm_semihumid = function()
--BIOME: warm_semihumid
--add_biome("warm_semihumid", nil, "lib_materials:dirt_dark_with_coniferous_litter", 1, "lib_materials:dirt_dark", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
--add_biome("warm_semihumid_generic", nil, "lib_materials:dirt_dark_with_coniferous_litter", 1, "lib_materials:dirt_dark", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
--add_biome("warm_semihumid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_brown", nil, nil, nil, nil, -10000, -192, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)

add_biome("warm_semihumid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_brown", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
--add_biome("warm_semihumid_beach", nil, "default:sand", 1, "default:sand", 4, "lib_materials:stone_brown", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)

add_biome("warm_semihumid_coastal", nil, "lib_materials:dirt_silty_with_brown_grass4", 1, "lib_materials:dirt_silty", 6, "lib_materials:stone_brown", nil, nil, nil, nil, -lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
add_biome("warm_semihumid_lowland", nil, "lib_materials:dirt_dark_with_brown_grass3", 1, "lib_materials:dirt", 5, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
add_biome("warm_semihumid_shelf", nil, "lib_materials:dirt_coarse_with_brown_grass2", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
add_biome("warm_semihumid_highland", nil, "lib_materials:dirt_dry_with_brown_grass2", 1, "lib_materials:dirt_dry", 3, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)

add_biome("warm_semihumid_mountain", nil, "lib_materials:stone_granite_brown", 10, "lib_materials:stone_andesite", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
add_biome("warm_semihumid_strato", nil, "lib_materials:stone_sandstone_desert", 15, "lib_materials:stone_granite_brown", 25, "lib_materials:stone_andesite", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)

--add_biome("warm_semihumid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", 1, "lib_materials:stone_basalt_01", 4, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
--add_biome("warm_semihumid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)
end

local add_biomes_warm_temperate = function()
--BIOME: warm_temperate
--add_biome("warm_temperate", nil, "lib_materials:dirt_dark_with_grass", 1, "lib_materials:dirt_dark", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
--add_biome("warm_temperate_generic", nil, "lib_materials:dirt_dark_with_grass", 1, "lib_materials:dirt_dark", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
--add_biome("warm_temperate_underground", nil, nil, nil, nil, nil, "lib_materials:stone_sand", nil, nil, nil, nil, -6000, -192, lib_ecology.temperature_warm, lib_ecology.humidity_semihumid)

add_biome("warm_temperate_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
add_biome("warm_temperate_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)

add_biome("warm_temperate_coastal", nil, "lib_materials:dirt_dark_with_grass2", 1, "lib_materials:dirt_dark", 6, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
add_biome("warm_temperate_lowland", nil, "lib_materials:dirt_dark_with_grass3", 1, "lib_materials:dirt", 5, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
add_biome("warm_temperate_shelf", nil, "lib_materials:dirt_coarse_with_grass4", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
add_biome("warm_temperate_highland", nil, "lib_materials:dirt_clay_red_with_grass4", 1, "lib_materials:dirt_clay_red", 3, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)

add_biome("warm_temperate_mountain", nil, "lib_materials:stone_sandstone_desert", 10, "lib_materials:stone_sand", 20, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
add_biome("warm_temperate_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)

--add_biome("warm_temperate_volcanic", nil, "air", 2, "air", 4, "default:lava_source", nil, nil, nil, nil, 140, 140, 15, 15)
--add_biome("warm_temperate_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_temperate)
end

local add_biomes_warm_semiarid = function()
--BIOME: warm_semiarid
--add_biome("warm_semiarid", nil, "lib_materials:dirt_dark_with_dry_grass", 1, "lib_materials:dirt_dark", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
--add_biome("warm_semiarid_generic", nil, "lib_materials:dirt_dark_with_dry_grass", 1, "lib_materials:dirt_dark", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
--add_biome("warm_semiarid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_desert", nil, nil, nil, nil, -lib_ecology.humidity_temperate00, -192, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)

add_biome("warm_semiarid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
add_biome("warm_semiarid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)

add_biome("warm_semiarid_coastal", nil, "lib_materials:stone_sandstone_white_gravel", 1, "lib_materials:dirt", 4, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
add_biome("warm_semiarid_lowland", nil, "lib_materials:dirt_coarse_with_dry_grass5", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
add_biome("warm_semiarid_shelf", nil, "lib_materials:dirt_clay_red_with_dry_grass6", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
add_biome("warm_semiarid_highland", nil, "lib_materials:dirt_clayey_with_dry_grass6", 1, "lib_materials:dirt_clayey", 4, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)

add_biome("warm_semiarid_mountain", nil, "lib_materials:stone_sandstone_desert", 10, "lib_materials:stone_sand", 20, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
add_biome("warm_semiarid_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)

--add_biome("warm_semiarid_volcanic", nil, "lib_materials:dirt_dark_with_grass", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
--add_biome("warm_semiarid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_semiarid)
end

local add_biomes_warm_arid = function()
--BIOME: warm_arid
--add_biome("warm_arid", nil, "default:desert_sand", 1, "lib_materials:stone_sand", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
--add_biome("warm_arid_generic", nil, "default:desert_sand", 1, "lib_materials:stone_sand", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
--add_biome("warm_arid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -1lib_ecology.humidity_temperate00, -192, lib_ecology.temperature_warm, lib_ecology.humidity_arid)

add_biome("warm_arid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
add_biome("warm_arid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_warm, lib_ecology.humidity_arid)

add_biome("warm_arid_coastal", nil, "lib_materials:sand_desert", 10, "lib_materials:stone_sand", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
add_biome("warm_arid_lowland", nil, "lib_materials:sand_desert", 10, "lib_materials:stone_sand", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
add_biome("warm_arid_shelf", nil, "lib_materials:sand_desert", 10, "lib_materials:stone_sand", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
add_biome("warm_arid_highland", nil, "lib_materials:sand_desert", 10, "lib_materials:stone_sand", lib_ecology.temperature_cold, "lib_materials:stone_sandstone_desert", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_warm, lib_ecology.humidity_arid)

add_biome("warm_arid_mountain", nil, "lib_materials:stone_sandstone_desert", 10, "lib_materials:stone_sand", 20, "lib_materials:stone_brown", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
add_biome("warm_arid_strato", nil, "lib_materials:stone_sandstone", 15, "lib_materials:stone_sandstone_desert", 25, "lib_materials:stone_sand", nil, nil, nil, "lib_materials:stone_sandstone_white_gravel", lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_warm, lib_ecology.humidity_arid)

--add_biome("warm_arid_volcanic", nil, "lib_materials:stone_sandstone_desert", 10, "lib_materials:stone_sand", 40, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
--add_biome("warm_arid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
end


--BIOMES: temperate_
local add_biomes_temperate_humid = function()
--BIOME: temperate_humid
--add_biome("temperate_humid", nil, "default:dirt_with_rainforest_litter", 1, "default:dirt", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
--add_biome("temperate_humid_generic", nil, "lib_materials:dirt_with_rainforest_litter", 1, "default:dirt", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
--add_biome("temperate_humid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_brown", nil, nil, nil, nil, -10000, -192, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)

add_biome("temperate_humid_ocean", nil, "lib_materials:dirt_silt_01", 4, "lib_materials:sand", 6, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
add_biome("temperate_humid_beach", nil, "default:sand", 2, "default:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)

add_biome("temperate_humid_coastal", nil, "lib_materials:dirt_silt_02_with_grass2", 1, "lib_materials:dirt_silt_01", 6, "lib_materials:stone_brown", nil, nil, nil, nil, -lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
add_biome("temperate_humid_lowland", nil, "lib_materials:dirt_silty_with_grass2", 1, "lib_materials:dirt_silty", 5, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
add_biome("temperate_humid_shelf", nil, "lib_materials:dirt_dark_with_grass2", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
add_biome("temperate_humid_highland", nil, "lib_materials:dirt_dark_with_grass2", 1, "lib_materials:dirt", 3, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)

add_biome("temperate_humid_mountain", nil, "lib_materials:stone_gabbro", 10, "lib_materials:stone_bluestone", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
add_biome("temperate_humid_strato", nil, "lib_materials:stone_diorite", 15, "lib_materials:stone_bluestone", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)

--add_biome("temperate_humid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", 20, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
--add_biome("temperate_humid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_humid)
end

local add_biomes_temperate_semihumid = function()
--BIOME: temperate_semihumid
--add_biome("temperate_semihumid", nil, "default:dirt_with_coniferous_litter", 1, "default:dirt", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
--add_biome("temperate_semihumid_generic", nil, "lib_materials:dirt_with_coniferous_litter", 1, "default:dirt", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
--add_biome("temperate_semihumid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)

add_biome("temperate_semihumid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
add_biome("temperate_semihumid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)

add_biome("temperate_semihumid_coastal", nil, "lib_materials:dirt_silty_with_grass2", 1, "lib_materials:dirt_silty", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
add_biome("temperate_semihumid_lowland", nil, "lib_materials:dirt_dark_with_grass3", 1, "lib_materials:dirt_dark", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
add_biome("temperate_semihumid_shelf", nil, "lib_materials:dirt_dark_with_grass3", 1, "lib_materials:dirt", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
add_biome("temperate_semihumid_highland", nil, "lib_materials:dirt_clay_red_with_grass4", 1, "lib_materials:dirt_clay_red", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)

add_biome("temperate_semihumid_mountain", nil, "lib_materials:stone_bluestone", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
add_biome("temperate_semihumid_strato", nil, "lib_materials:stone_bluestone", 15, "lib_materials:stone_gabbro", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)

--add_biome("temperate_semihumid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", 20, "default:lava", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
--add_biome("temperate_semihumid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_semihumid)
end

local add_biomes_temperate_temperate = function()
--BIOME: temperate_temperate
--add_biome("temperate_temperate", nil, "default:dirt_with_grass", 1, "default:dirt", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
--add_biome("temperate_temperate_generic", nil, "lib_materials:dirt_with_grass", 1, "default:dirt", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
--add_biome("temperate_temperate_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)

add_biome("temperate_temperate_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
add_biome("temperate_temperate_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)

add_biome("temperate_temperate_coastal", nil, "lib_materials:dirt_dark_with_dry_grass2", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
add_biome("temperate_temperate_lowland", nil, "lib_materials:dirt_dark_with_dry_grass3", 1, "lib_materials:dirt", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
add_biome("temperate_temperate_shelf", nil, "lib_materials:dirt_coarse_with_dry_grass3", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
add_biome("temperate_temperate_highland", nil, "lib_materials:dirt_clay_red_with_dry_grass4", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)

add_biome("temperate_temperate_mountain", nil, "lib_materials:stone_greenstone", 10, "lib_materials:stone_schist", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
add_biome("temperate_temperate_strato", nil, "lib_materials:stone_basalt_02", 15, "lib_materials:stone_greenstone", 25, "lib_materials:stone_schist", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)

--add_biome("temperate_temperate_volcanic", nil, "air", 2, "air", 4, "default:lava_source", nil, nil, nil, nil, 140, 140, 15, 15)
--add_biome("temperate_temperate_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
end

local add_biomes_temperate_semiarid = function()
--BIOME: temperate_semiarid
--add_biome("temperate_semiarid", nil, "default:dirt_with_dry_grass", 1, "default:dirt", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
--add_biome("temperate_semiarid_generic", nil, "lib_materials:dirt_with_dry_grass", 1, "default:dirt", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
--add_biome("temperate_semiarid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)

add_biome("temperate_semiarid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
add_biome("temperate_semiarid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)

add_biome("temperate_semiarid_coastal", nil, "lib_materials:dirt_with_dry_grass3", 1, "lib_materials:dirt", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
add_biome("temperate_semiarid_lowland", nil, "lib_materials:dirt_coarse_with_dry_grass3", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
add_biome("temperate_semiarid_shelf", nil, "lib_materials:dirt_clay_red_with_dry_grass4", 1, "lib_materials:dirt_clay_red", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
add_biome("temperate_semiarid_highland", nil, "lib_materials:dirt_clayey_with_dry_grass4", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)

add_biome("temperate_semiarid_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
add_biome("temperate_semiarid_strato", nil, "lib_materials:stone_desert", 15, "lib_materials:stone_sand", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)

--add_biome("temperate_semiarid_volcanic", nil, "air", 2, "air", 4, "default:lava_source", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
--add_biome("temperate_semiarid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_semiarid)
end

local add_biomes_temperate_arid = function()
--BIOME: temperate_arid
--add_biome("temperate_arid", nil, "default:desert_sand", 1, "lib_materials:stone_sandstone_desert", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
--add_biome("temperate_arid_generic", nil, "lib_materials:sand_desert", 1, "lib_materials:stone_sandstone_desert", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
--add_biome("temperate_arid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -192, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)

add_biome("temperate_arid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
add_biome("temperate_arid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)

add_biome("temperate_arid_coastal", nil, "lib_materials:dirt_coarse", 5, "lib_materials:stone_brown", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
add_biome("temperate_arid_lowland", nil, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_sand", 6, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
add_biome("temperate_arid_shelf", nil, "lib_materials:dirt_clayey", 3, "lib_materials:stone_desert", 8, "lib_materials:stone_sand", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
add_biome("temperate_arid_highland", nil, "lib_materials:sand_desert", 2, "lib_materials:stone_sandstone_desert", 10, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)

add_biome("temperate_arid_mountain", nil, "lib_materials:stone_desert", 15, "lib_materials:stone_brown", 25, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
add_biome("temperate_arid_strato", nil, "lib_materials:stone_desert", 15, "lib_materials:stone_sand", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)

--add_biome("temperate_arid_volcanic", nil, "lib_materials:stone_basalt_01_cobble", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", 20, "default:lava_source", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
--add_biome("temperate_arid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_arid)
end


--BIOMES: cool_
local add_biomes_cool_humid = function()
	--BIOME: cool_humid
	--add_biome("cool_humid", nil, "lib_materials:dirt_sandy_with_coniferous_litter", 1, "lib_materials:dirt_sandy", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	--add_biome("cool_humid_generic", nil, "lib_materials:dirt_sandy_with_coniferous_litter", 1, "lib_materials:dirt_sandy", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	--add_biome("cool_humid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cool, lib_ecology.humidity_humid)

	add_biome("cool_humid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	add_biome("cool_humid_beach", nil, "default:sand", 1, "default:sand", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cool, lib_ecology.humidity_humid)

	add_biome("cool_humid_coastal", nil, "lib_materials:dirt_silt_02_with_coniferous_litter", 1, "lib_materials:dirt_silt_02", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	add_biome("cool_humid_lowland", nil, "lib_materials:dirt_silty_with_coniferous_litter", 1, "lib_materials:dirt_silty", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	add_biome("cool_humid_shelf", nil, "lib_materials:dirt_dark_with_coniferous_litter", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	add_biome("cool_humid_highland", nil, "lib_materials:dirt_with_coniferous_litter", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cool, lib_ecology.humidity_humid)

	add_biome("cool_humid_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	add_biome("cool_humid_strato", nil, "lib_materials:stone_granite_02", 15, "lib_materials:stone_sand", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cool, lib_ecology.humidity_humid)

	--add_biome("cool_humid_volcanic", nil, nil, nil, nil, nil, nil, "default:ice", nil, nil, nil, 140, 140, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
	--add_biome("cool_humid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_humid)
end

local add_biomes_cool_semihumid = function()
	--BIOME: cool_semihumid
	--add_biome("cool_semihumid", nil, "lib_materials:dirt_sandy_with_coniferous_litter", 1, "lib_materials:dirt_sandy", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	--add_biome("cool_semihumid_generic", nil, "lib_materials:dirt_sandy_with_coniferous_litter", 1, "lib_materials:dirt_sandy", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	--add_biome("cool_semihumid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)

	add_biome("cool_semihumid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	add_biome("cool_semihumid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)

	add_biome("cool_semihumid_coastal", nil, "lib_materials:dirt_silty_with_coniferous_litter", 1, "lib_materials:dirt_silty", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	add_biome("cool_semihumid_lowland", nil, "lib_materials:dirt_dark_with_grass6", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	add_biome("cool_semihumid_shelf", nil, "lib_materials:dirt_dark_with_grass7", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	add_biome("cool_semihumid_highland", nil, "lib_materials:dirt_clay_red_with_coniferous_litter", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)

	add_biome("cool_semihumid_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	add_biome("cool_semihumid_strato", nil, "lib_materials:stone_gneiss_02", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)

	--add_biome("cool_semihumid_volcanic", nil, nil, nil, nil, nil, "default:ice", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
	--add_biome("cool_semihumid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_semihumid)
end

local add_biomes_cool_temperate = function()
	--BIOME: cool_temperate
	--add_biome("cool_temperate", nil, "lib_materials:dirt_sandy_with_grass", 1, "lib_materials:dirt_sandy", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	--add_biome("cool_temperate_generic", nil, "lib_materials:dirt_sandy_with_grass", 1, "lib_materials:dirt_sandy", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	--add_biome("cool_temperate_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)

	add_biome("cool_temperate_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	add_biome("cool_temperate_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)

	add_biome("cool_temperate_coastal", nil, "lib_materials:dirt_dark_with_grass6", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	add_biome("cool_temperate_lowland", nil, "lib_materials:dirt_dark_with_grass7", 1, "lib_materials:dirt", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	add_biome("cool_temperate_shelf", nil, "lib_materials:dirt_coarse_with_grass8", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	add_biome("cool_temperate_highland", nil, "lib_materials:dirt_clay_red_with_coniferous_litter", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)

	add_biome("cool_temperate_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	add_biome("cool_temperate_strato", nil, "lib_materials:stone_gneiss_02", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)

	--add_biome("cool_temperate_volcanic", nil, nil, nil, nil, nil, "default:ice", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
	--add_biome("cool_temperate_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)
end

local add_biomes_cool_semiarid = function()
	--BIOME: cool_semiarid
	--add_biome("cool_semiarid", nil, "lib_materials:dirt_sandy_with_dry_grass", 1, "lib_materials:dirt_sandy", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	--add_biome("cool_semiarid_generic", nil, "lib_materials:dirt_sandy_with_dry_grass", 1, "lib_materials:dirt_sandy", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	--add_biome("cool_semiarid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)

	add_biome("cool_semiarid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	add_biome("cool_semiarid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)

	add_biome("cool_semiarid_coastal", nil, "lib_materials:dirt_sandy_with_coniferous_litter", 1, "lib_materials:dirt_sandy", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	add_biome("cool_semiarid_lowland", nil, "lib_materials:dirt_clayey_with_dry_grass5", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	add_biome("cool_semiarid_shelf", nil, "lib_materials:dirt_clayey_with_dry_grass9", 1, "lib_materials:dirt_clay_red", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	add_biome("cool_semiarid_highland", nil, "lib_materials:dirt_clayey_with_coniferous_litter", 1, "lib_materials:dirt_clayey", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)

	add_biome("cool_semiarid_mountain", nil, "lib_materials:granite_01", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	add_biome("cool_semiarid_strato", nil, "lib_materials:stone_gneiss_02", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)

	--add_biome("cool_semiarid_volcanic", nil, "air", 1, "air", 1, "default:lava_source", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
	--add_biome("cool_semiarid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_semiarid)
end

local add_biomes_cool_arid = function()
	--BIOME: cool_arid
	--add_biome("cool_arid", nil, "lib_materials:dirt_sandy", 1, "lib_materials:stone_sand", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	--add_biome("cool_arid_generic", nil, "lib_materials:dirt_sandy", 1, "lib_materials:stone_sand", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	--add_biome("cool_arid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -192, lib_ecology.temperature_cool, lib_ecology.humidity_arid)

	add_biome("cool_arid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	add_biome("cool_arid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cool, lib_ecology.humidity_arid)

	add_biome("cool_arid_coastal", nil, "lib_materials:dirt_coarse", 5, "lib_materials:stone_granite_01", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	add_biome("cool_arid_lowland", nil, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_gabbro", 6, "lib_materials:stone_granite_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	add_biome("cool_arid_shelf", nil, "lib_materials:dirt_clayey", 3, "lib_materials:stone_granite_brown", 8, "lib_materials:stone_gabbro", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	add_biome("cool_arid_highland", nil, "lib_materials:sand_desert", 2, "lib_materials:stone_andesite", 10, "lib_materials:stone_granite_brown", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cool, lib_ecology.humidity_arid)

	add_biome("cool_arid_mountain", nil, "lib_materials:stone_andesite", 15, "lib_materials:stone_granite_brown", 25, "lib_materials:stone_gabbro", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	add_biome("cool_arid_strato", nil, "lib_materials:stone_gneiss_02", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_andesite", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cool, lib_ecology.humidity_arid)

	--add_biome("cool_arid_volcanic", nil, "air", 1, "air", 4, "default:lava_source", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
	--add_biome("cool_arid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cool, lib_ecology.humidity_arid)
end


--BIOME: cold_
local add_biomes_cold_humid = function()
	--BIOME: cold_humid
	--add_biome("cold_humid", nil, "lib_materials:dirt_coarse_with_rainforest_litter", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	--add_biome("cold_humid_generic", nil, "lib_materials:dirt_coarse_with_rainforest_litter", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	--add_biome("cold_humid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cold, lib_ecology.humidity_humid)

	add_biome("cold_humid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	add_biome("cold_humid_beach", nil, "default:sand", 1, "default:sand", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cold, lib_ecology.humidity_humid)

	add_biome("cold_humid_coastal", nil, "lib_materials:dirt_silt_02_with_snow", 1, "lib_materials:dirt_silt_02", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	add_biome("cold_humid_lowland", nil, "lib_materials:dirt_silty_with_snow", 1, "lib_materials:dirt_silty", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	add_biome("cold_humid_shelf", nil, "lib_materials:dirt_dark_with_snow", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	add_biome("cold_humid_highland", nil, "lib_materials:dirt_with_snow", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cold, lib_ecology.humidity_humid)

	add_biome("cold_humid_mountain", nil, "default:snowblock", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	add_biome("cold_humid_strato", nil, "default:ice", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cold, lib_ecology.humidity_humid)

	--add_biome("cold_humid_volcanic", nil, nil, nil, "default:ice", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
	--add_biome("cold_humid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_humid)
end

local add_biomes_cold_semihumid = function()
	--BIOME: cold_semihumid
	--add_biome("cold_semihumid", nil, "lib_materials:dirt_coarse_with_coniferous_litter", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	--add_biome("cold_semihumid_generic", nil, "lib_materials:dirt_coarse_with_coniferous_litter", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	--add_biome("cold_semihumid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)

	add_biome("cold_semihumid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	add_biome("cold_semihumid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)

	add_biome("cold_semihumid_coastal", nil, "lib_materials:dirt_silty_with_snow", 1, "lib_materials:dirt_silty", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	add_biome("cold_semihumid_lowland", nil, "lib_materials:dirt_dark_with_snow", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	add_biome("cold_semihumid_shelf", nil, "lib_materials:dirt_with_snow", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	add_biome("cold_semihumid_highland", nil, "lib_materials:dirt_coarse_with_snow", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)

	add_biome("cold_semihumid_mountain", nil, "default:snowblock", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	add_biome("cold_semihumid_strato", nil, "default:ice", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)

	--add_biome("cold_semihumid_volcanic", nil, nil, nil, "default:ice", 15, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
	--add_biome("cold_semihumid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_semihumid)
end

local add_biomes_cold_temperate = function()
	--BIOME: cold_temperate
	--add_biome("cold_temperate", nil, "lib_materials:dirt_coarse_with_grass", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	--add_biome("cold_temperate_generic", nil, "lib_materials:dirt_coarse_with_grass", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	--add_biome("cold_temperate_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)

	add_biome("cold_temperate_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	add_biome("cold_temperate_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)

	add_biome("cold_temperate_coastal", nil, "lib_materials:dirt_dark_with_snow", 1, "lib_materials:dirt_dark", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	add_biome("cold_temperate_lowland", nil, "lib_materials:dirt_with_snow", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	add_biome("cold_temperate_shelf", nil, "lib_materials:dirt_coarse_with_snow", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	add_biome("cold_temperate_highland", nil, "lib_materials:dirt_clay_red_with_snow", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)

	add_biome("cold_temperate_mountain", nil, "lib_materials:stone_sand", 10, "lib_materials:stone_brown", 20, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	add_biome("cold_temperate_strato", nil, "lib_materials:stone_gneiss_02", 15, "lib_materials:stone_granite_02", 25, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)

	--add_biome("cold_temperate_volcanic", nil, nil, nil, "default:ice", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
	--add_biome("cold_temperate_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_temperate)
end

local add_biomes_cold_semiarid = function()
	--BIOME: cold_semiarid
	--add_biome("cold_semiarid", nil, "lib_materials:dirt_coarse_with_dry_grass", 1, "lib_materials:dirt_coarse", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	--add_biome("cold_semiarid_generic", nil, "lib_materials:dirt_coarse_with_dry_grass", 1, "lib_materials:dirt_coarse", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	--add_biome("cold_semiarid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -lib_ecology.temperature_hot, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)

	add_biome("cold_semiarid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	add_biome("cold_semiarid_beach", nil, "lib_materials:sand", 1, "lib_materials:sand", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)

	add_biome("cold_semiarid_coastal", nil, "lib_materials:dirt_dark_with_dry_grass9", 1, "lib_materials:dirt", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	add_biome("cold_semiarid_lowland", nil, "lib_materials:dirt_coarse_with_dry_grass9", 1, "lib_materials:dirt_coarse", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	add_biome("cold_semiarid_shelf", nil, "lib_materials:dirt_clay_red_with_dry_grass9", 1, "lib_materials:dirt_clay_red", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	add_biome("cold_semiarid_highland", nil, "lib_materials:dirt_clayey_with_dry_grass9", 1, "lib_materials:dirt_clayey", lib_ecology.temperature_cold, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)

	add_biome("cold_semiarid_mountain", nil, "lib_materials:stone_diorite", 10, "lib_materials:stone_gneiss_02", 20, "lib_materials:stone_granite_02", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	add_biome("cold_semiarid_strato", nil, "lib_materials:stone_andesite", 15, "lib_materials:stone_diorite", 25, "lib_materials:stone_gneiss_02", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)

	--add_biome("cold_semiarid_volcanic", nil, "air", 1, "air", 1, "default:lava_source", nil, nil, nil, nil, 140, 140, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
	--add_biome("cold_temperate_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_semiarid)
end

local add_biomes_cold_arid = function()
	--BIOME: cold_arid
	--add_biome("cold_arid", nil, "lib_materials:dirt_coarse", 1, "lib_materials:savanna_stone", 2, nil, nil, nil, nil, nil, 0, 100, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	--add_biome("cold_arid_generic", nil, "lib_materials:dirt_coarse", 1, "lib_materials:savanna_stone", 4, nil, nil, nil, nil, nil, -192, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	--add_biome("cold_arid_underground", nil, nil, nil, nil, nil, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -31000, -192, lib_ecology.temperature_cold, lib_ecology.humidity_arid)

	add_biome("cold_arid_ocean", nil, "lib_materials:dirt_silt_01", 2, "lib_materials:sand", 4, "lib_materials:stone_sandstone", nil, nil, nil, nil, -192, -4, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	add_biome("cold_arid_beach", nil, "lib_materials:sand_silver", 1, "lib_materials:sand_silver", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -4, 4, lib_ecology.temperature_cold, lib_ecology.humidity_arid)

	add_biome("cold_arid_coastal", nil, "lib_materials:dirt_coarse", 8, "lib_materials:stone_granite_01", 10, "lib_materials:stone_basalt_01", nil, nil, nil, nil, lib_ecology.maxheight_beach, lib_ecology.maxheight_coastal, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	add_biome("cold_arid_lowland", nil, "lib_materials:dirt_clayey", 8, "lib_materials:stone_gabbro", 10, "lib_materials:stone_granite_01", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	add_biome("cold_arid_shelf", nil, "lib_materials:dirt_sandy", 8, "lib_materials:stone_granite_brown", 10, "lib_materials:stone_gabbro", nil, nil, nil, nil, lib_ecology.maxheight_lowland, lib_ecology.maxheight_shelf, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	add_biome("cold_arid_highland", nil, "lib_materials:dirt_sandy", 8, "lib_materials:stone_granite_02", 15, "lib_materials:stone_granite_brown", nil, nil, nil, nil, lib_ecology.maxheight_shelf, lib_ecology.maxheight_highland, lib_ecology.temperature_cold, lib_ecology.humidity_arid)

	add_biome("cold_arid_mountain", nil, "lib_materials:stone_diorite", 15, "lib_materials:stone_gneiss_02", 20, "lib_materials:stone_granite_02", nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
	add_biome("cold_arid_strato", nil, "lib_materials:stone_andesite", 15, "lib_materials:stone_diorite", 25, "lib_materials:stone_gneiss_02", nil, nil, nil, nil, lib_ecology.maxheight_mountain, lib_ecology.maxheight_strato, lib_ecology.temperature_cold, lib_ecology.humidity_arid)

	--add_biome("cold_arid_volcanic", nil, "air", 1, "air", 1, "default:lava_source", nil, nil, nil, nil, 140, 140, 15, 15)
	--add_biome("cold_arid_sky", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 180, 31000, lib_ecology.temperature_cold, lib_ecology.humidity_arid)
end


--BIOME: generic_      filler biomes, to cover certains temp/humid combos that may be missed above, and special biomes
local add_biomes_generic = function()
	--add_biome("generic_beach", nil, "default:sand", 1, "lib_materials:stone_sandstone", 4, nil, nil, nil, nil, nil, -4, 4, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	--add_biome("generic_ocean", nil, "lib_materials:dirt_silt_01", 1, "lib_materials:dirt_silt_02", 4, nil, nil, nil, nil, nil, -192, -4, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	--add_biome("generic_underground", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, -31000, -192, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	--add_biome("generic_mountain", nil, "default:snowblock", 1, "default:ice", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_highland, lib_ecology.maxheight_mountain, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	--add_biome("generic_volcanic", nil, "lib_materials:stone_basalt_01_cobble", 1, "lib_materials:stone_basalt_01", 3, "lib_materials:stone_brown", nil, nil, nil, nil, 1lib_ecology.temperature_temperate, 31000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)

	add_biome("generic_mantle", nil, nil, 1, nil, 4, "default:lava_source", nil, nil, nil, nil, -31000, -20000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("stone_basalt_01_layer", nil, nil, 1, nil, 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -20000, -15000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("stone_brown_layer", nil, nil, 1, nil, 4, "lib_materials:stone_brown", nil, nil, nil, nil, -15000, -10000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("stone_sand_layer", nil, nil, 1, nil, 4, "lib_materials:stone_sand", nil, nil, nil, nil, -10000, -6000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("desert_stone_layer", nil, nil, 1, nil, 4, "lib_materials:stone_desert", nil, nil, nil, nil, -6000, -5000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("desert_sandstone_layer", nil, nil, 1, nil, 4, "lib_materials:stone_sandstone_desert", nil, nil, nil, nil, -5000, -4000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("generic_stone_limestone_01_layer", nil, nil, 1, nil, 4, "lib_materials:stone_limestone_01", nil, nil, nil, nil, -4000, -3000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("generic_granite_layer", nil, nil, 1, nil, 4, "lib_materials:stone_granite_01", nil, nil, nil, nil, -3000, -2000, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)
	add_biome("generic_stone_layer", nil, nil, 1, nil, 4, "default:stone", nil, nil, nil, nil, -2000, -192, lib_ecology.temperature_temperate, lib_ecology.humidity_temperate)

	--add_biome("generic_burned", nil, "lib_materials:gray_dirt", 1, "lib_materials:stone_basalt_01_cobble", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 30, 45, 63, 37)
	--add_biome("generic_mushroom", nil, "lib_materials:dirt_with_fungi_covered_grass", 1, "default:dirt", 3, nil, nil, nil, nil, nil, 30, lib_ecology.temperature_temperate, 45, 55)
	--add_biome("generic_desert", nil, "default:sand", 1, "default:desert_sand", 3, nil, nil, nil, nil, nil, 4, 31000, 1lib_ecology.temperature_cool, 30)
	--add_biome("generic_cavern", nil, "lib_materials:stone_limestone_01", 4, "air", 8, "lib_materials:stone_basalt_01", nil, nil, nil, nil, -115, -85, -lib_ecology.temperature_cold, 60)
end


local add_biomes = function()

	add_biomes_generic()
	
	add_biomes_hot_humid()
	add_biomes_hot_semihumid()
	add_biomes_hot_temperate()
	add_biomes_hot_semiarid()
	add_biomes_hot_arid()
	add_biomes_warm_humid()
	add_biomes_warm_semihumid()
	add_biomes_warm_temperate()
	add_biomes_warm_semiarid()
	add_biomes_warm_arid()
	add_biomes_temperate_humid()
	add_biomes_temperate_semihumid()
	add_biomes_temperate_temperate()
	add_biomes_temperate_semiarid()
	add_biomes_temperate_arid()
	add_biomes_cool_humid()
	add_biomes_cool_semihumid()
	add_biomes_cool_temperate()
	add_biomes_cool_semiarid()
	add_biomes_cool_arid()
	add_biomes_cold_humid()
	add_biomes_cold_semihumid()
	add_biomes_cold_temperate()
	add_biomes_cold_semiarid()
	add_biomes_cold_arid()
	
end

add_biomes()


--valleys_c biomes

	add_biome("lib_ecology_deciduous_forest_swamp", nil, "lib_materials:dirt_mud_01", 1, "lib_materials:dirt_silty", 3, nil, nil, nil, nil, nil, -4, 4, 60, 60)
	add_biome("lib_ecology_desert", nil, "lib_materials:sand_desert", 1, "lib_materials:stone_sandstone_desert", 3, "lib_materials:stone_desert", nil, nil, nil, nil, 30, lib_ecology.temperature_hot, 80, lib_ecology.humidity_arid)
	add_biome("lib_ecology_desertstone_grassland", nil, "lib_materials:dirt_clayey_with_dry_grass", 1, "lib_materials:dirt_clayey", 2, "lib_materials:stone_desert", nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, 80, 55)
	add_biome("lib_ecology_rainforest", nil, "lib_materials:dirt_with_rainforest_litter", 1, "lib_materials:dirt", 2, "lib_materials:stone_brown", nil, nil, nil, nil, 30, lib_ecology.temperature_hot, 85, 70)
	add_biome("lib_ecology_rainforest_swamp", nil, "lib_materials:dirt_silty_with_rainforest_litter", 1, "lib_materials:dirt_mud_01", 2, nil, nil, nil, nil, nil, -1, 2, 85, 60)
	add_biome("lib_ecology_sandstone_grassland", nil, "lib_materials:dirt_sandy_with_dry_grass4", 1, "lib_materials:dirt_sandy", 2, "lib_materials:stone_sandstone", nil, nil, nil, nil, 5, 24, 55, 40)
	add_biome("lib_ecology_sandstone_grassland_dunes", nil, "lib_materials:sand", 1, "lib_materials:sand", 2, "lib_materials:stone_sandstone", nil, nil, nil, nil, 1, 5, 55, 40)
	add_biome("lib_ecology_savanna", nil, "lib_materials:dirt_with_dry_grass", 1, "lib_materials:dirt", 4, nil, nil, nil, nil, nil, lib_ecology.maxheight_coastal, lib_ecology.maxheight_lowland, 80, lib_ecology.humidity_semiarid)
	add_biome("lib_ecology_savanna_swamp", nil, "lib_materials:dirt_clayey_with_rainforest_litter", 1, "lib_materials:dirt_clay_red", 3, nil, nil, nil, nil, nil, -3, 0, 80, lib_ecology.humidity_semiarid)

--[[

	-- Permanent ice

	-- minetest.register_biome({name = "lib_ecology_glacier",
		-- node_dust = "default:snowblock",
		-- node_top = "default:snowblock",
		-- depth_top = 1,
		-- node_filler = "default:snowblock",
		-- depth_filler = 3,
		-- node_stone = "default:ice",
		-- node_water_top = "lib_ecology:ice",
		-- depth_water_top = lib_ecology.temperature_cold,
		-- --node_water = "",
		-- node_river_water = "lib_ecology:ice",
		-- y_min = -8,
		-- y_max = 31000,
		-- heat_point = 0,
		-- humidity_point = lib_ecology.temperature_temperate,
	-- })

	-- Cold
	-- minetest.register_biome({name = "lib_ecology_tundra",
		-- --node_dust = "",
		-- node_top = "default:dirt_with_snow",
		-- depth_top = 1,
		-- node_filler = "default:dirt",
		-- depth_filler = 1,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 2,
		-- y_max = 31000,
		-- heat_point = 15,
		-- humidity_point = 35,
	-- })
	-- minetest.register_biome({name = "lib_ecology_tundra_beach",
		-- --node_dust = "",
		-- node_top = "default:gravel",
		-- depth_top = 1,
		-- node_filler = "default:gravel",
		-- depth_filler = 2,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -3,
		-- y_max = 1,
		-- heat_point = 15,
		-- humidity_point = 35,
	-- })

	-- minetest.register_biome({name = "lib_ecology_taiga",
		-- node_dust = "",
		-- node_top = "default:dirt_with_snow",
		-- depth_top = 1,
		-- node_filler = "default:dirt",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 2,
		-- y_max = 31000,
		-- heat_point = 15,
		-- humidity_point = 65,
	-- })
	-- minetest.register_biome({name = "lib_ecology_cold_desert",
		-- --node_dust = "",
		-- node_top = "default:silver_sand",
		-- depth_top = 1,
		-- node_filler = "default:silver_sandstone",
		-- depth_filler = 1,
		-- node_stone = "lib_materials:stone_sand",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 5,
		-- y_max = 31000,
		-- heat_point = lib_ecology.temperature_cool,
		-- humidity_point = 0,
	-- })
	-- minetest.register_biome({name = "lib_ecology_cold_desert_ocean",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:sand",
		-- depth_filler = 3,
		-- node_stone = "lib_materials:stone_desert",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -112,
		-- y_max = 4,
		-- heat_point = lib_ecology.temperature_cool,
		-- humidity_point = lib_ecology.temperature_cold,
	-- })


	-- -- Temperate
	-- minetest.register_biome({name = "lib_ecology_stone_grassland",
		-- --node_dust = "",
		-- node_top = "lib_materials:dirt_sandy_with_grass",
		-- depth_top = 1,
		-- node_filler = "default:dirt",
		-- depth_filler = 1,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 6,
		-- y_max = 31000,
		-- heat_point = 35,
		-- humidity_point = 40,
	-- })
	-- minetest.register_biome({name = "lib_ecology_stone_grassland_dunes",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:sand",
		-- depth_filler = 2,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 5,
		-- y_max = 5,
		-- heat_point = 35,
		-- humidity_point = 40,
	-- })
	-- minetest.register_biome({name = "lib_ecology_stone_grassland_ocean",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:sand",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -112,
		-- y_max = 4,
		-- heat_point = 35,
		-- humidity_point = 40,
	-- })

	-- minetest.register_biome({name = "lib_ecology_coniferous_forest",
		-- --node_dust = "",
		-- node_top = "default:dirt_with_coniferous_litter",
		-- depth_top = 1,
		-- node_filler = "default:dirt",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 6,
		-- y_max = 31000,
		-- heat_point = 35,
		-- humidity_point = 60,
	-- })
	-- minetest.register_biome({name = "lib_ecology_coniferous_forest_dunes",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:dirt",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 5,
		-- y_max = 5,
		-- heat_point = 35,
		-- humidity_point = 60,
	-- })
	-- minetest.register_biome({name = "lib_ecology_coniferous_forest_ocean",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:sand",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -112,
		-- y_max = 4,
		-- heat_point = 35,
		-- humidity_point = 60,
	-- })
--]]

--[[
	minetest.register_biome({name = "lib_ecology_sandstone_grassland",
		--node_dust = "",
		node_top = "lib_materials:dirt_sandy_with_dry_grass4",
		depth_top = 1,
		node_filler = "lib_materials:dirt_sandy",
		depth_filler = 2,
		node_stone = "lib_materials:stone_sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 5,
		y_max = 24,
		heat_point = 55,
		humidity_point = 40,
	})
	minetest.register_biome({name = "lib_ecology_sandstone_grassland_dunes",
		--node_dust = "",
		node_top = "lib_materials:sand",
		depth_top = 1,
		node_filler = "lib_materials:sand",
		depth_filler = 2,
		node_stone = "lib_materials:stone_sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 1,
		y_max = 5,
		heat_point = 55,
		humidity_point = 40,
	})
--]]

--[[
	-- minetest.register_biome({name = "lib_ecology_sandstone_grassland_ocean",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:sand",
		-- depth_filler = 3,
		-- node_stone = "lib_materials:stone_sandstone",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -112,
		-- y_max = 4,
		-- heat_point = 55,
		-- humidity_point = 40,
	-- })

	-- minetest.register_biome({name = "lib_ecology_deciduous_forest",
		-- --node_dust = "",
		-- node_top = "default:dirt_with_grass",
		-- depth_top = 1,
		-- node_filler = "default:dirt",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = 1,
		-- y_max = 31000,
		-- heat_point = 60,
		-- humidity_point = 60,
	-- })
--]]

--[[
	minetest.register_biome({name = "lib_ecology_deciduous_forest_swamp",
		--node_dust = "",
		node_top = "lib_materials:dirt_silty_with_coniferous_litter",
		depth_top = 1,
		node_filler = "lib_materials:dirt_silty",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3,
		y_max = 0,
		heat_point = 60,
		humidity_point = 60,
	})
--]]	

--[[
	-- minetest.register_biome({name = "lib_ecology_deciduous_forest_ocean",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "default:sand",
		-- depth_filler = 3,
		-- --node_stone = "",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -112,
		-- y_max = -4,
		-- heat_point = 60,
		-- humidity_point = 60,
	-- })
--]]

--[[	
	-- Hot
	minetest.register_biome({name = "lib_ecology_desert",
		--node_dust = "",
		node_top = "lib_materials:sand_desert",
		depth_top = 1,
		node_filler = "lib_materials:stone_sandstone_desert",
		depth_filler = 3,
		node_stone = "lib_materials:stone_desert",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 30,
		y_max = lib_ecology.temperature_hot,
		heat_point = 80,
		humidity_point = lib_ecology.temperature_cold,
	})
--]]

--[[
	-- minetest.register_biome({name = "lib_ecology_desert_ocean",
		-- --node_dust = "",
		-- node_top = "default:sand",
		-- depth_top = 1,
		-- node_filler = "lib_materials:stone_sandstone",
		-- depth_filler = 3,
		-- --node_stone = "lib_materials:stone_desert",
		-- --node_water_top = "",
		-- --depth_water_top = ,
		-- --node_water = "",
		-- --node_river_water = "",
		-- y_min = -112,
		-- y_max = 4,
		-- heat_point = 80,
		-- humidity_point = lib_ecology.temperature_cold,
	-- })
--]]

--[[
	minetest.register_biome({name = "lib_ecology_savanna",
		--node_dust = "",
		node_top = "lib_materials:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "lib_materials:dirt",
		depth_filler = 4,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 30,
		y_max = 60,
		heat_point = 80,
		humidity_point = lib_ecology.temperature_cool,
	})
	minetest.register_biome({name = "lib_ecology_savanna_swamp",
		--node_dust = "",
		node_top = "lib_materials:dirt_clayey_with_rainforest_litter",
		depth_top = 1,
		node_filler = "lib_materials:dirt_clay_red",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3,
		y_max = 0,
		heat_point = 80,
		humidity_point = lib_ecology.temperature_cool,
	})
	
	minetest.register_biome({name = "lib_ecology_desertstone_grassland",
		--node_dust = "",
		node_top = "lib_materials:dirt_clayey_with_dry_grass",
		depth_top = 1,
		node_filler = "lib_materials:dirt_clayey",
		depth_filler = 2,
		node_stone = "lib_materials:stone_desert",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 30,
		y_max = 60,
		heat_point = 80,
		humidity_point = 55,
	})
	minetest.register_biome({name = "lib_ecology_rainforest",
		--node_dust = "",
		node_top = "lib_materials:dirt_with_rainforest_litter",
		depth_top = 1,
		node_filler = "lib_materials:dirt",
		depth_filler = 3,
		node_stone = "lib_materials:stone_brown",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 30,
		y_max = lib_ecology.temperature_hot,
		heat_point = 85,
		humidity_point = 70,
	})
	minetest.register_biome({name = "lib_ecology_rainforest_swamp",
		--node_dust = "",
		node_top = "lib_materials:dirt_silty_with_rainforest_litter",
		depth_top = 1,
		node_filler = "default:clay",
		depth_filler = 3,
		node_stone = "lib_materials:stone_brown",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3,
		y_max = 0,
		heat_point = 85,
		humidity_point = 70,
	})
--]]



--Ethereal Biomes

	add_biome("alpine", nil, "lib_materials:dirt_with_snow", 1, "lib_materials:dirt", 2, nil, nil, nil, nil, nil, 85, 95, lib_ecology.temperature_cold, 37)
	add_biome("desert", nil, "lib_materials:sand_desert", 1, "lib_materials:sand_desert", 3, nil, nil, nil, nil, nil, 3, 23, 35, 20)
	add_biome("fiery", nil, "lib_materials:dirt_with_grass_fiery", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 5, 20, lib_ecology.temperature_warm, lib_ecology.humidity_arid)
	add_biome("frost", nil, "lib_materials:dirt_with_grass_crystal", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 118, 122, lib_ecology.temperature_cold, 37)
	add_biome("junglee", nil, "lib_materials:dirt_with_grass_jungle_01", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 1, 11, 82, 62)
	add_biome("plains", nil, "lib_materials:dirt_dried", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 3, 25, 65, lib_ecology.humidity_semiarid)
	add_biome("prairie", nil, "lib_materials:dirt_with_grass_prairie", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 20, 40, 20, 40)
	add_biome("sandclay", nil, "lib_materials:sand", 3, "default:clay", 2, nil, nil, nil, nil, nil, 1, 11, 65, 2)
	add_biome("sandstone", nil, "lib_materials:stone_sandstone", 1, "lib_materials:stone_sandstone", 1, nil, nil, nil, nil, nil, 3, 23, lib_ecology.temperature_temperate, 20)
	add_biome("savannah", nil, "lib_materials:dirt_with_dry_grass", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 3, 50, 55, lib_ecology.humidity_semiarid)
	add_biome("snowy", nil, "lib_materials:dirt_with_grass_cold", 1, "lib_materials:dirt", 2, nil, nil, nil, nil, nil, 10, 35, lib_ecology.temperature_cold, 37)
	add_biome("swamp", nil, "lib_materials:dirt_with_grass_swamp", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 1, 7, 80, lib_ecology.humidity_humid)
	
	--add_biome("bamboo", nil, "lib_materials:dirt_with_bamboo_grass", 1, "default:dirt", 3, nil, nil, nil, nil, nil, 41, 71, 45, lib_ecology.humidity_semihumid)
	--add_biome("caves", nil, "lib_materials:stone_limestone_01", 8, "air", 6, nil, nil, nil, nil, nil, -4, 15, 15, lib_ecology.humidity_semiarid)
	--add_biome("clearing", nil, "lib_materials:green_dirt", 1, "default:dirt", 3, nil, nil, nil, nil, nil, 3, 71, 45, 65, 1) -- ADDED
	--add_biome("grassy", nil, "lib_materials:green_dirt", 1, "default:dirt", 3, nil, nil, nil, nil, nil, 3, 91, 13, 40)
	--add_biome("grayness", nil, "lib_materials:gray_dirt", 3, "lib_materials:stone_basalt_01_cobble", 4, "lib_materials:stone_basalt_01", nil, nil, nil, nil, 1lib_ecology.temperature_cool, 1lib_ecology.temperature_temperate, 15, 30)
	--add_biome("grayness2", nil, "lib_materials:gray_dirt", 1, "lib_materials:dirt_sandy", 3, "lib_materials:stone_brown", nil, nil, nil, nil, lib_ecology.temperature_warm, 95, lib_ecology.temperature_cool, 74)
	--add_biome("grassytwo", nil, "lib_materials:green_dirt", 1, "default:dirt", 3, nil, nil, nil, nil, nil, 1, 91, 15, 40)
	--add_biome("grove", nil, "lib_materials:grove_dirt", 1, "default:dirt", 3, nil, nil, nil, nil, nil, 3, 23, 45, 35)
	--add_biome("jumble", nil, "lib_materials:green_dirt", 1, "lib_materials:dirt", 3, nil, nil, nil, nil, nil, 1, 71, lib_ecology.temperature_cool, lib_ecology.humidity_temperate)

