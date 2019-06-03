---------------------
-- Deciduous Trees --
---------------------

-- Make some leaves of different colors (but the same properties).
local newnode = lib_ecology.clone_node("default:leaves")
if lib_ecology.noleafdecay then
	newnode.groups.leafdecay = 0
end
newnode.tiles = {"default_leaves.png^[colorize:#FF0000:20"}
minetest.register_node("lib_ecology:leaves2", newnode)
newnode.tiles = {"default_leaves.png^[colorize:#FFFF00:20"}
minetest.register_node("lib_ecology:leaves3", newnode)
newnode.tiles = {"default_leaves.png^[colorize:#00FFFF:20"}
minetest.register_node("lib_ecology:leaves4", newnode)
newnode.tiles = {"default_leaves.png^[colorize:#00FF00:20"}
minetest.register_node("lib_ecology:leaves5", newnode)

if lib_ecology.glow then
	minetest.register_node("lib_ecology:tree_glowing_moss", {
		description = "Tree with glowing moss",
		tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png^trunks_moss.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		light_source = 4,
		drop = 'default:tree',
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
end

-- create a schematic for a spherical tree.
function lib_ecology.generate_tree_schematic(trunk_height, radii, trunk, leaf, fruit, limbs)
	-- trunk_height refers to the amount of trunk visible below any leaves.
	local height = trunk_height + radii.y * 2 + 2
	local width = 2 * radii.z + 1
	local trunk_top = height-radii.y-1

	local s = lib_ecology.schematic_array(width, height, width)

	-- the main trunk
	for y = 1,trunk_top do
		local i = radii.z*width*height + y*width + radii.x + 1
		if trunk == "default:tree" and lib_ecology.glow and math.random(1,10) == 1 then
			s.data[i].name = "lib_ecology:tree_glowing_moss"
		else
			s.data[i].name = trunk
		end
		s.data[i].param1 = 255
		s.data[i].force_place = false
	end

	-- some leaves for free
	lib_ecology.generate_leaves(s, leaf, {x=0, y=trunk_top, z=0}, radii.x, fruit)

	-- Specify a table of limb positions...
	if radii.x > 3 and limbs then
		for _, p in pairs(limbs) do
			local i = (p.z+radii.z)*width*height + p.y*width + (p.x+radii.x) + 1
			s.data[i].name = trunk
			s.data[i].param1 = 255
			s.data[i].force_place = false
			lib_ecology.generate_leaves(s, leaf, p, radii.x, fruit, true)
		end
		-- or just do it randomly.
	elseif radii.x > 3 then
		for z = -radii.z,radii.z do
			for y = -radii.y,radii.y do
				for x = -radii.x,radii.x do
					-- a smaller spheroid inside the radii
					if x^2/(radii.x-3)^2 + y^2/(radii.y-3)^2 + z^2/(radii.z-3)^2 <= 1 then
						if math.random(1,6) == 1 then
							local i = (z+radii.z)*width*height + (y+trunk_top)*width + (x+radii.x) + 1

							s.data[i].name = trunk
							s.data[i].param1 = 255
							s.data[i].force_place = false
							lib_ecology.generate_leaves(s, leaf, {x=x, y=trunk_top+y, z=z}, radii.x, fruit, true)
						end
					end
				end
			end
		end
	end

	return s
end

-- Create a spheroid of leaves.
function lib_ecology.generate_leaves(s, leaf, pos, radius, fruit, adjust)
	local height = s.size.y
	local width = s.size.x
	local rx = math.floor(s.size.x / 2)
	local rz = math.floor(s.size.z / 2)
	local r1 = math.min(3, radius)  -- leaf decay radius
	local probs = {255,200,150,100,75}

	for z = -r1,r1 do
		for y = -r1,r1 do
			for x = -r1,r1 do
				if x+pos.x >= -rx and x+pos.x <= rx and y+pos.y >= 0 and y+pos.y < height and z+pos.z >= -rz and z+pos.z <= rz then
					local i = (z+pos.z+rz)*width*height + (y+pos.y)*width + (x+pos.x+rx) + 1
					local dist1 = math.sqrt(x^2 + y^2 + z^2)
					local dist2 = math.sqrt((x+pos.x)^2 + (z+pos.z)^2)
					if dist1 <= r1 then
						local newprob = probs[math.max(1, math.ceil(dist1))]
						if s.data[i].name == "air" then
							if fruit and (rx < 3 or dist2 / rx > 0.5) and math.random(1,10) == 1 then
								s.data[i].name = fruit
								s.data[i].param1 = 127
							else
								s.data[i].name = leaf
								s.data[i].param1 = newprob
							end
						elseif adjust and s.data[i].name == leaf then
							s.data[i].param1 = math.max(s.data[i].param1, newprob)
						end
					end
				end
			end
		end
	end
end

-- generic deciduous trees
lib_ecology.schematics.deciduous_trees = {}
local leaves = {"default:leaves", "lib_ecology:leaves2", "lib_ecology:leaves3", "lib_ecology:leaves4", "lib_ecology:leaves5"}
for i = 1,#leaves do
	local max_r = 6
	local fruit = nil

	if i == 1 then
		fruit = "default:apple"
	end

	for r = 3,max_r do
		local schem = lib_ecology.generate_tree_schematic(2, {x=r, y=r, z=r}, "default:tree", leaves[i], fruit)

		push(lib_ecology.schematics.deciduous_trees, schem)

		--fill_ratio = (max_r-r+1)/1700,
		minetest.register_decoration({
			deco_type = "schematic",
			sidelen = 80,
			place_on = {"default:dirt_with_grass", "lib_materials:dirt_course_with_grass", "lib_materials:dirt_silty_with_grass", "lib_materials:dirt_clayey_with_grass",},
			y_min = 4,
			fill_ratio = (max_r-r+1)/3600,
			biomes = {"lib_ecology_deciduous_forest", "temperate_temperate", "cool_temperate", "hot_temperate", "warm_temperate", },
			schematic = schem,
			flags = "place_center_x, place_center_z",
			rotation = "random",
		})
	end
end

-- Place the schematic when a sapling grows.
function default.grow_new_apple_tree(pos, bad)
	local schem = lib_ecology.schematics.deciduous_trees[math.random(1,#lib_ecology.schematics.deciduous_trees)]
	local adj = {x = pos.x - math.floor(schem.size.x / 2),
	             y = pos.y - 1,
	             z = pos.z - math.floor(schem.size.z / 2)}
	minetest.place_schematic(adj, schem, 'random', nil, true)
end

-- Cherries
lib_ecology.schematics.cherry_trees = {}
lib_ecology.tree_cherry_blossom_01 = lib_ecology.generate_tree_schematic(2, {x=2, y=2, z=2}, "lib_ecology:tree_cherry_blossom_trunk", "lib_ecology:tree_cherry_blossom_leaves", nil)
push(lib_ecology.schematics.cherry_trees, lib_ecology.tree_cherry_blossom_01)
lib_ecology.tree_cherry_blossom_02 = lib_ecology.generate_tree_schematic(2, {x=3, y=3, z=3}, "lib_ecology:tree_cherry_blossom_trunk", "lib_ecology:tree_cherry_blossom_leaves", nil)
push(lib_ecology.schematics.cherry_trees, lib_ecology.tree_cherry_blossom_02)

-- do
	-- local max_r = 3
	-- local fruit = nil

	-- for r = 2,max_r do
		-- local schem = lib_ecology.generate_tree_schematic(2, {x=r, y=r, z=r}, "lib_ecology:cherry_blossom_trunk", "lib_ecology:cherry_blossom_leaves", fruit)

		-- push(lib_ecology.schematics.cherry_trees, schem)

		-- -- -- minetest.register_decoration({
			-- -- -- deco_type = "schematic",
			-- -- -- sidelen = 80,
			-- -- -- place_on = {"default:dirt_with_grass", "lib_materials:dirt_course_with_grass", },
			-- -- -- y_min = 4,
			-- -- -- fill_ratio = (max_r-r+1)/5000,
			-- -- -- biomes = {"lib_ecology_deciduous_forest", "cool_temperate", "temperate_temperate",},
			-- -- -- schematic = schem,
			-- -- -- flags = "place_center_x, place_center_z",
			-- -- -- rotation = "random",
		-- -- -- })
	-- end
-- end

-- Birch trees
lib_ecology.schematics.birch_trees = {}
lib_ecology.tree_birch_02 = lib_ecology.generate_tree_schematic(2, {x=2, y=3, z=2}, "lib_ecology:tree_birch_02_trunk", "lib_ecology:tree_birch_02_leaves")
push(lib_ecology.schematics.birch_trees, lib_ecology.tree_birch_02)
lib_ecology.tree_birch_03 = lib_ecology.generate_tree_schematic(3, {x=2, y=3, z=2}, "lib_ecology:tree_birch_02_trunk", "lib_ecology:tree_birch_02_leaves")
push(lib_ecology.schematics.birch_trees, lib_ecology.tree_birch_03)
lib_ecology.tree_birch_04 = lib_ecology.generate_tree_schematic(4, {x=2, y=3, z=2}, "lib_ecology:tree_birch_02_trunk", "lib_ecology:tree_birch_02_leaves")
push(lib_ecology.schematics.birch_trees, lib_ecology.tree_birch_04)

-- do
	-- local max_h = 4

	-- for h = 2,max_h do
		-- local schem = lib_ecology.generate_tree_schematic(h, {x=2, y=3, z=2}, "lib_ecology:birch_02_trunk", "lib_ecology:birch_02_leaves")

		-- push(lib_ecology.schematics.birch_trees, schem)

		-- -- -- minetest.register_decoration({
			-- -- -- deco_type = "schematic",
			-- -- -- sidelen = 80,
			-- -- -- place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter", "lib_materials:dirt_course_with_coniferous_litter",},
			-- -- -- y_min = 4,
			-- -- -- fill_ratio = (max_h-h+1)/4000,
			-- -- -- biomes = {"lib_ecology_coniferous_forest", "lib_ecology_taiga", "cool_semiarid", "cold_temperate", "cool_humid", },
			-- -- -- schematic = schem,
			-- -- -- flags = "place_center_x, place_center_z",
			-- -- -- rotation = "random",
		-- -- -- })
	-- end
-- end

