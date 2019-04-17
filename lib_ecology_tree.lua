
local S = lib_ecology.intllib


-- set leaftype (value inside init.lua)
local leaftype = "allfaces_optional"

if lib_ecology.leaftype ~= 0 then
	leaftype = "allfaces_optional"
end

-- default apple tree leaves
	minetest.override_item("default:leaves", {
		drawtype = "allfaces_optional",
		visual_scale = 1.2,
		inventory_image = "default_leaves.png",
		wield_image = "default_leaves.png",
		walkable = lib_ecology.leafwalk,
	})
-- default jungle tree leaves
	minetest.override_item("default:jungleleaves", {
		drawtype = "allfaces_optional",
		visual_scale = 1.2,
		inventory_image = "default_jungleleaves.png",
		wield_image = "default_jungleleaves.png",
		walkable = lib_ecology.leafwalk,
	})
-- default pine tree leaves
	minetest.override_item("default:pine_needles", {
		drawtype = "allfaces_optional",
		visual_scale = 1.2,
		inventory_image = "default_pine_needles.png",
		wield_image = "default_pine_needles.png",
		walkable = false,
		is_ground_content = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"default:pine_sapling"}, rarity = 20},
				{items = {"lib_ecology:pine_nuts"}, rarity = 5},
				{items = {"default:pine_needles"}}
			}
		},
	})
-- default acacia tree leaves
	minetest.override_item("default:acacia_leaves", {
		drawtype = "allfaces_optional",
	--	tiles = {"moretrees_acacia_leaves.png"},
		inventory_image = "default_acacia_leaves.png",
		wield_image = "default_acacia_leaves.png",
		visual_scale = 1.2,
		walkable = false,
		is_ground_content = false,
	})
-- default aspen tree leaves
	minetest.override_item("default:aspen_leaves", {
		drawtype = "allfaces_optional",
		inventory_image = "default_aspen_leaves.png",
		wield_image = "default_aspen_leaves.png",
		visual_scale = 1.2,
		walkable = false,
		is_ground_content = false,
	})

--[[This section, from deco_trees.lua, runs BEFORE valleys_c trees are generated.

-----------
-- Trees --
-----------

-- See textures/image-credits.txt
--]]
-- Change leafdecay ratings
	minetest.add_group("default:leaves", {leafdecay = 4})
	minetest.add_group("default:jungleleaves", {leafdecay = 4})
	minetest.add_group("default:pine_needles", {leafdecay = 5})

--[[
	minetest.override_item("default:leaves", {
		drawtype = "mesh",
		mesh = "leaf.obj",
		paramtype = "light",
		walkable = false,
	})
	minetest.override_item("default:aspen_leaves", {
		drawtype = "mesh",
		mesh = "leaf.obj",
		paramtype = "light",
		walkable = false,
	})
	minetest.override_item("default:jungleleaves", {
		drawtype = "mesh",
		mesh = "leaf.obj",
		paramtype = "light",
		walkable = false,
	})
--]]


	minetest.register_craftitem("lib_ecology:stick", {
		description = "Stick",
		inventory_image = "lib_ecology_stick.png",
		groups = {stick = 1, flammable = 2},
	})

--[[TREE NODE DEFINITIONS  (Including Ethereal, Mapgen, Maple, Moretrees, and Valleys_c tree nodes and graphics.  Licenses included where available.)
--]]

