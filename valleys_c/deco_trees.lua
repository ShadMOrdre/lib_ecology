-----------
-- Trees --
-----------

-- See textures/image-credits.txt

-- Change leafdecay ratings
minetest.add_group("default:leaves", {leafdecay = 4})
minetest.add_group("default:jungleleaves", {leafdecay = 4})
minetest.add_group("default:pine_needles", {leafdecay = 5})


-- a list of tree descriptions
lib_ecology.treelist = {
	{name="banana",
	 desc="Banana",
	 leaf="leaves",
	 leaf_desc="Leaves",
	 leaf_tile="banana_leaves",
	 fruit="banana",
	 fruit_desc="Banana",
	 drop_rarity=20,
	 selbox={-0.35, -0.5, -0.35, 0.35, 0.5, 0.35},
	 health=3,
	 trunk_dia=0.75},

	{name="birch",
	 desc="Birch",
	 leaf="leaves",
	 leaf_desc="Leaves",
	 leaf_tile="birch_leaves",
	 drop_rarity=20,
	 trunk_dia=0.5},
	{name="cherry_blossom",
	 desc="Cherry Blossom",
	 leaf="leaves",
	 leaf_desc="Leaves",
	 leaf_tile="cherry_blossom_leaves",
	 drop_rarity=20,
	 trunk_dia=0.5},

	{name="fir",
	 desc="Fir",
	 leaf="needles",
	 leaf_desc="Needles",
	 leaf_tile="fir_leaves",
	 drop_rarity=20,
	 trunk_dia=1.0},
}


for _, tree in ipairs(lib_ecology.treelist) do
	-- a standard node description
	local node_d = {
		description = tree.desc.." Tree",
		tiles = {
			"vmg_"..tree.name.."_tree_top.png",
			"vmg_"..tree.name.."_tree_top.png",
			"vmg_"..tree.name.."_tree.png"
		},
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		sounds = default.node_sound_wood_defaults(),
		on_place = minetest.rotate_node,
	}
	-- Some trunks aren't a meter wide.
	if tree.trunk_dia and tree.trunk_dia ~= 1 then
		local radius = tree.trunk_dia / 2
		node_d.paramtype = "light"
		node_d.drawtype = "nodebox"
		node_d.node_box = { type = "fixed", 
			fixed = { {-radius, -0.5, -radius, radius, 0.5, radius}, }
		}
	end
	minetest.register_node("lib_ecology:"..tree.name.."_tree", node_d)

	if tree.name ~= "banana" then
		-- planks that come from the tree
		minetest.register_node("lib_ecology:"..tree.name.."_wood", {
			description = tree.desc.." Planks",
			tiles = {"vmg_"..tree.name.."_wood.png"},
			is_ground_content = true,
			groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
			sounds = default.node_sound_wood_defaults(),
		})

		-- how to get the planks
		minetest.register_craft({
			output = "lib_ecology:"..tree.name.."_wood 5",
			recipe = {
				{"lib_ecology:"..tree.name.."_tree"}
			}
		})

		-- appropriate wooden stairs and slabs
		-- -- if minetest.get_modpath("stairs") then
			-- -- stairs.register_stair_and_slab(
				-- -- "vmg_"..tree.name.."_tree",
				-- -- "lib_ecology:"..tree.name.."_tree",
				-- -- {snappy=1, choppy=2, oddly_breakable_by_hand=1, flammable=2 },
				-- -- {	"vmg_"..tree.name.."_tree_top.png",
					-- -- "vmg_"..tree.name.."_tree_top.png",
					-- -- "vmg_"..tree.name.."_tree.png"
				-- -- },
				-- -- tree.desc.." Tree Stair",
				-- -- tree.desc.." Tree Slab",
				-- -- default.node_sound_wood_defaults()
			-- -- )
			-- -- stairs.register_stair_and_slab(
				-- -- "vmg_"..tree.name.."_wood",
				-- -- "lib_ecology:"..tree.name.."_wood",
				-- -- { snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3 },
				-- -- {"vmg_"..tree.name.."_wood.png" },
				-- -- tree.desc.." Planks Stair",
				-- -- tree.desc.." Planks Slab",
				-- -- default.node_sound_wood_defaults()
			-- -- )
		-- -- end
	end

	-- the tree's sapling form
	minetest.register_node("lib_ecology:"..tree.name.."_sapling", {
		description = tree.desc.." Sapling",
		drawtype = "plantlike",
		visual_scale = 1.0,
		tiles = {"vmg_"..tree.name.."_sapling.png"},
		inventory_image = "vmg_"..tree.name.."_sapling.png",
		wield_image = "vmg_"..tree.name.."_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
		},
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
		sounds = default.node_sound_leaves_defaults(),
	})

	-- leaves for the tree
	minetest.register_node("lib_ecology:"..tree.name.."_"..tree.leaf.."", {
		description = tree.desc.." "..tree.leaf_desc.."",
		drawtype = "allfaces_optional",
		waving = 1,
		visual_scale = 1.3,
		tiles = { "vmg_"..tree.leaf_tile..".png"},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy=3, leafdecay=4, flammable=2, leaves=1, leafdecay=1},
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:"..tree.name.."_sapling"}, rarity = tree.drop_rarity },
				{items = {"lib_ecology:"..tree.name.."_"..tree.leaf..""} }
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		after_place_node = default.after_place_leaves,
	})

	-- appropriate fruit
	if tree.fruit then
		minetest.register_node("lib_ecology:"..tree.fruit.."", {
			description = tree.fruit_desc,
			drawtype = "plantlike",
			visual_scale = 1.0,
			tiles = { "vmg_"..tree.fruit..".png" },
			inventory_image = "vmg_"..tree.fruit..".png",
			wield_image = "vmg_"..tree.fruit..".png",
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			is_ground_content = false,
			selection_box = {
				type = "fixed",
					fixed = tree.selbox
			},
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay=3,leafdecay_drop=1},
			-- Fruit makes you healthy.
			on_use = minetest.item_eat(tree.health),
			sounds = default.node_sound_leaves_defaults(),
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:"..tree.fruit.."", param2=1})
				end
			end,
		})
	end
