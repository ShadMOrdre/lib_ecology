----------------------------------------
-- The Valleys Mapgen C++ Helper Code --
----------------------------------------

-- This code handles standard decorations for the Valleys Mapgen C++
--  mapgen. Most of this code is based on Gael-de-Sailly's amazing
--  work. The C++ mapgen is available at...
--    https://github.com/duane-r/minetest


-- Check for necessary mod functions and abort if they aren't available.
--[[
if not minetest.get_biome_id then
	minetest.log()
	minetest.log("* Not loading Valleys Mapgen *")
	minetest.log("Valleys Mapgen requires mod functions which are")
	minetest.log(" not exposed by your Minetest build.")
	minetest.log()
	return
end
--]]

--[[
minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname="valleys"})
	minetest.setting_set("mg_valleys_lava_features", 0)
	minetest.setting_set("mg_valleys_water_features", 0)
end)
--]]

minetest.set_gen_notify("alternative_cave")


-- the mod object
lib_ecology = {}
lib_ecology.version = "1.0"
lib_ecology.time_factor = 10

-- path to all lib_ecology code
lib_ecology.path = minetest.get_modpath("lib_ecology")
lib_ecology.noise_set_id = minetest.settings:get("noise_set_id") or 2


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

print (S("[MOD] lib_ecology loading..."))

