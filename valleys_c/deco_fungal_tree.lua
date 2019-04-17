-------------------
-- Fungal Tree   --
-------------------

local light_max = 9

local colors = {"^[colorize:#FF00FF:60", "", "^[colorize:#0000FF:60", "^[colorize:#FF4500:80"}
lib_ecology.fungal_tree_leaves = {}

-- all leaves
function lib_ecology.make_fungal_tree(data, area, pos, height, leaves, fruit)
	for y = 0, height do
		local radius = 1
		if y > 1 and y < height - 2 then
			radius = 2
		end
		local force_x = math.random(1,3) - 2
		local force_y = math.random(1,3) - 2
		for z = -radius,radius do
			for x = -radius,radius do
				local sr = math.random(1,27)
				local i = pos + z*area.zstride + y*area.ystride + x
				if force_x == x and force_y == y then
					data[i] = leaves
				elseif sr == 1 then
					data[i] = fruit
				elseif sr < 14 then
					data[i] = leaves
				end
			end
		end
	end
end

-- multicolored growths
local count = 0
for _, color in pairs(colors) do
	count = count + 1
	local name = "lib_ecology:fungal_tree_leaves_"..count
	lib_ecology.fungal_tree_leaves[#lib_ecology.fungal_tree_leaves+1] = name

	minetest.register_node(name, {
		description = "Fungal tree growths",
		drawtype = "allfaces_optional",
		waving = 1,
		visual_scale = 1.3,
		tiles = {"valc_fungal_tree_leaves.png"..color},
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy=3, flammable=3, leaves=1, plant=1},
		drop = {
			max_items = 1,
			items = {
				--{items = {"lib_ecology:"..tree.name.."_sapling"}, rarity = tree.drop_rarity },
				{items = {name} }
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		after_place_node = default.after_place_leaves,
	})

	minetest.register_craft({
		output = "default:stick",
		recipe = {
			{name}
		}
	})
end


local leaves_and_air = table.copy(lib_ecology.fungal_tree_leaves)
leaves_and_air[#leaves_and_air+1] = "air"
local good_stone = {"lib_ecology:stone_with_lichen", "lib_ecology:stone_with_algae"}

local function find_ground(pos)
	for y1 = 1, 16 do
		local node = minetest.get_node_or_nil({x=pos.x, y=pos.y-y1, z=pos.z})
		if node then
			if minetest.get_item_group(node.name, "soil") ~= 0 or
				table.contains(good_stone, node.name) then
				return y1
			end
		end
	end

	return 1000
end


--[[
-- -- fungal spread
-- minetest.register_abm({
	-- nodenames = lib_ecology.fungal_tree_leaves,
	-- interval = 2 * lib_ecology.time_factor,
	-- chance = 10,
	-- action = function(pos, node)
		-- if minetest.get_node_light(pos, nil) == 15 then
			-- minetest.remove_node(pos)
			-- return
		-- end
		-- if find_ground(pos) > 16 then
			-- minetest.remove_node(pos)
			-- return
		-- end

		-- local grow_pos = {x=pos.x, y=pos.y-1, z=pos.z}
		-- local grow_node = minetest.get_node_or_nil(grow_pos)
		-- if grow_node and grow_node.name == "air" then
			-- minetest.set_node(grow_pos, {name = node.name})
			-- return
		-- end
		-- if math.random(1,3) ~= 1 then
			-- return
		-- end

		-- local foreign = {}
		-- for _, i in pairs(lib_ecology.fungal_tree_leaves) do
			-- if i ~= node.name then
				-- foreign[#foreign+1] = i
			-- end
		-- end
		-- local pos1, count = minetest.find_nodes_in_area(vector.subtract(pos, 3), vector.add(pos, 3), foreign)
		-- if #pos1 > 0 then
			-- minetest.set_node(pos1[math.random(1,#pos1)], {name="air"})
			-- return
		-- end

		-- if math.random(1,201) == 1 then
			-- local new = lib_ecology.fungal_tree_leaves[math.random(1,#lib_ecology.fungal_tree_leaves)]
			-- local pos1, count = minetest.find_nodes_in_area({x=pos.x-8, y=pos.y-16, z=pos.z-8}, {x=pos.x+8, y=pos.y+16, z=pos.z+8}, node.name)
			-- for _, p in pairs(pos1) do
				-- minetest.set_node(p, {name=new})
			-- end
			-- return
		-- end

		-- grow_pos = {x = pos.x + math.random(-1,1), y = pos.y + math.random(-1,1), z = pos.z + math.random(-1,1)}
		-- grow_node = minetest.get_node_or_nil(grow_pos)
		-- --if math.random(1,2) == 1 then
			-- minetest.set_node(pos, {name = "air"})
		-- --end
		-- if not grow_node or not table.contains(leaves_and_air, grow_node.name) or find_ground(grow_pos) > 16 then
			-- return
		-- end
		-- if minetest.get_node_light(grow_pos, nil) <= light_max then
			-- minetest.set_node(pos, {name = "air"})
			-- if math.random(1,27) == 1 then
				-- minetest.set_node(grow_pos, {name = "lib_ecology:fungal_tree_fruit"})
			-- else
				-- minetest.set_node(grow_pos, {name = node.name})
			-- end
		-- end
	-- end
-- })
--]]


-- Fill a list with data for content IDs, after all nodes are registered
local cid_data = {}
minetest.after(0, function()
	for name, def in pairs(minetest.registered_nodes) do
		cid_data[minetest.get_content_id(name)] = {
			name = name,
			--drops = def.drops,
			flammable = def.groups.flammable,
			choppy = def.groups.choppy,
			fleshy = def.groups.fleshy,
			snappy = def.groups.snappy,
			on_blast = def.on_blast,
		}
	end
end)

local function add_effects(pos, radius)
	minetest.add_particlespawner({
		amount = 128,
		time = 1,
		minpos = vector.subtract(pos, radius / 2),
		maxpos = vector.add(pos, radius / 2),
		minvel = {x=-20, y=-20, z=-20},
		maxvel = {x=20,  y=20,  z=20},
		minacc = vector.new(),
		maxacc = vector.new(),
		minexptime = 1,
		maxexptime = 3,
		minsize = 8,
		maxsize = 16,
		texture = "tnt_smoke.png",
	})
end

local function destroy(pos, cid)
	if minetest.is_protected(pos, "") then
		return
	end
	local def = cid_data[cid]
	if def and def.on_blast then
		def.on_blast(vector.new(pos), 1)
		return
	end
	if def.snappy == nil and def.choppy == nil and def.fleshy == nil and def.name ~= "fire:basic_flame" then
		return
	end
	local new = "air"
	--if math.random(1,2) == 1 then
	if true then
		local node_under = minetest.get_node_or_nil({x = pos.x,
			y = pos.y - 1, z = pos.z})
		if node_under and node_under.name ~= "air" then
			--new = node.name
		end
	end
	minetest.set_node(pos, {name=new})
end

local function explode(pos, radius)
	local pos = vector.round(pos)
	local vm = VoxelManip()
	local p1 = vector.subtract(pos, radius)
	local p2 = vector.add(pos, radius)
	local minp, maxp = vm:read_from_map(p1, p2)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	local drops = {}
	local p = {}

	local c_air = minetest.get_content_id("air")

	for z = -radius, radius do
	for y = -radius, 4*radius do
	local vi = a:index(pos.x + (-radius), pos.y + y, pos.z + z)
	for x = -radius, radius do
		if (x * x) + (y * y / 4) + (z * z) <=
				(radius * radius) + math.random(-radius, radius) then
			local cid = data[vi]
			p.x = pos.x + x
			p.y = pos.y + y
			p.z = pos.z + z
			if cid ~= c_air then
				destroy(p, cid)
			end
		end
		vi = vi + 1
	end
	end
	end
end

local function calc_velocity(pos1, pos2, old_vel, power)
	local vel = vector.direction(pos1, pos2)
	vel = vector.normalize(vel)
	vel = vector.multiply(vel, power)

	-- Divide by distance
	local dist = vector.distance(pos1, pos2)
	dist = math.max(dist, 1)
	vel = vector.divide(vel, dist)

	-- Add old velocity
	vel = vector.add(vel, old_vel)
	return vel
end

local function entity_physics(pos, radius)
	-- Make the damage radius larger than the destruction radius
	radius = radius * 2
	local objs = minetest.get_objects_inside_radius(pos, radius)
	for _, obj in pairs(objs) do
		local obj_pos = obj:getpos()
		local obj_vel = obj:getvelocity()
		local dist = math.max(1, vector.distance(pos, obj_pos))

		if obj_vel ~= nil then
			obj:setvelocity(calc_velocity(pos, obj_pos,
					obj_vel, radius * 10))
		end

		local damage = (4 / dist) * radius
		obj:set_hp(obj:get_hp() - damage)
	end
end


local function boom(pos)
	if not pos then
		return
	end
	local node = minetest.get_node_or_nil(pos)
	if not node then
		return
	end

	minetest.sound_play("tnt_explode", {pos=pos, gain=1.5, max_hear_distance=2*64})
	local radius = 5
	minetest.set_node(pos, {name="air"})
	explode(pos, radius)
	entity_physics(pos, radius)
	add_effects(pos, radius)
end

local function burn(pos)
	minetest.get_node_timer(pos):start(1)
end

--[[
-- -- Exploding fruit
-- minetest.register_abm({
	-- nodenames = {"lib_ecology:fungal_tree_fruit"},
	-- interval = 3 * lib_ecology.time_factor,
	-- chance = 20,
	-- action = function(pos, node)
		-- local pos1, count = minetest.find_nodes_in_area(vector.subtract(pos, 1), vector.add(pos, 1), {"fire:basic_flame"})
		-- if #pos1 > 0 then
			-- boom(pos)
			-- return
		-- end

		-- local pos1, count = minetest.find_nodes_in_area(vector.subtract(pos, 1), vector.add(pos, 1), lib_ecology.fungal_tree_leaves)
		-- if #pos1 < 3 then
			-- minetest.set_node(pos, {name="air"})
			-- return
		-- end

		-- local g = find_ground(pos)
		-- if g > 4 and g < 17 then
			-- if math.random(1,17 - g) == 1 then
				-- boom(pos)
			-- end
		-- elseif math.random(1,2) == 1 then
			-- minetest.set_node(pos, {name="air"})
		-- end
	-- end
-- })
--]]

minetest.register_node("lib_ecology:fungal_tree_fruit", {
	description = "Fungal tree fruit",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"valc_fungal_tree_fruit.png"},
	--inventory_image = ".png",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 6,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2},
	--on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	on_timer = boom,
	on_punch = boom,
})


