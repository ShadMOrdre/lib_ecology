
local S = lib_materials.gettext




lib_ecology.grow_giant_tree_fern = function(pos)
	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	if minetest.get_node(pos_01).name ~= "air"
			and minetest.get_node(pos_01).name ~= "lib_ecology:fern_giant_tree_sapling"
			and minetest.get_node(pos_01).name ~= "default:junglegrass" then
		return
	end

	local size = math.random(12,16)	-- min of range must be >= 4
	
	local leafchecks = {
		{
			direction  = 3,
			positions = {
				{x = pos.x + 1, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x + 2, y = pos.y + size    , z = pos.z    },
				{x = pos.x + 3, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x + 4, y = pos.y + size - 2, z = pos.z    }
			}
		},
		{
			direction  = 1,
			positions = {
				{x = pos.x - 1, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x - 2, y = pos.y + size,     z = pos.z    },
				{x = pos.x - 3, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x - 4, y = pos.y + size - 2, z = pos.z    }
			}
		},
		{
			direction  = 2,
			positions = {
				{x = pos.x    , y = pos.y + size - 1, z = pos.z + 1},
				{x = pos.x    , y = pos.y + size    , z = pos.z + 2},
				{x = pos.x    , y = pos.y + size - 1, z = pos.z + 3},
				{x = pos.x    , y = pos.y + size - 2, z = pos.z + 4}
			}
		},
		{
			direction  = 0,
			positions = {
				{x = pos.x    , y = pos.y + size - 1, z = pos.z - 1},
				{x = pos.x    , y = pos.y + size    , z = pos.z - 2},
				{x = pos.x    , y = pos.y + size - 1, z = pos.z - 3},
				{x = pos.x    , y = pos.y + size - 2, z = pos.z - 4}
			}
		}
	}

	for i = 1, size-3 do
		minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, {name="lib_ecology:fern_giant_tree_trunk"})
	end
	minetest.set_node({x = pos.x, y = pos.y + size-2, z = pos.z}, {name="lib_ecology:fern_giant_tree_trunk_top"})
	minetest.set_node({x = pos.x, y = pos.y + size-1, z = pos.z}, {name="lib_ecology:fern_giant_tree_leaves"})

	-- all the checking for air below is to prevent some ugly bugs (incomplete trunks of neighbouring trees), it's a bit slower, but worth the result

	-- assert(#leafchecks == 4)
	for i = 1, 4 do
		local positions = leafchecks[i].positions
		local rot = leafchecks[i].direction
		local endpos = 4	-- If the loop below adds all intermediate leaves then the "terminating" leaf will be at positions[4]
		-- assert(#positions == 4)
		-- add leaves so long as the destination nodes are air
		for j = 1, 3 do
			if minetest.get_node(positions[j]).name == "air" then
				minetest.set_node(positions[j], {name="lib_ecology:fern_giant_tree_leaves"})
			else
				endpos = j
				break
			end
		end
		-- add the terminating leaf if required and possible
		if endpos == 4 and minetest.get_node(positions[endpos]).name == "air" then
			minetest.set_node(positions[endpos], {name="lib_ecology:fern_giant_tree_leaves_end", param2=rot})
		end
	end
end


lib_ecology.grow_tree_fern = function(pos)

	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	if minetest.get_node(pos_01).name ~= "air"
			and minetest.get_node(pos_01).name ~= "lib_ecology:fern_tree_sapling"
			and minetest.get_node(pos_01).name ~= "default:junglegrass" then
		return
	end
		
	local size = math.random(1, 5)
	local crown = ({ "lib_ecology:fern_tree_leaves", "lib_ecology:fern_tree_leaves_02" })[math.random(1, 2)]
	
	local i = 1
	while (i < size-1) do
		if minetest.get_node({x = pos.x, y = pos.y + i + 1, z = pos.z}).name ~= "air" then
			break
		end
		minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, { name = "lib_ecology:fern_tree_trunk" })
		i = i + 1
	end

	minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, { name = crown })
end


