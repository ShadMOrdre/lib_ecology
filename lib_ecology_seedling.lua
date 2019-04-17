
if minetest.get_modpath("screwdriver") then
	screwdriver = screwdriver or {}
end

local tmp_x = {}
local tmp_y = {}
local max_objs = tonumber(minetest.setting_get("max_objects_per_block")) or 49

-- item entity

minetest.register_entity("lib_ecology:seedling_x",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 1, y = 1},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)

		if (mobs and mobs.entity and mobs.entity == false)
		or not self then
			self.object:remove()
			return
		end

		if tmp_x.nodename ~= nil
		and tmp_x.texture ~= nil then

			self.nodename = tmp_x.nodename
			tmp_x.nodename = nil
			self.texture = tmp_x.texture
			tmp_x.texture = nil
		else
			if staticdata ~= nil
			and staticdata ~= "" then

				local data = staticdata:split(';')

				if data and data[1] and data[2] then

					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end

		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end

		if self.nodename == "lib_ecology:seedling_mound" then
			--self.object:set_properties({automatic_rotate = 1})
		end

	end,

	get_staticdata = function(self)

		if self.nodename ~= nil
		and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end

		return ""
	end,
})

minetest.register_entity("lib_ecology:seedling_y",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 1, y = 1},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"air"},
	on_activate = function(self, staticdata)

		if (mobs and mobs.entity and mobs.entity == false)
		or not self then
			self.object:remove()
			return
		end

		if tmp_y.nodename ~= nil
		and tmp_y.texture ~= nil then

			self.nodename = tmp_y.nodename
			tmp_y.nodename = nil
			self.texture = tmp_y.texture
			tmp_y.texture = nil
		else
			if staticdata ~= nil
			and staticdata ~= "" then

				local data = staticdata:split(';')

				if data and data[1] and data[2] then

					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end

		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end

		if self.nodename == "lib_ecology:seedling_mound" then
			--self.object:set_properties({automatic_rotate = 1})
		end

	end,

	get_staticdata = function(self)

		if self.nodename ~= nil
		and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end

		return ""
	end,
})

local facedir = {}

facedir[0] = {x = 0, y = 0, z = 1}
facedir[1] = {x = 1, y = 0, z = 0}
facedir[2] = {x = 0, y = 0, z = -1}
facedir[3] = {x = -1, y = 0, z = 0}

-- functions

local remove_item = function(pos, node)

	local objs = nil

	if node.name == "lib_ecology:seedling_mound" then

		--pos.y = pos.y + 1
		objs = minetest.get_objects_inside_radius(pos, 0.5)
		--pos.y = pos.y - 1
	end

	if objs then

		for _, obj in pairs(objs) do

			if obj and obj:get_luaentity()
			and obj:get_luaentity().name == "lib_ecology:seedling_x" then
				obj:remove()
			end
			if obj and obj:get_luaentity()
			and obj:get_luaentity().name == "lib_ecology:seedling_y" then
				obj:remove()
			end
		end
	end
end

local update_item = function(pos, node)

	remove_item(pos, node)

	local meta = minetest.get_meta(pos)
if not meta then return end
	if meta:get_string("seed") ~= "" then

		if node.name == "lib_ecology:seedling_mound" then
			pos.y = pos.y + 0.5
			--pos.y = pos.y
		end

		tmp_x.nodename = node.name
		tmp_x.texture = ItemStack(meta:get_string("seed")):get_name()
		tmp_y.nodename = node.name
		tmp_y.texture = ItemStack(meta:get_string("seed")):get_name()

		local e_x = minetest.add_entity(pos,"lib_ecology:seedling_x")
		local e_y = minetest.add_entity(pos,"lib_ecology:seedling_y")

			local yaw_x = math.pi * 2 - node.param2 * math.pi / 2
			e_x:setyaw(yaw_x)

			local yaw_y = (math.pi * 2 - node.param2 * math.pi / 2) + (math.pi/2)
			e_y:setyaw(yaw_y)
			
			
	end
end

local drop_item = function(pos, node, metadata)

	local meta = metadata or minetest.get_meta(pos)
if not meta then return end
	local item = meta:get_string("seed")

	meta:set_string("seed", "")

	if item ~= "" then

		if node.name == "lib_ecology:seedling_mound" then

			--pos.y = pos.y + 1
			minetest.add_item(pos, item)
			--pos.y = pos.y - 1
		end

		remove_item(pos, node)

	end

end

-- nodes

minetest.register_node("lib_ecology:seedling_mound",{
	description = "Seedling Mound (Dirt mound on which to grow plants.)",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.375, 0.375}, -- bottom plate
			{-0.3125, -0.375, -0.3125, 0.3125, -0.3125, 0.3125}, -- bottom plate (upper)
			{-0.25, -0.3125, -0.25, 0.25, -0.25, 0.25}, -- pillar
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.25, 0.375}, -- bottom plate
		}
	},
	tiles = {"lib_seedling_dirt.png"},
	paramtype = "light",
	groups = {cracky = 3},
	--sounds = default.node_sound_defaults(),
	on_rotate = screwdriver.disallow,

	after_place_node = function(pos, placer, itemstack)

		local meta = minetest.get_meta(pos)

		meta:set_string("infotext","Seedling Mound (Dirt to grow plants).")
	end,

	on_rightclick = function(pos, node, clicker, itemstack)

		if not itemstack
		or minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end

		local meta = minetest.get_meta(pos)
if not meta then return end
		if meta:get_string("seed") ~= "" then

			drop_item(pos, node, meta)
		else
			local s = itemstack:take_item()

			meta:set_string("seed", s:to_string())

			update_item(pos, node)

			return itemstack
		end
	end,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos))
	end,

	on_punch = function(pos, node, puncher)
		update_item(pos, node)
	end,

	on_blast = function(pos, intensity)

		drop_item(pos, minetest.get_node(pos))

		minetest.add_item(pos, {name = "lib_ecology:seedling_mound"})

		minetest.remove_node(pos)
	end,
})

-- automatically restore entities lost from frames/pedestals
-- due to /clearobjects or similar

minetest.register_abm({
	nodenames = {"lib_ecology:seedling_mound"},
	interval = 15,
	chance = 1,
	catch_up = false,

	action = function(pos, node, active_object_count, active_object_count_wider)

		if active_object_count >= max_objs then
			return
		end

		local num

		if node.name == "lib_ecology:seedling_mound" then

			pos.y = pos.y + 1
			num = #minetest.get_objects_inside_radius(pos, 0.5)
			pos.y = pos.y - 1
		end

		if num > 0 then
			return
		end

		update_item(pos, node)
	end
})

-- crafts

minetest.register_craft({
	output = 'lib_ecology:seedling_mound',
	recipe = {
		{'', '', ''},
		{'', 'default:dirt', ''},
		{'default:dirt', 'default:dirt', 'default:dirt'},
	}
})

-- stop mesecon pistons from pushing itemframe and pedestals
if minetest.get_modpath("mesecons_mvps") then
	--mesecon.register_mvps_stopper("itemframes:frame")
	--mesecon.register_mvps_stopper("lib_ecology:seedling_mound")
end
