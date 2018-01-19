---------------------
-- Luminous Trees --
---------------------

minetest.register_node("lib_ecology:leaves_lumin", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_leaves.png^[brighten"},
	special_tiles = {"default_leaves_simple.png^[brighten"},
	paramtype = "light",
	is_ground_content = false,
	light_source = 8,
	groups = {snappy = 3, leafdecay = 4, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			--{
			--	-- player will get sapling with 1/20 chance
			--	items = {'default:sapling'},
			--	rarity = 20,
			--},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'lib_ecology:leaves_lumin'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("lib_ecology:lumin_tree", {
	description = "Lumin Tree",
	tiles = {
		"default_tree_top.png", "default_tree_top.png", "valc_lumin_tree.png"
	},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed", 
		fixed = { {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, }
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})


function lib_ecology.generate_luminous_schematic(trunk_height_in)
	local trunk_height = trunk_height_in + 1
	local height = trunk_height + 3
	local radius = 1
	local width = 3
	local s = lib_ecology.schematic_array(width, height, width)

	-- the main trunk
	for y = 1,trunk_height do
		local i = (0+radius)*width*height + y*width + (0+radius) + 1
		s.data[i].name = "lib_ecology:lumin_tree"
		s.data[i].param1 = 255
		s.data[i].force_place = true
	end

	for z = -1,1 do
		for y = 3, height-1 do
			for x = -1,1 do
				local i = (z+radius)*width*height + y*width + (x+radius) + 1
				if y > height then
					s.data[i].name = "lib_ecology:leaves_lumin"
					if x == 0 and z == 0 then
						s.data[i].param1 = 255
					else
						s.data[i].param1 = 127
					end
				elseif x == 0 and z == 0 then
					s.data[i].name = "lib_ecology:leaves_lumin"
					s.data[i].param1 = 255
				elseif x ~= 0 or z ~= 0 then
					s.data[i].name = "lib_ecology:leaves_lumin"
					s.data[i].param1 = 127
				end
			end
		end
	end

	return s
end

-- generic luminous trees
lib_ecology.schematics.luminous_trees = {}
local leaves = {"lib_ecology:leaves_lumin"}
for i = 1,#leaves do
	local max_r = 6
	local fruit = nil

	for r = 3,max_r do
		local schem = lib_ecology.generate_luminous_schematic(r)

		push(lib_ecology.schematics.luminous_trees, schem)

		minetest.register_decoration({
			deco_type = "schematic",
			sidelen = 80,
			place_on = {"group:soil"},
			y_min = 4,
			fill_ratio = (max_r-r+1)/5000,
			biomes = {"lib_ecology_coniferous_forest", "lib_ecology_deciduous_forest"},
			schematic = schem,
			flags = "place_center_x, place_center_z",
			rotation = "random",
		})
	end
end