lib_ecology.register_tree = function(name)

	minetest.register_node("lib_ecology:tree_"..name.."_trunk", {
		description = S(name .. " Trunk"),
		tiles = {"lib_ecology_tree_"..name.."_trunk_top.png", "lib_ecology_tree_"..name.."_trunk_top.png", "lib_ecology_tree_"..name.."_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_"..name.."_wood", {
		description = S(name .. " Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_"..name.."_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_"..name.."_leaves", {
		description = S(name .. " Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_"..name.."_leaves.png"},
		special_tiles = {"lib_ecology_tree_"..name.."_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_"..name.."_leaves"}},
				{items = {"lib_ecology:tree_"..name.."_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})
	minetest.register_node("lib_ecology:tree_"..name.."_sapling", {
		description = S(name .. " Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_"..name.."_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = default.grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(2400,4800))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_"..name.."_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	minetest.register_craft({
		output = "lib_ecology:tree_"..name.."_wood 4",
		recipe = {
			{"lib_ecology:tree_"..name.."_trunk"},
		}
	})


	minetest.register_node("lib_ecology:tree_"..name.."_trunk_allface_side", {
		description = S(name .. " Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_"..name.."_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_"..name.."_trunk_allface_top", {
		description = S(name .. " Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_"..name.."_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

end

lib_ecology.register_tree("acacia")
lib_ecology.register_tree("apple")
lib_ecology.register_tree("ash")
lib_ecology.register_tree("aspen")
--lib_ecology.register_tree("bamboo_01")
--lib_ecology.register_tree("bamboo_02")
lib_ecology.register_tree("banana_01")
lib_ecology.register_tree("banana_02")
lib_ecology.register_tree("baobab")
lib_ecology.register_tree("beech")
lib_ecology.register_tree("birch_01")
--lib_ecology.register_tree("birch_02")
lib_ecology.register_tree("cedar")
--lib_ecology.register_tree("cherry_blossom")
lib_ecology.register_tree("chestnut")
lib_ecology.register_tree("conifers")
lib_ecology.register_tree("cypress")
lib_ecology.register_tree("date_palm")
lib_ecology.register_tree("default")
lib_ecology.register_tree("dry")
lib_ecology.register_tree("eucalyptus")
lib_ecology.register_tree("fir_coast")
lib_ecology.register_tree("fir_doug")
lib_ecology.register_tree("fir")
lib_ecology.register_tree("frost")
lib_ecology.register_tree("jungle_01")
lib_ecology.register_tree("jungle_02")
lib_ecology.register_tree("jungle_03")
lib_ecology.register_tree("jungle_palm_01")
lib_ecology.register_tree("jungle_palm_02")
lib_ecology.register_tree("jungle_palm_03")
lib_ecology.register_tree("mangrove")
lib_ecology.register_tree("maple")
lib_ecology.register_tree("oak")
lib_ecology.register_tree("orange")
lib_ecology.register_tree("palm_01")
--lib_ecology.register_tree("palm_02")
lib_ecology.register_tree("pine_01")
lib_ecology.register_tree("pine_02")
lib_ecology.register_tree("pine_03")
lib_ecology.register_tree("poplar")
lib_ecology.register_tree("redwood")
lib_ecology.register_tree("rubber")
--lib_ecology.register_tree("scorched")
lib_ecology.register_tree("sequoia")
lib_ecology.register_tree("spruce")
lib_ecology.register_tree("willow_01")
lib_ecology.register_tree("willow_02")
lib_ecology.register_tree("willow_03")
lib_ecology.register_tree("willow_04")
lib_ecology.register_tree("yellow_healing")
lib_ecology.register_tree("yellow_ipe")



--ACACIA
--[[
		-- -- minetest.register_node("lib_ecology:tree_acacia_trunk", {
			-- -- description = S("Acacia Trunk"),
			-- -- tiles = {"lib_ecology_tree_acacia_trunk_top.png", "lib_ecology_tree_acacia_trunk_top.png", "lib_ecology_tree_acacia_trunk.png"},
			-- -- paramtype = "light",
			-- -- paramtype2 = "facedir",
			-- -- walkable = true,
			-- -- is_ground_content = false,
			-- -- groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			-- -- sounds = lib_ecology.node_sound_wood_defaults(),

			-- -- on_place = minetest.rotate_node
		-- -- })
		-- -- minetest.register_node("lib_ecology:tree_acacia_wood", {
			-- -- description = S("Acacia Wood Planks"),
			-- -- paramtype2 = "facedir",
			-- -- place_param2 = 0,
			-- -- tiles = {"lib_ecology_tree_acacia_wood.png"},
			-- -- is_ground_content = false,
			-- -- groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			-- -- sounds = lib_ecology.node_sound_wood_defaults(),
		-- -- })
		-- -- minetest.register_node("lib_ecology:tree_acacia_leaves", {
			-- -- description = S("Acacia Leaves"),
			-- -- drawtype = "allfaces_optional",
			-- -- tiles = {"lib_ecology_tree_acacia_leaves.png"},
			-- -- special_tiles = {"lib_ecology_tree_acacia_leaves_simple.png"},
			-- -- paramtype = "light",
			-- -- waving = 1,
			-- -- walkable = false,
			-- -- is_ground_content = false,
			-- -- groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			-- -- drop = {
				-- -- max_items = 1,
				-- -- items = {
					-- -- {items = {"lib_ecology:tree_acacia_leaves"}},
					-- -- {items = {"lib_ecology:tree_acacia_sapling"}, rarity = 20},
					-- -- {items = {"lib_ecology:stick"}, rarity = 10},
				-- -- }
			-- -- },
			-- -- sounds = lib_ecology.node_sound_leaves_defaults(),

			-- -- after_place_node = default.after_place_leaves,
		-- -- })
		-- -- minetest.register_node("lib_ecology:tree_acacia_sapling", {
			-- -- description = S("Acacia Tree Sapling"),
			-- -- drawtype = "plantlike",
			-- -- tiles = {"lib_ecology_tree_acacia_sapling.png"},
			-- -- inventory_image = "lib_ecology_tree_acacia_sapling.png",
			-- -- wield_image = "lib_ecology_tree_acacia_sapling.png",
			-- -- paramtype = "light",
			-- -- sunlight_propagates = true,
			-- -- walkable = false,
			-- -- on_timer = default.grow_sapling,
			-- -- selection_box = {
				-- -- type = "fixed",
				-- -- fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			-- -- },
			-- -- groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			-- -- sounds = lib_ecology.node_sound_leaves_defaults(),

			-- -- on_construct = function(pos)
				-- -- minetest.get_node_timer(pos):start(math.random(2400,4800))
			-- -- end,

			-- -- on_place = function(itemstack, placer, pointed_thing)
				-- -- itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					-- -- "lib_ecology:tree_acacia_sapling",
					-- -- -- minp, maxp to be checked, relative to sapling pos
					-- -- -- minp_relative.y = 1 because sapling pos has been checked
					-- -- {x = -4, y = 1, z = -4},
					-- -- {x = 4, y = 6, z = 4},
					-- -- -- maximum interval of interior volume check
					-- -- 4)

				-- -- return itemstack
			-- -- end,
		-- -- })
		-- -- minetest.register_craft({
			-- -- output = 'lib_ecology:tree_acacia_wood 4',
			-- -- recipe = {
				-- -- {'lib_ecology:tree_acacia_trunk'},
			-- -- }
		-- -- })
--]]
--APPLE
		minetest.register_node("lib_ecology:fruit_apple", {
			description = S("Fruit - Apple"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_apple.png" },
			visual_scale = 1.0,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),
			drop = "lib_ecology:fruit_apple",
			selection_box = {
				type = "fixed",
				fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
			},
			on_use = minetest.item_eat(2),
			after_place_node = function(pos, placer)
				if placer:is_player() then
					minetest.set_node(pos, {name = "lib_ecology:fruit_apple", param2 = 1})
				end
			end,
		})
--ASH
--ASPEN
--BAMBOO 01
		minetest.register_node("lib_ecology:tree_bamboo_01_trunk", {
			description = S("bamboo_02 Trunk"),
			drawtype = "nodebox",
			tiles = {"lib_ecology_tree_bamboo_01_trunk.png^[transformR90^lib_ecology_tree_bamboo_01_trunk.png","lib_ecology_tree_bamboo_01_trunk.png^[transformR90^lib_ecology_tree_bamboo_01_trunk.png","lib_ecology_tree_bamboo_01_trunk.png","lib_ecology_tree_bamboo_01_trunk.png^[transformFX","lib_ecology_tree_bamboo_01_trunk.png^[transformFX","lib_ecology_tree_bamboo_01_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),
			node_box = {
				type = "fixed",
				fixed = {
					{-0.1875, -0.5, -0.1875, 0.25, 0.5, 0.25}, -- Stalk
					{-0.25, 0.3125, -0.0625, -0.1875, 0.4375, 0.125}, -- NodeBox2
					{-0.0625, 0.3125, -0.25, 0.125, 0.4375, -0.1875}, -- NodeBox3
					{0.25, 0.125, -0.0625, 0.3125, 0.4375, 0.125}, -- NodeBox4
					{-0.0625, 0.125, 0.25, 0.125, 0.4375, 0.3125}, -- NodeBox5
					{-0.25, -0.4375, -0.0625, -0.1875, -0.3125, 0.125}, -- NodeBox6
					{-0.0625, -0.4375, -0.25, 0.125, -0.3125, -0.1875}, -- NodeBox7
					{-0.375, -0.375, -0.0625, -0.25, -0.3125, 0.125}, -- NodeBox8
					{-0.0625, -0.375, -0.375, 0.125, -0.3125, -0.25}, -- NodeBox9
					{0.3125, 0.1875, -0.0625, 0.375, 0.25, 0.125}, -- NodeBox10
					{0.375, 0.25, -0.0625, 0.4375, 0.3125, 0.125}, -- NodeBox11
					{-0.0625, 0.1875, 0.3125, 0.125, 0.25, 0.375}, -- NodeBox12
					{-0.0625, 0.25, 0.375, 0.125, 0.3125, 0.4375}, -- NodeBox13
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.1875, -0.5, -0.1875, 0.25, 0.5, 0.25}, -- Stalk
					{-0.25, 0.3125, -0.0625, -0.1875, 0.4375, 0.125}, -- NodeBox2
					{-0.0625, 0.3125, -0.25, 0.125, 0.4375, -0.1875}, -- NodeBox3
					{0.25, 0.125, -0.0625, 0.3125, 0.4375, 0.125}, -- NodeBox4
					{-0.0625, 0.125, 0.25, 0.125, 0.4375, 0.3125}, -- NodeBox5
					{-0.25, -0.4375, -0.0625, -0.1875, -0.3125, 0.125}, -- NodeBox6
					{-0.0625, -0.4375, -0.25, 0.125, -0.3125, -0.1875}, -- NodeBox7
					{-0.375, -0.375, -0.0625, -0.25, -0.3125, 0.125}, -- NodeBox8
					{-0.0625, -0.375, -0.375, 0.125, -0.3125, -0.25}, -- NodeBox9
					{0.3125, 0.1875, -0.0625, 0.375, 0.25, 0.125}, -- NodeBox10
					{0.375, 0.25, -0.0625, 0.4375, 0.3125, 0.125}, -- NodeBox11
					{-0.0625, 0.1875, 0.3125, 0.125, 0.25, 0.375}, -- NodeBox12
					{-0.0625, 0.25, 0.375, 0.125, 0.3125, 0.4375}, -- NodeBox13
				}
			},

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_bamboo_01_wood", {
			description = S("bamboo_02 Wood Planks"),
			paramtype2 = "facedir",
			place_param2 = 0,
			tiles = {"lib_ecology_tree_bamboo_01_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),
		})
		minetest.register_node("lib_ecology:tree_bamboo_01_leaves", {
			description = S("bamboo_02 Leaves"),
			drawtype = "allfaces_optional",
			tiles = {"lib_ecology_tree_bamboo_01_leaves.png"},
			paramtype = "light",
			visual_scale = 1.2,
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			drop = {
				max_items = 1,
				items = {
					{items = {"lib_ecology:tree_bamboo_01_leaves"}},
					{items = {"lib_ecology:tree_bamboo_01_sapling"}, rarity = 20},
					{items = {"lib_ecology:stick"}, rarity = 10},
				}
			},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			after_place_node = default.after_place_leaves,
		})
		minetest.register_node("lib_ecology:tree_bamboo_01_sapling", {
			description = S("bamboo_02 Tree Sapling"),
			drawtype = "plantlike",
			tiles = {"lib_ecology_tree_bamboo_01_sapling.png"},
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			on_timer = default.grow_sapling,
			selection_box = {
				type = "fixed",
				fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			},
			groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(2400,4800))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					"lib_ecology:tree_bamboo_01_sapling",
					-- minp, maxp to be checked, relative to sapling pos
					-- minp_relative.y = 1 because sapling pos has been checked
					{x = -4, y = 1, z = -4},
					{x = 4, y = 6, z = 4},
					-- maximum interval of interior volume check
					4)

				return itemstack
			end,
		})
		minetest.register_craft({
			output = 'lib_ecology:tree_bamboo_01_wood 4',
			recipe = {
				{'lib_ecology:tree_bamboo_01_trunk'},
			}
		})
--BAMBOO 02
		minetest.register_node("lib_ecology:tree_bamboo_02_trunk", {
			description = S("bamboo_02 Trunk"),
			drawtype = "nodebox",
			tiles = {"lib_ecology_tree_bamboo_02_trunk_top.png", "lib_ecology_tree_bamboo_02_trunk_top.png", "lib_ecology_tree_bamboo_02_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),
			node_box = {
				type = "fixed",
				fixed = {
					{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox1
					{-0.5, -0.5, 0, 0.5, 0.5, 0}, -- NodeBox2
					{0.00470524, -0.5, -0.5, 0.00470524, 0.5, 0.5}, -- NodeBox3
				}
			},

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_bamboo_02_trunk_with_leaves", {
			description = S("bamboo_02 Trunk with Leaves"),
			drawtype = "nodebox",
			tiles = {"lib_ecology_tree_bamboo_02_trunk_top.png", "lib_ecology_tree_bamboo_02_trunk_top.png", "lib_ecology_tree_bamboo_02_leaves.png^lib_ecology_tree_bamboo_02_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),
			node_box = {
				type = "fixed",
				fixed = {
					{-0.1875, -0.5, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox1
					{-0.5, -0.5, 0, 0.5, 0.5, 0}, -- NodeBox2
					{0.00470524, -0.5, -0.5, 0.00470524, 0.5, 0.5}, -- NodeBox3
				}
			},

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_bamboo_02_wood", {
			description = S("bamboo_02 Wood Planks"),
			paramtype2 = "facedir",
			place_param2 = 0,
			tiles = {"lib_ecology_tree_bamboo_02_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),
		})
		minetest.register_node("lib_ecology:tree_bamboo_02_leaves", {
			description = S("bamboo_02 Leaves"),
			drawtype = "allfaces_optional",
			tiles = {"lib_ecology_tree_bamboo_02_leaves.png"},
			special_tiles = {"lib_ecology_tree_bamboo_02_leaves_simple.png"},
			paramtype = "light",
			visual_scale = 1.2,
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			drop = {
				max_items = 1,
				items = {
					{items = {"lib_ecology:tree_bamboo_02_leaves"}},
					{items = {"lib_ecology:tree_bamboo_02_sapling"}, rarity = 20},
					{items = {"lib_ecology:stick"}, rarity = 10},
				}
			},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			after_place_node = default.after_place_leaves,
		})
		minetest.register_node("lib_ecology:tree_bamboo_02_sapling", {
			description = S("bamboo_02 Tree Sapling"),
			drawtype = "plantlike",
			tiles = {"lib_ecology_tree_bamboo_02_sapling.png"},
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			on_timer = default.grow_sapling,
			selection_box = {
				type = "fixed",
				fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			},
			groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(2400,4800))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					"lib_ecology:tree_bamboo_02_sapling",
					-- minp, maxp to be checked, relative to sapling pos
					-- minp_relative.y = 1 because sapling pos has been checked
					{x = -4, y = 1, z = -4},
					{x = 4, y = 6, z = 4},
					-- maximum interval of interior volume check
					4)

				return itemstack
			end,
		})
		minetest.register_craft({
			output = 'lib_ecology:tree_bamboo_02_wood 4',
			recipe = {
				{'lib_ecology:tree_bamboo_02_trunk'},
			}
		})
--BANANA 01
		minetest.register_node("lib_ecology:fruit_banana_01", {
			description = S("Fruit - Banana 01"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_banana_01.png" },
			visual_scale = 1.0,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),
			drop = "lib_ecology:fruit_banana_01",
			selection_box = {
				type = "fixed",
				fixed = {-0.31, -0.5, -0.31, 0.31, 0.5, 0.31}
			},
			on_use = minetest.item_eat(3),
			after_place_node = function(pos, placer)
				if placer:is_player() then
					minetest.set_node(pos, {name = "lib_ecology:fruit_banana_01", param2 = 1})
				end
			end,
		})
--BANANA 02
		minetest.register_node("lib_ecology:fruit_banana_02", {
			description = S("Fruit - Banana 02"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_banana_02.png" },
			visual_scale = 1.0,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),
			drop = "lib_ecology:fruit_banana_02",
			selection_box = {
				type = "fixed",
					fixed = {-0.35, -0.5, -0.35, 0.35, 0.5, 0.35}
				},
			on_use = minetest.item_eat(3),
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_banana_02", param2=1})
				end
			end,
		})
--BAOBOB
--BEECH
--BIRCH 01
--BIRCH 02
		minetest.register_node("lib_ecology:tree_birch_02_trunk", {
			description = S("birch_02 Trunk"),
			drawtype = "nodebox",
			tiles = {"lib_ecology_tree_birch_02_trunk_top.png", "lib_ecology_tree_birch_02_trunk_top.png", "lib_ecology_tree_birch_02_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),
			node_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- Trunk
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- Trunk
				}
			},

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_birch_02_wood", {
			description = S("birch_02 Wood Planks"),
			paramtype2 = "facedir",
			place_param2 = 0,
			tiles = {"lib_ecology_tree_birch_02_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),
		})
		minetest.register_node("lib_ecology:tree_birch_02_leaves", {
			description = S("birch_02 Leaves"),
			drawtype = "allfaces_optional",
			tiles = {"lib_ecology_tree_birch_02_leaves.png"},
			special_tiles = {"lib_ecology_tree_birch_02_leaves_simple.png"},
			paramtype = "light",
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			drop = {
				max_items = 1,
				items = {
					{items = {"lib_ecology:tree_birch_02_leaves"}},
					{items = {"lib_ecology:tree_birch_02_sapling"}, rarity = 20},
					{items = {"lib_ecology:stick"}, rarity = 10},
				}
			},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			after_place_node = default.after_place_leaves,
		})
		minetest.register_node("lib_ecology:tree_birch_02_sapling", {
			description = S("birch_02 Tree Sapling"),
			drawtype = "plantlike",
			tiles = {"lib_ecology_tree_birch_02_sapling.png"},
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			on_timer = default.grow_sapling,
			selection_box = {
				type = "fixed",
				fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			},
			groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(2400,4800))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					"lib_ecology:tree_birch_02_sapling",
					-- minp, maxp to be checked, relative to sapling pos
					-- minp_relative.y = 1 because sapling pos has been checked
					{x = -4, y = 1, z = -4},
					{x = 4, y = 6, z = 4},
					-- maximum interval of interior volume check
					4)

				return itemstack
			end,
		})
		minetest.register_craft({
			output = 'lib_ecology:tree_birch_02_wood 4',
			recipe = {
				{'lib_ecology:tree_birch_02_trunk'},
			}
		})
--CEDAR
		minetest.register_node("lib_ecology:fruit_cedar_cone", {
			description = S("Fruit - Cedar Cone"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_cedar_cone.png" },
			visual_scale = 0.8,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
			drop = "lib_ecology:fruit_cedar_cone",
			selection_box = {
				type = "fixed",
					fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
				},
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_cedar_cone", param2=1})
				end
			end,
		})
--CHERRY BLOSSOM
		minetest.register_node("lib_ecology:tree_cherry_blossom_trunk", {
			description = S("cherry_blossom Trunk"),
			drawtype = "nodebox",
			tiles = {"lib_ecology_tree_cherry_blossom_trunk_top.png", "lib_ecology_tree_cherry_blossom_trunk_top.png", "lib_ecology_tree_cherry_blossom_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),
			node_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- Trunk
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, -- Trunk
				}
			},

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_cherry_blossom_wood", {
			description = S("cherry_blossom Wood Planks"),
			paramtype2 = "facedir",
			place_param2 = 0,
			tiles = {"lib_ecology_tree_cherry_blossom_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),
		})
		minetest.register_node("lib_ecology:tree_cherry_blossom_leaves", {
			description = S("cherry_blossom Leaves"),
			drawtype = "allfaces_optional",
			tiles = {"lib_ecology_tree_cherry_blossom_leaves.png"},
			special_tiles = {"lib_ecology_tree_cherry_blossom_leaves_simple.png"},
			paramtype = "light",
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			drop = {
				max_items = 1,
				items = {
					{items = {"lib_ecology:tree_cherry_blossom_leaves"}},
					{items = {"lib_ecology:tree_cherry_blossom_sapling"}, rarity = 20},
					{items = {"lib_ecology:stick"}, rarity = 10},
				}
			},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			after_place_node = default.after_place_leaves,
		})
		minetest.register_node("lib_ecology:tree_cherry_blossom_sapling", {
			description = S("cherry_blossom Tree Sapling"),
			drawtype = "plantlike",
			tiles = {"lib_ecology_tree_cherry_blossom_sapling.png"},
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			on_timer = default.grow_sapling,
			selection_box = {
				type = "fixed",
				fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			},
			groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(2400,4800))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					"lib_ecology:tree_cherry_blossom_sapling",
					-- minp, maxp to be checked, relative to sapling pos
					-- minp_relative.y = 1 because sapling pos has been checked
					{x = -4, y = 1, z = -4},
					{x = 4, y = 6, z = 4},
					-- maximum interval of interior volume check
					4)

				return itemstack
			end,
		})
		minetest.register_craft({
			output = 'lib_ecology:tree_cherry_blossom_wood 4',
			recipe = {
				{'lib_ecology:tree_cherry_blossom_trunk'},
			}
		})
--CHESTNUT
--CONIFER
--CYPRESS
--DATE PALM
		minetest.register_node("lib_ecology:fruit_dates", {
			description = S("Fruit - Dates"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_dates.png" },
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			selection_box = {
				type = "fixed",
					fixed = {0.5, -0.5, -0.5, 0.375, 0.5, 0.5}
				},
			groups = {fleshy=3,dig_immediate=3,flammable=2, attached_node=1, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
		})
--DEFAULT
--DRY (SAVANNAH)
--EUCALYPTUS
--FIR COAST
--FIR DOUGLASS
--FIR
		minetest.register_node("lib_ecology:fruit_fir_cone", {
			description = S("Fruit - Fir Cone"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_fir_cone.png" },
			visual_scale = 0.8,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
			drop = "lib_ecology:fruit_fir_cone",
			selection_box = {
				type = "fixed",
					fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
				},
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_fir_cone", param2=1})
				end
			end,
		})
--FROST
--JUNGLE
--MANGROVE
--MAPLE
--OAK
		minetest.register_node("lib_ecology:fruit_acorn", {
			description = S("Fruit - Acorn"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_acorn.png" },
			visual_scale = 0.8,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
			drop = "lib_ecology:fruit_acorn",
			selection_box = {
				type = "fixed",
					fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
				},
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_acorn", param2=1})
				end
			end,
		})
--ORANGE
		minetest.register_node("lib_ecology:fruit_orange", {
			description = S("Fruit - Orange"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_orange.png" },
			visual_scale = 1.0,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),
			drop = "lib_ecology:fruit_orange",
			selection_box = {
				type = "fixed",
				fixed = {-0.27, -0.37, -0.27, 0.27, 0.44, 0.27}
			},
			on_use = minetest.item_eat(4),
			after_place_node = function(pos, placer)
				if placer:is_player() then
					minetest.set_node(pos, {name = "lib_ecology:fruit_orange", param2 = 1})
				end
			end,
		})
--PALM 01
		minetest.register_node("lib_ecology:fruit_coconut", {
			description = S("Fruit - Coconut"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_coconut.png" },
			visual_scale = 0.8,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
			drop = "lib_ecology:fruit_coconut",
			selection_box = {
				type = "fixed",
					fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
				},
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_coconut", param2=1})
				end
			end,
		})
--PALM 02
		minetest.register_node("lib_ecology:tree_palm_02_trunk", {
			description = S("Palm 02  Trunk"),
			tiles = {"lib_ecology_tree_palm_02_trunk_top.png", "lib_ecology_tree_palm_02_trunk_top.png", "lib_ecology_tree_palm_02_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			walkable = true,
			is_ground_content = false,
			groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_palm_02_wood", {
			description = S("Palm 02  Wood Planks"),
			paramtype2 = "facedir",
			place_param2 = 0,
			tiles = {"lib_ecology_tree_palm_02_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),
		})
		minetest.register_node("lib_ecology:tree_palm_02_leaves", {
			description = S("Palm 02 Leaves"),
			drawtype = "allfaces_optional",
			tiles = {"lib_ecology_tree_palm_02_leaves.png", "lib_ecology_tree_palm_02_leaves.png", "lib_ecology_tree_palm_02_leaves.png^[transformR270"},
			special_tiles = {"lib_ecology_tree_palm_02_leaves_simple.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			drop = {
				max_items = 1,
				items = {
					{items = {"lib_ecology:tree_palm_02_leaves"}},
					{items = {"lib_ecology:tree_palm_02_sapling"}, rarity = 20},
					{items = {"lib_ecology:stick"}, rarity = 10},
				}
			},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			after_place_node = default.after_place_leaves,
		})
		minetest.register_node("lib_ecology:tree_palm_02_leaves2", {
			description = S("Palm 02 Leaves2"),
			tiles = {"lib_ecology_tree_palm_02_leaves.png", "lib_ecology_tree_palm_02_leaves.png", "lib_ecology_tree_palm_02_leaves.png^[transformR270"},
			special_tiles = {"lib_ecology_tree_palm_02_leaves_simple.png", "lib_ecology_tree_palm_02_leaves_simple.png", "lib_ecology_tree_palm_02_leaves_simple.png^[transformR270"},
			paramtype = "light",
			paramtype2 = "facedir",
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
			drop = {
				max_items = 1,
				items = {
					{items = {"lib_ecology:tree_palm_02_leaves2"}},
					{items = {"lib_ecology:tree_palm_02_sapling"}, rarity = 20},
					{items = {"lib_ecology:stick"}, rarity = 10},
				}
			},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			after_place_node = default.after_place_leaves,
		})
		minetest.register_node("lib_ecology:tree_palm_02_sapling", {
			description = S("Palm 02 Tree Sapling"),
			drawtype = "plantlike",
			tiles = {"lib_ecology_tree_palm_02_sapling.png"},
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			on_timer = default.grow_sapling,
			selection_box = {
				type = "fixed",
				fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			},
			groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(2400,4800))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					"lib_ecology:tree_palm_02_sapling",
					-- minp, maxp to be checked, relative to sapling pos
					-- minp_relative.y = 1 because sapling pos has been checked
					{x = -4, y = 1, z = -4},
					{x = 4, y = 6, z = 4},
					-- maximum interval of interior volume check
					4)

				return itemstack
			end,
		})
		minetest.register_craft({
			output = "lib_ecology:tree_palm_02_wood 4",
			recipe = {
				{"lib_ecology:tree_palm_02_trunk"},
			}
		})
--PINE 01
		minetest.register_node("lib_ecology:fruit_pine_cone", {
			description = S("Fruit - Pine Cone"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_pine_cone.png" },
			visual_scale = 0.8,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
			drop = "lib_ecology:fruit_pine_cone",
			selection_box = {
				type = "fixed",
					fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
				},
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_pine_cone", param2=1})
				end
			end,
		})
--PINE 02
--POPLAR
--POPLAR SMALL
		minetest.register_node("lib_ecology:tree_poplar_small_sapling", {
			description = S("Poplar Small Tree Sapling"),
			drawtype = "plantlike",
			tiles = {"lib_ecology_tree_poplar_small_sapling.png"},
			paramtype = "light",
			sunlight_propagates = true,
			walkable = false,
			on_timer = default.grow_sapling,
			selection_box = {
				type = "fixed",
				fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
			},
			groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),

			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(2400,4800))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
					"lib_ecology:tree_poplar_small_sapling",
					-- minp, maxp to be checked, relative to sapling pos
					-- minp_relative.y = 1 because sapling pos has been checked
					{x = -4, y = 1, z = -4},
					{x = 4, y = 6, z = 4},
					-- maximum interval of interior volume check
					4)

				return itemstack
			end,
		})

--REDWOOD
--RUBBER
		minetest.register_node("lib_ecology:tree_rubber_trunk_empty", {
			description = S("Rubber Trunk - Empty"),
			tiles = {"lib_ecology_tree_rubber_trunk_top.png", "lib_ecology_tree_rubber_trunk_top.png", "lib_ecology_tree_rubber_trunk_empty.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),

			on_place = minetest.rotate_node
		})
--SCORCHED

		minetest.register_node("lib_ecology:tree_scorched_trunk", {
			description = S("scorched Trunk"),
			tiles = {"lib_ecology_tree_scorched_trunk_top.png", "lib_ecology_tree_scorched_trunk_top.png", "lib_ecology_tree_scorched_trunk.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			walkable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = lib_ecology.node_sound_wood_defaults(),

			on_place = minetest.rotate_node
		})
		minetest.register_node("lib_ecology:tree_scorched_wood", {
			description = S("scorched Wood Planks"),
			paramtype2 = "facedir",
			place_param2 = 0,
			tiles = {"lib_ecology_tree_scorched_wood.png"},
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = lib_ecology.node_sound_wood_defaults(),
		})
		minetest.register_craft({
			output = 'lib_ecology:tree_scorched_wood 4',
			recipe = {
				{'lib_ecology:tree_scorched_trunk'},
			}
		})

--SEQUOIA
--SPRUCE
		minetest.register_node("lib_ecology:fruit_spruce_cone", {
			description = S("Fruit - Spruce Cone"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_spruce_cone.png" },
			visual_scale = 0.8,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_defaults(),
			drop = "lib_ecology:fruit_spruce_cone",
			selection_box = {
				type = "fixed",
					fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
				},
			after_place_node = function(pos, placer, itemstack)
				if placer:is_player() then
					minetest.set_node(pos, {name="lib_ecology:fruit_spruce_cone", param2=1})
				end
			end,
		})
--WILLOW 01
--WILLOW 02
--WILLOW 03
--WILLOW 04
--YELLOW HEALING
		minetest.register_node("lib_ecology:fruit_apple_gold", {
			description = S("Fruit - Golden Apple"),
			drawtype = "plantlike",
			tiles = { "lib_ecology_fruit_apple_gold.png" },
			visual_scale = 1.0,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			groups = {fleshy=3,dig_immediate=3,flammable=2, leafdecay = 1, leafdecay_drop = 1},
			sounds = lib_ecology.node_sound_leaves_defaults(),
			drop = "lib_ecology:fruit_apple_gold",
			selection_box = {
				type = "fixed",
				fixed = {-0.2, -0.37, -0.2, 0.2, 0.31, 0.2}
			},
			on_use = minetest.item_eat(20),
			after_place_node = function(pos, placer)
				if placer:is_player() then
					minetest.set_node(pos, {name = "lib_ecology:fruit_apple_gold", param2 = 1})
				end
			end,
		})
--YELLOW IPE


--CUSTOM

minetest.register_node("lib_ecology:tree_generic_jungle_02_trunk", {
	description = S("Jungle Tree 02 Trunk"),
	tiles = {
		"lib_ecology_tree_generic_jungle_02_trunk_top.png",
		"lib_ecology_tree_generic_jungle_02_trunk_top.png",
		"lib_ecology_tree_generic_jungle_02_trunk.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	is_ground_content = false,
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = lib_ecology.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})
minetest.register_node("lib_ecology:tree_generic_jungle_03_trunk", {
	description = S("Jungle Tree 03 Trunk"),
	tiles = {
		"lib_ecology_tree_generic_jungle_03_trunk_top.png",
		"lib_ecology_tree_generic_jungle_03_trunk_top.png",
		"lib_ecology_tree_generic_jungle_03_trunk.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	is_ground_content = false,
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = lib_ecology.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})
minetest.register_node("lib_ecology:tree_generic_brown_trunk", {
	description = S("Generic Brown Trunk"),
	tiles = {
		"lib_ecology_tree_generic_brown_trunk_top.png",
		"lib_ecology_tree_generic_brown_trunk_top.png",
		"lib_ecology_tree_generic_brown_trunk.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	is_ground_content = false,
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = lib_ecology.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})
minetest.register_node("lib_ecology:tree_generic_green_trunk", {
	description = S("Generic Green Trunk"),
	tiles = {
		"lib_ecology_tree_generic_green_trunk_top.png",
		"lib_ecology_tree_generic_green_trunk_top.png",
		"lib_ecology_tree_generic_green_trunk.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	is_ground_content = false,
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = lib_ecology.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})
minetest.register_node("lib_ecology:tree_generic_grey_trunk", {
	description = S("Generic Grey Trunk"),
	tiles = {
		"lib_ecology_tree_generic_grey_trunk_top.png",
		"lib_ecology_tree_generic_grey_trunk_top.png",
		"lib_ecology_tree_generic_grey_trunk.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	is_ground_content = false,
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = lib_ecology.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})



minetest.register_craft({
	output = 'default:junglewood 4',
	recipe = {
		{'lib_ecology:tree_generic_trunk_jungle_03'},
	}
})
minetest.register_craft({
	output = 'default:wood 4',
	recipe = {
		{'lib_ecology:tree_generic_brown_trunk'},
	}
})
minetest.register_craft({
	output = 'default:wood 4',
	recipe = {
		{'lib_ecology:tree_generic_green_trunk'},
	}
})


minetest.register_node("lib_ecology:tree_leaves_autumn", {
	description = S("Leaves - Autumn"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_autumn.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_autumn"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dry", {
	description = S("Leaves - Dry"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dry.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dry"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dk_green", {
	description = S("Leaves - Dark Green"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dk_green.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dk_green"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dk_green_2", {
	description = S("Leaves - Dark Green (#FF0000:10)"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dk_green.png^[colorize:#FF0000:10"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dk_green"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dk_green_3", {
	description = S("Leaves - Dark Green (#FFFF00:30)"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dk_green.png^[colorize:#FFFF00:30"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dk_green"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dk_green_simple", {
	description = S("Leaves - Dark Green Simple"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dk_green_simple.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dk_green_simple"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dk_green_simple_2", {
	description = S("Leaves - Dark Green Simple (#FF0000:10)"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dk_green_simple.png^[colorize:#FF0000:10"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dk_green_simple"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_dk_green_simple_3", {
	description = S("Leaves - Dark Green Simple (#FFFF00:30)"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_dk_green_simple.png^[colorize:#FFFF00:30"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_dk_green_simple"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_green", {
	description = S("Leaves - Green"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_green.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_green"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_green_2", {
	description = S("Leaves - Green (#FF0000:10)"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_green.png^[colorize:#FF0000:10"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_green"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_green_3", {
	description = S("Leaves - Green (#FFFF00:30)"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_green.png^[colorize:#FFFF00:30"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_green"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_purple", {
	description = S("Leaves - Purple"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_purple.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_purple"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_red", {
	description = S("Leaves - Red"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_red.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_red"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_yellow", {
	description = S("Leaves - Yellow"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_yellow.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_yellow"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})
minetest.register_node("lib_ecology:tree_leaves_white", {
	description = S("Leaves - White"),
	drawtype = "allfaces_optional",
	tiles = {"lib_ecology_tree_leaves_white.png"},
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:tree_leaves_white"}},
			{items = {"lib_ecology:stick"}, rarity = 10},
		}
	},
	sounds = lib_ecology.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})



--MUSHROOMS
minetest.register_node("lib_ecology:mushroom_01_stem", {
	description = S("Mushroom 01 Stem"),
	tiles = {
		"lib_ecology_mushroom_01_trunk_top.png",
		"lib_ecology_mushroom_01_trunk_top.png",
		"lib_ecology_mushroom_01_trunk.png"
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = lib_ecology.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
})
minetest.register_node("lib_ecology:mushroom_01_cap_spotted_red", {
	description = S("Mushroom 01 Cap Spotted Red"),
	tiles = {"lib_ecology_mushroom_01_cap.png"},
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"lib_ecology:mushroom_sapling"}, rarity = 20},
			{items = {"lib_ecology:mushroom_01_cap_spotted_red"}}
		}
	},
	sounds = lib_ecology.node_sound_wood_defaults(),
})
minetest.register_node("lib_ecology:mushroom_spores", {
	description = S("Mushroom 01 Spores"),
	tiles = {"lib_ecology_mushroom_01_spores.png"},
	groups = {
		snappy = 3, cracky = 3, choppy = 3, oddly_breakable_by_hand = 3,
		flammable = 2, disable_jump = 1, fall_damage_add_percent = -100
	},
	sounds = lib_ecology.node_sound_dirt_defaults(),
})
minetest.register_craft({
	type = "fuel",
	recipe = "lib_ecology:mushroom_01_cap_spotted_red",
	burntime = 10,
})

minetest.register_node("lib_ecology:mushroom_02_stem", {
	description = S("Mushroom 02 Stem"),
	tiles = {
		"lib_ecology_mushroom_02_trunk_top.png",
		"lib_ecology_mushroom_02_trunk_top.png",
		"lib_ecology_mushroom_02_trunk.png",
	},
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults(),
	paramtype2 = "facedir",
	on_place = minetest.rotate_node
})
minetest.register_node("lib_ecology:mushroom_02_cap_red", {
	description = S("Mushroom 02 Cap Red"),
	tiles = {
		"lib_ecology_mushroom_02_cap_red.png",
		"lib_ecology_mushroom_02_spores.png",
		"lib_ecology_mushroom_02_cap_red.png",
	},
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})
minetest.register_node("lib_ecology:mushroom_02_cap_brown", {
	description = S("Mushroom 02 Cap Brown"),
	tiles = {
		"lib_ecology_mushroom_02_cap_brown.png",
		"lib_ecology_mushroom_02_spores.png",
		"lib_ecology_mushroom_02_cap_brown.png",
	},
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_03_stem", {
	description = S("Mushroom 03 Stem"),
	tiles = {"lib_ecology_mushroom_01_trunk_top.png", "lib_ecology_mushroom_01_trunk_top.png", "lib_ecology_mushroom_03_trunk.png"},
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2, plant=1},
	sounds = lib_ecology.node_sound_wood_defaults(),
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", fixed = { {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, }},
})
minetest.register_node("lib_ecology:mushroom_03_cap_giant", {
	description = S("Mushroom 03 Cap Giant"),
	tiles = {"lib_ecology_mushroom_03_cap.png", "lib_ecology_mushroom_03_spores.png", "lib_ecology_mushroom_03_cap.png"},
	is_ground_content = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", 
		fixed = {
			{-0.4, -0.5, -0.4, 0.4, 0.0, 0.4},
			{-0.75, -0.5, -0.4, -0.4, -0.25, 0.4},
			{0.4, -0.5, -0.4, 0.75, -0.25, 0.4},
			{-0.4, -0.5, -0.75, 0.4, -0.25, -0.4},
			{-0.4, -0.5, 0.4, 0.4, -0.25, 0.75},
		} },
	groups = {fleshy=1, dig_immediate=3, flammable=2, plant=1, leafdecay=1},
})
minetest.register_node("lib_ecology:mushroom_03_cap_huge", {
	description = S("Mushroom 03 Cap Huge"),
	tiles = {"lib_ecology_mushroom_03_cap.png", "lib_ecology_mushroom_03_spores.png", "lib_ecology_mushroom_03_cap.png"},
	is_ground_content = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = { type = "fixed", 
		fixed = {
			{-0.5, -0.5, -0.33, 0.5, -0.33, 0.33}, 
			{-0.33, -0.5, 0.33, 0.33, -0.33, 0.5}, 
			{-0.33, -0.5, -0.33, 0.33, -0.33, -0.5}, 
			{-0.33, -0.33, -0.33, 0.33, -0.17, 0.33}, 
		} },
	groups = {fleshy=1, dig_immediate=3, flammable=2, plant=1, leafdecay=1},
})




--[[
		NOTE:	Change the following to use node timers --  ShadMOrdre
--]]

--MORETREES L TREES ABMs
-- -- -- actually grow the tree from a sapling

minetest.register_abm({
nodenames = {"lib_ecology:fern_giant_tree_sapling", "lib_ecology:fern_tree_sapling"},
	--nodenames = {"group:sapling"},
	interval = 30,
	chance = 10,
	action = function(pos, node)
		-- remove the sapling
		minetest.set_node( pos, {name="air"})
			
		if node.name == "lib_ecology:fern_giant_tree_sapling" then
			lib_ecology.grow_giant_tree_fern({x = pos.x, y = pos.y-1, z = pos.z});
		end
		
		if node.name == "lib_ecology:fern_tree_sapling" then
			lib_ecology.grow_tree_fern({x = pos.x, y = pos.y-1, z = pos.z});
		end
		
	end
})







