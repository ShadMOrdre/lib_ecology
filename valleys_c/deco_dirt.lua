
-- Add silt
minetest.register_node("lib_ecology:silt", {
	description = "Silt",
	tiles = {"vmg_silt.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults(),
})

-- I don't like the default:clay, this does not look like clay. So add red clay.
minetest.register_node("lib_ecology:red_clay", {
	description = "Red Clay",
	tiles = {"vmg_red_clay.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.override_item("default:clay", {description = "White Clay"})

-- Add dirts
local function register_dirts(readname)
	local name = readname:lower()
	local itemstr_dirt = "lib_ecology:dirt_" .. name
	local itemstr_lawn = itemstr_dirt .. "_with_grass"
	local itemstr_dry = itemstr_dirt .. "_with_dry_grass"
	local itemstr_rain = itemstr_dirt .. "_with_rainforest_litter"
	local itemstr_snow = itemstr_dirt .. "_with_snow"
	local tilestr = "vmg_dirt_" .. name .. ".png"

	minetest.register_node(itemstr_dirt, {
		description = readname .. " Dirt",
		tiles = {tilestr},
		is_ground_content = true,
		groups = {crumbly=3,soil=1},
		sounds = default.node_sound_dirt_defaults(),
	})

	minetest.register_node(itemstr_lawn, {
		description = readname .. " Dirt with Grass",
		tiles = {"default_grass.png", tilestr, tilestr .. "^default_grass_side.png"},
		is_ground_content = true,
		groups = {crumbly=3,soil=1},
		drop = itemstr_dirt,
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
	})

	minetest.register_node(itemstr_rain, {
		description = readname .. " Dirt with Rainforest Litter",
		tiles = {"default_rainforest_litter.png", tilestr, tilestr .. "^default_rainforest_litter_side.png"},
		is_ground_content = true,
		groups = {crumbly=3,soil=1},
		drop = itemstr_dirt,
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
	})

	minetest.register_node(itemstr_dry, {
		description = readname .. " Dirt with Dry Grass",
		tiles = {"default_dry_grass.png", tilestr, tilestr .. "^default_dry_grass_side.png"},
		groups = {crumbly=3, soil=1},
		drop = itemstr_dirt,
		sounds = default.node_sound_dirt_defaults({
			footstep = {name = "default_grass_footstep", gain=0.4},
		}),
	})

	minetest.register_node(itemstr_snow, {
		description = readname .. " Dirt with Snow",
		tiles = {"default_snow.png", tilestr, tilestr .. "^default_snow_side.png"},
		is_ground_content = true,
		groups = {crumbly=3,soil=1},
		drop = itemstr_dirt,
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_snow_footstep", gain=0.25},
		}),
	})



	if false then
	minetest.register_abm({
		nodenames = {itemstr_dirt},
		interval = 2,
		chance = 200,
		action = function(pos, node)
			local above = {x=pos.x, y=pos.y+1, z=pos.z}
			local name = minetest.get_node(above).name
			local nodedef = minetest.registered_nodes[name]
			if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
					and nodedef.liquidtype == "none"
					and (minetest.get_node_light(above) or 0) >= 13 then
				if name == "default:snow" or name == "default:snowblock" or (lib_ecology.test_snow and lib_ecology.test_snow({x=pos.x, y=pos.y+1, z=pos.z})) then
					minetest.set_node(pos, {name = itemstr_snow})
				elseif lib_ecology.test_dry and lib_ecology.test_dry(pos) then
					minetest.set_node(pos, {name = itemstr_dry})
				else
					minetest.set_node(pos, {name = itemstr_lawn})
				end
			end
		end
	})
	end

	minetest.register_abm({
		nodenames = {itemstr_lawn, itemstr_dry},
		interval = 2,
		chance = 20,
		action = function(pos, node)
			local above = {x=pos.x, y=pos.y+1, z=pos.z}
			local name = minetest.get_node(above).name
			local nodedef = minetest.registered_nodes[name]
			if name ~= "ignore" and nodedef
					and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
					and nodedef.liquidtype == "none") then
				minetest.set_node(pos, {name = itemstr_dirt})
			end
		end
	})
end

-- 3 types of dirt :
-- Clayey dirt is a dirt that contains clay, but is not pure clay
register_dirts("Clayey")
-- Idem for silty dirt that contains silt without beeing pure silt
register_dirts("Silty")
-- And sandy dirt
register_dirts("Sandy")
