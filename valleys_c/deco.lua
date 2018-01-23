function table.contains_substring(t, s)
	if type(s) ~= "string" then
		return nil
	end

	for key, value in pairs(t) do
		if type(value) == 'string' and s:find(value) then
			if key then
				return key
			else
				return true
			end
		end
	end
	return false
end

-- Copy all the decorations except the ones I don't like.
--  This is currently used to remove the default trees.
local bad_deco = {"apple_tree", "pine_tree", "jungle_tree", "junglegrass", }
local decos = {}
for id, deco_table in pairs(minetest.registered_decorations) do
	if type(deco_table.schematic) ~= "string" or not table.contains_substring(bad_deco, deco_table.schematic) then
		table.insert(decos, deco_table)
	end
end


-- Create and initialize a table for a schematic.
function lib_ecology.schematic_array(width, height, depth)
	-- Dimensions of data array.
	local s = {size={x=width, y=height, z=depth}}
	s.data = {}

	for z = 0,depth-1 do
		for y = 0,height-1 do
			for x = 0,width-1 do
				local i = z*width*height + y*width + x + 1
				s.data[i] = {}
				s.data[i].name = "air"
				s.data[i].param1 = 000
			end
		end
	end

	s.yslice_prob = {}

	return s
end


-- Clear all decorations, so I can place the new trees.
minetest.clear_registered_decorations()

-- A list of all schematics, for re-use.
lib_ecology.schematics = {}


-- Specific decoration code.
if lib_ecology.houses then
	dofile(lib_ecology.path.."/valleys_c/deco_houses.lua")
end

dofile(lib_ecology.path.."/valleys_c/deco_coral.lua")
dofile(lib_ecology.path.."/valleys_c/deco_dirt.lua")
dofile(lib_ecology.path.."/valleys_c/deco_trees.lua")
dofile(lib_ecology.path.."/valleys_c/deco_plants.lua")
dofile(lib_ecology.path.."/valleys_c/deco_rocks.lua")
dofile(lib_ecology.path.."/valleys_c/deco_caves.lua")
dofile(lib_ecology.path.."/valleys_c/deco_fungal_tree.lua")
dofile(lib_ecology.path.."/valleys_c/deco_ferns.lua")
dofile(lib_ecology.path.."/valleys_c/deco_ferns_tree.lua")
dofile(lib_ecology.path.."/valleys_c/deco_water.lua")


	-- biomes = {"sandstone_grassland", "glacier", "tundra", "taiga", "stone_grassland", "coniferous_forest", "deciduous_forest", "desert", "savanna", "rainforest", "rainforest_swamp", "desertstone_grassland", },


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
