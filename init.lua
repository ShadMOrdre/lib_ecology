-------------------------------------------------------------
-- lib_ecology  ©2019 Shad MOrdre (shadmordre@minetest.net)--
-------------------------------------------------------------

-- the mod object
lib_ecology = {}
lib_ecology.name = "lib_ecology"
lib_ecology.ver_max = 5
lib_ecology.ver_min = 0
lib_ecology.ver_rev = 2
lib_ecology.ver_str = lib_ecology.ver_max .. "." .. lib_ecology.ver_min .. "." .. lib_ecology.ver_rev
lib_ecology.authorship = "ShadMOrdre.  Additional credits to Tenplus1, Gail de Sailly, VannessaE, runs, and numerous others."
lib_ecology.license = "LGLv2.1"
lib_ecology.copyright = "2019"
lib_ecology.path_mod = minetest.get_modpath(minetest.get_current_modname())
lib_ecology.path_world = minetest.get_worldpath()
lib_ecology.path = lib_ecology.path_mod


-- Intllib
--local MP
local S
local NS
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	--S = function(s) return s end
	-- internationalization boilerplate
	S, NS = dofile(lib_ecology.path_mod.."/intllib.lua")
end
lib_ecology.intllib = S


minetest.log(S("[MOD] lib_ecology:  Loading..."))
minetest.log(S("[MOD] lib_ecology:  Version:") .. S(lib_ecology.ver_str))
minetest.log(S("[MOD] lib_ecology:  Legal Info: Copyright ") .. S(lib_ecology.copyright) .. " " .. S(lib_ecology.authorship) .. "")
minetest.log(S("[MOD] lib_ecology:  License: ") .. S(lib_ecology.license) .. "")


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
lib_ecology.maxheight_strato = lib_ecology.maxheight_mountain  + (lib_ecology.biome_altitude_range * (lib_ecology.mgv7_mapgen_scale_factor / 2))

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

lib_ecology.biome_vertical_blend = lib_ecology.biome_altitude_range / 5

minetest.set_gen_notify("alternative_cave")

-- clear default mapgen biomes, decorations and ores
--minetest.clear_registered_biomes()
--minetest.clear_registered_decorations()
--minetest.clear_registered_ores()

	lib_ecology.read_csv = dofile(lib_ecology.path .. "/csv.lua")
	
	lib_ecology.N = {}
	lib_ecology.schem = dofile(lib_ecology.path.."/lib_ecology_schem.lua")
	dofile(lib_ecology.path.."/lib_ecology_schematic.lua")

	dofile(lib_ecology.path.."/lib_ecology_sound_defaults.lua")

	dofile(lib_ecology.path.."/useful_code_samples.lua")


--Trees
	dofile(lib_ecology.path.."/lib_ecology_tree_utils.lua")

	dofile(lib_ecology.path.."/lib_ecology_node_registration.lua")

	dofile(lib_ecology.path.."/mushrooms.lua")

	dofile(lib_ecology.path.."/lib_ecology_schematics.lua")

--Plants

	dofile(lib_ecology.path .. "/lib_ecology_craftitems.lua")

	dofile(lib_ecology.path .. "/lib_ecology_craftrecipes.lua")

	dofile(lib_ecology.path.."/lib_ecology_deco_registration.lua")


--[[
--v6 Mapgen Aliases
	minetest.register_alias("mapgen_tree", "lib_ecology:tree_default_trunk")
	minetest.register_alias("mapgen_leaves", "lib_ecology:tree_default_leaves")
	minetest.register_alias("mapgen_apple", "lib_ecology:fruit_apple")
	minetest.register_alias("mapgen_jungletree", "lib_ecology:tree_jungle_01_trunk")
	minetest.register_alias("mapgen_jungleleaves", "lib_ecology:tree_jungle_01_leaves")
	minetest.register_alias("mapgen_junglegrass", "lib_ecology:shrub_jungle")
	minetest.register_alias("mapgen_pine_tree", "lib_ecology:tree_pine_01_trunk")
	minetest.register_alias("mapgen_pine_needles", "lib_ecology:tree_pine_01_leaves")
--]]




minetest.log(S("[MOD]: lib_ecology:  Successfully loaded."))



