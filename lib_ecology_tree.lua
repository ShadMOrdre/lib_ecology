
local S = lib_ecology.intllib

local RADIUS = 5

-- Grow trees from saplings
-- 'can grow' function
lib_ecology.can_grow = function(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end

-- 'is snow nearby' function
lib_ecology.is_snow_nearby = function(pos)
	return minetest.find_node_near(pos, 1, {"group:snowy"})
end

lib_ecology.sapling_on_place = function(itemstack, placer, pointed_thing,
		sapling_name, minp_relative, maxp_relative, interval)
	-- Position of sapling
	local pos = pointed_thing.under
	local node = minetest.get_node_or_nil(pos)
	local pdef = node and minetest.registered_nodes[node.name]

	if pdef and pdef.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
		return pdef.on_rightclick(pos, node, placer, itemstack, pointed_thing)
	end

	if not pdef or not pdef.buildable_to then
		pos = pointed_thing.above
		node = minetest.get_node_or_nil(pos)
		pdef = node and minetest.registered_nodes[node.name]
		if not pdef or not pdef.buildable_to then
			return itemstack
		end
	end

	local player_name = placer and placer:get_player_name() or ""
	-- Check sapling position for protection
	if minetest.is_protected(pos, player_name) then
		minetest.record_protection_violation(pos, player_name)
		return itemstack
	end
	-- Check tree volume for protection
	if minetest.is_area_protected(
			vector.add(pos, minp_relative),
			vector.add(pos, maxp_relative),
			player_name,
			interval) then
		minetest.record_protection_violation(pos, player_name)
		-- Print extra information to explain
		minetest.chat_send_player(player_name,
			itemstack:get_definition().description .. " will intersect protection " ..
			"on growth")
		return itemstack
	end

	minetest.log("action", player_name .. " places node "
			.. sapling_name .. " at " .. minetest.pos_to_string(pos))

	local take_item = not (creative and creative.is_enabled_for
		and creative.is_enabled_for(player_name))
	local newnode = {name = sapling_name}
	local ndef = minetest.registered_nodes[sapling_name]
	minetest.set_node(pos, newnode)

	-- Run callback
	if ndef and ndef.after_place_node then
		-- Deepcopy place_to and pointed_thing because callback can modify it
		if ndef.after_place_node(table.copy(pos), placer,
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	-- Run script hook
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		if callback(table.copy(pos), table.copy(newnode),
				placer, table.copy(node or {}),
				itemstack, table.copy(pointed_thing)) then
			take_item = false
		end
	end

	if take_item then
		itemstack:take_item()
	end

	return itemstack
end

-- Leafdecay
-- Prevent decay of placed leaves
lib_ecology.after_place_leaves = function(pos, placer, itemstack, pointed_thing)
	if placer and placer:is_player() and not placer:get_player_control().sneak then
		local node = minetest.get_node(pos)
		node.param2 = 1
		minetest.set_node(pos, node)
	end
end


	minetest.register_craftitem("lib_ecology:stick", {
		description = "Stick",
		inventory_image = "lib_ecology_stick.png",
		groups = {stick = 1, flammable = 2},
	})

--TREE NODE DEFINITIONS  (Including Default, 30biomes, CoolTrees, Ethereal, Farlands, Forest, Maple, Moretrees, Trees, and Valleys_c tree nodes and graphics.  Licenses included where available.)
lib_ecology.register_tree = function(name)
	--tree parts
	minetest.register_node("lib_ecology:tree_"..name.."_trunk", {
		description = S(name .. " Trunk"),
		tiles = {"lib_ecology_tree_"..name.."_trunk_top.png", "lib_ecology_tree_"..name.."_trunk_top.png", "lib_ecology_tree_"..name.."_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_"..name.."_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
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
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_"..name.."_leaves"}},
				{items = {"lib_ecology:tree_"..name.."_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_"..name.."_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_"..name.."_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_"..name.."_sapling", {
		description = S(name .. " Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_"..name.."_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_cactus_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_"..name.."_wood 4",
		recipe = {
			{"lib_ecology:tree_"..name.."_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_"..name.."_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_"..name.."_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_"..name.."_leaves",
		burntime = 5,
	})
	--allface
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

--lib_ecology.register_tree("acacia")
--lib_ecology.register_tree("apple")
--lib_ecology.register_tree("ash")
--lib_ecology.register_tree("aspen")
--lib_ecology.register_tree("bamboo_01")
--lib_ecology.register_tree("bamboo_02")
lib_ecology.register_tree("banana_01")
---------lib_ecology.register_tree("banana_02")
--lib_ecology.register_tree("baobab")
--lib_ecology.register_tree("beech")
--lib_ecology.register_tree("beech_southern")
--lib_ecology.register_tree("birch_01")
--lib_ecology.register_tree("birch_02")
--lib_ecology.register_tree("cedar")
--lib_ecology.register_tree("cherry_blossom")
--lib_ecology.register_tree("cherry")
--lib_ecology.register_tree("chestnut")
--lib_ecology.register_tree("clementine")
--lib_ecology.register_tree("conifers")
--lib_ecology.register_tree("cypress")
---------lib_ecology.register_tree("date_palm")
--lib_ecology.register_tree("default")
--lib_ecology.register_tree("dry")
--lib_ecology.register_tree("ebony")
--lib_ecology.register_tree("eucalyptus")
--lib_ecology.register_tree("fir_coast")
--lib_ecology.register_tree("fir_doug")
--lib_ecology.register_tree("fir")
--lib_ecology.register_tree("frost")
--lib_ecology.register_tree("ginkgo")
--lib_ecology.register_tree("ipe_yellow")
lib_ecology.register_tree("jungle_01")
lib_ecology.register_tree("jungle_02")
lib_ecology.register_tree("jungle_03")
lib_ecology.register_tree("jungle_palm_01")
lib_ecology.register_tree("jungle_palm_02")
lib_ecology.register_tree("jungle_palm_03")
--lib_ecology.register_tree("lavender")
--lib_ecology.register_tree("lemon")
--lib_ecology.register_tree("mahogany")
--lib_ecology.register_tree("mangrove")
--lib_ecology.register_tree("maple")
--lib_ecology.register_tree("mirabelle")
--lib_ecology.register_tree("oak")
--lib_ecology.register_tree("oak_southern")
--lib_ecology.register_tree("oak_red")
--lib_ecology.register_tree("orange")
--lib_ecology.register_tree("palm_coconut")
--lib_ecology.register_tree("palm_date")
--lib_ecology.register_tree("palm_desert_01")
--lib_ecology.register_tree("palm_desert_02")
--lib_ecology.register_tree("palm_desert_03")
--lib_ecology.register_tree("palm_jungle_01")
--lib_ecology.register_tree("palm_jungle_02")
--lib_ecology.register_tree("palm_jungle_03")
lib_ecology.register_tree("palm_01")
--lib_ecology.register_tree("palm_02")
--lib_ecology.register_tree("pine_01")
--lib_ecology.register_tree("pine_02")
--lib_ecology.register_tree("pine_03")
--lib_ecology.register_tree("poplar")
--lib_ecology.register_tree("poplar_small")
--lib_ecology.register_tree("redwood")
--lib_ecology.register_tree("redwood_coast")
--lib_ecology.register_tree("rubber")
--lib_ecology.register_tree("sakura")
---------lib_ecology.register_tree("scorched")
--lib_ecology.register_tree("sequoia")
--lib_ecology.register_tree("spruce")
--lib_ecology.register_tree("spruce_sitka")
--lib_ecology.register_tree("teak")
--lib_ecology.register_tree("willow_01")
--lib_ecology.register_tree("willow_02")
--lib_ecology.register_tree("willow_03")
---------lib_ecology.register_tree("willow_04")
--lib_ecology.register_tree("yellow_healing")



--ACACIA
	--tree parts
	minetest.register_node("lib_ecology:tree_acacia_trunk", {
		description = S("Acacia Trunk"),
		tiles = {"lib_ecology_tree_acacia_trunk_top.png", "lib_ecology_tree_acacia_trunk_top.png", "lib_ecology_tree_acacia_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			----leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_acacia_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_acacia_wood", {
		description = S("Acacia Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_acacia_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_acacia_leaves", {
		description = S("Acacia Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_acacia_leaves.png"},
		special_tiles = {"lib_ecology_tree_acacia_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_acacia_leaves"}},
				{items = {"lib_ecology:tree_acacia_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_acacia_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_acacia_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_acacia_sapling", {
		description = S("Acacia Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_acacia_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--minetest.place_schematic({x = pos.x - 3, y = pos.y - 1, z = pos.z - 3}, tree_name, "random", nil, false)
			minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_01, "random", nil, true, "place_center_x, place_center_z")
			local rnum = math.random(1,7)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_06, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 7 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_acacia_07, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_acacia_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_acacia_wood 4",
		recipe = {
			{"lib_ecology:tree_acacia_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_acacia_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_acacia_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_acacia_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_acacia_trunk_allface_side", {
		description = S("Acacia Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_acacia_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_acacia_trunk_allface_top", {
		description = S("Acacia Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_acacia_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--APPLE
	--tree parts
	minetest.register_node("lib_ecology:tree_apple_trunk", {
		description = S("Apple Trunk"),
		tiles = {"lib_ecology_tree_apple_trunk_top.png", "lib_ecology_tree_apple_trunk_top.png", "lib_ecology_tree_apple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			----leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_apple_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_apple_wood", {
		description = S("Apple Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_apple_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_apple_leaves", {
		description = S("Apple Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_apple_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_apple_leaves"}},
				{items = {"lib_ecology:tree_apple_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_apple_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_apple_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_apple_sapling", {
		description = S("Apple Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_apple_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,5)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_apple_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_apple_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_apple_large_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_apple_large_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_apple_large_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_apple_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_apple_wood 4",
		recipe = {
			{"lib_ecology:tree_apple_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_apple_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_apple_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_apple_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_apple_trunk_allface_side", {
		description = S("Apple Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_apple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_apple_trunk_allface_top", {
		description = S("Apple Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_apple_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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
	--tree parts
	minetest.register_node("lib_ecology:tree_ash_trunk", {
		description = S("Ash Trunk"),
		tiles = {"lib_ecology_tree_ash_trunk_top.png", "lib_ecology_tree_ash_trunk_top.png", "lib_ecology_tree_ash_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			----leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_ash_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ash_wood", {
		description = S("Ash Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_ash_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_ash_leaves", {
		description = S("Ash Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_ash_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_ash_leaves"}},
				{items = {"lib_ecology:tree_ash_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_ash_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_ash_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_ash_sapling", {
		description = S("Ash Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_ash_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_ash_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_ash_02, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_ash_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_ash_wood 4",
		recipe = {
			{"lib_ecology:tree_ash_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ash_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ash_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ash_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_ash_trunk_allface_side", {
		description = S("Ash Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_ash_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ash_trunk_allface_top", {
		description = S("Ash Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_ash_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--ASPEN
	--tree parts
	minetest.register_node("lib_ecology:tree_aspen_trunk", {
		description = S("Aspen Trunk"),
		tiles = {"lib_ecology_tree_aspen_trunk_top.png", "lib_ecology_tree_aspen_trunk_top.png", "lib_ecology_tree_aspen_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			----leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_aspen_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_aspen_wood", {
		description = S("Aspen Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_aspen_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_aspen_leaves", {
		description = S("Aspen Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_aspen_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_aspen_leaves"}},
				{items = {"lib_ecology:tree_aspen_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_aspen_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_aspen_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_aspen_sapling", {
		description = S("Aspen Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_aspen_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,6)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_aspen_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_aspen_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_aspen_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_aspen_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_aspen_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_aspen_06, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_aspen_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_aspen_wood 4",
		recipe = {
			{"lib_ecology:tree_aspen_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_aspen_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_aspen_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_aspen_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_aspen_trunk_allface_side", {
		description = S("Aspen Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_aspen_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_aspen_trunk_allface_top", {
		description = S("Aspen Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_aspen_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


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

		after_destruct = function(pos, oldnode)
			----leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_bamboo_01_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
	
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

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_bamboo_01_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_bamboo_01_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

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
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_bamboo_01_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_bamboo_01_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_bamboo_01_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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
				minetest.get_node_timer(pos):start(math.random(60,120))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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
	--tree parts
	minetest.register_node("lib_ecology:tree_baobab_trunk", {
		description = S("Baobab Trunk"),
		tiles = {"lib_ecology_tree_baobab_trunk_top.png", "lib_ecology_tree_baobab_trunk_top.png", "lib_ecology_tree_baobab_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_baobab_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_baobab_wood", {
		description = S("Baobab Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_baobab_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_baobab_leaves", {
		description = S("Baobab Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_baobab_leaves.png"},
		special_tiles = {"lib_ecology_tree_baobab_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_baobab_leaves"}},
				{items = {"lib_ecology:tree_baobab_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_baobab_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_baobab_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_baobab_sapling", {
		description = S("Baobab Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_baobab_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,4)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_baobab_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_baobab_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_baobab_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_baobab_04, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_baobab_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_baobab_wood 4",
		recipe = {
			{"lib_ecology:tree_baobab_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_baobab_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_baobab_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_baobab_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_baobab_trunk_allface_side", {
		description = S("Baobab Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_baobab_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_baobab_trunk_allface_top", {
		description = S("Baobab Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_baobab_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--BEECH
	--tree parts
	minetest.register_node("lib_ecology:tree_beech_trunk", {
		description = S("Beech Trunk"),
		tiles = {"lib_ecology_tree_beech_trunk_top.png", "lib_ecology_tree_beech_trunk_top.png", "lib_ecology_tree_beech_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_beech_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_beech_wood", {
		description = S("Beech Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_beech_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_beech_leaves", {
		description = S("Beech Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_beech_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_beech_leaves"}},
				{items = {"lib_ecology:tree_beech_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_beech_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_beech_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_beech_sapling", {
		description = S("Beech Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_beech_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,5)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_large_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_large_02, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_beech_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_beech_wood 4",
		recipe = {
			{"lib_ecology:tree_beech_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_beech_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_beech_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_beech_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_beech_trunk_allface_side", {
		description = S("Beech Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_beech_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_beech_trunk_allface_top", {
		description = S("Beech Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_beech_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--BEECH SOUTHERN
	--tree parts
	minetest.register_node("lib_ecology:tree_beech_southern_trunk", {
		description = S("Southern Beech Trunk"),
		tiles = {"lib_ecology_tree_beech_southern_trunk_top.png", "lib_ecology_tree_beech_southern_trunk_top.png", "lib_ecology_tree_beech_southern_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_beech_southern_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_beech_southern_wood", {
		description = S("Southern Beech Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_beech_southern_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_beech_southern_leaves", {
		description = S("Southern Beech Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_beech_southern_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_beech_southern_leaves"}},
				{items = {"lib_ecology:tree_beech_southern_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_beech_southern_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_beech_southern_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_beech_southern_sapling", {
		description = S("Southern Beech Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_beech_southern_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,5)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_southern_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_southern_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_southern_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_southern_large_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_beech_southern_large_02, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_beech_southern_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_beech_southern_wood 4",
		recipe = {
			{"lib_ecology:tree_beech_southern_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_beech_southern_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_beech_southern_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_beech_southern_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_beech_southern_trunk_allface_side", {
		description = S("Southern Beech Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_beech_southern_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_beech_southern_trunk_allface_top", {
		description = S("Southern Beech Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_beech_southern_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--BIRCH 01
	--tree parts
	minetest.register_node("lib_ecology:tree_birch_01_trunk", {
		description = S("Birch 01 Trunk"),
		tiles = {"lib_ecology_tree_birch_01_trunk_top.png", "lib_ecology_tree_birch_01_trunk_top.png", "lib_ecology_tree_birch_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_birch_01_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_birch_01_wood", {
		description = S("Birch 01 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_birch_01_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_birch_01_leaves", {
		description = S("Birch 01 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_birch_01_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_birch_01_leaves"}},
				{items = {"lib_ecology:tree_birch_01_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)
			--leafdecay_on_timer(pos, def)
			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_birch_01_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_birch_01_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_birch_01_sapling", {
		description = S("Birch 01 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_birch_01_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,4)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_birch_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_birch_large_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_birch_large_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_birch_large_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_birch_01_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_birch_01_wood 4",
		recipe = {
			{"lib_ecology:tree_birch_01_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_birch_01_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_birch_01_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_birch_01_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_birch_01_trunk_allface_side", {
		description = S("Birch 01 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_birch_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_birch_01_trunk_allface_top", {
		description = S("Birch 01 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_birch_01_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


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
			paramtype = "light",
			paramtype2 = "facedir",
			waving = 1,
			walkable = false,
			is_ground_content = false,
			groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
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
				minetest.get_node_timer(pos):start(math.random(60,120))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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
	--tree parts
	minetest.register_node("lib_ecology:tree_cedar_trunk", {
		description = S("Cedar Trunk"),
		tiles = {"lib_ecology_tree_cedar_trunk_top.png", "lib_ecology_tree_cedar_trunk_top.png", "lib_ecology_tree_cedar_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_cedar_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_cedar_wood", {
		description = S("Cedar Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_cedar_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_cedar_leaves", {
		description = S("Cedar Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_cedar_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_cedar_leaves"}},
				{items = {"lib_ecology:tree_cedar_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_cedar_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_cedar_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_cedar_sapling", {
		description = S("Cedar Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_cedar_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cedar_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cedar_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cedar_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_cedar_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_cedar_wood 4",
		recipe = {
			{"lib_ecology:tree_cedar_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cedar_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cedar_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cedar_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_cedar_trunk_allface_side", {
		description = S("Cedar Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_cedar_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_cedar_trunk_allface_top", {
		description = S("Cedar Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_cedar_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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
				minetest.get_node_timer(pos):start(math.random(60,120))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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


--CHERRY
	--tree parts
	minetest.register_node("lib_ecology:tree_cherry_trunk", {
		description = S("Cherry Trunk"),
		tiles = {"lib_ecology_tree_cherry_trunk_top.png", "lib_ecology_tree_cherry_trunk_top.png", "lib_ecology_tree_cherry_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_cherry_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_cherry_wood", {
		description = S("Cherry Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_cherry_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_cherry_leaves", {
		description = S("Cherry Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_cherry_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_cherry_leaves"}},
				{items = {"lib_ecology:tree_cherry_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_cherry_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_cherry_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_cherry_sapling", {
		description = S("Cherry Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_cherry_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cherry, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_cherry_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_cherry_wood 4",
		recipe = {
			{"lib_ecology:tree_cherry_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cherry_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cherry_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cherry_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_cherry_trunk_allface_side", {
		description = S("Cherry Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_cherry_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_cherry_trunk_allface_top", {
		description = S("Cherry Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_cherry_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("lib_ecology:fruit_cherry", {
		description = S("Fruit - Cherry"),
		drawtype = "plantlike",
		tiles = { "lib_ecology_fruit_cherry.png" },
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


--CHESTNUT
	--tree parts
	minetest.register_node("lib_ecology:tree_chestnut_trunk", {
		description = S("Chestnut Trunk"),
		tiles = {"lib_ecology_tree_chestnut_trunk_top.png", "lib_ecology_tree_chestnut_trunk_top.png", "lib_ecology_tree_chestnut_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_chestnut_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_chestnut_wood", {
		description = S("Chestnut Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_chestnut_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_chestnut_leaves", {
		description = S("Chestnut Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_chestnut_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_chestnut_leaves"}},
				{items = {"lib_ecology:tree_chestnut_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_chestnut_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_chestnut_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_chestnut_sapling", {
		description = S("Chestnut Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_chestnut_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_chestnut_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_chestnut_02, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_chestnut_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_chestnut_wood 4",
		recipe = {
			{"lib_ecology:tree_chestnut_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_chestnut_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_chestnut_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_chestnut_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_chestnut_trunk_allface_side", {
		description = S("Chestnut Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_chestnut_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_chestnut_trunk_allface_top", {
		description = S("Chestnut Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_chestnut_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--CLEMENTINE
	--tree parts
	minetest.register_node("lib_ecology:tree_clementine_trunk", {
		description = S("Clementine Trunk"),
		tiles = {"lib_ecology_tree_clementine_trunk_top.png", "lib_ecology_tree_clementine_trunk_top.png", "lib_ecology_tree_clementine_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_clementine_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_clementine_wood", {
		description = S("Clementine Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_clementine_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_clementine_leaves", {
		description = S("Clementine Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_clementine_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_clementine_leaves"}},
				{items = {"lib_ecology:tree_clementine_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_clementine_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_clementine_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_clementine_sapling", {
		description = S("Clementine Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_clementine_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_clementine, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_clementine_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_clementine_wood 4",
		recipe = {
			{"lib_ecology:tree_clementine_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_clementine_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_clementine_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_clementine_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_clementine_trunk_allface_side", {
		description = S("Clementine Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_clementine_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_clementine_trunk_allface_top", {
		description = S("Clementine Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_clementine_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("lib_ecology:fruit_clementine", {
		description = S("Fruit - Clementine"),
		drawtype = "plantlike",
		tiles = { "lib_ecology_fruit_clementine.png" },
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


--CONIFERS
	--tree parts
	minetest.register_node("lib_ecology:tree_conifers_trunk", {
		description = S("Conifers Trunk"),
		tiles = {"lib_ecology_tree_conifers_trunk_top.png", "lib_ecology_tree_conifers_trunk_top.png", "lib_ecology_tree_conifers_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_conifers_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_conifers_wood", {
		description = S("Conifers Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_conifers_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_conifers_leaves", {
		description = S("Conifers Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_conifers_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_conifers_leaves"}},
				{items = {"lib_ecology:tree_conifers_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_conifers_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_conifers_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_conifers_sapling", {
		description = S("Conifers Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_conifers_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,7)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_06, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 7 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_conifer_07, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_conifers_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_conifers_wood 4",
		recipe = {
			{"lib_ecology:tree_conifers_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_conifers_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_conifers_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_conifers_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_conifers_trunk_allface_side", {
		description = S("Conifers Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_conifers_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_conifers_trunk_allface_top", {
		description = S("Conifers Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_conifers_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--CYPRESS
	--tree parts
	minetest.register_node("lib_ecology:tree_cypress_trunk", {
		description = S("Cypress Trunk"),
		tiles = {"lib_ecology_tree_cypress_trunk_top.png", "lib_ecology_tree_cypress_trunk_top.png", "lib_ecology_tree_cypress_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_cypress_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_cypress_wood", {
		description = S("Cypress Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_cypress_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_cypress_leaves", {
		description = S("Cypress Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_cypress_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_cypress_leaves"}},
				{items = {"lib_ecology:tree_cypress_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_cypress_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_cypress_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_cypress_sapling", {
		description = S("Cypress Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_cypress_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cypress_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cypress_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_cypress_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_cypress_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_cypress_wood 4",
		recipe = {
			{"lib_ecology:tree_cypress_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cypress_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cypress_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_cypress_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_cypress_trunk_allface_side", {
		description = S("Cypress Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_cypress_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_cypress_trunk_allface_top", {
		description = S("Cypress Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_cypress_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--DEFAULT --needs schematic
	--tree parts
	minetest.register_node("lib_ecology:tree_default_trunk", {
		description = S("Default Trunk"),
		tiles = {"lib_ecology_tree_default_trunk_top.png", "lib_ecology_tree_default_trunk_top.png", "lib_ecology_tree_default_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_default_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_default_wood", {
		description = S("Default Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_default_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_default_leaves", {
		description = S("Default Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_default_leaves.png"},
		special_tiles = {"lib_ecology_tree_default_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_default_leaves"}},
				{items = {"lib_ecology:tree_default_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_default_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_default_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_default_sapling", {
		description = S("Default Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_default_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_default_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_default_wood 4",
		recipe = {
			{"lib_ecology:tree_default_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_default_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_default_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_default_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_default_trunk_allface_side", {
		description = S("Default Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_default_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_default_trunk_allface_top", {
		description = S("Default Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_default_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--DRY (SAVANNAH) --needs schematic
	--tree parts
	minetest.register_node("lib_ecology:tree_dry_trunk", {
		description = S("Dry Trunk"),
		tiles = {"lib_ecology_tree_dry_trunk_top.png", "lib_ecology_tree_dry_trunk_top.png", "lib_ecology_tree_dry_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_dry_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_dry_wood", {
		description = S("Dry Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_dry_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_dry_leaves", {
		description = S("Dry Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_dry_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_dry_leaves"}},
				{items = {"lib_ecology:tree_dry_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_dry_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_dry_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_dry_sapling", {
		description = S("Dry Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_dry_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_dry_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_dry_wood 4",
		recipe = {
			{"lib_ecology:tree_dry_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_dry_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_dry_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_dry_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_dry_trunk_allface_side", {
		description = S("Dry Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_dry_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_dry_trunk_allface_top", {
		description = S("Dry Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_dry_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--EBONY
	--tree parts
	minetest.register_node("lib_ecology:tree_ebony_trunk", {
		description = S("Ebony Trunk"),
		tiles = {"lib_ecology_tree_ebony_trunk_top.png", "lib_ecology_tree_ebony_trunk_top.png", "lib_ecology_tree_ebony_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_ebony_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ebony_wood", {
		description = S("Ebony Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_ebony_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_ebony_leaves", {
		description = S("Ebony Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_ebony_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_ebony_leaves"}},
				{items = {"lib_ecology:tree_ebony_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_ebony_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_ebony_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_ebony_sapling", {
		description = S("Ebony Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_ebony_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_ebony, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_ebony_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_ebony_wood 4",
		recipe = {
			{"lib_ecology:tree_ebony_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ebony_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ebony_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ebony_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_ebony_trunk_allface_side", {
		description = S("Ebony Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_ebony_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ebony_trunk_allface_top", {
		description = S("Ebony Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_ebony_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--EUCALYPTUS
	--tree parts
	minetest.register_node("lib_ecology:tree_eucalyptus_trunk", {
		description = S("Eucalyptus Trunk"),
		tiles = {"lib_ecology_tree_eucalyptus_trunk_top.png", "lib_ecology_tree_eucalyptus_trunk_top.png", "lib_ecology_tree_eucalyptus_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_eucalyptus_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_eucalyptus_wood", {
		description = S("Eucalyptus Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_eucalyptus_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_eucalyptus_leaves", {
		description = S("Eucalyptus Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_eucalyptus_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_eucalyptus_leaves"}},
				{items = {"lib_ecology:tree_eucalyptus_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_eucalyptus_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_eucalyptus_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_eucalyptus_sapling", {
		description = S("Eucalyptus Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_eucalyptus_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_eucalyptus_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_eucalyptus_large_01, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_eucalyptus_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_eucalyptus_wood 4",
		recipe = {
			{"lib_ecology:tree_eucalyptus_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_eucalyptus_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_eucalyptus_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_eucalyptus_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_eucalyptus_trunk_allface_side", {
		description = S("Eucalyptus Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_eucalyptus_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_eucalyptus_trunk_allface_top", {
		description = S("Eucalyptus Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_eucalyptus_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--FERN TREES
	minetest.register_node("lib_ecology:tree_fern_giant_crown", {
		description = S("Tree Fern Giant Crown (Dicksonia)"),
		drawtype = "plantlike",
		visual_scale = 8.0,  --math.sqrt(8),
		wield_scale = {x=0.175, y=0.175, z=0.175},
		paramtype = "light",
		tiles = {"lib_ecology_tree_fern_giant_crown.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,attached_node=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 2,
			items = {
				{
					-- occasionally, drop a second sapling instead of leaves
					-- (extra saplings can also be obtained by replanting and
					--  reharvesting leaves)
					items = {"lib_ecology:tree_fern_giant_crown"},
					rarity = 10,
				},
				{
					items = {"lib_ecology:tree_fern_giant_sapling"},
				}
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:tree_fern_giant_leaves", {
		description = "Tree Fern Giant Leaves",
		drawtype = "raillike",
		paramtype = "light",
		tiles = {
			"lib_ecology_tree_fern_giant_leaves.png",
		},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:tree_fern_giant_leaves_end", {
		description = "Tree Fern Giant Leaves End",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = { "lib_ecology_tree_fern_giant_leaves_end.png" },
		walkable = false,
		node_box = {
			type = "fixed",
	--			    {left, bottom, front, right, top,   back }
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:tree_fern_giant_trunk_top", {
		description = "Tree Fern Giant Trunk Top",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_tree_fern_giant_leaves_cross.png",
			"lib_ecology_tree_fern_giant_trunk_top.png",
			"lib_ecology_tree_fern_giant_trunk.png"
		},
		node_box = {
			type = "fixed",
	--			{left, bottom, front, right, top,   back }
			fixed = {
				{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
				{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		groups = {tree=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1, not_in_creative_inventory=1, leafdecay=3}, -- to support vines
		drop = "lib_ecology:fern_giant_tree_trunk",
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_fern_giant_trunk", {
		description = "Tree Fern Giant Trunk",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_tree_fern_giant_trunk_top.png",
			"lib_ecology_tree_fern_giant_trunk_top.png",
			"lib_ecology_tree_fern_giant_trunk.png"
		},
		node_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
		sounds = lib_ecology.node_sound_wood_defaults(),
		--after_destruct = function(pos,oldnode)
			--local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
			--if node.name == "lib_ecology:fern_giant_tree_trunk" or node.name == "lib_ecology:fern_giant_tree_trunk_top" then 
				--minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, "air") 
				--minetest.add_item(pos,"lib_ecology:fern_giant_tree_trunk")
			--end
		--end,
	})

	minetest.register_node("lib_ecology:fern_giant_tree_crown2", {
		description = S("Fern Giant Tree Crown2 (Dicksonia)"),
		drawtype = "plantlike",
		visual_scale = 7.0,  --math.sqrt(8),
		wield_scale = {x=0.175, y=0.175, z=0.175},
		paramtype = "light",
		tiles = {"lib_ecology_fern_giant_tree_crown2.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,attached_node=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 2,
			items = {
				{
					-- occasionally, drop a second sapling instead of leaves
					-- (extra saplings can also be obtained by replanting and
					--  reharvesting leaves)
					items = {"lib_ecology:fern_giant_tree_sapling"},
					rarity = 10,
				},
				{
					items = {"lib_ecology:fern_giant_tree_sapling"},
				},
				{
					items = {"lib_ecology:fern_giant_tree_crown2"},
				}
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves_2", {
		description = "Fern Giant Tree Leaves 2",
		drawtype = "raillike",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_giant_tree_leaves2.png",
		},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_leaves_end_2", {
		description = "Fern Giant Tree Leaves End 2",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = { "lib_ecology_fern_giant_tree_leaves_end2.png" },
		walkable = false,
		node_box = {
			type = "fixed",
	--			    {left, bottom, front, right, top,   back }
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
		},
		groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1, leaves = 1, leafdecay = 1},
		drop = "",
		sounds = lib_ecology.node_sound_leaves_defaults(),
	})
	minetest.register_node("lib_ecology:fern_giant_tree_trunk_top_2", {
		description = "Fern Giant Tree Trunk Top 2",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_fern_giant_tree_leaves_cross2.png",
			"lib_ecology_fern_giant_tree_trunk_top.png",
			"lib_ecology_fern_giant_tree_trunk.png"
		},
		node_box = {
			type = "fixed",
	--			{left, bottom, front, right, top,   back }
			fixed = {
				{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
				{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		},
		groups = {
			tree=1,
			choppy=2,
			oddly_breakable_by_hand=2,
			flammable=3,
			wood=1,
			not_in_creative_inventory=1,
			leafdecay=3 -- to support vines
		},
		drop = "lib_ecology:fern_giant_tree_trunk",
		sounds = lib_ecology.node_sound_wood_defaults(),
	})

	minetest.register_node("lib_ecology:tree_fern_giant_sapling", {
		description = "Tree Fern Giant Sapling",
		drawtype = "plantlike",
		paramtype = "light",
		tiles = {"lib_ecology_tree_fern_giant_sapling.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, sapling = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})

	minetest.register_node("lib_ecology:tree_fern_giant_leaves_big", {
		description = S("Tree Fern Giant Leaves"),
		drawtype = "allfaces_optional",
		visual_scale = 1.189,
		tiles = {
			"lib_ecology_tree_fern_giant_leaves.png",
			nil,
			"lib_ecology_tree_fern_giant_leaves_end.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 3, flammable = 2, leaves = 1, moretrees_leaves = 1, leafdecay = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),

	})

	minetest.register_node("lib_ecology:tree_fern_small_leaves_01", {
		description = "Tree Fern Small 01 Leaves",
		drawtype = "plantlike",
		visual_scale = 4.0,
		paramtype = "light",
		waving = 1,
		paramtype2 = "facedir",
		tiles = {"lib_ecology_tree_fern_small_01_leaves.png"},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 1,
			items = {
				{
					items = {"lib_ecology:fern_tree_sapling"},
					rarity = 20,
				},
				{
					items = {"lib_ecology:fern_tree_leaves_01"},
				}
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:tree_fern_small_leaves_02", {
		description = "Tree Fern Small 02 Leaves",
		drawtype = "plantlike",
		visual_scale = 4.0,
		paramtype = "light",
		waving = 1,
		tiles = {"lib_ecology_tree_fern_small_02_leaves.png"},
		walkable = false,
		groups = {snappy=3,flammable=2,attached_node=1, leaves = 1, leafdecay = 1},
		drop = {
			max_items = 1,
			items = {
				{
					items = {"lib_ecology:fern_tree_sapling"},
					rarity = 20,
				},
				{
					items = {"lib_ecology:fern_tree_leaves_02"},
				}
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})
	minetest.register_node("lib_ecology:tree_fern_small_trunk", {
		description = "Tree Fern Small Trunk",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {
			"lib_ecology_tree_fern_small_trunk_top.png",
			"lib_ecology_tree_fern_small_trunk_top.png",
			"lib_ecology_tree_fern_small_trunk.png"
		},
		node_box = {
			type = "fixed",
			fixed = {
				{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
				{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
		},
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
		sounds = lib_ecology.node_sound_wood_defaults(),
		-- after_destruct = function(pos,oldnode)
			-- local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
			-- if node.name == "lib_ecology:fern_tree_trunk" then 
				-- minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z}) 
				-- minetest.add_item(pos,"lib_ecology:fern_tree_trunk")
			-- end
		-- end,
	})
	minetest.register_node("lib_ecology:tree_fern_small_sapling", {
		description = "Tree Fern Small Sapling",
		drawtype = "plantlike",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = {"lib_ecology_tree_fern_small_sapling.png"},
		walkable = false,
		waving = 1,
		floodable = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, sapling = 1},
		sounds = lib_ecology.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
		},
	})



--FIR COAST
	--tree parts
	minetest.register_node("lib_ecology:tree_fir_coast_trunk", {
		description = S("Coastal Fir Trunk"),
		tiles = {"lib_ecology_tree_fir_coast_trunk_top.png", "lib_ecology_tree_fir_coast_trunk_top.png", "lib_ecology_tree_fir_coast_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_fir_coast_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_fir_coast_wood", {
		description = S("Coastal Fir Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_fir_coast_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_fir_coast_leaves", {
		description = S("Coastal Fir Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_fir_coast_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_fir_coast_leaves"}},
				{items = {"lib_ecology:tree_fir_coast_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_fir_coast_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_fir_coast_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_fir_coast_sapling", {
		description = S("Coastal Fir Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_fir_coast_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,6)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_coast_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_coast_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_coast_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_coast_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_coast_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_coast_06, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_fir_coast_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_fir_coast_wood 4",
		recipe = {
			{"lib_ecology:tree_fir_coast_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_coast_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_coast_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_coast_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_fir_coast_trunk_allface_side", {
		description = S("Coastal Fir Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_fir_coast_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_fir_coast_trunk_allface_top", {
		description = S("Coastal Fir Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_fir_coast_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--FIR DOUGLASS
	--tree parts
	minetest.register_node("lib_ecology:tree_fir_doug_trunk", {
		description = S("Douglas Fir Trunk"),
		tiles = {"lib_ecology_tree_fir_doug_trunk_top.png", "lib_ecology_tree_fir_doug_trunk_top.png", "lib_ecology_tree_fir_doug_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_fir_doug_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_fir_doug_wood", {
		description = S("Douglas Fir Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_fir_doug_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_fir_doug_leaves", {
		description = S("Douglas Fir Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_fir_doug_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_fir_doug_leaves"}},
				{items = {"lib_ecology:tree_fir_doug_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_fir_doug_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_fir_doug_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_fir_doug_sapling", {
		description = S("Douglas Fir Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_fir_doug_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,6)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_doug_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_doug_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_doug_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_doug_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_doug_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_doug_06, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_fir_doug_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_fir_doug_wood 4",
		recipe = {
			{"lib_ecology:tree_fir_doug_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_doug_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_doug_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_doug_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_fir_doug_trunk_allface_side", {
		description = S("Douglas Fir Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_fir_doug_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_fir_doug_trunk_allface_top", {
		description = S("Douglas Fir Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_fir_doug_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--FIR
	--tree parts
	minetest.register_node("lib_ecology:tree_fir_trunk", {
		description = S("Fir Trunk"),
		tiles = {"lib_ecology_tree_fir_trunk_top.png", "lib_ecology_tree_fir_trunk_top.png", "lib_ecology_tree_fir_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_fir_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_fir_wood", {
		description = S("Fir Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_fir_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_fir_leaves", {
		description = S("Fir Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_fir_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_fir_leaves"}},
				{items = {"lib_ecology:tree_fir_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_fir_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_fir_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_fir_sapling", {
		description = S("Fir Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_fir_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,6)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_fir_06, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_fir_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_fir_wood 4",
		recipe = {
			{"lib_ecology:tree_fir_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_fir_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_fir_trunk_allface_side", {
		description = S("Fir Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_fir_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_fir_trunk_allface_top", {
		description = S("Fir Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_fir_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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
	--tree parts
	minetest.register_node("lib_ecology:tree_frost_trunk", {
		description = S("Frost Trunk"),
		tiles = {"lib_ecology_tree_frost_trunk_top.png", "lib_ecology_tree_frost_trunk_top.png", "lib_ecology_tree_frost_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_frost_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_frost_wood", {
		description = S("Frost Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_frost_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_frost_leaves", {
		description = S("Frost Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_frost_leaves.png"},
		special_tiles = {"lib_ecology_tree_frost_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_frost_leaves"}},
				{items = {"lib_ecology:tree_frost_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_frost_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_frost_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_frost_sapling", {
		description = S("Frost Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_frost_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_frost, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_frost_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_frost_wood 4",
		recipe = {
			{"lib_ecology:tree_frost_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_frost_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_frost_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_frost_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_frost_trunk_allface_side", {
		description = S("Frost Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_frost_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_frost_trunk_allface_top", {
		description = S("Frost Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_frost_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--GINKGO --needs schematic
	--tree parts
	minetest.register_node("lib_ecology:tree_ginkgo_trunk", {
		description = S("Ginkgo Trunk"),
		tiles = {"lib_ecology_tree_ginkgo_trunk_top.png", "lib_ecology_tree_ginkgo_trunk_top.png", "lib_ecology_tree_ginkgo_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_ginkgo_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ginkgo_wood", {
		description = S("Ginkgo Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_ginkgo_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_ginkgo_leaves", {
		description = S("Ginkgo Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_ginkgo_leaves.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_ginkgo_leaves"}},
				{items = {"lib_ecology:tree_ginkgo_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_ginkgo_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_ginkgo_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_ginkgo_sapling", {
		description = S("Ginkgo Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_ginkgo_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_ginkgo_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_ginkgo_wood 4",
		recipe = {
			{"lib_ecology:tree_ginkgo_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ginkgo_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ginkgo_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ginkgo_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_ginkgo_trunk_allface_side", {
		description = S("Ginkgo Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_ginkgo_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ginkgo_trunk_allface_top", {
		description = S("Ginkgo Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_ginkgo_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--IPE YELLOW
	--tree parts
	minetest.register_node("lib_ecology:tree_ipe_yellow_trunk", {
		description = S("Yellow Ipe Trunk"),
		tiles = {"lib_ecology_tree_ipe_yellow_trunk_top.png", "lib_ecology_tree_ipe_yellow_trunk_top.png", "lib_ecology_tree_ipe_yellow_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_ipe_yellow_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ipe_yellow_wood", {
		description = S("Yellow Ipe Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_ipe_yellow_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_ipe_yellow_leaves", {
		description = S("Yellow Ipe Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_ipe_yellow_leaves.png"},
		special_tiles = {"lib_ecology_tree_ipe_yellow_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_ipe_yellow_leaves"}},
				{items = {"lib_ecology:tree_ipe_yellow_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_ipe_yellow_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_ipe_yellow_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_ipe_yellow_sapling", {
		description = S("Yellow Ipe Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_ipe_yellow_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_ipe_yellow, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_ipe_yellow_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_ipe_yellow_wood 4",
		recipe = {
			{"lib_ecology:tree_ipe_yellow_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ipe_yellow_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ipe_yellow_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_ipe_yellow_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_ipe_yellow_trunk_allface_side", {
		description = S("Yellow Ipe Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_ipe_yellow_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_ipe_yellow_trunk_allface_top", {
		description = S("Yellow Ipe Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_ipe_yellow_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--JUNGLE


--LAVENDER --needs schematic
	--tree parts
	minetest.register_node("lib_ecology:tree_lavender_trunk", {
		description = S("Lavender Trunk"),
		tiles = {"lib_ecology_tree_lavender_trunk_top.png", "lib_ecology_tree_lavender_trunk_top.png", "lib_ecology_tree_lavender_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_lavender_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_lavender_wood", {
		description = S("Lavender Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_lavender_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_lavender_leaves", {
		description = S("Lavender Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_lavender_leaves.png"},
		special_tiles = {"lib_ecology_tree_lavender_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_lavender_leaves"}},
				{items = {"lib_ecology:tree_lavender_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_lavender_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_lavender_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_lavender_sapling", {
		description = S("Lavender Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_lavender_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_lavender_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_lavender_wood 4",
		recipe = {
			{"lib_ecology:tree_lavender_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_lavender_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_lavender_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_lavender_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_lavender_trunk_allface_side", {
		description = S("Lavender Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_lavender_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_lavender_trunk_allface_top", {
		description = S("Lavender Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_lavender_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("lib_ecology:fruit_lavender", {
		description = S("Fruit - Lavender"),
		drawtype = "plantlike",
		tiles = { "lib_ecology_fruit_lavender.png" },
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

--LEMON
	--tree parts
	minetest.register_node("lib_ecology:tree_lemon_trunk", {
		description = S("Lemon Trunk"),
		tiles = {"lib_ecology_tree_lemon_trunk_top.png", "lib_ecology_tree_lemon_trunk_top.png", "lib_ecology_tree_lemon_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_lemon_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_lemon_wood", {
		description = S("Lemon Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_lemon_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_lemon_leaves", {
		description = S("Lemon Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_lemon_leaves.png"},
		special_tiles = {"lib_ecology_tree_lemon_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_lemon_leaves"}},
				{items = {"lib_ecology:tree_lemon_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_lemon_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_lemon_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_lemon_sapling", {
		description = S("Lemon Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_lemon_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_lemon, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_lemon_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_lemon_wood 4",
		recipe = {
			{"lib_ecology:tree_lemon_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_lemon_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_lemon_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_lemon_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_lemon_trunk_allface_side", {
		description = S("Lemon Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_lemon_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_lemon_trunk_allface_top", {
		description = S("Lemon Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_lemon_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("lib_ecology:fruit_lemon", {
		description = S("Fruit - Lemon"),
		drawtype = "plantlike",
		tiles = { "lib_ecology_fruit_lemon.png" },
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

--MAHOGANY
	--tree parts
	minetest.register_node("lib_ecology:tree_mahogany_trunk", {
		description = S("Mahogany Trunk"),
		tiles = {"lib_ecology_tree_mahogany_trunk_top.png", "lib_ecology_tree_mahogany_trunk_top.png", "lib_ecology_tree_mahogany_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_mahogany_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_mahogany_wood", {
		description = S("Mahogany Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_mahogany_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_mahogany_leaves", {
		description = S("Mahogany Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_mahogany_leaves.png"},
		special_tiles = {"lib_ecology_tree_mahogany_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_mahogany_leaves"}},
				{items = {"lib_ecology:tree_mahogany_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_mahogany_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_mahogany_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_mahogany_sapling", {
		description = S("Mahogany Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_mahogany_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mahogany, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_mahogany_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_mahogany_wood 4",
		recipe = {
			{"lib_ecology:tree_mahogany_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mahogany_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mahogany_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mahogany_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_mahogany_trunk_allface_side", {
		description = S("Mahogany Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_mahogany_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_mahogany_trunk_allface_top", {
		description = S("Mahogany Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_mahogany_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--MANGROVE
	--tree parts
	minetest.register_node("lib_ecology:tree_mangrove_trunk", {
		description = S("Mangrove Trunk"),
		tiles = {"lib_ecology_tree_mangrove_trunk_top.png", "lib_ecology_tree_mangrove_trunk_top.png", "lib_ecology_tree_mangrove_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_mangrove_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_mangrove_wood", {
		description = S("Mangrove Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_mangrove_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_mangrove_leaves", {
		description = S("Mangrove Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_mangrove_leaves.png"},
		special_tiles = {"lib_ecology_tree_mangrove_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_mangrove_leaves"}},
				{items = {"lib_ecology:tree_mangrove_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_mangrove_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_mangrove_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_mangrove_sapling", {
		description = S("Mangrove Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_mangrove_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,6)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mangrove_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mangrove_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mangrove_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mangrove_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mangrove_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_mangrove_06, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_mangrove_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_mangrove_wood 4",
		recipe = {
			{"lib_ecology:tree_mangrove_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mangrove_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mangrove_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mangrove_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_mangrove_trunk_allface_side", {
		description = S("Mangrove Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_mangrove_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_mangrove_trunk_allface_top", {
		description = S("Mangrove Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_mangrove_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	--root
	minetest.register_node("lib_ecology:tree_mangrove_root", {
		description = S("Mangrove Root"),
		drawtype = "plantlike_rooted",
		tiles = {"lib_materials_dirt_silt_01.png"},
		special_tiles = {{name = "lib_ecology_tree_mangrove_roots.png", tileable_vertical = true}},
		inventory_image = "lib_ecology_tree_mangrove_roots.png",
		wield_image = "lib_ecology_tree_mangrove_roots.png",
		paramtype = "light",
		is_ground_content = false,
		sunlight_propagates = true,
		walkable = true,
		node_dig_prediction = "lib_ecology:tree_mangrove_root",
		node_placement_prediction = "lib_ecology:tree_mangrove_root",
		groups = {snappy = 3, sea=1},
		sounds = lib_ecology.node_sound_wood_defaults({
			dig = {name = "default_dig_choppy", gain = 0.2},
			dug = {name = "default_grass_footstep", gain = 0.25},
		}),
		selection_box = {
			type = "fixed",
			fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
					{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
			},
		},


		on_place = function(itemstack, placer, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			if pointed_thing.type == "node" and placer and
					not placer:get_player_control().sneak then
				local node_ptu = minetest.get_node(pointed_thing.under)
				local def_ptu = minetest.registered_nodes[node_ptu.name]
				if def_ptu and def_ptu.on_rightclick then
					return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
						itemstack, pointed_thing)
				end
			end

			local pos = pointed_thing.under
			if minetest.get_node(pos).name ~= "lib_materials:dirt_silt_01" then
				return itemstack
			end

			local height = math.random(4, 6)
			local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
			local node_top = minetest.get_node(pos_top)
			local def_top = minetest.registered_nodes[node_top.name]
			local player_name = placer:get_player_name()

			if def_top and def_top.liquidtype == "source" and
					minetest.get_item_group(node_top.name, "water") > 0 then
				if not minetest.is_protected(pos, player_name) and
						not minetest.is_protected(pos_top, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:tree_mangrove_root",
						param2 = height * 16})
					if not (creative and creative.is_enabled_for
							and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end,

		after_destruct  = function(pos, oldnode)
			minetest.set_node(pos, {name = "lib_materials:dirt_silt_01"})
		end,
	})

--MAPLE
	--tree parts
	minetest.register_node("lib_ecology:tree_maple_trunk", {
		description = S("Maple Trunk"),
		tiles = {"lib_ecology_tree_maple_trunk_top.png", "lib_ecology_tree_maple_trunk_top.png", "lib_ecology_tree_maple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_maple_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_maple_wood", {
		description = S("Maple Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_maple_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_maple_leaves", {
		description = S("Maple Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_maple_leaves.png"},
		special_tiles = {"lib_ecology_tree_maple_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_maple_leaves"}},
				{items = {"lib_ecology:tree_maple_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_maple_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_maple_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_maple_sapling", {
		description = S("Maple Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_maple_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_maple_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_maple_large_01, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_maple_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_maple_wood 4",
		recipe = {
			{"lib_ecology:tree_maple_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_maple_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_maple_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_maple_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_maple_trunk_allface_side", {
		description = S("Maple Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_maple_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_maple_trunk_allface_top", {
		description = S("Maple Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_maple_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--MIRABELLE --needs schematic
	--tree parts
	minetest.register_node("lib_ecology:tree_mirabelle_trunk", {
		description = S("Mirabelle Trunk"),
		tiles = {"lib_ecology_tree_mirabelle_trunk_top.png", "lib_ecology_tree_mirabelle_trunk_top.png", "lib_ecology_tree_mirabelle_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_mirabelle_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_mirabelle_wood", {
		description = S("Mirabelle Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_mirabelle_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_mirabelle_leaves", {
		description = S("Mirabelle Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_mirabelle_leaves.png"},
		special_tiles = {"lib_ecology_tree_mirabelle_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_mirabelle_leaves"}},
				{items = {"lib_ecology:tree_mirabelle_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_mirabelle_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs("lib_ecology:tree_mirabelle_leaves") do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_mirabelle_sapling", {
		description = S("Mirabelle Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_mirabelle_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_mirabelle_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_mirabelle_wood 4",
		recipe = {
			{"lib_ecology:tree_mirabelle_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mirabelle_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mirabelle_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_mirabelle_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_mirabelle_trunk_allface_side", {
		description = S("Mirabelle Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_mirabelle_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_mirabelle_trunk_allface_top", {
		description = S("Mirabelle Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_mirabelle_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("lib_ecology:fruit_mirabelle", {
		description = S("Fruit - Mirabelle"),
		drawtype = "plantlike",
		tiles = { "lib_ecology_fruit_mirabelle.png" },
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

--OAK
	--tree parts
	minetest.register_node("lib_ecology:tree_oak_trunk", {
		description = S("Oak Trunk"),
		tiles = {"lib_ecology_tree_oak_trunk_top.png", "lib_ecology_tree_oak_trunk_top.png", "lib_ecology_tree_oak_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_oak_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_oak_wood", {
		description = S("Oak Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_oak_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_oak_leaves", {
		description = S("Oak Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_oak_leaves.png"},
		special_tiles = {"lib_ecology_tree_oak_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_oak_leaves"}},
				{items = {"lib_ecology:tree_oak_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_oak_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_oak_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_oak_sapling", {
		description = S("Oak Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_oak_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_oak_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_oak_wood 4",
		recipe = {
			{"lib_ecology:tree_oak_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_oak_trunk_allface_side", {
		description = S("Oak Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_oak_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_oak_trunk_allface_top", {
		description = S("Oak Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_oak_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--OAK RED
	--tree parts
	minetest.register_node("lib_ecology:tree_oak_red_trunk", {
		description = S("Red Oak Trunk"),
		tiles = {"lib_ecology_tree_oak_red_trunk_top.png", "lib_ecology_tree_oak_red_trunk_top.png", "lib_ecology_tree_oak_red_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_oak_red_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_oak_red_wood", {
		description = S("Red Oak Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_oak_red_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_oak_red_leaves", {
		description = S("Red Oak Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_oak_red_leaves.png"},
		special_tiles = {"lib_ecology_tree_oak_red_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_oak_red_leaves"}},
				{items = {"lib_ecology:tree_oak_red_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_oak_red_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_oak_red_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_oak_red_sapling", {
		description = S("Red Oak Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_oak_red_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_red_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_red_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_red_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_oak_red_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_oak_red_wood 4",
		recipe = {
			{"lib_ecology:tree_oak_red_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_red_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_red_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_red_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_oak_red_trunk_allface_side", {
		description = S("Red Oak Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_oak_red_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_oak_red_trunk_allface_top", {
		description = S("Red Oak Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_oak_red_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--OAK SOUTHERN
	--tree parts
	minetest.register_node("lib_ecology:tree_oak_southern_trunk", {
		description = S("Southern Oak Trunk"),
		tiles = {"lib_ecology_tree_oak_southern_trunk_top.png", "lib_ecology_tree_oak_southern_trunk_top.png", "lib_ecology_tree_oak_southern_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_oak_southern_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_oak_southern_wood", {
		description = S("Southern Oak Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_oak_southern_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_oak_southern_leaves", {
		description = S("Southern Oak Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_oak_southern_leaves.png"},
		special_tiles = {"lib_ecology_tree_oak_southern_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_oak_southern_leaves"}},
				{items = {"lib_ecology:tree_oak_southern_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_oak_southern_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_oak_southern_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_oak_southern_sapling", {
		description = S("Southern Oak Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_oak_southern_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_southern_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_southern_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_oak_southern_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_oak_southern_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_oak_southern_wood 4",
		recipe = {
			{"lib_ecology:tree_oak_southern_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_southern_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_southern_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_oak_southern_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_oak_southern_trunk_allface_side", {
		description = S("Southern Oak Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_oak_southern_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_oak_southern_trunk_allface_top", {
		description = S("Southern Oak Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_oak_southern_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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
	--tree parts
	minetest.register_node("lib_ecology:tree_orange_trunk", {
		description = S("Orange Trunk"),
		tiles = {"lib_ecology_tree_orange_trunk_top.png", "lib_ecology_tree_orange_trunk_top.png", "lib_ecology_tree_orange_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_orange_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_orange_wood", {
		description = S("Orange Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_orange_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_orange_leaves", {
		description = S("Orange Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_orange_leaves.png"},
		special_tiles = {"lib_ecology_tree_orange_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_orange_leaves"}},
				{items = {"lib_ecology:tree_orange_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_orange_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_orange_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_orange_sapling", {
		description = S("Orange Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_orange_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_orange, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_orange_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_orange_wood 4",
		recipe = {
			{"lib_ecology:tree_orange_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_orange_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_orange_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_orange_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_orange_trunk_allface_side", {
		description = S("Orange Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_orange_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_orange_trunk_allface_top", {
		description = S("Orange Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_orange_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--PALM COCONUT
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_coconut_trunk", {
		description = S("Coconut Palm Trunk"),
		tiles = {"lib_ecology_tree_palm_coconut_trunk_top.png", "lib_ecology_tree_palm_coconut_trunk_top.png", "lib_ecology_tree_palm_coconut_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_coconut_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_coconut_wood", {
		description = S("Coconut Palm Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_coconut_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_coconut_leaves", {
		description = S("Coconut Palm Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_coconut_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_coconut_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_coconut_leaves"}},
				{items = {"lib_ecology:tree_palm_coconut_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_coconut_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_coconut_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_coconut_sapling", {
		description = S("Coconut Palm Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_coconut_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_coconut_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_coconut_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_coconut_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_coconut_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_coconut_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_coconut_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_coconut_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_coconut_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_coconut_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_coconut_trunk_allface_side", {
		description = S("Coconut Palm Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_coconut_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_coconut_trunk_allface_top", {
		description = S("Coconut Palm Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_coconut_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--PALM DATE
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_date_trunk", {
		description = S("Date Palm Trunk"),
		tiles = {"lib_ecology_tree_palm_date_trunk_top.png", "lib_ecology_tree_palm_date_trunk_top.png", "lib_ecology_tree_palm_date_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_date_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_date_wood", {
		description = S("Date Palm Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_date_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_date_leaves", {
		description = S("Date Palm Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_date_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_date_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_date_leaves"}},
				{items = {"lib_ecology:tree_palm_date_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_date_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_date_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_date_sapling", {
		description = S("Date Palm Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_date_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,5)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_date_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_date_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_date_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_date_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_palm_date_05, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_date_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_date_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_date_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_date_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_date_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_date_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_date_trunk_allface_side", {
		description = S("Date Palm Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_date_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_date_trunk_allface_top", {
		description = S("Date Palm Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_date_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--PALM DESERT 01
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_desert_01_trunk", {
		description = S("Desert Palm 01 Trunk"),
		tiles = {"lib_ecology_tree_palm_desert_01_trunk_top.png", "lib_ecology_tree_palm_desert_01_trunk_top.png", "lib_ecology_tree_palm_desert_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_desert_01_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_desert_01_wood", {
		description = S("Desert Palm 01 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_desert_01_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_desert_01_leaves", {
		description = S("Desert Palm 01 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_desert_01_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_desert_01_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_desert_01_leaves"}},
				{items = {"lib_ecology:tree_palm_desert_01_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_desert_01_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_desert_01_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_desert_01_sapling", {
		description = S("Desert Palm 01 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_desert_01_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_desert_01_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_desert_01_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_desert_01_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_01_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_01_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_01_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_desert_01_trunk_allface_side", {
		description = S("Desert Palm 01 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_desert_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_desert_01_trunk_allface_top", {
		description = S("Desert Palm 01 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_desert_01_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--PALM DESERT 02
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_desert_02_trunk", {
		description = S("Desert Palm 02 Trunk"),
		tiles = {"lib_ecology_tree_palm_desert_02_trunk_top.png", "lib_ecology_tree_palm_desert_02_trunk_top.png", "lib_ecology_tree_palm_desert_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_desert_02_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_desert_02_wood", {
		description = S("Desert Palm 02 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_desert_02_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_desert_02_leaves", {
		description = S("Desert Palm 02 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_desert_02_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_desert_02_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_desert_02_leaves"}},
				{items = {"lib_ecology:tree_palm_desert_02_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_desert_02_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_desert_02_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_desert_02_sapling", {
		description = S("Desert Palm 02 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_desert_02_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_desert_02_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_desert_02_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_desert_02_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_02_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_02_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_02_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_desert_02_trunk_allface_side", {
		description = S("Desert Palm 02 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_desert_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_desert_02_trunk_allface_top", {
		description = S("Desert Palm 02 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_desert_02_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--PALM DESERT 03
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_desert_03_trunk", {
		description = S("Desert Palm 03 Trunk"),
		tiles = {"lib_ecology_tree_palm_desert_03_trunk_top.png", "lib_ecology_tree_palm_desert_03_trunk_top.png", "lib_ecology_tree_palm_desert_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_desert_03_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_desert_03_wood", {
		description = S("Desert Palm 03 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_desert_03_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_desert_03_leaves", {
		description = S("Desert Palm 03 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_desert_03_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_desert_03_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_desert_03_leaves"}},
				{items = {"lib_ecology:tree_palm_desert_03_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_desert_03_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_desert_03_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_desert_03_sapling", {
		description = S("Desert Palm 03 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_desert_03_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_desert_03_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_desert_03_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_desert_03_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_03_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_03_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_desert_03_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_desert_03_trunk_allface_side", {
		description = S("Desert Palm 03 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_desert_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_desert_03_trunk_allface_top", {
		description = S("Desert Palm 03 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_desert_03_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--PALM JUNGLE 01
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_jungle_01_trunk", {
		description = S("Jungle Palm 01 Trunk"),
		tiles = {"lib_ecology_tree_palm_jungle_01_trunk_top.png", "lib_ecology_tree_palm_jungle_01_trunk_top.png", "lib_ecology_tree_palm_jungle_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_jungle_01_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_01_wood", {
		description = S("Jungle Palm 01 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_jungle_01_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_01_leaves", {
		description = S("Jungle Palm 01 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_jungle_01_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_jungle_01_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_jungle_01_leaves"}},
				{items = {"lib_ecology:tree_palm_jungle_01_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_jungle_01_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_jungle_01_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_jungle_01_sapling", {
		description = S("Jungle Palm 01 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_jungle_01_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_jungle_01_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_jungle_01_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_jungle_01_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_01_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_01_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_01_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_jungle_01_trunk_allface_side", {
		description = S("Jungle Palm 01 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_jungle_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_01_trunk_allface_top", {
		description = S("Jungle Palm 01 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_jungle_01_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--PALM JUNGLE 02
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_jungle_02_trunk", {
		description = S("Jungle Palm 02 Trunk"),
		tiles = {"lib_ecology_tree_palm_jungle_02_trunk_top.png", "lib_ecology_tree_palm_jungle_02_trunk_top.png", "lib_ecology_tree_palm_jungle_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_jungle_02_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_02_wood", {
		description = S("Jungle Palm 02 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_jungle_02_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_02_leaves", {
		description = S("Jungle Palm 02 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_jungle_02_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_jungle_02_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_jungle_02_leaves"}},
				{items = {"lib_ecology:tree_palm_jungle_02_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_jungle_02_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_jungle_02_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_jungle_02_sapling", {
		description = S("Jungle Palm 02 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_jungle_02_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_jungle_02_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_jungle_02_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_jungle_02_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_02_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_02_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_02_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_jungle_02_trunk_allface_side", {
		description = S("Jungle Palm 02 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_jungle_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_02_trunk_allface_top", {
		description = S("Jungle Palm 02 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_jungle_02_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--PALM JUNGLE 03
	--tree parts
	minetest.register_node("lib_ecology:tree_palm_jungle_03_trunk", {
		description = S("Jungle Palm 03 Trunk"),
		tiles = {"lib_ecology_tree_palm_jungle_03_trunk_top.png", "lib_ecology_tree_palm_jungle_03_trunk_top.png", "lib_ecology_tree_palm_jungle_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_palm_jungle_03_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_03_wood", {
		description = S("Jungle Palm 03 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_palm_jungle_03_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_03_leaves", {
		description = S("Jungle Palm 03 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_palm_jungle_03_leaves.png"},
		special_tiles = {"lib_ecology_tree_palm_jungle_03_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_palm_jungle_03_leaves"}},
				{items = {"lib_ecology:tree_palm_jungle_03_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_palm_jungle_03_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_palm_jungle_03_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_palm_jungle_03_sapling", {
		description = S("Jungle Palm 03 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_palm_jungle_03_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_palm_jungle_03_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_palm_jungle_03_wood 4",
		recipe = {
			{"lib_ecology:tree_palm_jungle_03_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_03_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_03_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_palm_jungle_03_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_palm_jungle_03_trunk_allface_side", {
		description = S("Jungle Palm 03 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_palm_jungle_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_palm_jungle_03_trunk_allface_top", {
		description = S("Jungle Palm 03 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_palm_jungle_03_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})


--PALM 01
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
				minetest.get_node_timer(pos):start(math.random(60,120))
			end,

			on_place = function(itemstack, placer, pointed_thing)
				itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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
	--tree parts
	minetest.register_node("lib_ecology:tree_pine_01_trunk", {
		description = S("Pine 01 Trunk"),
		tiles = {"lib_ecology_tree_pine_01_trunk_top.png", "lib_ecology_tree_pine_01_trunk_top.png", "lib_ecology_tree_pine_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_pine_01_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_pine_01_wood", {
		description = S("Pine 01 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_pine_01_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_pine_01_leaves", {
		description = S("Pine 01 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_pine_01_leaves.png"},
		special_tiles = {"lib_ecology_tree_pine_01_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_pine_01_leaves"}},
				{items = {"lib_ecology:tree_pine_01_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_pine_01_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_pine_01_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_pine_01_sapling", {
		description = S("Pine 01 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_pine_01_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_pine_01_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_pine_01_wood 4",
		recipe = {
			{"lib_ecology:tree_pine_01_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_01_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_01_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_01_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_pine_01_trunk_allface_side", {
		description = S("Pine 01 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_pine_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_pine_01_trunk_allface_top", {
		description = S("Pine 01 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_pine_01_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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
	--tree parts
	minetest.register_node("lib_ecology:tree_pine_02_trunk", {
		description = S("Pine 02 Trunk"),
		tiles = {"lib_ecology_tree_pine_02_trunk_top.png", "lib_ecology_tree_pine_02_trunk_top.png", "lib_ecology_tree_pine_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_pine_02_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_pine_02_wood", {
		description = S("Pine 02 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_pine_02_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_pine_02_leaves", {
		description = S("Pine 02 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_pine_02_leaves.png"},
		special_tiles = {"lib_ecology_tree_pine_02_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_pine_02_leaves"}},
				{items = {"lib_ecology:tree_pine_02_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_pine_02_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_pine_02_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_pine_02_sapling", {
		description = S("Pine 02 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_pine_02_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_pine_02_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_pine_02_wood 4",
		recipe = {
			{"lib_ecology:tree_pine_02_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_02_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_02_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_02_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_pine_02_trunk_allface_side", {
		description = S("Pine 02 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_pine_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_pine_02_trunk_allface_top", {
		description = S("Pine 02 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_pine_02_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--PINE 03
	--tree parts
	minetest.register_node("lib_ecology:tree_pine_03_trunk", {
		description = S("Pine 03 Trunk"),
		tiles = {"lib_ecology_tree_pine_03_trunk_top.png", "lib_ecology_tree_pine_03_trunk_top.png", "lib_ecology_tree_pine_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_pine_03_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_pine_03_wood", {
		description = S("Pine 03 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_pine_03_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_pine_03_leaves", {
		description = S("Pine 03 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_pine_03_leaves.png"},
		special_tiles = {"lib_ecology_tree_pine_03_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_pine_03_leaves"}},
				{items = {"lib_ecology:tree_pine_03_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_pine_03_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_pine_03_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_pine_03_sapling", {
		description = S("Pine 03 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_pine_03_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_pine_03_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_pine_03_wood 4",
		recipe = {
			{"lib_ecology:tree_pine_03_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_03_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_03_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_pine_03_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_pine_03_trunk_allface_side", {
		description = S("Pine 03 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_pine_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_pine_03_trunk_allface_top", {
		description = S("Pine 03 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_pine_03_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--POPLAR
	--tree parts
	minetest.register_node("lib_ecology:tree_poplar_trunk", {
		description = S("Poplar Trunk"),
		tiles = {"lib_ecology_tree_poplar_trunk_top.png", "lib_ecology_tree_poplar_trunk_top.png", "lib_ecology_tree_poplar_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_poplar_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_poplar_wood", {
		description = S("Poplar Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_poplar_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_poplar_leaves", {
		description = S("Poplar Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_poplar_leaves.png"},
		special_tiles = {"lib_ecology_tree_poplar_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_poplar_leaves"}},
				{items = {"lib_ecology:tree_poplar_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_poplar_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_poplar_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_poplar_sapling", {
		description = S("Poplar Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_poplar_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_poplar_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_poplar_wood 4",
		recipe = {
			{"lib_ecology:tree_poplar_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_poplar_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_poplar_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_poplar_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_poplar_trunk_allface_side", {
		description = S("Poplar Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_poplar_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_poplar_trunk_allface_top", {
		description = S("Poplar Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_poplar_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--POPLAR SMALL
	--tree parts
	minetest.register_node("lib_ecology:tree_poplar_small_trunk", {
		description = S("Small Poplar Trunk"),
		tiles = {"lib_ecology_tree_poplar_small_trunk_top.png", "lib_ecology_tree_poplar_small_trunk_top.png", "lib_ecology_tree_poplar_small_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_poplar_small_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_poplar_small_wood", {
		description = S("Small Poplar Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_poplar_small_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_poplar_small_leaves", {
		description = S("Small Poplar Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_poplar_small_leaves.png"},
		special_tiles = {"lib_ecology_tree_poplar_small_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_poplar_small_leaves"}},
				{items = {"lib_ecology:tree_poplar_small_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_poplar_small_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_poplar_small_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_poplar_small_sapling", {
		description = S("Small Poplar Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_poplar_small_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,5)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_small_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_small_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_small_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_small_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_poplar_small_05, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
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
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_poplar_small_wood 4",
		recipe = {
			{"lib_ecology:tree_poplar_small_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_poplar_small_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_poplar_small_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_poplar_small_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_poplar_small_trunk_allface_side", {
		description = S("Small Poplar Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_poplar_small_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_poplar_small_trunk_allface_top", {
		description = S("Small Poplar Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_poplar_small_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--REDWOOD
	--tree parts
	minetest.register_node("lib_ecology:tree_redwood_trunk", {
		description = S("Redwood Trunk"),
		tiles = {"lib_ecology_tree_redwood_trunk_top.png", "lib_ecology_tree_redwood_trunk_top.png", "lib_ecology_tree_redwood_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_redwood_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_redwood_wood", {
		description = S("Redwood Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_redwood_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_redwood_leaves", {
		description = S("Redwood Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_redwood_leaves.png"},
		special_tiles = {"lib_ecology_tree_redwood_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_redwood_leaves"}},
				{items = {"lib_ecology:tree_redwood_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_redwood_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_redwood_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_redwood_sapling", {
		description = S("Redwood Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_redwood_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,2)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_redwood_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_redwood_02, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_redwood_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_redwood_wood 4",
		recipe = {
			{"lib_ecology:tree_redwood_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_redwood_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_redwood_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_redwood_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_redwood_trunk_allface_side", {
		description = S("Redwood Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_redwood_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_redwood_trunk_allface_top", {
		description = S("Redwood Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_redwood_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--REDWOOD COAST
	--tree parts
	minetest.register_node("lib_ecology:tree_redwood_coast_trunk", {
		description = S("Coast Redwood Trunk"),
		tiles = {"lib_ecology_tree_redwood_coast_trunk_top.png", "lib_ecology_tree_redwood_coast_trunk_top.png", "lib_ecology_tree_redwood_coast_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_redwood_coast_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_redwood_coast_wood", {
		description = S("Coast Redwood Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_redwood_coast_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_redwood_coast_leaves", {
		description = S("Coast Redwood Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_redwood_coast_leaves.png"},
		special_tiles = {"lib_ecology_tree_redwood_coast_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_redwood_coast_leaves"}},
				{items = {"lib_ecology:tree_redwood_coast_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_redwood_coast_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_redwood_coast_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_redwood_coast_sapling", {
		description = S("Coast Redwood Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_redwood_coast_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_redwood_coast_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_redwood_coast_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_redwood_coast_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_redwood_coast_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_redwood_coast_wood 4",
		recipe = {
			{"lib_ecology:tree_redwood_coast_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_redwood_coast_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_redwood_coast_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_redwood_coast_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_redwood_coast_trunk_allface_side", {
		description = S("Coast Redwood Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_redwood_coast_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_redwood_coast_trunk_allface_top", {
		description = S("Coast Redwood Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_redwood_coast_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--RUBBER
	--tree parts
	minetest.register_node("lib_ecology:tree_rubber_trunk", {
		description = S("Rubber Trunk"),
		tiles = {"lib_ecology_tree_rubber_trunk_top.png", "lib_ecology_tree_rubber_trunk_top.png", "lib_ecology_tree_rubber_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_rubber_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_rubber_wood", {
		description = S("Rubber Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_rubber_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_rubber_leaves", {
		description = S("Rubber Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_rubber_leaves.png"},
		special_tiles = {"lib_ecology_tree_rubber_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_rubber_leaves"}},
				{items = {"lib_ecology:tree_rubber_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_rubber_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_rubber_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_rubber_sapling", {
		description = S("Rubber Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_rubber_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,4)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_rubber_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_rubber_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_rubber_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_rubber_04, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_rubber_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_rubber_wood 4",
		recipe = {
			{"lib_ecology:tree_rubber_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_rubber_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_rubber_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_rubber_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_rubber_trunk_allface_side", {
		description = S("Rubber Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_rubber_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_rubber_trunk_allface_top", {
		description = S("Rubber Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_rubber_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--SAKURA
	--tree parts
	minetest.register_node("lib_ecology:tree_sakura_trunk", {
		description = S("Sakura Trunk"),
		tiles = {"lib_ecology_tree_sakura_trunk_top.png", "lib_ecology_tree_sakura_trunk_top.png", "lib_ecology_tree_sakura_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_sakura_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_sakura_wood", {
		description = S("Sakura Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_sakura_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_sakura_leaves", {
		description = S("Sakura Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_sakura_leaves.png"},
		special_tiles = {"lib_ecology_tree_sakura_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_sakura_leaves"}},
				{items = {"lib_ecology:tree_sakura_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_sakura_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_sakura_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_sakura_sapling", {
		description = S("Sakura Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_sakura_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_sakura, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_sakura_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_sakura_wood 4",
		recipe = {
			{"lib_ecology:tree_sakura_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_sakura_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_sakura_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_sakura_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_sakura_trunk_allface_side", {
		description = S("Sakura Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_sakura_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_sakura_trunk_allface_top", {
		description = S("Sakura Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_sakura_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--SCORCHED
	--tree parts
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
	--tree parts
	minetest.register_node("lib_ecology:tree_sequoia_trunk", {
		description = S("Sequoia Trunk"),
		tiles = {"lib_ecology_tree_sequoia_trunk_top.png", "lib_ecology_tree_sequoia_trunk_top.png", "lib_ecology_tree_sequoia_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_sequoia_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_sequoia_wood", {
		description = S("Sequoia Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_sequoia_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_sequoia_leaves", {
		description = S("Sequoia Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_sequoia_leaves.png"},
		special_tiles = {"lib_ecology_tree_sequoia_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_sequoia_leaves"}},
				{items = {"lib_ecology:tree_sequoia_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_sequoia_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_sequoia_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_sequoia_sapling", {
		description = S("Sequoia Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_sequoia_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,7)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_sequoia_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_sequoia_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_sequoia_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_sequoia_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_sequoia_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_sequoia_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 7 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_sequoia_04, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_sequoia_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_sequoia_wood 4",
		recipe = {
			{"lib_ecology:tree_sequoia_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_sequoia_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_sequoia_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_sequoia_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_sequoia_trunk_allface_side", {
		description = S("Sequoia Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_sequoia_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_sequoia_trunk_allface_top", {
		description = S("Sequoia Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_sequoia_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--SPRUCE
	--tree parts
	minetest.register_node("lib_ecology:tree_spruce_trunk", {
		description = S("Spruce Trunk"),
		tiles = {"lib_ecology_tree_spruce_trunk_top.png", "lib_ecology_tree_spruce_trunk_top.png", "lib_ecology_tree_spruce_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_spruce_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_spruce_wood", {
		description = S("Spruce Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_spruce_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_spruce_leaves", {
		description = S("Spruce Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_spruce_leaves.png"},
		special_tiles = {"lib_ecology_tree_spruce_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_spruce_leaves"}},
				{items = {"lib_ecology:tree_spruce_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_spruce_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_spruce_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_spruce_sapling", {
		description = S("Spruce Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_spruce_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,7)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_06, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 7 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_07, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_spruce_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_spruce_wood 4",
		recipe = {
			{"lib_ecology:tree_spruce_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_spruce_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_spruce_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_spruce_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_spruce_trunk_allface_side", {
		description = S("Spruce Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_spruce_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_spruce_trunk_allface_top", {
		description = S("Spruce Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_spruce_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--SPRUCE SITKA
	--tree parts
	minetest.register_node("lib_ecology:tree_spruce_sitka_trunk", {
		description = S("Sitka Spruce Trunk"),
		tiles = {"lib_ecology_tree_spruce_sitka_trunk_top.png", "lib_ecology_tree_spruce_sitka_trunk_top.png", "lib_ecology_tree_spruce_sitka_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_spruce_sitka_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_spruce_sitka_wood", {
		description = S("Sitka Spruce Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_spruce_sitka_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_spruce_sitka_leaves", {
		description = S("Sitka Spruce Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_spruce_sitka_leaves.png"},
		special_tiles = {"lib_ecology_tree_spruce_sitka_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_spruce_sitka_leaves"}},
				{items = {"lib_ecology:tree_spruce_sitka_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_spruce_sitka_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_spruce_sitka_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_spruce_sitka_sapling", {
		description = S("Sitka Spruce Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_spruce_sitka_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,10)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_04, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 5 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_05, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 6 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_06, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 7 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_spruce_sitka_07, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 8 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_spruce_sitka_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 9 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_spruce_sitka_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 10 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_giant_spruce_sitka_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_spruce_sitka_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_spruce_sitka_wood 4",
		recipe = {
			{"lib_ecology:tree_spruce_sitka_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_spruce_sitka_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_spruce_sitka_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_spruce_sitka_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_spruce_sitka_trunk_allface_side", {
		description = S("Sitka Spruce Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_spruce_sitka_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_spruce_sitka_trunk_allface_top", {
		description = S("Sitka Spruce Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_spruce_sitka_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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

--TEAK
	--tree parts
	minetest.register_node("lib_ecology:tree_teak_trunk", {
		description = S("Teak Trunk"),
		tiles = {"lib_ecology_tree_teak_trunk_top.png", "lib_ecology_tree_teak_trunk_top.png", "lib_ecology_tree_teak_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_teak_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_teak_wood", {
		description = S("Teak Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_teak_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_teak_leaves", {
		description = S("Teak Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_teak_leaves.png"},
		special_tiles = {"lib_ecology_tree_teak_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_teak_leaves"}},
				{items = {"lib_ecology:tree_teak_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_teak_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_teak_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_teak_sapling", {
		description = S("Teak Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_teak_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,4)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_teak_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_teak_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_teak_03, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 4 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_teak_04, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_teak_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_teak_wood 4",
		recipe = {
			{"lib_ecology:tree_teak_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_teak_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_teak_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_teak_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_teak_trunk_allface_side", {
		description = S("Teak Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_teak_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_teak_trunk_allface_top", {
		description = S("Teak Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_teak_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--WILLOW 01
	--tree parts
	minetest.register_node("lib_ecology:tree_willow_01_trunk", {
		description = S("Willow 01 Trunk"),
		tiles = {"lib_ecology_tree_willow_01_trunk_top.png", "lib_ecology_tree_willow_01_trunk_top.png", "lib_ecology_tree_willow_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_willow_01_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_willow_01_wood", {
		description = S("Willow 01 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_willow_01_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_willow_01_leaves", {
		description = S("Willow 01 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_willow_01_leaves.png"},
		special_tiles = {"lib_ecology_tree_willow_01_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_willow_01_leaves"}},
				{items = {"lib_ecology:tree_willow_01_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_willow_01_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_willow_01_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_willow_01_sapling", {
		description = S("Willow 01 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_willow_01_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_01_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_01_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_01_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_willow_01_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_willow_01_wood 4",
		recipe = {
			{"lib_ecology:tree_willow_01_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_01_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_01_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_01_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_willow_01_trunk_allface_side", {
		description = S("Willow 01 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_willow_01_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_willow_01_trunk_allface_top", {
		description = S("Willow 01 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_willow_01_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--WILLOW 02
	--tree parts
	minetest.register_node("lib_ecology:tree_willow_02_trunk", {
		description = S("Willow 02 Trunk"),
		tiles = {"lib_ecology_tree_willow_02_trunk_top.png", "lib_ecology_tree_willow_02_trunk_top.png", "lib_ecology_tree_willow_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_willow_02_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_willow_02_wood", {
		description = S("Willow 02 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_willow_02_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_willow_02_leaves", {
		description = S("Willow 02 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_willow_02_leaves.png"},
		special_tiles = {"lib_ecology_tree_willow_02_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_willow_02_leaves"}},
				{items = {"lib_ecology:tree_willow_02_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_willow_02_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_willow_02_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_willow_02_sapling", {
		description = S("Willow 02 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_willow_02_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_02_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_02_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_02_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_willow_02_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_willow_02_wood 4",
		recipe = {
			{"lib_ecology:tree_willow_02_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_02_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_02_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_02_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_willow_02_trunk_allface_side", {
		description = S("Willow 02 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_willow_02_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_willow_02_trunk_allface_top", {
		description = S("Willow 02 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_willow_02_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--WILLOW 03
	--tree parts
	minetest.register_node("lib_ecology:tree_willow_03_trunk", {
		description = S("Willow 03 Trunk"),
		tiles = {"lib_ecology_tree_willow_03_trunk_top.png", "lib_ecology_tree_willow_03_trunk_top.png", "lib_ecology_tree_willow_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_willow_03_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_willow_03_wood", {
		description = S("Willow 03 Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_willow_03_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_willow_03_leaves", {
		description = S("Willow 03 Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_willow_03_leaves.png"},
		special_tiles = {"lib_ecology_tree_willow_03_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_willow_03_leaves"}},
				{items = {"lib_ecology:tree_willow_03_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_willow_03_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_willow_03_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_willow_03_sapling", {
		description = S("Willow 03 Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_willow_03_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			local rnum = math.random(1,3)
			if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_03_01, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 2 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_03_02, "random", nil, true, "place_center_x, place_center_z")
			elseif rnum == 3 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_willow_03_03, "random", nil, true, "place_center_x, place_center_z")
			else
				
			end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_willow_03_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_willow_03_wood 4",
		recipe = {
			{"lib_ecology:tree_willow_03_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_03_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_03_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_willow_03_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_willow_03_trunk_allface_side", {
		description = S("Willow 03 Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_willow_03_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_willow_03_trunk_allface_top", {
		description = S("Willow 03 Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_willow_03_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

--WILLOW 04
--YELLOW HEALING
	--tree parts
	minetest.register_node("lib_ecology:tree_yellow_healing_trunk", {
		description = S("Yellow Healing Trunk"),
		tiles = {"lib_ecology_tree_yellow_healing_trunk_top.png", "lib_ecology_tree_yellow_healing_trunk_top.png", "lib_ecology_tree_yellow_healing_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1, lib_ecology_tree = 1, },
		sounds = lib_ecology.node_sound_wood_defaults(),

		after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:tree_yellow_healing_leaves")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end,
		
		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_yellow_healing_wood", {
		description = S("Yellow Healing Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"lib_ecology_tree_yellow_healing_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),
	})
	minetest.register_node("lib_ecology:tree_yellow_healing_leaves", {
		description = S("Yellow Healing Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"lib_ecology_tree_yellow_healing_leaves.png"},
		special_tiles = {"lib_ecology_tree_yellow_healing_leaves_simple.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		waving = 1,
		walkable = false,
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, lib_ecology_leaves = 1, },
		drop = {
			max_items = 1,
			items = {
				{items = {"lib_ecology:tree_yellow_healing_leaves"}},
				{items = {"lib_ecology:tree_yellow_healing_sapling"}, rarity = 20},
				{items = {"lib_ecology:stick"}, rarity = 10},
			}
		},
		sounds = lib_ecology.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack, pointed_thing)
			if placer and placer:is_player() and not placer:get_player_control().sneak then
				local node = minetest.get_node(pos)
				node.param2 = 1
				minetest.set_node(pos, node)
			end
		end,

		on_timer = function(pos)

			if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_yellow_healing_trunk") then
				return false
			end

			local node = minetest.get_node(pos)
			local drops = minetest.get_node_drops(node.name)
			for _, item in ipairs(drops) do
				local is_leaf
				for _, v in pairs({"lib_ecology:tree_yellow_healing_leaves"}) do
					if v == item then
						is_leaf = true
					end
				end
				if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
						not is_leaf then
					minetest.add_item({
						x = pos.x - 0.5 + math.random(),
						y = pos.y - 0.5 + math.random(),
						z = pos.z - 0.5 + math.random(),
					}, item)
				end
			end

			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end,

	})
	minetest.register_node("lib_ecology:tree_yellow_healing_sapling", {
		description = S("Yellow Healing Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"lib_ecology_tree_yellow_healing_sapling.png"},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1, lib_ecology_sapling = 1, },
		sounds = lib_ecology.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end,

		on_timer = function(pos)

			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end

			--local rnum = math.random(1,2)
			--if rnum == 1 then
				minetest.place_schematic(pos, lib_ecology.schem_tree_yellow_healing, "random", nil, true, "place_center_x, place_center_z")
			--elseif rnum == 2 then
				--minetest.place_schematic(pos, schematic, "random", nil, true, "place_center_x, place_center_z")
			--else
				
			--end

		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:tree_yellow_healing_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})
	--wood
	minetest.register_craft({
		output = "lib_ecology:tree_yellow_healing_wood 4",
		recipe = {
			{"lib_ecology:tree_yellow_healing_trunk"},
		}
	})
	--fuel
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_yellow_healing_trunk",
		burntime = 30,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_yellow_healing_wood",
		burntime = 20,
	})
	minetest.register_craft({
		type = "fuel",
		recipe = "lib_ecology:tree_yellow_healing_leaves",
		burntime = 5,
	})
	--allface
	minetest.register_node("lib_ecology:tree_yellow_healing_trunk_allface_side", {
		description = S("Yellow Healing Trunk All Faces Side"),
		tiles = {"lib_ecology_tree_yellow_healing_trunk.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})
	minetest.register_node("lib_ecology:tree_yellow_healing_trunk_allface_top", {
		description = S("Yellow Healing Trunk All Faces Top"),
		tiles = {"lib_ecology_tree_yellow_healing_trunk_top.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = true,
		is_ground_content = false,
		groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2, tree = 1},
		sounds = lib_ecology.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

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
minetest.register_node("lib_ecology:mushroom_01_trunk", {
	description = S("Mushroom 01 Trunk"),
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

minetest.register_node("lib_ecology:mushroom_02_trunk", {
	description = S("Mushroom 02 Trunk"),
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

minetest.register_node("lib_ecology:mushroom_cap_blue", {
	description = S("Mushroom - Cap Blue"),
	tiles = {"lib_ecology_mushroom_cap_blue.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_cap_brown_02", {
	description = S("Mushroom - Cap Brown 02"),
	tiles = {"lib_ecology_mushroom_cap_brown_02.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_cap_green_dk", {
	description = S("Mushroom - Cap Green Dark"),
	tiles = {"lib_ecology_mushroom_cap_green_dk.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_cap_green_lt", {
	description = S("Mushroom - Cap Green Light"),
	tiles = {"lib_ecology_mushroom_cap_green_lt.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_cap_green_spotted", {
	description = S("Mushroom - Cap Green Spotted"),
	tiles = {"lib_ecology_mushroom_cap_green_spotted.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_cap_purple", {
	description = S("Mushroom - Cap Purple"),
	tiles = {"lib_ecology_mushroom_cap_purple.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_cap_red_02", {
	description = S("Mushroom - Cap Red 02"),
	tiles = {"lib_ecology_mushroom_cap_red_02.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})

minetest.register_node("lib_ecology:mushroom_spores_03", {
	description = S("Mushroom - Spores 03"),
	tiles = {"lib_ecology_mushroom_spores_03.png", },
	groups = {choppy = 1, flammable = 1, oddly_breakable_by_hand=1, wood=1},
	sounds = lib_ecology.node_sound_wood_defaults()
})








--CRAFT RECIPES



-------------------------
--NOTE:	Change the following to use node timers --  ShadMOrdre
-------------------------

--MORETREES L TREES ABMs
-- -- -- actually grow the tree from a sapling
--[[
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
--]]






