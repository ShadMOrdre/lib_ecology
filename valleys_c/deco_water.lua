-- Modified from Perttu Ahola's <celeron55@gmail.com> "noairblocks"
-- mod and released as LGPL 2.1, as the original.


local water_nodes = {"default:water_source", "default:water_flowing", "default:river_water_source",  "default:river_water_flowing"}
local lib_ecology_nodes = {"lib_ecology:water_source", "lib_ecology:water_flowing", "lib_ecology:river_water_source",  "lib_ecology:river_water_flowing"}

for _, name in pairs(water_nodes) do
	local water = table.copy(minetest.registered_nodes[name])
	local new_name = string.gsub(name, 'default', 'lib_ecology')
	local new_source = string.gsub(water.liquid_alternative_source, 'default', 'lib_ecology')
	local new_flowing = string.gsub(water.liquid_alternative_flowing, 'default', 'lib_ecology')
	water.alpha = 0
	water.liquid_alternative_source = new_source
	water.liquid_alternative_flowing = new_flowing
	water.groups.not_in_creative_inventory = 1

	minetest.register_node(new_name, water)
end


local check_pos = {
	{x=-1, y=0, z=0},
	{x=1, y=0, z=0},
	{x=0, y=0, z=-1},
	{x=0, y=0, z=1},
	{x=0, y=1, z=0},
}

minetest.register_abm({
	nodenames = {"group:sea"},
	neighbors = {"group:water"},
	interval = 10,
	chance = 1,
	action = function(pos)
		for _,offset in pairs(check_pos) do
			local check = vector.add(pos, offset)
			local check_above = vector.add(check, {x=0,y=1,z=0})
			if offset == {0,-1,0} or minetest.get_node(check_above).name ~= "air" then
				local name = minetest.get_node(check).name
				for node_num=1,#water_nodes do
					if name == water_nodes[node_num] then
						minetest.add_node(check, {name = lib_ecology_nodes[node_num]})
					end
				end
			end
		end
	end,
})

minetest.register_abm({
	nodenames = lib_ecology_nodes,
	neighbors = {"air"},
	interval = 20,
	chance = 1,
	action = function(pos)
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.remove_node(pos)
		end
	end,
})