minetest.register_node("lib_ecology:papyrus_3d", {
	description = S("Papyrus 3D"),
	drawtype = "nodebox",
	tiles = {
		"default_papyrus.png^(default_papyrus.png^[transformFX)",
		"default_papyrus.png^(default_papyrus.png^[transformFX)",
		"default_papyrus.png",
		"default_papyrus.png^[transformFX",
		"default_papyrus.png^[transformFX",
		"default_papyrus.png",
	},
	--wield_image = "bamboo.png",
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

--[[

	Minetest Ethereal Mod (6th December 2016)

	Created by ChinChow

	Updated by TenPlus1

]]

lib_ecology.leaftype = 0 -- 0 for 2D plantlike, 1 for 3D allfaces
lib_ecology.leafwalk = false -- true for walkable leaves, false to fall through
lib_ecology.cavedirt = true -- caves chop through dirt when true
lib_ecology.torchdrop = true -- torches drop when touching water
lib_ecology.papyruswalk = true -- papyrus can be walked on
lib_ecology.lilywalk = true -- waterlilies can be walked on
lib_ecology.xcraft = true -- allow cheat crafts for cobble->gravel->dirt->sand, ice->snow, dry dirt->desert sand

-- Set following to 1 to enable biome or 0 to disable
lib_ecology.glacier   = 1 -- Ice glaciers with snow
lib_ecology.bamboo    = 1 -- Bamboo with sprouts
lib_ecology.mesa      = 1 -- Mesa red and orange clay with giant redwood
lib_ecology.alpine    = 1 -- Snowy grass
lib_ecology.healing   = 1 -- Snowy peaks with healing trees
lib_ecology.snowy     = 1 -- Cold grass with pine trees and snow spots
lib_ecology.frost     = 1 -- Blue dirt with blue/pink frost trees
lib_ecology.grassy    = 1 -- Green grass with flowers and trees
lib_ecology.caves     = 1 -- Desert stone ares with huge caverns underneath
lib_ecology.grayness  = 1 -- Grey grass with willow trees
lib_ecology.grassytwo = 1 -- Sparse trees with old trees and flowers
lib_ecology.prairie   = 1 -- Flowery grass with many plants and flowers
lib_ecology.jumble    = 1 -- Green grass with trees and jungle grass
lib_ecology.junglee   = 1 -- Jungle grass with tall jungle trees
lib_ecology.desert    = 1 -- Desert sand with cactus
lib_ecology.grove     = 1 -- Banana groves and ferns
lib_ecology.mushroom  = 1 -- Purple grass with giant mushrooms
lib_ecology.sandstone = 1 -- Sandstone with smaller cactus
lib_ecology.quicksand = 1 -- Quicksand banks
lib_ecology.plains    = 1 -- Dry dirt with scorched trees
lib_ecology.savannah  = 1 -- Dry yellow grass with acacia tree's
lib_ecology.fiery     = 1 -- Red grass with lava craters
lib_ecology.sandclay  = 1 -- Sand areas with clay underneath
lib_ecology.swamp     = 1 -- Swamp areas with vines on tree's, mushrooms, lilly's and clay sand

--local path = minetest.get_modpath("lib_ecology")

dofile(lib_ecology.path .. "/ethereal/plantlife.lua")
dofile(lib_ecology.path .. "/ethereal/mushroom.lua")
dofile(lib_ecology.path .. "/ethereal/onion.lua")
dofile(lib_ecology.path .. "/ethereal/crystal.lua")
dofile(lib_ecology.path .. "/ethereal/water.lua")
dofile(lib_ecology.path .. "/ethereal/dirt.lua")
dofile(lib_ecology.path .. "/ethereal/leaves.lua")
dofile(lib_ecology.path .. "/ethereal/wood.lua")
dofile(lib_ecology.path .. "/ethereal/sapling.lua")
dofile(lib_ecology.path .. "/ethereal/strawberry.lua")
dofile(lib_ecology.path .. "/ethereal/fishing.lua")
dofile(lib_ecology.path .. "/ethereal/extra.lua")
dofile(lib_ecology.path .. "/ethereal/sealife.lua")
--dofile(lib_ecology.path .. "/fences.lua")
--dofile(lib_ecology.path .. "/gates.lua")
--dofile(lib_ecology.path .. "/ethereal/mapgen.lua")
dofile(lib_ecology.path .. "/ethereal/food.lua")
dofile(lib_ecology.path .. "/ethereal/bonemeal.lua")
--dofile(lib_ecology.path .. "/compatibility.lua")
--dofile(lib_ecology.path .. "/stairs.lua")
--dofile(lib_ecology.path .. "/lucky_block.lua")

if minetest.get_modpath("xanadu") then
	dofile(path .. "/plantpack.lua")
end

minetest.log(S("@)-->-->  STATUS:     lib_ecology Section ethereal loaded."))



lib_ecology.noleafdecay = minetest.setting_getbool('lib_ecology_no_leaf_decay')
lib_ecology.glow = minetest.setting_getbool('lib_ecology_glow')
lib_ecology.houses = minetest.setting_getbool('lib_ecology_houses')
lib_ecology.use_gennotify = minetest.setting_getbool('lib_ecology_use_gennotify')


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


-- Execute each section of the code.
--dofile(lib_ecology.path.."/valleys_c/biomes.lua")
dofile(lib_ecology.path.."/lib_ecology_biomes.lua")

dofile(lib_ecology.path.."/valleys_c/deco.lua")
dofile(lib_ecology.path.."/valleys_c/voxel.lua")
--dofile(lib_ecology.path.."/vulcanism.lua")

--[[
minetest.register_abm({
	nodenames = {"bones:bones"},
	interval = 10,
	chance = 1,
	action = function(pos)
		minetest.log(S("*** Bones say: I'm at ("..pos.x..","..pos.y..","..pos.z..")."))
	end,
})
--]]
--[[
minetest.register_on_dieplayer(function(player)
	if minetest.setting_getbool("creative_mode") then
		return
	end
	
	local pos = player:getpos()
	pos.x = math.floor(pos.x+0.5)
	pos.y = math.floor(pos.y+0.5)
	pos.z = math.floor(pos.z+0.5)
	local player_name = player:get_player_name()

	minetest.log(S("* "..player_name.." died at ("..pos.x..","..pos.y..","..pos.z..")."))
	minetest.chat_send_player(S(player_name, "You died at ("..pos.x..","..pos.y..","..pos.z..")."))
end)
--]]

minetest.log(S("@)-->-->  STATUS:     lib_ecology Section valleys_c loaded."))




minetest.log(S("@)-->-->  STATUS:     lib_ecology Loading Complete....."))

