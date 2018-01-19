--------------------------------------------------------------
-- Adapted from the work by Mossmanikin and VanessaE
-- License (everything): 	WTFPL
--------------------------------------------------------------

-----------
-- Ferns --
-----------

-- This is a simpler implementation of ferns as regular decorations.


-- Check that the original ferns mod is not loaded.
abstract_ferns = nil
if not abstract_ferns then
	local max_s = 3
	local images 	= { "ferns_fern.png", "ferns_fern_mid.png", "ferns_fern_big.png" }
	local sizes = {1,2,2.2}

	for s = 1,max_s do
		local fern_name = "lib_ecology:fern_"..string.format("%02d", s)
		minetest.register_node(fern_name, {
			description = "Lady-fern (Athyrium)",
			inventory_image = "ferns_fern.png",
			drawtype = "plantlike",
			visual_scale = sizes[s],
			paramtype = "light",
			tiles = { images[s] },
			walkable = false,
			buildable_to = true,
			groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1},
			sounds = default.node_sound_leaves_defaults(),
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			drop = "lib_ecology:fern_01",
		})

		minetest.register_decoration({
			deco_type = "simple",
			decoration = fern_name,
			sidelen = 80,
			place_on = {"default:dirt_with_grass", "default:mossycobble", "default:sand", "default:jungletree", "dirt_with_rainforest_litter"},
			fill_ratio = (max_s-s+1)/400,
			biomes = {"lib_ecology_taiga", "lib_ecology_coniferous_forest", "lib_ecology_deciduous_forest", "lib_ecology_savanna", "lib_ecology_savanna_swamp", "lib_ecology_rainforest", "lib_ecology_rainforest_swamp", "lib_ecology_desertstone_grassland", },
		})

		-- Supposedly ferns sometimes signal the presence of ores.
		-- I could try to plant them near ore, but why bother?
		--  Just place it under them occasionally.
		minetest.register_decoration({
			deco_type = "schematic",
			schematic = {size={x=1,y=5,z=1},
		    data={{name="default:stone_with_iron", param1=255},
			        {name="default:dirt", param1=255},
			        {name="default:dirt_with_grass", param1=255},
			        {name=fern_name, param1=255},
			        {name="air", param1=255}, }, },
			flags = "place_center_y, force_placement",
			sidelen = 80,
			place_on = {"default:dirt_with_grass", "default:mossycobble", "default:sand", "default:jungletree",},
			fill_ratio = (max_s-s+1)/4000,
			biomes = {"lib_ecology_taiga", "lib_ecology_coniferous_forest", "lib_ecology_deciduous_forest", "lib_ecology_savanna", "lib_ecology_savanna_swamp", "lib_ecology_rainforest", "lib_ecology_rainforest_swamp", "lib_ecology_desertstone_grassland", },
		})
	end


	----------------------------
	-- HORSETAIL  (EQUISETUM) --
	-- A true living fossil!  --
	----------------------------

	local node_names = {}

	for i = 1, 4 do
		local node_name = "lib_ecology:horsetail_" .. string.format("%02d", i)
		local node_img = "ferns_horsetail_" .. string.format("%02d", i) .. ".png"
		local node_desc
		local node_on_use = nil
		local node_drop = "lib_ecology:horsetail_04"

		if i == 1 then
			node_desc = "Young Horsetail (Equisetum)"
			node_on_use = minetest.item_eat(1) -- young ones edible https://en.wikipedia.org/wiki/Equisetum
			node_drop = node_name
		else
			node_desc = "Horsetail (Equisetum)"
		end

		node_names[i] = node_name

		minetest.register_node(node_name, {
			description = node_desc,
			drawtype = "plantlike",
			paramtype = "light",
			tiles = { node_img },
			inventory_image = node_img,
			walkable = false,
			buildable_to = true,
			groups = {snappy=3,flammable=2,attached_node=1,horsetail=1},
			sounds = default.node_sound_leaves_defaults(),
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			on_use = node_on_use,
			drop = node_drop,
		})

		minetest.register_decoration({
			deco_type = "simple",
			decoration = node_name,
			sidelen = 80,
			place_on = {"default:dirt_with_grass", "default:mossycobble", "default:sand", "default:jungletree", "default:gravel",},
			fill_ratio = 0.003,
			biomes = {"lib_ecology_taiga", "lib_ecology_coniferous_forest", "lib_ecology_deciduous_forest", "lib_ecology_savanna", "lib_ecology_savanna_swamp", "lib_ecology_rainforest", "lib_ecology_rainforest_swamp", "lib_ecology_desertstone_grassland", },
		})
	end


	----------------------------------
	-- Ferns - Crafting
	----------------------------------

	minetest.register_craft({
		type = "shapeless",
		output = "lib_ecology:fiddlehead 3",
		recipe = {"lib_ecology:fern_01"},
		replacements = {
			{"lib_ecology:fern_01", "lib_ecology:ferntuber"}
		},
	})

	minetest.register_craft({
		type = "shapeless",
		output = "lib_ecology:fiddlehead 3",
		recipe = {"lib_ecology:tree_fern_leaves"},
		replacements = {
			{"lib_ecology:tree_fern_leaves", "lib_ecology:sapling_tree_fern"}
		},
	})

	-----------------------
	-- FIDDLEHEAD
	-----------------------
	minetest.register_craftitem("lib_ecology:fiddlehead", {
		description = "Fiddlehead",
		inventory_image = "ferns_fiddlehead.png",
		on_use = minetest.item_eat(-1), -- slightly poisonous when raw
	})
	minetest.register_craft({
		type = "cooking",
		output = "lib_ecology:fiddlehead_roasted",
		recipe = "lib_ecology:fiddlehead",
		cooktime = 1,
	})
	minetest.register_craftitem("lib_ecology:fiddlehead_roasted", {
		description = "Roasted Fiddlehead",
		inventory_image = "ferns_fiddlehead_roasted.png",
		on_use = minetest.item_eat(1), -- edible when cooked
	})

	------------------
	-- FERN TUBER
	------------------
	minetest.register_alias("archaeplantae:ferntuber",      "lib_ecology:ferntuber")

	minetest.register_craftitem("lib_ecology:ferntuber", {
		description = "Fern Tuber",
		inventory_image = "ferns_ferntuber.png",
	})
	minetest.register_craft({
		type = "cooking",
		output = "lib_ecology:ferntuber_roasted",
		recipe = "lib_ecology:ferntuber",
		cooktime = 3,
	})

	minetest.register_alias("archaeplantae:ferntuber_roasted",      "lib_ecology:ferntuber_roasted")

	minetest.register_craftitem("lib_ecology:ferntuber_roasted", {
		description = "Roasted Fern Tuber",
		inventory_image = "ferns_ferntuber_roasted.png",
		on_use = minetest.item_eat(3),
	})

	--------------------------
	-- HORSETAIL  (EQUISETUM)
	--  --> GREEN DYE https://en.wikipedia.org/wiki/Equisetum
	--------------------------
	minetest.register_craft({
		type = "shapeless",
		output = "dye:green",
		recipe = {"group:horsetail"},
	})
end
