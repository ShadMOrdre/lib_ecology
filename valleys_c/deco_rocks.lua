----------------------
-- Decorative Rocks --
----------------------

-- I'm feeling a bit zen...

-- Create a simple sphereoid from nodeboxes.
-- This isn't as nifty as I originally thought. The large ones are
-- ugly and the small ones are nearly invisible. I may stick with cubes.
local function step_sphere(grid, pos, diameters, embed)
	local step = {x=diameters.x * 0.2, y=diameters.y * 0.2, z=diameters.z * 0.2}
	local rock = {}

	if embed then
		embed = 1
	else
		embed = 0
	end

	rock[1] = pos.x + step.x
	rock[2] = pos.y + (step.y * embed)
	rock[3] = pos.z
	rock[4] = pos.x + diameters.x - step.x
	rock[5] = diameters.y + pos.y - step.y - (step.y * embed)
	rock[6] = pos.z + diameters.z
	push(grid, rock)

	rock = {}
	rock[1] = pos.x
	rock[2] = pos.y + (step.y * embed)
	rock[3] = pos.z + step.z
	rock[4] = pos.x + step.x
	rock[5] = diameters.y + pos.y - step.y - (step.y * embed)
	rock[6] = pos.z + diameters.z - step.z
	push(grid, rock)

	rock = {}
	rock[1] = pos.x + diameters.x - step.x
	rock[2] = pos.y + (step.y * embed)
	rock[3] = pos.z + step.z
	rock[4] = pos.x + diameters.x
	rock[5] = diameters.y + pos.y - step.y - (step.y * embed)
	rock[6] = pos.z + diameters.z - step.z
	push(grid, rock)

	if not embed then
		rock = {}
		rock[1] = pos.x + step.x
		rock[2] = pos.y
		rock[3] = pos.z + step.z
		rock[4] = pos.x + diameters.x - step.x
		rock[5] = step.y + pos.y
		rock[6] = pos.z + diameters.z - step.z
		push(grid, rock)
	end

	rock = {}
	rock[1] = pos.x + step.x
	rock[2] = diameters.y + pos.y - step.y - (step.y * embed)
	rock[3] = pos.z + step.z
	rock[4] = pos.x + diameters.x - step.x
	rock[5] = diameters.y + pos.y - (step.y * embed)
	rock[6] = pos.z + diameters.z - step.z
	push(grid, rock)
end

-- Place a small nodebox.
local function small_cube(grid, pos, diameters)
	local rock = {}

	rock[1] = pos.x
	rock[2] = pos.y
	rock[3] = pos.z
	rock[4] = pos.x + diameters.x
	rock[5] = pos.y + diameters.y
	rock[6] = pos.z + diameters.z
	push(grid, rock)
end


-- Create some tiles of small rocks that can be picked up.
local default_grid
local tiles = {"default_stone.png", "default_desert_stone.png", "default_sandstone.png"}

for grid_count = 1,6 do
	local grid = {}
	for rock_count = 2, math.random(1,4) + 1 do
		local diameter = math.random(5,15)/100
		local x = math.random(1,80)/100 - 0.5
		local z = math.random(1,80)/100 - 0.5
		--step_sphere(grid, {x=x,y=-0.5,z=z}, {x=diameter, y=diameter, z=diameter})
		small_cube(grid, {x=x,y=-0.5,z=z}, {x=diameter, y=diameter, z=diameter})
	end

	--local stone = tiles[math.random(1,#tiles)]
	local stone = tiles[(grid_count % #tiles) + 1]

	minetest.register_node("lib_ecology:small_rocks"..grid_count, {
		description = "Small Rocks",
		tiles = {stone},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		drawtype = "nodebox",
		buildable_to = true,
		node_box = { type = "fixed", 
								 fixed = grid },
		selection_box = { type = "fixed", 
											fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
										},
		groups = {stone=1, oddly_breakable_by_hand=3},
		drop = "lib_ecology:small_rocks",
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_decoration({
		deco_type = "simple",
		decoration = "lib_ecology:small_rocks"..grid_count,
		sidelen = 80,
		place_on = {"group:soil", "group:sand", "group:stone"},
		fill_ratio = 0.002,
		biomes = {"lib_ecology_sandstone_grassland", "lib_ecology_tundra", "lib_ecology_taiga", "lib_ecology_stone_grassland", "lib_ecology_coniferous_forest", "lib_ecology_deciduous_forest", "lib_ecology_desert", "lib_ecology_cold_desert", "lib_ecology_savanna", "lib_ecology_rainforest", "lib_ecology_desertstone_grassland", },
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	default_grid = grid
end

-- This is the inventory item, so we don't have six different stacks.
minetest.register_node("lib_ecology:small_rocks", {
	description = "Small Rocks",
	tiles = {"default_stone.png"},
	inventory_image = "vmg_small_rocks.png",
	is_ground_content = true,
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", 
							 fixed = default_grid },
	selection_box = { type = "fixed", 
										fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
									},
	groups = {stone=1, oddly_breakable_by_hand=3},
	sounds = default.node_sound_stone_defaults(),
})


---- Create some larger rocks that can be mined.
--local tiles = {"default_stone.png", "default_desert_stone.png", "default_sandstone.png"}
--local sel = {{-0.4,-0.5,-0.4,0.4,0.0,0.3}, {-0.4,-0.5,-0.4,0.2,-0.1,0.3}, {-0.3,-0.5,-0.3,0.2,-0.2,0.3}}
--
--for count = 1,9 do
--	local stone = tiles[(count % #tiles) + 1]
--	--local grid = {}
--	--step_sphere(grid, {x=-0.25,y=-0.5,z=-0.25}, {x=0.5, y=0.3, z=0.5})
--
--	minetest.register_node("lib_ecology:medium_rock"..count, {
--		description = "Medium Rock",
--		tiles = {stone},
--		is_ground_content = true,
--		walkable = true,
--		paramtype = "light",
--		--drawtype = "mesh",
--		drawtype = "nodebox",
--		--mesh = "rock0"..math.ceil(count / 3)..".b3d",
--		node_box = {
--			type = "fixed", 
--			fixed = {
--				-0.25, -0.5, -0.25, 0.25, -0.25, 0.25,
--			},
--		},
--		selection_box = {type="fixed", fixed=sel[math.ceil(count / 3)]},
--		groups = {stone=1, cracky=3},
--		drop = "default:cobble",
--		sounds = default.node_sound_stone_defaults(),
--	})
--
--	minetest.register_decoration({
--		deco_type = "simple",
--		decoration = "lib_ecology:medium_rock"..count,
--		sidelen = 80,
--		place_on = {"group:soil", "group:sand"},
--		fill_ratio = 0.001,
--		biomes = {"sandstone_grassland", "tundra", "taiga", "stone_grassland", "coniferous_forest", "deciduous_forest", "desert", "cold_desert", "savanna", "rainforest", "desertstone_grassland", },
--		flags = "place_center_x, place_center_z",
--		rotation = "random",
--	})
--end


-- Small rocks can be used to create cobblestone, if you like.
minetest.register_craft({
	output = "default:cobble",
	recipe = {
		{"", "", ""},
		{"lib_ecology:small_rocks", "lib_ecology:small_rocks", ""},
		{"lib_ecology:small_rocks", "lib_ecology:small_rocks", ""},
	},
})

