-------------------------------------------------------------
-- lib_ecology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------

-- the mod object
lib_ecology = {}
lib_ecology.name = "lib_ecology"
lib_ecology.ver_max = 5
lib_ecology.ver_min = 0
lib_ecology.ver_rev = 2
lib_ecology.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_ecology.path_world = minetest.get_worldpath()
lib_ecology.path = lib_ecology.path_mod


lib_ecology.time_factor = 10
lib_ecology.mgv7_mapgen_scale_factor = lib_materials.mgv7_mapgen_scale_factor or 8
lib_ecology.biome_altitude_range = lib_materials.biome_altitude_range or 40

--DEFAULTS
--0, 4, 30, 60, 90, 120, 150, 1800
lib_ecology.ocean_depth = lib_materials.ocean_depth or -192
lib_ecology.beach_depth = lib_materials.beach_depth or -4
lib_ecology.sea_level = lib_materials.sea_level or 0
lib_ecology.maxheight_beach = lib_materials.maxheight_beach or 4

lib_ecology.maxheight_coastal = lib_ecology.sea_level + lib_ecology.biome_altitude_range
lib_ecology.maxheight_lowland = lib_ecology.maxheight_coastal + lib_ecology.biome_altitude_range
lib_ecology.maxheight_shelf = lib_ecology.maxheight_lowland + lib_ecology.biome_altitude_range
lib_ecology.maxheight_highland = lib_ecology.maxheight_shelf + lib_ecology.biome_altitude_range
lib_ecology.maxheight_mountain = lib_ecology.maxheight_highland + lib_ecology.biome_altitude_range
lib_ecology.minheight_snow = lib_ecology.maxheight_mountain + lib_ecology.biome_altitude_range
lib_ecology.maxheight_snow = lib_ecology.minheight_snow  + (lib_ecology.biome_altitude_range * 2)
lib_ecology.maxheight_strato = lib_ecology.maxheight_snow  + (lib_ecology.biome_altitude_range * (lib_ecology.mgv7_mapgen_scale_factor / 2))

lib_ecology.temperature_hot = lib_materials.temperature_hot or 90
lib_ecology.temperature_warm = lib_materials.temperature_warm or 75
lib_ecology.temperature_temperate = lib_materials.temperature_temperate or 50
lib_ecology.temperature_cool = lib_materials.temperature_cool or 25
lib_ecology.temperature_cold = lib_materials.temperature_cold or 10
lib_ecology.humidity_humid = lib_materials.humidity_humid or 90
lib_ecology.humidity_semihumid = lib_materials.humidity_semihumid or 75
lib_ecology.humidity_temperate = lib_materials.humidity_temperate or 50
lib_ecology.humidity_semiarid = lib_materials.humidity_semiarid or 25
lib_ecology.humidity_arid = lib_materials.humidity_arid or 10

lib_ecology.biome_vertical_blend = lib_materials.biome_vertical_blend or (lib_ecology.biome_altitude_range / 5)

minetest.set_gen_notify("alternative_cave")

-- clear default mapgen biomes, decorations and ores
--minetest.clear_registered_biomes()
--minetest.clear_registered_decorations()
--minetest.clear_registered_ores()

-- Intllib
--local MP
local S
local NS
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	--S = function(s) return s end
	-- internationalization boilerplate
	--MP = minetest.get_modpath(minetest.get_current_modname())
	S, NS = dofile(lib_ecology.path.."/intllib.lua")
end
lib_ecology.intllib = S


minetest.log(S("[MOD]: lib_ecology:  Loading..."))

	lib_ecology.read_csv = dofile(lib_ecology.path .. "/csv.lua")

	dofile(lib_ecology.path.."/lib_ecology_schematic.lua")

	dofile(lib_ecology.path.."/lib_ecology_sound_defaults.lua")

	dofile(lib_ecology.path.."/useful_code_samples.lua")


--[[The following two code files and media from Minetest Ethereal Mod (6th December 2016)
	Created by ChinChow 	Updated by TenPlus1
	Integrated into lib_ecology by ShadMOrdre 2017-2019
]]
		--dofile(lib_ecology.path .. "/lib_ecology_fishing.lua")

		--dofile(lib_ecology.path .. "/lib_ecology_water_mechanics.lua")

-- Prevent rivers from flowing through (the air in) caves.
	minetest.override_item("default:river_water_source", {is_ground_content = true})

		--dofile(lib_ecology.path.."/lib_ecology_plant.lua")

		--dofile(lib_ecology.path.."/lib_ecology_tree.lua")

--Trees
	dofile(lib_ecology.path.."/lib_ecology_tree_utils.lua")

	dofile(lib_ecology.path.."/lib_ecology_node_registration.lua")

		--dofile(lib_ecology.path.."/lib_ecology_schem_models_1.lua")

	dofile(lib_ecology.path.."/lib_ecology_schematics.lua")

		--dofile(lib_ecology.path.."/lib_ecology_biomes.lua")

minetest.log(S("[MOD]: lib_ecology:  Section: Remaining valleys_c code  loading..."))

-- Valleys_c Schematics
	--Plants

		--dofile(lib_ecology.path.."/valleys_c/deco_coral.lua")

	dofile(lib_ecology.path.."/valleys_c/deco_rocks.lua")

	dofile(lib_ecology.path.."/valleys_c/deco_caves.lua")

		--dofile(lib_ecology.path.."/valleys_c/deco_fungal_tree.lua")

	dofile(lib_ecology.path.."/valleys_c/deco_water.lua")


	dofile(lib_ecology.path.."/lib_ecology_extra.lua")

		--dofile(lib_ecology.path .. "/lib_ecology_seedling.lua")

	dofile(lib_ecology.path .. "/lib_ecology_craftitems.lua")

	dofile(lib_ecology.path .. "/lib_ecology_craftrecipes.lua")

		--dofile(lib_ecology.path.."/lib_ecology_decorations.lua")

	dofile(lib_ecology.path.."/lib_ecology_deco_registration.lua")

		--dofile(lib_ecology.path.."/lib_ecology_chatcommands.lua")



minetest.log(S("[MOD]: lib_ecology:  Successfully loaded."))