end


-- list of all lib_ecology-specific saplings
lib_ecology.saplings = {
	{sapling="lib_ecology:banana_sapling",
	 schematics=lib_ecology.schematics.banana_plants},
	{sapling="lib_ecology:cherry_blossom_sapling",
	 schematics=lib_ecology.schematics.cherry_trees},
	{sapling="lib_ecology:birch_sapling",
	 schematics=lib_ecology.schematics.birch_trees},
 }

-- create a list of just the node names
local sapling_list = {}
for _, sap in pairs(lib_ecology.saplings) do
	push(sapling_list, sap.sapling)
end

-- This abm can handle all saplings.
minetest.register_abm({
	nodenames = sapling_list,
	interval = 10,
	chance = 50,
	action = function(pos, node)
		local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under or
		minetest.get_item_group(node_under.name, "soil") == 0 then
			return
		end

		for _, sap in lib_ecology.saplings do
			if node.name == sap.sapling then
				minetest.log("action", "A sapling grows into a tree at "..
					minetest.pos_to_string(pos))

				local schem = sap.schematics[math.random(1,#sap.schematics)]
				local adj = {x = pos.x - math.floor(schem.size.x / 2),
										 y = pos.y - 1,
										 z = pos.z - math.floor(schem.size.z / 2)}
				minetest.place_schematic(adj, schem, 'random', nil, true)
				break
			end
		end
	end,
})


-- tree creation code
dofile(lib_ecology.path.."/valleys_c/deco_deciduous.lua")
dofile(lib_ecology.path.."/valleys_c/deco_conifer.lua")
dofile(lib_ecology.path.."/valleys_c/deco_jungle.lua")
dofile(lib_ecology.path.."/valleys_c/deco_banana.lua")

if lib_ecology.glow then
	dofile(lib_ecology.path.."/valleys_c/deco_lumin.lua")
end
