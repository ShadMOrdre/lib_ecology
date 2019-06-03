local S = lib_ecology.intllib



--NOTES
--[[
Code below taken from Valleys_c deco.lua, and deco_trees.lua
Sections are delineated due to execution timing.
--]]


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
--minetest.clear_registered_decorations()

-- A list of all schematics, for re-use.
lib_ecology.schematics = {}




