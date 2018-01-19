----------------------
-- Voxel Manip Loop --
----------------------

-- This is only used to handle cases the decoration manager can't,
--  such as water plants and cave decorations.





-- Define perlin noises used in this mapgen by default
lib_ecology.noises = {}

if lib_ecology.noise_set_id == 1 then
	-- Noise 1 : Base Ground Height						2D
	--lib_ecology.noises[1] = {offset = -10, scale = 50, seed = 5202, spread = {x = 1024, y = 1024, z = 1024}, octaves = 6, persist = 0.4, lacunarity = 2},
	lib_ecology.noises[1] = {offset = -10, scale = 25, seed = 5202, spread = {x = 4096, y = 4096, z = 4096}, octaves = 6, persist = 0.4, lacunarity = 2}
	-- Noise 2 : Valleys (River where around zero)				2D
	lib_ecology.noises[2] = {offset = 0, scale = 1, seed = -6050, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.6, lacunarity = 2}
	-- Noise 3 : Valleys Depth						2D
	lib_ecology.noises[3] = {offset = 5, scale = 4, seed = -1914, spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 4 : Valleys Profile (Higher values = Larger valleys)		2D
	lib_ecology.noises[4] = {offset = 0.6, scale = 0.5, seed = 777, spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 5 : Inter-valleys slopes					2D
	lib_ecology.noises[5] = {offset = 0.5, scale = 0.5, seed = 746, spread = {x = 128, y = 128, z = 128}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 6 : Inter-valleys filling					3D
	lib_ecology.noises[6] = {offset = 0, scale = 1, seed = 1993, spread = {x = 256, y = 512, z = 256}, octaves = 6, persist = 0.8, lacunarity = 2}
	-- Noise 7 : Dirt thickness						2D
	lib_ecology.noises[7] = {offset = 3, scale = 1.75, seed = 1605, spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2}
	-- Noise 8 : Caves I							3D
	lib_ecology.noises[8] = {offset = 0, scale = 1, seed = -4640, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 9 : Caves II							3D
	lib_ecology.noises[9] = {offset = 0, scale = 1, seed = 8804, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 10 : Caves III							3D
	lib_ecology.noises[10] = {offset = 0, scale = 1, seed = -4780, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 11 : Caves IV and Lava I					3D
	lib_ecology.noises[11] = {offset = 0, scale = 1, seed = -9969, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 12 : Lava II (Geologic heat)					3D
	lib_ecology.noises[12] = {offset = 0, scale = 1, seed = 3314, spread = {x = 64, y = 64, z = 64}, octaves = 4, persist = 0.5, lacunarity = 2}

	-- Noise 13 : Clayey dirt noise						2D
	lib_ecology.noises[13] = {offset = 0, scale = 1, seed = 2835, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 14 : Silty dirt noise						2D
	lib_ecology.noises[14] = {offset = 0, scale = 1, seed = 6674, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 15 : Sandy dirt noise						2D
	lib_ecology.noises[15] = {offset = 0, scale = 1, seed = 6940, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 16 : Beaches							2D
	lib_ecology.noises[16] = {offset = 2, scale = 8, seed = 2349, spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2}

	-- Noise 17 : Temperature (not in maps)					3D
	lib_ecology.noises[17] = {offset = 2, scale = 1, seed = -1805, spread = {x = 768, y = 256, z = 768}, octaves = 4, persist = 0.5, lacunarity = 4}
	-- Noise 18 : Humidity							2D
	lib_ecology.noises[18] = {offset = 0, scale = 1, seed = -5787, spread = {x = 243, y = 243, z = 243}, octaves = 4, persist = 0.5, lacunarity = 3}

	-- Noise 21 : Water plants							2D
	lib_ecology.noises[21] = {offset = 0.0, scale = 1.0, spread = {x = 200, y = 200, z = 200}, seed = 33, octaves = 3, persist = 0.7, lacunarity = 2.0}
	-- Noise 22 : Cave blend							2D
	lib_ecology.noises[22] = {offset = 0.0, scale = 0.1, spread = {x = 8, y = 8, z = 8}, seed = 4023, octaves = 2, persist = 1.0, lacunarity = 2.0}
	-- Noise 23 : Cave noise							2D
	lib_ecology.noises[23] = {offset = 0.0, scale = 1.0, spread = {x = 400, y = 400, z = 400}, seed = 903, octaves = 3, persist = 0.5, lacunarity = 2.0}
end

if lib_ecology.noise_set_id == 2 then
	-- Noise 1 : Base Ground Height						2D
	--lib_ecology.noises[1] = {offset = -10, scale = 50, seed = 5202, spread = {x = 1024, y = 1024, z = 1024}, octaves = 6, persist = 0.4, lacunarity = 2},
	lib_ecology.noises[1] = {offset = -10, scale = 50, seed = 5202, spread = {x = 1024, y = 1024, z = 1024}, octaves = 6, persist = 0.4, lacunarity = 2}
	-- Noise 2 : Valleys (River where around zero)				2D
	lib_ecology.noises[2] = {offset = 0, scale = 1, seed = -6050, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.6, lacunarity = 2}
	-- Noise 3 : Valleys Depth						2D
	lib_ecology.noises[3] = {offset = 5, scale = 4, seed = -1914, spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 4 : Valleys Profile (Higher values = Larger valleys)		2D
	lib_ecology.noises[4] = {offset = 0.6, scale = 0.5, seed = 777, spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 5 : Inter-valleys slopes					2D
	lib_ecology.noises[5] = {offset = 0.5, scale = 0.5, seed = 746, spread = {x = 128, y = 128, z = 128}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 6 : Inter-valleys filling					3D
	lib_ecology.noises[6] = {offset = 0, scale = 1, seed = 1993, spread = {x = 256, y = 512, z = 256}, octaves = 6, persist = 0.8, lacunarity = 2}
	-- Noise 7 : Dirt thickness						2D
	lib_ecology.noises[7] = {offset = 3, scale = 1.75, seed = 1605, spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2}
	-- Noise 8 : Caves I							3D
	lib_ecology.noises[8] = {offset = 0, scale = 1, seed = -4640, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 9 : Caves II							3D
	lib_ecology.noises[9] = {offset = 0, scale = 1, seed = 8804, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 10 : Caves III							3D
	lib_ecology.noises[10] = {offset = 0, scale = 1, seed = -4780, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 11 : Caves IV and Lava I					3D
	lib_ecology.noises[11] = {offset = 0, scale = 1, seed = -9969, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 12 : Lava II (Geologic heat)					3D
	lib_ecology.noises[12] = {offset = 0, scale = 1, seed = 3314, spread = {x = 64, y = 64, z = 64}, octaves = 4, persist = 0.5, lacunarity = 2}

	-- Noise 13 : Clayey dirt noise						2D
	lib_ecology.noises[13] = {offset = 0, scale = 1, seed = 2835, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 14 : Silty dirt noise						2D
	lib_ecology.noises[14] = {offset = 0, scale = 1, seed = 6674, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 15 : Sandy dirt noise						2D
	lib_ecology.noises[15] = {offset = 0, scale = 1, seed = 6940, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 16 : Beaches							2D
	lib_ecology.noises[16] = {offset = 2, scale = 8, seed = 2349, spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2}

	-- Noise 17 : Temperature (not in maps)					3D
	lib_ecology.noises[17] = {offset = 2, scale = 1, seed = -1805, spread = {x = 768, y = 256, z = 768}, octaves = 4, persist = 0.5, lacunarity = 4}
	-- Noise 18 : Humidity							2D
	lib_ecology.noises[18] = {offset = 0, scale = 1, seed = -5787, spread = {x = 243, y = 243, z = 243}, octaves = 4, persist = 0.5, lacunarity = 3}

	-- Noise 21 : Water plants							2D
	lib_ecology.noises[21] = {offset = 0.0, scale = 1.0, spread = {x = 200, y = 200, z = 200}, seed = 33, octaves = 3, persist = 0.7, lacunarity = 2.0}
	-- Noise 22 : Cave blend							2D
	lib_ecology.noises[22] = {offset = 0.0, scale = 0.1, spread = {x = 8, y = 8, z = 8}, seed = 4023, octaves = 2, persist = 1.0, lacunarity = 2.0}
	-- Noise 23 : Cave noise							2D
	lib_ecology.noises[23] = {offset = 0.0, scale = 1.0, spread = {x = 400, y = 400, z = 400}, seed = 903, octaves = 3, persist = 0.5, lacunarity = 2.0}

end

if lib_ecology.noise_set_id == 3 then
	-- Noise 1 : Base Ground Height						2D
	--lib_ecology.noises[1] = {offset = -10, scale = 50, seed = 5202, spread = {x = 1024, y = 1024, z = 1024}, octaves = 6, persist = 0.4, lacunarity = 2},
	lib_ecology.noises[1] = {offset = -10, scale = 25, seed = 5202, spread = {x = 4096, y = 4096, z = 4096}, octaves = 6, persist = 0.4, lacunarity = 2}
	-- Noise 2 : Valleys (River where around zero)				2D
	lib_ecology.noises[2] = {offset = 0, scale = 1, seed = -6050, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.6, lacunarity = 2}
	-- Noise 3 : Valleys Depth						2D
	lib_ecology.noises[3] = {offset = 5, scale = 4, seed = -1914, spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 4 : Valleys Profile (Higher values = Larger valleys)		2D
	lib_ecology.noises[4] = {offset = 0.6, scale = 0.5, seed = 777, spread = {x = 512, y = 512, z = 512}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 5 : Inter-valleys slopes					2D
	lib_ecology.noises[5] = {offset = 0.5, scale = 0.5, seed = 746, spread = {x = 128, y = 128, z = 128}, octaves = 1, persist = 1, lacunarity = 2}
	-- Noise 6 : Inter-valleys filling					3D
	lib_ecology.noises[6] = {offset = 0, scale = 1, seed = 1993, spread = {x = 256, y = 512, z = 256}, octaves = 6, persist = 0.8, lacunarity = 2}
	-- Noise 7 : Dirt thickness						2D
	lib_ecology.noises[7] = {offset = 3, scale = 1.75, seed = 1605, spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2}
	-- Noise 8 : Caves I							3D
	lib_ecology.noises[8] = {offset = 0, scale = 1, seed = -4640, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 9 : Caves II							3D
	lib_ecology.noises[9] = {offset = 0, scale = 1, seed = 8804, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 10 : Caves III							3D
	lib_ecology.noises[10] = {offset = 0, scale = 1, seed = -4780, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 11 : Caves IV and Lava I					3D
	lib_ecology.noises[11] = {offset = 0, scale = 1, seed = -9969, spread = {x = 32, y = 32, z = 32}, octaves = 4, persist = 0.5, lacunarity = 2}
	-- Noise 12 : Lava II (Geologic heat)					3D
	lib_ecology.noises[12] = {offset = 0, scale = 1, seed = 3314, spread = {x = 64, y = 64, z = 64}, octaves = 4, persist = 0.5, lacunarity = 2}

	-- Noise 13 : Clayey dirt noise						2D
	lib_ecology.noises[13] = {offset = 0, scale = 1, seed = 2835, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 14 : Silty dirt noise						2D
	lib_ecology.noises[14] = {offset = 0, scale = 1, seed = 6674, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 15 : Sandy dirt noise						2D
	lib_ecology.noises[15] = {offset = 0, scale = 1, seed = 6940, spread = {x = 256, y = 256, z = 256}, octaves = 5, persist = 0.5, lacunarity = 4}
	-- Noise 16 : Beaches							2D
	lib_ecology.noises[16] = {offset = 2, scale = 8, seed = 2349, spread = {x = 256, y = 256, z = 256}, octaves = 3, persist = 0.5, lacunarity = 2}

	-- Noise 17 : Temperature (not in maps)					3D
	lib_ecology.noises[17] = {offset = 2, scale = 1, seed = -1805, spread = {x = 768, y = 256, z = 768}, octaves = 4, persist = 0.5, lacunarity = 4}
	-- Noise 18 : Humidity							2D
	lib_ecology.noises[18] = {offset = 0, scale = 1, seed = -5787, spread = {x = 243, y = 243, z = 243}, octaves = 4, persist = 0.5, lacunarity = 3}

	-- Noise 21 : Water plants							2D
	lib_ecology.noises[21] = {offset = 0.0, scale = 1.0, spread = {x = 200, y = 200, z = 200}, seed = 33, octaves = 3, persist = 0.7, lacunarity = 2.0}
	-- Noise 22 : Cave blend							2D
	lib_ecology.noises[22] = {offset = 0.0, scale = 0.1, spread = {x = 8, y = 8, z = 8}, seed = 4023, octaves = 2, persist = 1.0, lacunarity = 2.0}
	-- Noise 23 : Cave noise							2D
	lib_ecology.noises[23] = {offset = 0.0, scale = 1.0, spread = {x = 400, y = 400, z = 400}, seed = 903, octaves = 3, persist = 0.5, lacunarity = 2.0}

end






-- function to get noisemaps
function lib_ecology.noisemap(i, minp, chulens)
	local obj = minetest.get_perlin_map(lib_ecology.noises[i], chulens)
	if minp.z then
		return obj:get3dMap_flat(minp)
	else
		return obj:get2dMap_flat(minp)
	end
end

-- useful function to convert a 3D pos to 2D
function pos2d(pos)
	if type(pos) == "number" then
		return {x = pos, y = pos}
	elseif pos.z then
		return {x = pos.x, y = pos.z}
	else
		return {x = pos.x, y = pos.y}
	end
end

-- Check if a chunk contains a huge cave.
-- This sucks. Use gennotify when possible.
local function survey(data, area, maxp, minp, lava, water, air)
	local index_3d
	local space = 0
	for z = minp.z, maxp.z do
		for x = minp.x, maxp.x do
			index_3d = area:index(x, maxp.y, z)
			for y = maxp.y, minp.y, -1 do
				index_3d = index_3d - area.ystride
				-- The mapgen won't place lava or water near a huge cave.
				if data[index_3d] == lava or data[index_3d] == water then
					return false
				elseif data[index_3d] == air then
					space = space + 1
				end

				-- This shortcut may skip lava or water, causing a false
				-- positive, but it can save a lot of time.
				-- This is an extremely poor way to check, but there aren't
				-- any good ways, and all the others take more cpu time.
				if space > 20000 then
					return true
				end
			end
		end
	end

	return false
end

local mapgen_times = {
	liquid_lighting = {},
	loops = {},
	make_chunk = {},
	noisemaps = {},
	preparation = {},
	writing = {},
}


-- Define content IDs
-- A content ID is a number that represents a node in the core of Minetest.
-- Every nodename has its ID.
-- The VoxelManipulator uses content IDs instead of nodenames.

local node = {}

local nodes = {
	-- Ground nodes
	{"sand_stone", "lib_materials:sand_stone"},
	{"brown_stone", "lib_materials:brown_stone"},
	{"granite", "lib_materials:granite"},
	{"marble", "lib_materials:marble"},
	{"basalt", "darkage:basalt"},
	{"chalk", "darkage:chalk"},
	{"darkdirt", "darkage:darkdirt"},
	{"gneiss", "darkage:gneiss"},
	{"darkdirt", "darkage:mud"},
	{"darkdirt", "darkage:ors"},
	{"darkdirt", "darkage:serpentine"},
	{"darkdirt", "darkage:shale"},
	{"darkdirt", "darkage:schist"},
	{"darkdirt", "darkage:silt"},
	{"darkdirt", "darkage:slate"},
	{"desertstone", "default:desert_stone"},
	{"desert_sandstone", "default:desert_sandstone"},
	{"sandstone", "default:sandstone"},
	{"silver_sandstone", "default:silver_sandstone"},
	{"stone", "default:stone"},
	{"gravel", "default:gravel"},
	{"dirt_with_grass", "default:dirt_with_grass"},
	{"dirt_with_dry_grass", "default:dirt_with_dry_grass"},
	{"dirt_with_snow", "default:dirt_with_snow"},
	{"dirt_with_rainforest_litter", "default:dirt_with_rainforest_litter"},
	{"dirt_with_coniferous_litter", "default:dirt_with_coniferous_litter"},
	{"dirt", "default:dirt"},
	{"green_dirt", "lib_ecology:green_dirt"},
	{"dry_dirt", "lib_ecology:dry_dirt"},
	{"bamboo_dirt", "lib_ecology:bamboo_dirt"},
	{"cold_dirt", "lib_ecology:cold_dirt"},
	{"crystal_dirt", "lib_ecology:crystal_dirt"},
	{"fiery_dirt", "lib_ecology:fiery_dirt"},
	{"gray_dirt", "lib_ecology:gray_dirt"},
	{"grove_dirt", "lib_ecology:grove_dirt"},
	{"jungle_dirt", "lib_ecology:jungle_dirt"},
	{"mushroom_dirt_dirt", "lib_ecology:mushroom_dirt_dirt"},
	{"prairie_dirt", "lib_ecology:prairie_dirt"},
	{"bamboo_dirt", "ethereal:bamboo_dirt"},
	{"cold_dirt", "ethereal:cold_dirt"},
	{"crystal_dirt", "ethereal:crystal_dirt"},
	{"fiery_dirt", "ethereal:fiery_dirt"},
	{"gray_dirt", "ethereal:gray_dirt"},
	{"grove_dirt", "ethereal:grove_dirt"},
	{"jungle_dirt", "ethereal:jungle_dirt"},
	{"mushroom_dirt_dirt", "ethereal:mushroom_dirt_dirt"},
	{"prairie_dirt", "ethereal:prairie_dirt"},
	{"quicksand", "lib_ecology:quicksand"},
	{"quicksand2", "lib_ecology:quicksand2"},
	{"quicksand", "ethereal:quicksand"},
	{"quicksand2", "ethereal:quicksand2"},
	{"desert_sand", "default:desert_sand"},
	{"silver_sand", "default:silver_sand"},
	{"sand", "default:sand"},
	{"clay", "default:clay"},
	{"river_water_source", "default:river_water_source"},
	{"water_source", "default:water_source"},
	{"lava", "default:lava_source"},

	{"sand_with_rocks", "lib_ecology:sand_with_rocks"},
	--{"glowing_sand", "lib_ecology:glowing_sand"},
	{"fungal_stone", "lib_ecology:glowing_fungal_stone"},
	{"stalactite", "lib_ecology:stalactite"},
	{"stalactite_slimy", "lib_ecology:stalactite_slimy"},
	{"stalactite_mossy", "lib_ecology:stalactite_mossy"},
	{"stalagmite", "lib_ecology:stalagmite"},
	{"stalagmite_slimy", "lib_ecology:stalagmite_slimy"},
	{"stalagmite_mossy", "lib_ecology:stalagmite_mossy"},
	{"mushroom_cap_giant", "lib_ecology:giant_mushroom_cap"},
	{"mushroom_cap_huge", "lib_ecology:huge_mushroom_cap"},
	{"mushroom_stem", "lib_ecology:giant_mushroom_stem"},
	{"mushroom_red", "flowers:mushroom_red"},
	{"mushroom_brown", "flowers:mushroom_brown"},
	{"waterlily", "flowers:waterlily"},
	{"brain_coral", "lib_ecology:brain_coral"},
	--{"dragon_eye", "lib_ecology:dragon_eye"},
	{"pillar_coral", "lib_ecology:pillar_coral"},
	{"staghorn_coral", "lib_ecology:staghorn_coral"},
	{"coral_brown", "default:coral_brown"},
	{"coral_orange", "default:coral_orange"},
	{"coral_skeleton", "default:coral_skeleton"},


	{"dirt_clay", "lib_ecology:dirt_clayey"},
	{"lawn_clay", "lib_ecology:dirt_clayey_with_grass"},
	{"dry_clay", "lib_ecology:dirt_clayey_with_dry_grass"},
	{"snow_clay", "lib_ecology:dirt_clayey_with_snow"},
	{"dirt_silt", "lib_ecology:dirt_silty"},
	{"lawn_silt", "lib_ecology:dirt_silty_with_grass"},
	{"dry_silt", "lib_ecology:dirt_silty_with_dry_grass"},
	{"snow_silt", "lib_ecology:dirt_silty_with_snow"},
	{"dirt_sand", "lib_ecology:dirt_sandy"},
	{"lawn_sand", "lib_ecology:dirt_sandy_with_grass"},
	{"dry_sand", "lib_ecology:dirt_sandy_with_dry_grass"},
	{"snow_sand", "lib_ecology:dirt_sandy_with_snow"},
	{"silt", "lib_ecology:silt"},
	{"clay", "lib_ecology:red_clay"},

	{"tree", "default:tree"},
	{"leaves", "default:leaves"},
	{"apple", "default:apple"},
	{"bamboo", "lib_ecology:bamboo"},
	{"bamboo_leaves", "lib_ecology:bamboo_leaves"},
	{"banana_tree", "lib_ecology:banana_tree"},
	{"banana_leaves", "lib_ecology:banana_leaves"},
	{"banana", "lib_ecology:banana"},
	{"birch_tree", "lib_ecology:birch_tree"},
	{"birch_leaves", "lib_ecology:birch_leaves"},
	{"cherry_blossom_tree", "lib_ecology:cherry_blossom_tree"},
	{"cherry_blossom_leaves", "lib_ecology:cherry_blossom_leaves"},
	{"fir_tree", "lib_ecology:fir_tree"},
	{"fir_needles", "lib_ecology:fir_needles"},
	{"redwood_trunk", "ethereal:redwood_trunk"},
	{"redwood_leaves", "ethereal:redwood_leaves"},
	{"willow_trunk", "ethereal:willow_trunk"},
	{"willow_twig", "ethereal:willow_twig"},
	{"yellow_trunk", "ethereal:yellow_trunk"},
	{"yellowleaves", "ethereal:yellowleaves"},
	{"palm_trunk", "ethereal:palm_trunk"},
	{"palmleaves", "ethereal:palmleaves"},
	{"frost_tree", "ethereal:frost_tree"},
	{"frost_leaves", "ethereal:frost_leaves"},
	{"default:junglegrass", "lib_ecology:default:junglegrass"},
	{"dry_shrub", "default:dry_shrub"},
	{"cactus", "default:cactus"},
	{"papyrus", "default:papyrus"},
	{"geranium", "flowers:geranium"},
	{"rose", "flowers:rose"},
	{"tulip", "flowers:tulip"},
	{"viola", "flowers:viola"},
	{"gerbera", "lib_ecology:gerbera"},
	{"fiddlehead", "lib_ecology:"},
	{"fern", "lib_ecology:fern"},
	{"arrow_arum", "lib_ecology:arrow_arum"},
	{"bird_of_paradise", "lib_ecology:bird_of_paradise"},
	{"calla_lily", "lib_ecology:calla_lily"},
	{"fire_flower", "lib_ecology:fire_flower"},
	{"giant_mushroom_stem", "lib_ecology:giant_mushroom_stem"},
	{"giant_mushroom_cap", "lib_ecology:giant_mushroom_cap"},
	{"hibiscus", "lib_ecology:hibiscus"},
	{"gerbera", "lib_ecology:gerbera"},
	
	
	-- Air and Ignore
	{"air", "air"},
	{"ignore", "ignore"},

	{"ice", "default:ice"},
	{"thinice", "lib_ecology:thin_ice"},
	--{"crystal", "lib_ecology:glow_crystal"},
	--node["gem"]1 = minetest.get_content_id("lib_ecology:glow_gem")
	--node["gem"]2 = minetest.get_content_id("lib_ecology:glow_gem_2")
	--node["gem"]3 = minetest.get_content_id("lib_ecology:glow_gem_3")
	--node["gem"]4 = minetest.get_content_id("lib_ecology:glow_gem_4")
	--node["gem"]5 = minetest.get_content_id("lib_ecology:glow_gem_5")
	--node["saltgem"]1 = minetest.get_content_id("lib_ecology:salt_gem")
	--node["saltgem"]2 = minetest.get_content_id("lib_ecology:salt_gem_2")
	--node["saltgem"]3 = minetest.get_content_id("lib_ecology:salt_gem_3")
	--node["saltgem"]4 = minetest.get_content_id("lib_ecology:salt_gem_4")
	--node["saltgem"]5 = minetest.get_content_id("lib_ecology:salt_gem_5")
	--node["spike"]1 = minetest.get_content_id("lib_ecology:spike")
	--node["spike"]2 = minetest.get_content_id("lib_ecology:spike_2")
	--node["spike"]3 = minetest.get_content_id("lib_ecology:spike_3")
	--node["spike"]4 = minetest.get_content_id("lib_ecology:spike_4")
	--node["spike"]5 = minetest.get_content_id("lib_ecology:spike_5")
	{"moss", "lib_ecology:stone_with_moss"},
	{"lichen", "lib_ecology:stone_with_lichen"},
	{"algae", "lib_ecology:stone_with_algae"},
	{"salt", "lib_ecology:stone_with_salt"},
	--{"hcobble", "lib_ecology:hot_cobble"},
	--{"gobsidian", "lib_ecology:glow_obsidian"},
	--{"gobsidian2", "lib_ecology:glow_obsidian_2"},
	--{"coalblock", "default:coalblock"},
	{"obsidian", "default:obsidian"},
	--{"desand", "default:desert_sand"},
	--{"coaldust", "lib_ecology:coal_dust"},
	--{"fungus", "lib_ecology:fungus"},
	--{"mycena", "lib_ecology:mycena"},
	--{"worm", "lib_ecology:glow_worm"},
	{"icicle_up", "lib_ecology:icicle_up"},
	{"icicle_down", "lib_ecology:icicle_down"},
	{"flame", "lib_ecology:constant_flame"},
	--{"fountain", "lib_ecology:s_fountain"},
	--{"fortress", "lib_ecology:s_fortress"},

	{"fungal_tree_fruit", "lib_ecology:fungal_tree_fruit"},
}

for _, i in pairs(nodes) do
	node[i[1]] = minetest.get_content_id(i[2])
end

node["fungal_tree_leaves"] = {}
for _, name in pairs(lib_ecology.fungal_tree_leaves) do
	node["fungal_tree_leaves"][#node["fungal_tree_leaves"]+1] = minetest.get_content_id(name)
end

local soil_translate = {}
soil_translate["clay_over"] = {
	dirt = node["clay"],
	lawn = node["clay"],
	dry = node["clay"],
	snow = node["clay"],
}
soil_translate["clay_under"] = {
	dirt = node["dirt_clay"],
	lawn = node["lawn_clay"],
	dry = node["dry_clay"],
	snow = node["snow_clay"],
}
soil_translate["silt_over"] = {
	dirt = node["silt"],
	lawn = node["silt"],
	dry = node["silt"],
	snow = node["silt"],
}
soil_translate["silt_under"] = {
	dirt = node["dirt_silt"],
	lawn = node["lawn_silt"],
	dry = node["dry_silt"],
	snow = node["snow_silt"],
}
soil_translate["sand"] = {
	dirt = node["dirt_sand"],
	lawn = node["lawn_sand"],
	dry = node["dry_sand"],
	snow = node["snow_sand"],
}
soil_translate["dirt"] = {
	dirt = node["dirt"],
	lawn = node["dirt_with_grass"],
	dry = node["dirt_with_dry_grass"],
	snow = node["dirt_with_snow"],
}

local water_lily_biomes = {"lib_ecology_rainforest_swamp", "lib_ecology_rainforest", "lib_ecology_savanna_swamp", "lib_ecology_savanna",  "lib_ecology_deciduous_forest_swamp", "lib_ecology_deciduous_forest", "lib_ecology_desertstone_grassland", }
local coral_biomes = {"lib_ecology_desert_ocean", "lib_ecology_savanna_ocean", "lib_ecology_rainforest_ocean", }

local clay_threshold = 1
local silt_threshold = 1
local sand_threshold = 0.75
local dirt_threshold = 0.75

--local clay_threshold = vmg.define("clay_threshold", 1)
--local silt_threshold = vmg.define("silt_threshold", 1)
--local sand_threshold = vmg.define("sand_threshold", 0.75)
--local dirt_threshold = vmg.define("dirt_threshold", 0.5)

local light_depth = -13
local deep = -7000

-- Create a table of biome ids, so I can use the biomemap.
if not lib_ecology.biome_ids then
	local i
	lib_ecology.biome_ids = {}
	for name, desc in pairs(minetest.registered_biomes) do
		i = minetest.get_biome_id(desc.name)
		lib_ecology.biome_ids[i] = desc.name
	end
end

-- Get the content ids for all registered water plants.
for _, desc in pairs(lib_ecology.water_plants) do
	if type(desc.decoration) == 'string' then
		desc.content_id = minetest.get_content_id(desc.decoration)
	elseif type(desc.decoration) == 'table' then
		desc.content_id = minetest.get_content_id(desc.decoration[1])
	end
end


local data = {}


-- the mapgen function
function lib_ecology.generate(minp, maxp, seed)
	local t0 = os.clock()

	-- minp and maxp strings, used by logs
	local minps, maxps = minetest.pos_to_string(minp), minetest.pos_to_string(maxp)

	-- The VoxelManipulator, a complicated but speedy method to set many nodes at the same time
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local heightmap = minetest.get_mapgen_object("heightmap")
	-- local heatmap = minetest.get_mapgen_object("heatmap")
	local gennotify = minetest.get_mapgen_object("gennotify")
	--print(dump(gennotify))
	local water_level = 1

	vm:get_data(data) -- data is the original array of content IDs (solely or mostly air)
	-- Be careful: emin ≠ minp and emax ≠ maxp !
	-- The data array is not limited by minp and maxp. It exceeds it by 16 nodes in the 6 directions.
	-- The real limits of data array are emin and emax.
	-- The VoxelArea is used to convert a position into an index for the array.
	local area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
	local ystride = area.ystride -- Tip : the ystride of a VoxelArea is the number to add to the array index to get the index of the position above. It's faster because it avoids to completely recalculate the index.
	local zstride = area.zstride

	local chulens = vector.add(vector.subtract(maxp, minp), 1) -- Size of the generated area, used by noisemaps
	local minp2d = pos2d(minp)

	-- The biomemap is a table of biome index numbers for each horizontal
	--  location. It's created in the mapgen, and is right most of the time.
	--  It's off in about 1% of cases, for various reasons.
	-- Bear in mind that biomes can change from one voxel to the next.
	local biomemap = minetest.get_mapgen_object("biomemap")
	--local filename = "biome_coords.txt";
	--local path = minetest.get_worldpath()..'/'..filename;
	--local file = io.open( path, 'w' );

	-- Calculate the noise values
	local n1 = lib_ecology.noisemap(1, minp2d, chulens)
	local n2 = lib_ecology.noisemap(2, minp2d, chulens)
	local n3 = lib_ecology.noisemap(3, minp2d, chulens)
	local n4 = lib_ecology.noisemap(4, minp2d, chulens)
	local n5 = lib_ecology.noisemap(5, minp2d, chulens)
	local n6 = lib_ecology.noisemap(6, minp, chulens)
	local n7 = lib_ecology.noisemap(7, minp2d, chulens)
	local n8 = lib_ecology.noisemap(8, minp, chulens)
	local n9 = lib_ecology.noisemap(9, minp, chulens)
	local n10 = lib_ecology.noisemap(10, minp, chulens)
	local n11 = lib_ecology.noisemap(11, minp, chulens)
	local n12 = lib_ecology.noisemap(12, minp, chulens)
	local n13 = lib_ecology.noisemap(13, minp2d, chulens)
	local n14 = lib_ecology.noisemap(14, minp2d, chulens)
	local n15 = lib_ecology.noisemap(15, minp2d, chulens)
	local n16 = lib_ecology.noisemap(16, minp2d, chulens)
	local n17 = lib_ecology.noisemap(17, minp2d, chulens)
	local n18 = lib_ecology.noisemap(18, minp2d, chulens)
	local n21 = lib_ecology.noisemap(21, minp2d, chulens)
	local n22 = lib_ecology.noisemap(22, minp2d, chulens)
	local n23 = lib_ecology.noisemap(23, minp2d, chulens)

	local node_match_cache = {}

	-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
	local t1 = os.clock()

	-- the mapgen algorithm
	local index_2d = 0
	local write = false
	local relight = false
	local huge_cave = false
	local hug

	if lib_ecology.use_gennotify then
		if gennotify.alternative_cave then
			huge_cave = true
		end
	elseif maxp.y < -300 then
		if gennotify.alternative_cave then
			huge_cave = true
		end

		hug = survey(data, area, maxp, minp, node['lava'], node['water'], node['air'])

		if huge_cave ~= hug then
			print("fake gennotify screwed up")
		end
	end


	local index_3d, air_count, ground
	local index_3d_below, index_3d_above, surround
	local v1, v2, v3, v4, v5, v7, v13, v14, v15, v16, v18
	local n, biome, sr, placeable, pos, count
	local stone_type, stone_depth, n23_val
	local soil, max

	for z = minp.z, maxp.z do
		for x = minp.x, maxp.x do
			index_2d = index_2d + 1

			index_3d = area:index(x, maxp.y, z) -- index of the data array, matching the position {x, y, z}
			air_count = 0
			ground = heightmap[index_2d]
			--if ground >= minp.y and ground <= maxp.y then
			--	local index_ground = index_3d - ystride * (maxp.y - ground)
			--	if data[index_ground] == node["air"] then
			--		print("*** bad heightmap at ("..x..","..ground..","..z..")")
			--		--ground = -31000
			--	end
			--end

			v1, v2, v3, v4, v5, v7, v13, v14, v15, v16, v18 = n1[index_2d], n2[index_2d], n3[index_2d], n4[index_2d], n5[index_2d], n7[index_2d], n13[index_2d], n14[index_2d], n15[index_2d], n16[index_2d], n18[index_2d] -- take the noise values for 2D noises

			for y = maxp.y, minp.y, -1 do -- for each node in vertical line
				index_3d_below = index_3d - ystride
				index_3d_above = index_3d + ystride
				surround = true

				-- Determine if a plant/dirt block can be placed without showing.
				-- Avoid the edges of the chunk, just to make things easier.
				if y < maxp.y and x > minp.x and x < maxp.x and z > minp.z and z < maxp.z and (data[index_3d] == node["sand"] or data[index_3d] == node["dirt"]) then
					if data[index_3d_above] == node["river_water_source"] or data[index_3d_above] == node["water_source"] then
						-- Check to make sure that a plant root is fully surrounded.
						-- This is due to the kludgy way you have to make water plants
						--  in minetest, to avoid bubbles.
						for x1 = -1,1,2 do
							n = data[index_3d+x1] 
							if n == node["river_water_source"] or n == node["water_source"] or n == node["air"] then
								surround = false
							end
						end
						for z1 = -zstride,zstride,2*zstride do
							n = data[index_3d+z1] 
							if n == node["river_water_source"] or n == node["water_source"] or n == node["air"] then
								surround = false
							end
						end
					end

					if y >= light_depth and (data[index_3d] == node["sand"] or data[index_3d] == node["dirt"]) and (data[index_3d_above] == node["water_source"] or data[index_3d_above] == node["river_water_source"]) then
						-- Check the biomes and plant water plants, if called for.
						biome = lib_ecology.biome_ids[biomemap[index_2d]]
						--file:write(biome .. " @: X " .. x .. ", Z " .. z .. "\n")
						if y < water_level and data[index_3d_above + ystride] == node["water_source"] and table.contains(coral_biomes, biome) and n21[index_2d] < -0.1 and math.random(1,3) ~= 1 then
							sr = math.random(1,100)
							if sr < 4 then
								data[index_3d_above] = node["brain_coral"]
							elseif sr < 6 then
								data[index_3d_above] = node["dragon_eye"]
							elseif sr < 35 then
								data[index_3d_above] = node["staghorn_coral"]
							elseif sr < 100 then
								data[index_3d_above] = node["pillar_coral"]
							end
						elseif surround then
							for _, desc in pairs(lib_ecology.water_plants) do
								placeable = false

								if not node_match_cache[desc] then
									node_match_cache[desc] = {}
								end

								if node_match_cache[desc][data[index_3d]] then
									placeable = node_match_cache[desc][data[index_3d]]
								else
									-- This is a great way to match all node type strings
									-- against a given node (or nodes). However, it's slow.
									-- To speed it up, we cache the results for each plant
									-- on each node, and avoid calling find_nodes every time.
									pos, count = minetest.find_nodes_in_area({x=x,y=y,z=z}, {x=x,y=y,z=z}, desc.place_on)
									if #pos > 0 then
										placeable = true
									end
									node_match_cache[desc][data[index_3d]] = placeable 
								end

								if placeable and desc.fill_ratio and desc.content_id then
									biome = lib_ecology.biome_ids[biomemap[index_2d]]
									--file:write(biome .. " @: X " .. x .. ", Z " .. z .. "\n")

									if not desc.biomes or (biome and desc.biomes and table.contains(desc.biomes, biome)) then
										if math.random() <= desc.fill_ratio then
											data[index_3d] = desc.content_id
											write = true
										end
									end
								end
							end
						end
					end
				end

				-- on top of the water
				if y > minp.y and data[index_3d] == node["air"] and data[index_3d_below] == node["river_water_source"] then
					biome = lib_ecology.biome_ids[biomemap[index_2d]]
					--file:write(biome .. " @: X " .. x .. ", Z " .. z .. "\n")
					-- I haven't figured out what the decoration manager is
					--  doing with the noise functions, but this works ok.
					if table.contains(water_lily_biomes, biome) and n21[index_2d] > 0.5 and math.random(1,15) == 1 then
						data[index_3d] = node["waterlily"]
						write = true
					end
				end

				-- Handle caves.
				if (y < ground - 5 or y < -100) and (data[index_3d] == node["air"] or data[index_3d] == node["river_water_source"] or data[index_3d] == node["water_source"]) then
					relight = true

					stone_type = node["stone"]
					stone_depth = 1
					n23_val = n23[index_2d] + n22[index_2d]
					if n23_val < -0.8 then
						if y < deep then
							stone_type = node["ice"]
							stone_depth = 2
						else
							stone_type = node["thinice"]
							stone_depth = 2
						end
					elseif n23_val < -0.7 then
						stone_type = node["lichen"]
					elseif n23_val < -0.3 then
						stone_type = node["moss"]
					elseif n23_val < 0.2 then
						stone_type = node["lichen"]
					elseif n23_val < 0.5 then
						stone_type = node["algae"]
					elseif n23_val < 0.6 then
						stone_type = node["salt"]
						stone_depth = 2
					elseif n23_val < 0.8 then
						stone_type = node["coalblock"]
						stone_depth = 2
					else
						stone_type = node["hcobble"]
					end
					--	"glow"

					-- Change stone per biome.
					if data[index_3d_below] == node["stone"] then
						data[index_3d_below] = stone_type
						if stone_depth == 2 then
							data[index_3d_below - ystride] = stone_type
						end
						write = true
					end
					if data[index_3d_above] == node["stone"] then
						data[index_3d_above] = stone_type
						if stone_depth == 2 then
							data[index_3d_above + ystride] = stone_type
						end
						write = true
					end

					if (data[index_3d_above] == node["lichen"] or data[index_3d_above] == node["moss"]) and math.random(1,20) == 1 then
						data[index_3d_above] = node["fungal_stone"]
						write = true
					end

					if data[index_3d] == node["air"] then
						sr = math.random(1,1000)

						-- fluids
						if (not huge_cave) and data[index_3d_below] == node["stone"] and sr < 10 then
								data[index_3d] = node["lava"]
						elseif (not huge_cave) and data[index_3d_below] == node["moss"] and sr < 10 then
								data[index_3d] = node["river_water_source"]
						-- hanging down
						elseif data[index_3d_above] == node["ice"] and sr < 80 then
							data[index_3d] = node["icicle_down"]
							write = true
						elseif (data[index_3d_above] == node["lichen"] or data[index_3d_above] == node["moss"] or data[index_3d_above] == node["algae"] or data[index_3d_above] == node["stone"]) and sr < 80 then
							if data[index_3d_above] == node["algae"] then
								data[index_3d] = node["stalactite_slimy"]
							elseif data[index_3d_above] == node["moss"] then
								data[index_3d] = node["stalactite_mossy"]
							else
								data[index_3d] = node["stalactite"]
							end
							write = true
						-- standing up
						elseif data[index_3d_below] == node["coalblock"] and sr < 20 then
							data[index_3d] = node["flame"]
						elseif data[index_3d_below] == node["ice"] and sr < 80 then
							data[index_3d] = node["icicle_up"]
							write = true
						elseif (data[index_3d_below] == node["lichen"] or data[index_3d_below] == node["algae"] or data[index_3d_below] == node["stone"] or data[index_3d_below] == node["moss"]) and sr < 80 then
							if data[index_3d_below] == node["algae"] then
								data[index_3d] = node["stalagmite_slimy"]
							elseif data[index_3d_below] == node["moss"] then
								data[index_3d] = node["stalagmite_mossy"]
							elseif data[index_3d_below] == node["lichen"] or data[index_3d_above] == node["stone"] then
								data[index_3d] = node["stalagmite"]
							end
						-- vegetation
						elseif (data[index_3d_below] == node["lichen"] or data[index_3d_below] == node["algae"]) and n23_val >= -0.7 then
							if sr < 110 then
								data[index_3d] = node["mushroom_red"]
							elseif sr < 140 then
								data[index_3d] = node["mushroom_brown"]
							elseif air_count > 1 and sr < 160 then
								data[index_3d_above] = node["mushroom_cap_huge"]
								data[index_3d] = node["mushroom_stem"]
							elseif air_count > 2 and sr < 170 then
								data[index_3d + 2 * ystride] = node["mushroom_cap_giant"]
								data[index_3d_above] = node["mushroom_stem"]
								data[index_3d] = node["mushroom_stem"]
							elseif huge_cave and air_count > 5 and sr < 180 then
								lib_ecology.make_fungal_tree(data, area, index_3d, math.random(2,math.min(air_count, 12)), node["fungal_tree_leaves"][math.random(1,#node["fungal_tree_leaves"])], node["fungal_tree_fruit"])
								data[index_3d_below] = node["dirt"]
								write = true
							elseif sr < 300 then
								data[index_3d_below] = node["dirt"]
								write = true
							end
							if data[index_3d] ~= node["air"] then
								data[index_3d_below] = node["dirt"]
								write = true
							end
						end
					end

					if data[index_3d] == node["air"] then
						air_count = air_count + 1
					end
				end

				if data[index_3d] == node["dirt"] or data[index_3d] == node["dirt_with_snow"] or data[index_3d] == node["dirt_with_grass"] or data[index_3d] == node["dirt_with_dry_grass"] or data[index_3d] == node["sand"] then
					-- Choose biome, by default normal dirt
					soil = "dirt"
					max = math.max(v13, v14, v15) -- the biome is the maximal of these 3 values.
					if max > dirt_threshold then -- if one of these values is bigger than dirt_threshold, make clayey, silty or sandy dirt, depending on the case. If none of clay, silt or sand is predominant, make normal dirt.
						if v13 == max then
							if v13 > clay_threshold then
								soil = "clay_over"
							else
								soil = "clay_under"
							end
						elseif v14 == max then
							if v14 > silt_threshold then
								soil = "silt_over"
							else
								soil = "silt_under"
							end
						else
							soil = "sand"
						end
					end

					if data[index_3d] == node["dirt"] then
						data[index_3d] = soil_translate[soil].dirt
						write = true
					elseif data[index_3d] == node["dirt_with_snow"] then
						data[index_3d] = soil_translate[soil].snow
						write = true
					elseif data[index_3d] == node["dirt_with_grass"] then
						data[index_3d] = soil_translate[soil].lawn
						write = true
					elseif data[index_3d] == node["dirt_with_dry_grass"] then
						data[index_3d] = soil_translate[soil].dry
						write = true
					elseif data[index_3d] == node["sand"] then
						sr = math.random(1,50)
						if lib_ecology.glow and sr == 1 then
							data[index_3d] = node["glowing_sand"]
							write = true
						elseif sr < 10 then
							data[index_3d] = node["sand_with_rocks"]
							write = true
						end
					end
				end

				if data[index_3d] ~= node["air"] then
					air_count = 0
				end
				index_3d = index_3d_below
			end
		end
	end
	
	--file:write("BIOME DATA EOF")
	--file:close();

	local t2 = os.clock()

	-- execute voxelmanip boring stuff to write to the map...
	if write then
		vm:set_data(data)
	end

	local t3 = os.clock()

	if write then
		-- probably not necessary
		if relight then
			--vm:set_lighting({day = 10, night = 10})
		end

		-- This seems to be necessary to avoid lighting problems.
		vm:calc_lighting()

		-- probably not necessary
		--vm:update_liquids()
	end

	local t4 = os.clock()

	if write then
		vm:write_to_map()
	end

	local t5 = os.clock()

	table.insert(mapgen_times.noisemaps, 0)
	table.insert(mapgen_times.preparation, t1 - t0)
	table.insert(mapgen_times.loops, t2 - t1)
	table.insert(mapgen_times.writing, t3 - t2 + t5 - t4)
	table.insert(mapgen_times.liquid_lighting, t4 - t3)
	table.insert(mapgen_times.make_chunk, t5 - t0)

	-- Deal with memory issues. This, of course, is supposed to be automatic.
	local mem = math.floor(collectgarbage("count")/1024)
	if mem > 500 then
		print("Valleys_c is manually collecting garbage as memory use has exceeded 500K.")
		collectgarbage("collect")
	end
end

local function mean( t )
  local sum = 0
  local count= 0

  for k,v in pairs(t) do
    if type(v) == 'number' then
      sum = sum + v
      count = count + 1
    end
  end

  return (sum / count)
end

minetest.register_on_shutdown(function()
	if #mapgen_times.make_chunk == 0 then
		return
	end

	local average, standard_dev
	minetest.log("Valleys_C lua Mapgen Times:")

	average = mean(mapgen_times.liquid_lighting)
	minetest.log("  liquid_lighting: - - - - - - - - - - - -  "..average)

	average = mean(mapgen_times.loops)
	minetest.log("  loops: - - - - - - - - - - - - - - - - -  "..average)

	average = mean(mapgen_times.make_chunk)
	minetest.log("  makeChunk: - - - - - - - - - - - - - - -  "..average)

	average = mean(mapgen_times.noisemaps)
	minetest.log("  noisemaps: - - - - - - - - - - - - - - -  "..average)

	average = mean(mapgen_times.preparation)
	minetest.log("  preparation: - - - - - - - - - - - - - -  "..average)

	average = mean(mapgen_times.writing)
	minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
end)


-- Call the mapgen function lib_ecology.generate on mapgen.
--  (located in voxel.lua)
minetest.register_on_generated(lib_ecology.generate)

