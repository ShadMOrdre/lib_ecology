----------------------------------------
-- The Valleys Mapgen C++ Helper Code --
----------------------------------------

minetest.set_gen_notify("alternative_cave")

-- the mod object
lib_ecology = {}
lib_ecology.version = "1.0"
lib_ecology.path = minetest.get_modpath("lib_ecology")


lib_ecology.time_factor = 10

--DEFAULTS
--0, 4, 30, 60, 90, 120, 150, 1800
lib_ecology.ocean_depth = -192
lib_ecology.beach_depth = -4
lib_ecology.sea_level = 0
lib_ecology.maxheight_beach = 4
lib_ecology.maxheight_coastal = 40
lib_ecology.maxheight_lowland = 80
lib_ecology.maxheight_shelf = 120
lib_ecology.maxheight_highland = 160
lib_ecology.maxheight_mountain = 200
lib_ecology.maxheight_strato = 1800

lib_ecology.temperature_hot = 90
lib_ecology.temperature_warm = 75
lib_ecology.temperature_temperate = 50
lib_ecology.temperature_cool = 25
lib_ecology.temperature_cold = 10
lib_ecology.humidity_humid = 90
lib_ecology.humidity_semihumid = 75
lib_ecology.humidity_temperate = 50
lib_ecology.humidity_semiarid = 25
lib_ecology.humidity_arid = 10


-- Intllib
local MP
local S
local NS
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	--S = function(s) return s end
	-- internationalization boilerplate
	MP = minetest.get_modpath(minetest.get_current_modname())
	S, NS = dofile(MP.."/intllib.lua")
end
lib_ecology.intllib = S


minetest.log(S("[MOD] lib_ecology loading..."))
--lib_ecology.noise_set_id = minetest.settings:get("noise_set_id") or 1
--minetest.log(S("[MOD] lib_ecology using noise set " .. lib_ecology.noise_set_id))


--[[This section, from deco.lua, runs BEFORE valleys_c trees are generated.
--]]
-- Copy all the decorations except the ones I don't like.
--  This is currently used to remove the default trees.
local bad_deco = {"apple_tree", "pine_tree", "jungle_tree", "junglegrass", }
local decos = {}
for id, deco_table in pairs(minetest.registered_decorations) do
	if type(deco_table.schematic) ~= "string" or not table.contains_substring(bad_deco, deco_table.schematic) then
		table.insert(decos, deco_table)
	end
end


--[[ETHEREAL SECTION

	Minetest Ethereal Mod (6th December 2016)

	Created by ChinChow

	Updated by TenPlus1

]]
lib_ecology.leaftype = 1 -- 0 for 2D plantlike, 1 for 3D allfaces
lib_ecology.leafwalk = false -- true for walkable leaves, false to fall through
lib_ecology.cavedirt = true -- caves chop through dirt when true
lib_ecology.torchdrop = true -- torches drop when touching water
lib_ecology.papyruswalk = true -- papyrus can be walked on
lib_ecology.lilywalk = true -- waterlilies can be walked on
lib_ecology.xcraft = true -- allow cheat crafts for cobble->gravel->dirt->sand, ice->snow, dry dirt->desert sand

dofile(lib_ecology.path .. "/ethereal/water.lua")
dofile(lib_ecology.path .. "/ethereal/fishing.lua")
dofile(lib_ecology.path .. "/ethereal/bonemeal.lua")

minetest.log(S("@)-->-->  STATUS:     lib_ecology Section ethereal loaded."))

lib_ecology.noleafdecay = minetest.setting_getbool('lib_ecology_no_leaf_decay') or false
lib_ecology.glow = minetest.setting_getbool('lib_ecology_glow') or false
lib_ecology.houses = minetest.setting_getbool('lib_ecology_houses') or false
lib_ecology.use_gennotify = minetest.setting_getbool('lib_ecology_use_gennotify') or true

-- Modify a node to add a group
function minetest.add_group(node, groups)
	local def = minetest.registered_items[node]
	if not def then
		return false
	end
	local def_groups = def.groups or {}
	for group, value in pairs(groups) do
		if value ~= 0 then
			def_groups[group] = value
		else
			def_groups[group] = nil
		end
	end
	minetest.override_item(node, {groups = def_groups})
	return true
end

-- Check if the table contains an element.
function table.contains(table, element)
  for key, value in pairs(table) do
    if value == element then
			if key then
				return key
			else
				return true
			end
    end
  end
  return false
end

-- This isn't already in the math library? Really?
function math.round(i)
	return math.floor(i + 0.5)
end

-- Push an element onto a stack (table).
function push(t, x)
	t[#t+1] = x
end

function lib_ecology.clone_node(name)
	local node = minetest.registered_nodes[name]
	local node2 = table.copy(node)
	return node2
end

-- Prevent rivers from flowing through (the air in) caves.
minetest.override_item("default:river_water_source", {is_ground_content = true})

dofile(lib_ecology.path.."/lib_ecology_biomes.lua")

dofile(lib_ecology.path.."/valleys_c/deco_coral.lua")
dofile(lib_ecology.path.."/valleys_c/deco_rocks.lua")
dofile(lib_ecology.path.."/valleys_c/deco_caves.lua")
dofile(lib_ecology.path.."/valleys_c/deco_fungal_tree.lua")
dofile(lib_ecology.path.."/valleys_c/deco_water.lua")

--[[This section, from deco.lua, runs AFTER valleys_c trees are generated.
--]]
-- Re-register the good decorations.
-- This has to be done after registering the trees or
--  the trees spawn on top of grass.  /shrug
for _, i in pairs(decos) do
	minetest.register_decoration(i)
end

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"lib_ecology_rainforest", "lib_ecology_desertstone_grassland"},
	y_min = 1,
	y_max = 31000,
	decoration = "default:junglegrass",
})

minetest.register_craft({
	output = "default:stick 2",
	recipe = {
		{"default:cactus"}
	}
})

minetest.add_group("default:cactus", {oddly_breakable_by_hand=1})

dofile(lib_ecology.path.."/lib_ecology_tree_utils.lua")
dofile(lib_ecology.path.."/lib_ecology_plant.lua")
dofile(lib_ecology.path.."/lib_ecology_tree.lua")
dofile(lib_ecology.path.."/lib_ecology_extra.lua")

dofile(lib_ecology.path.."/lib_ecology_decorations.lua")

minetest.log(S("@)-->-->  STATUS:     lib_ecology Section valleys_c loaded."))

minetest.log(S("@)-->-->  STATUS:     lib_ecology Loading Complete....."))

