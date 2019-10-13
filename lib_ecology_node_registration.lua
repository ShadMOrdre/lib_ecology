--
-- Register lib_ecology nodes
--
--
--
-- Define constants that can be used in csv

local S = lib_ecology.intllib

local function read_node_str(node_str)
	if #node_str > 0 then
		local node, count = node_str:match("([^%s]+)%s*(%d*)")
		return node, tonumber(count) or 1
	end
end

for i, stone in ipairs(lib_ecology.read_csv("|", lib_ecology.path .. "/nodes.csv")) do


	--#Node_Name,Description,Alias_Mod,Alias_Node,Tile_String,Special_Tiles,Inv_Image,Wield_Image,Draw_Type,Vis_Scale,Wld_Scale,Param_Type,ParamType2,Place_Param2,LightSource,Walkable,Pointable,Climbable,Diggable,Buildable,Floodable,Waving,Use_Alpha,Sun_Prop,Liquid_Point,Damage_Per_Second,Grnd_Cnt,MaxLight,Groups,Max_Drops,Drops,Sounds,Dig_Predict,Place_Predict,NodeBox,SelBox,ColBox,Mesh,OnConstruct,OnTimer,TimerTrig,TimerAct,AfterPlace,OnPlace

	--#Node_Name,Description,Alias_Mod,Alias_Node,Tile_String,Special_Tiles,Inv_Image,Wield_Image,Draw_Type,Vis_Scale,Wld_Scale,Param_Type,ParamType2,Place_Param2,LightSource,Walkable,Pointable,Climbable,Diggable,Buildable,Floodable,Waving,Use_Alpha,Sun_Prop,Liquid_Point,Damage_Per_Second,Grnd_Cnt,Leg_wall,MaxLight,Grow,Eat,Groups,Max_Drops,Drops,Sounds,Dig_Predict,Place_Predict,NodeBox,SelBox,ColBox,Mesh,LiquidType,LiquidViscosity,LiquidRange,LiquidRenew,LiquidAltSource,LiquidAltFlow,OnConstruct,OnTimer,TimerTrig,TimerAct,AfterPlace,OnPlace
	local node_name, descript, alias_mod, alias_node, tile_string, spec_tile, inv_img, wld_img, draw_type, vis_scale, wld_scale, param_type, param2, place_param2, light, walk, point, climb, dig, build, flood, wave, use_alpha, sun_prop, liq_point, damage, grnd_cont, leg_wal, maxlight, grow, eat, groups, max_drop, drops, sounds, dig_pre, place_pre, node_box, sel_box, col_box, mesh, liq_type, liq_visc, liq_rng, liq_renew, liq_altsrc, liq_altflow, on_con, on_time, time_trig, time_act, aft_place, on_place = unpack(stone)

	-- Parse node names: transform empty strings into nil and separate node and count
	node_name = read_node_str(node_name)
	--descript = read_node_str(descript)
	alias_mod = read_node_str(alias_mod)
	alias_node = read_node_str(alias_node)

	local new_node_def = {}
	local new_node_type = 1

	new_node_def.tiles = {}
	new_node_def.groups = {}
	new_node_def.sounds = {}



	if descript ~= "" then
		new_node_def.description = S(""..descript.."")
	end

	if draw_type ~= "" then
		new_node_def.drawtype = draw_type
	end

	if vis_scale ~= "" then
		new_node_def.visual_scale = tonumber(vis_scale)
	end

	if wld_scale ~= "" then
		new_node_def.wield_scale = {}
		local ws_x, ws_y, ws_z = unpack(wld_scale:split(",", true))
		new_node_def.wield_scale.x = tonumber(ws_x)
		new_node_def.wield_scale.y = tonumber(ws_y)
		new_node_def.wield_scale.z = tonumber(ws_z)
	end

	if param_type ~= "" then
		new_node_def.paramtype = param_type
	end

	if param2 ~= "" then
		new_node_def.paramtype2 = param2
	end

	if place_param2 ~= "" then
		new_node_def.place_param2 = tonumber(place_param2)
	end

	if light ~= "" then
		new_node_def.light_source = tonumber(light)
	end

	if string.lower(leg_wal) == "true" then
		new_node_def.legacy_wallmounted = true
	else
		new_node_def.legacy_wallmounted = false
	end

	if walk ~= "" then
		if string.lower(walk) == "true" then
			new_node_def.walkable = true
		else
			new_node_def.walkable = false
		end
	end

	if point ~= "" then
		if string.lower(point) == "true" then
			new_node_def.pointable = true
		else
			new_node_def.pointable = false
		end
	end

	if climb ~= "" then
		if string.lower(climb) == "true" then
			new_node_def.climbable = true
		else
			new_node_def.climbable = false
		end
	end

	if dig ~= "" then
		if string.lower(dig) == "true" then
			new_node_def.diggable = true
		else
			new_node_def.diggable = false
		end
	end

	if build ~= "" then
		if string.lower(build) == "true" then
			new_node_def.buildable_to = true
		else
			new_node_def.buildable_to = false
		end
	end

	if flood ~= "" then
		if string.lower(flood) == "true" then
			new_node_def.floodable = true
		else
			new_node_def.floodable = false
		end
	end

	if wave ~= "" then
		new_node_def.waving = tonumber(wave)
	end

	if use_alpha ~= "" then
		new_node_def.use_texture_alpha = string.lower(use_alpha)
	end

	if liq_point ~= "" then
		if string.lower(liq_point) == "true" then
			new_node_def.liquids_pointable = true
		else
			new_node_def.liquids_pointable = false
		end
	end

	if sun_prop ~= "" then
		if string.lower(sun_prop) == "true" then
			new_node_def.sunlight_propagates = true
		else
			new_node_def.sunlight_propagates = false
		end
	end

	if damage ~= "" then
		if tonumber(damage) > 0 then
			new_node_def.damage_per_second = tonumber(damage)
		end
	end

	if grnd_cont ~= "" then
		if string.lower(grnd_cont) == "true" then
			new_node_def.is_ground_content = true
		else
			new_node_def.is_ground_content = false
		end
	end

--NEED GROW CODE FOR CROPS
	if grow ~= "" then
		if string.find(grow, ",") then
			
		else
			new_node_def.on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(60,120))
			end
			new_node_def.on_timer = function(pos)
				minetest.set_node(pos, {name=grow})
			end
		end
	end

	if eat ~= "" then
		new_node_def.on_use = minetest.item_eat(tonumber(eat))
	end

--USE MAX LIGHT FOR CROPS
	if maxlight ~= "" then
		--new_node_def.alpha = tonumber(maxlight)
	end


	if dig_pre ~= "" then
		new_node_def.node_dig_prediction = dig_pre
	end

	if place_pre ~= "" then
		new_node_def.node_placement_prediction = place_pre
	end

	if mesh ~= "" then
		new_node_def.mesh = mesh
	end

	if liq_type ~= "" then
		new_node_def.liquidtype = liq_type
	end

	if liq_visc ~= "" then
		new_node_def.liquid_viscosity = tonumber(liq_visc)
	end

	if liq_rng ~= "" then
		new_node_def.liquid_range = tonumber(liq_rng)
	end

	if liq_renew ~= "" then
		if string.lower(liq_renew) == "true" then
			new_node_def.liquid_renewable = true
		else
			new_node_def.liquid_renewable = false
		end
	end

	if liq_altflow ~= "" then
		new_node_def.liquid_alternative_flowing = liq_altflow
	end

	if liq_altsrc ~= "" then
		new_node_def.liquid_alternative_source = liq_altsrc
	end

	if drops == "" then
		drops = nil
	end

	if drops then

		if drops:find("[^%,% ]") then

			local new_drop1, new_drop2, new_drop3, new_drop4, new_drop5, new_drop6
			new_node_def.drop = {}

			if max_drop then
				new_node_def.drop.max_items = max_drop
			end

			new_node_def.drop.items = {}
			new_drop1, new_drop2, new_drop3, new_drop4, new_drop5, new_drop6 = unpack(drops:split(",", true))

			local new_drop_name, new_drop_rarity
			if new_drop1 then

				new_drop_name, new_drop_rarity = unpack(new_drop1:split(" ", true))
				if new_drop_name then

					--minetest.log(new_drop_name)

					if new_drop_rarity then

						--minetest.log(new_drop_rarity)

						new_node_def.drop.items[1] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
					else
						new_node_def.drop.items[1] = {items = {new_drop_name}}
					end
				else
					new_node_def.drop.items[1] = {items = {new_drop1}}
				end
			else
				new_node_def.drop.items[1] = {items = {drops}}
			end
			if new_drop2 then

				new_drop_name, new_drop_rarity = unpack(new_drop2:split(" ", true))
				if new_drop_name then

					--minetest.log(new_drop_name)

					if new_drop_rarity then

						--minetest.log(new_drop_rarity)

						new_node_def.drop.items[2] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
					else
						new_node_def.drop.items[2] = {items = {new_drop_name}}
					end
				else
					new_node_def.drop.items[2] = {items = {new_drop2}}
				end
			else
				new_node_def.drop.items[2] = {items = {drops}}
			end
			if new_drop3 then

				new_drop_name, new_drop_rarity = unpack(new_drop3:split(" ", true))
				if new_drop_name then

					--minetest.log(new_drop_name)

					if new_drop_rarity then

						--minetest.log(new_drop_rarity)

						new_node_def.drop.items[3] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
					else
						new_node_def.drop.items[3] = {items = {new_drop_name}}
					end
				else
					new_node_def.drop.items[3] = {items = {new_drop3}}
				end
			else
				new_node_def.drop.items[3] = {items = {drops}}
			end
			if new_drop4 then

				new_drop_name, new_drop_rarity = unpack(new_drop4:split(" ", true))
				if new_drop_name then

					--minetest.log(new_drop_name)

					if new_drop_rarity then

						--minetest.log(new_drop_rarity)

						new_node_def.drop.items[4] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
					else
						new_node_def.drop.items[4] = {items = {new_drop_name}}
					end
				else
					new_node_def.drop.items[4] = {items = {new_drop4}}
				end
			else
				new_node_def.drop.items[4] = {items = {drops}}
			end
			if new_drop5 then

				new_drop_name, new_drop_rarity = unpack(new_drop5:split(" ", true))
				if new_drop_name then

					--minetest.log(new_drop_name)

					if new_drop_rarity then

						--minetest.log(new_drop_rarity)

						new_node_def.drop.items[5] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
					else
						new_node_def.drop.items[5] = {items = {new_drop_name}}
					end
				else
					new_node_def.drop.items[5] = {items = {new_drop5}}
				end
			else
				new_node_def.drop.items[5] = {items = {drops}}
			end
			if new_drop6 then

				new_drop_name, new_drop_rarity = unpack(new_drop6:split(" ", true))
				if new_drop_name then

					--minetest.log(new_drop_name)

					if new_drop_rarity then

						--minetest.log(new_drop_rarity)

						new_node_def.drop.items[6] = {items = {new_drop_name}, rarity = tonumber(new_drop_rarity)}
					else
						new_node_def.drop.items[6] = {items = {new_drop_name}}
					end
				else
					new_node_def.drop.items[6] = {items = {new_drop6}}
				end
			else
				new_node_def.drop.items[6] = {items = {drops}}
			end

		else
			new_node_def.drop = drops
		end
	end

	if spec_tile ~= "" then
		new_node_def.special_tiles = {}
		new_node_def.special_tiles[1] = {}
		--new_node_def.special_tiles = {{name = st_name, tileable_vertical = st_val}}
		local s_tile = {}
		local st_name, st_val = unpack(spec_tile:split(" ", true))
		s_tile.name = st_name
		if st_val ~= "" then
			if string.lower(st_val) == "true" then
				s_tile.tileable_vertical = true
			else
				s_tile.tileable_vertical = false
			end
		--else
			--new_node_def.special_tiles.tileable_vertical = true
		end
		new_node_def.special_tiles[1] = s_tile
	end

	if inv_img ~= "" then
		new_node_def.inventory_image = inv_img
	end

	if wld_img ~= "" then
		new_node_def.wield_image = wld_img
	end

	local new_tile1, new_tile2, new_tile3, new_tile4, new_tile5, new_tile6
	if tile_string then
		if tile_string:find("[^%,% ]") then
			new_tile1, new_tile2, new_tile3, new_tile4, new_tile5, new_tile6 = unpack(tile_string:split(",", true))
		else
			new_tile1 = tile_string
		end
	end

	if new_tile1 then
		new_node_def.tiles[1] = new_tile1
	end
	if new_tile2 and new_tile2 ~= "" then
		new_node_def.tiles[2] = new_tile2
	else
		new_node_def.tiles[2] = new_tile1
	end
	if new_tile3 and new_tile3 ~= "" then
		new_node_def.tiles[3] = new_tile3
	else
		new_node_def.tiles[3] = new_tile2
	end
	if new_tile4 and new_tile4 ~= "" then
		new_node_def.tiles[4] = new_tile4
	else
		new_node_def.tiles[4] = new_tile3
	end
	if new_tile5 and new_tile5 ~= "" then
		new_node_def.tiles[5] = new_tile5
	else
		new_node_def.tiles[5] = new_tile3
	end
	if new_tile6 and new_tile6 ~= "" then
		new_node_def.tiles[6] = new_tile6
	else
		new_node_def.tiles[6] = new_tile3
	end
	
	if sounds and sounds ~= "" then
		--sounds = assert(loadstring(sounds))() or lib_materials.node_sound_stone_defaults(),
		--new_node_def.sounds = assert(loadstring(sounds))() or lib_materials.node_sound_stone_defaults()
		if sounds == "dirt" then
			new_node_def.sounds = lib_ecology.node_sound_dirt_defaults()
		elseif sounds == "stone" then
			new_node_def.sounds = lib_ecology.node_sound_stone_defaults()
		elseif sounds == "sand" then
			new_node_def.sounds = lib_ecology.node_sound_sand_defaults()
		elseif sounds == "gravel" then
			new_node_def.sounds = lib_ecology.node_sound_gravel_defaults()
		elseif sounds == "glass" then
			new_node_def.sounds = lib_ecology.node_sound_glass_defaults()
		elseif sounds == "metal" then
			new_node_def.sounds = lib_ecology.node_sound_metal_defaults()
		elseif sounds == "water" then
			new_node_def.sounds = lib_ecology.node_sound_water_defaults()
		elseif sounds == "snow" then
			new_node_def.sounds = lib_ecology.node_sound_snow_defaults()
		else

		end
	end

	if groups then
		local temp_new_groups = {}
		local new_node_groups = groups:split(",", true)
		for _, nng in pairs(new_node_groups) do
			local g_name, g_val = unpack(nng:split(" ", true))
			temp_new_groups[g_name] = tonumber(g_val)
		end
		new_node_def.groups = temp_new_groups
	end

	if node_box ~= "" then
		new_node_def.node_box = {}
		local temp_nodebox_def = {}
		temp_nodebox_def.type = "fixed"
		temp_nodebox_def.fixed = {}

		if string.find(node_box, ";") then
			local nb_row_idx = 1
			local new_node_nb = node_box:split(";", true)
			for i, nbr in pairs(new_node_nb) do
				local nb_col_idx = 1
				local nb_row_list = {}
				local new_nb_item = nbr:split(",", true)
				for _, nri in pairs(new_nb_item) do
					nb_row_list[nb_col_idx] = nri
					nb_col_idx = nb_col_idx + 1
				end
				temp_nodebox_def.fixed[nb_row_idx] = nb_row_list
				--temp_nodebox_def.fixed[nb_row_idx] = nbr
				nb_row_idx = nb_row_idx + 1
			end
		else
			--if draw_type == "plantlike" then
			--	temp_nodebox_def.fixed = node_box
			--else
				local nb_col_idx = 1
				local nb_row_list = {}
				local new_nb_item = node_box:split(",", true)
				for _, nri in pairs(new_nb_item) do
					nb_row_list[nb_col_idx] = nri
					nb_col_idx = nb_col_idx + 1
				end
				temp_nodebox_def.fixed[1] = nb_row_list
			--end
		end

		new_node_def.node_box = temp_nodebox_def
	end

	if sel_box ~= "" then
		new_node_def.selection_box = {}
		local temp_selbox_def = {}

		if sel_box == "wallmounted" then
			temp_selbox_def.type = "wallmounted"
		else
			temp_selbox_def.type = "fixed"
		end

		temp_selbox_def.fixed = {}

		if string.find(sel_box, ";") then
			local nb_row_idx = 1
			local new_node_nb = sel_box:split(";", true)
			for i, nbr in pairs(new_node_nb) do
				local nb_col_idx = 1
				local nb_row_list = {}
				local new_nb_item = nbr:split(",", true)
				for _, nri in pairs(new_nb_item) do
					nb_row_list[nb_col_idx] = nri
					nb_col_idx = nb_col_idx + 1
				end
				temp_selbox_def.fixed[nb_row_idx] = nb_row_list
				--temp_selbox_def.fixed[nb_row_idx] = nbr
				nb_row_idx = nb_row_idx + 1
			end
		else
			--if draw_type == "plantlike" then
			--	temp_selbox_def.fixed = sel_box
			--else
				local nb_col_idx = 1
				local nb_row_list = {}
				local new_nb_item = sel_box:split(",", true)
				for _, nri in pairs(new_nb_item) do
					nb_row_list[nb_col_idx] = nri
					nb_col_idx = nb_col_idx + 1
				end
				temp_selbox_def.fixed[1] = nb_row_list
			--end
		end

		new_node_def.selection_box = temp_selbox_def
	end

	--if col_box ~= "" then
	--	new_node_def.collision_box = {
	--		type = "fixed",
	--		fixed = col_box
	--	}
	--end


	if string.find(node_name, "_waterlily") then
		new_node_def.on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			local node = minetest.get_node(pointed_thing.under).name
			local def = minetest.registered_nodes[node]
			local player_name = placer:get_player_name()

			if def and def.liquidtype == "source" and
					minetest.get_item_group(node, "water") > 0 then
				if not minetest.is_protected(pos, player_name) then
					minetest.set_node(pos, {name = "lib_ecology:"..node_name, param2 = math.random(0, 3)})
					if not minetest.setting_getbool("creative_mode") then
						itemstack:take_item()
					end
				else
					minetest.chat_send_player(player_name, "Node is protected")
					minetest.record_protection_violation(pos, player_name)
				end
			end

			return itemstack
		end
	
	end


	if draw_type == "plantlike_rooted" then
		if string.find(groups, "sea") then
			if string.find(tile_string, "_coral") then
				new_node_def.on_place = function(itemstack, placer, pointed_thing)
					if pointed_thing.type ~= "node" or not placer then
						return itemstack
					end
		
					local player_name = placer:get_player_name()
					local pos_under = pointed_thing.under
					local pos_above = pointed_thing.above
		
					if minetest.get_node(pos_under).name ~= "lib_ecology:coral_skeleton" or (string.find(minetest.get_node(pos_above).name, "water_") and string.find(minetest.get_node(pos_above).name, "_source")) then
						return itemstack
					end
		
					if minetest.is_protected(pos_under, player_name) or
							minetest.is_protected(pos_above, player_name) then
						minetest.chat_send_player(player_name, "Node is protected")
						minetest.record_protection_violation(pos_under, player_name)
						return itemstack
					end
		
					minetest.set_node(pos_under, {name = "lib_ecology:"..node_name..""})
					if not (creative and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
		
					return itemstack
				end
				new_node_def.after_destruct  = function(pos, oldnode)
					minetest.set_node(pos, {name = "lib_ecology:coral_skeleton"})
				end
			else
				new_node_def.on_place = function(itemstack, placer, pointed_thing)
					if pointed_thing.type ~= "node" or not placer then
						return itemstack
					end
		
					local player_name = placer:get_player_name()
					local pos_under = pointed_thing.under
					local pos_above = pointed_thing.above
		
					if minetest.get_node(pos_under).name ~= dig_pre or (string.find(minetest.get_node(pos_above).name, "water_") and string.find(minetest.get_node(pos_above).name, "_source")) then
						return itemstack
					end
		
					if minetest.is_protected(pos_under, player_name) or
							minetest.is_protected(pos_above, player_name) then
						minetest.chat_send_player(player_name, "Node is protected")
						minetest.record_protection_violation(pos_under, player_name)
						return itemstack
					end
		
					minetest.set_node(pos_under, {name = "lib_ecology:"..node_name..""})
					if not (creative and creative.is_enabled_for(player_name)) then
						itemstack:take_item()
					end
		
					return itemstack
				end
				new_node_def.after_destruct  = function(pos, oldnode)
					minetest.set_node(pos, {name = dig_pre})
				end
			end
		else

		end
	end



	local RADIUS = 6

	if string.find(node_name, "_leaves") then
		if string.find(node_name, "_tree_leaves") then
			new_node_def.after_place_node = function(pos, placer, itemstack, pointed_thing)
				if placer and placer:is_player() and not placer:get_player_control().sneak then
					local node = minetest.get_node(pos)
					node.param2 = 1
					minetest.set_node(pos, node)
				end
			end
			new_node_def.on_timer = function(pos)
				local node = minetest.get_node(pos)
				local drops = minetest.get_node_drops(node.name)
				for _, item in ipairs(drops) do
					local is_leaf
					for _, v in pairs({"lib_ecology:"..node_name..""}) do
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
			end

		else
			new_node_def.after_place_node = function(pos, placer, itemstack, pointed_thing)
				if placer and placer:is_player() and not placer:get_player_control().sneak then
					local node = minetest.get_node(pos)
					node.param2 = 1
					minetest.set_node(pos, node)
				end
			end
			new_node_def.on_timer = function(pos)
				if minetest.find_node_near(pos, RADIUS, "lib_ecology:tree_"..node_name.."_trunk") then
					return false
				end
				local node = minetest.get_node(pos)
				local drops = minetest.get_node_drops(node.name)
				for _, item in ipairs(drops) do
					local is_leaf
					for _, v in pairs({"lib_ecology:"..node_name..""}) do
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
			end
		end
	end

	if string.find(node_name, "_trunk") then
		new_node_def.after_destruct = function(pos, oldnode)
			--leafdecay_after_destruct(pos, oldnode, def)
			for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, RADIUS),
					vector.add(pos, RADIUS), "lib_ecology:"..node_name.."")) do
				local node = minetest.get_node(v)
				local timer = minetest.get_node_timer(v)
				if node.param2 == 0 and not timer:is_started() then
					timer:start(math.random(20, 120) / 10)
				end
			end
		end
		new_node_def.on_place = minetest.rotate_node
	end

	if string.find(node_name, "_sapling") then
		new_node_def.on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(60,120))
		end
		new_node_def.on_timer = function(pos)
			if not lib_ecology.can_grow(pos) then
				-- try again 5 min later
				minetest.get_node_timer(pos):start(300)
				return
			end
			if string.find(grow, ",") then
				local new_node_schems = grow:split(",", true)
				local rnum = math.random(1,#new_node_schems)
				local rname = new_node_schems[rnum]
				minetest.place_schematic(pos, lib_ecology.schematics.select(rname), "random", nil, true, "place_center_x, place_center_z")
			end
		end
		new_node_def.on_place = function(itemstack, placer, pointed_thing)
			itemstack = lib_ecology.sapling_on_place(itemstack, placer, pointed_thing,
				"lib_ecology:" .. node_name .. "",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -4, y = 1, z = -4},
				{x = 4, y = 6, z = 4},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end
	end

	minetest.register_node("lib_ecology:"..node_name.."", new_node_def)
	minetest.register_alias(""..node_name.."", "lib_ecology:"..node_name.."")
	--game.lib.node.register("lib_ecology:"..node_name.."", new_node_def)
	--game.lib.node.register_alias("lib_ecology", node_name, alias_mod, alias_node)

	if minetest.global_exists("lib_shapes") then
		if not string.find(node_name, "plant") then
			--if ((string.find(node_name, "_allface") or string.find(node_name, "_trunk") or string.find(node_name, "_wood")) and string.find(node_name, "tree_")) and not string.find(node_name, "plant") then
			if (string.find(node_name, "_allface") and string.find(node_name, "tree_")) then
				if string.find(node_name, "_beech") or string.find(node_name, "_oak") or string.find(node_name, "_pine") or string.find(node_name, "_frost") or string.find(node_name, "_acacia")
				    or string.find(node_name, "_cedar") or string.find(node_name, "_maple") or string.find(node_name, "_palm") or string.find(node_name, "_jungle") or string.find(node_name, "_cherry")
				    or string.find(node_name, "_healing") then
					--lib_shapes.register_basic_set("lib_ecology:"..node_name.."")
					--lib_shapes.register_fancy_set("lib_ecology:"..node_name.."")
					--lib_shapes.register_doors_set("lib_ecology:"..node_name.."")
					--lib_shapes.register_furniture_set("lib_ecology:"..node_name.."")
					lib_shapes.register_furniture_node("lib_ecology:"..node_name.."", "bed_simple")
					lib_shapes.register_furniture_node("lib_ecology:"..node_name.."", "chair_basic_01")
					lib_shapes.register_furniture_node("lib_ecology:"..node_name.."", "table_basic_01")
				end
			end
			if (string.find(node_name, "_wood") and string.find(node_name, "tree_")) then
				if string.find(node_name, "_beech") or string.find(node_name, "_oak") or string.find(node_name, "_pine") or string.find(node_name, "_frost") or string.find(node_name, "_acacia")
				    or string.find(node_name, "_cedar") or string.find(node_name, "_maple") or string.find(node_name, "_palm") or string.find(node_name, "_jungle") or string.find(node_name, "_cherry")
				    or string.find(node_name, "_healing") or string.find(node_name, "_default") then
					--lib_shapes.register_doors_set("lib_ecology:"..node_name.."")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "door_centered")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "door_centered_right")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "door_centered_with_window")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "door_centered_with_window_right")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "door_centered_sliding")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "door_centered_sliding_right")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "fencegate_centered")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "fencegate_centered_right")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "trapdoor_solid")
					lib_shapes.register_door_node("lib_ecology:"..node_name.."", "trapdoor_with_window")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "stairs")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "stairs_inner")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "stairs_outer")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "slab")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "ceiling")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "wall")
					lib_shapes.register_node("lib_ecology:"..node_name.."", "wall_centered")
					lib_shapes.register_fence_node("lib_ecology:"..node_name.."", "fence")
					lib_shapes.register_fence_node("lib_ecology:"..node_name.."", "fence_stone_cobble_post")
				end
			end
		end
	end


	if alias_mod and alias_node then
		minetest.register_alias(""..alias_mod..":"..alias_node.."", "lib_ecology:"..node_name.."")
		minetest.register_alias(""..alias_node.."", "lib_ecology:"..node_name.."")
	end

end



if minetest.global_exists("lib_shapes") then
	minetest.register_alias("stairs:stair_wood", "lib_ecology:tree_default_wood_stairs")
	minetest.register_alias("stairs:stair_inner_wood", "lib_ecology:tree_default_wood_stairs_inner")
	minetest.register_alias("stairs:stair_outer_wood", "lib_ecology:tree_default_wood_stairs_outer")
	minetest.register_alias("stairs:slab_wood", "lib_ecology:tree_default_wood_slab")

	minetest.register_alias("stairs:stair_junglewood", "lib_ecology:tree_jungle_01_wood_stairs")
	minetest.register_alias("stairs:stair_inner_junglewood", "lib_ecology:tree_jungle_01_wood_stairs_inner")
	minetest.register_alias("stairs:stair_outer_junglewood", "lib_ecology:tree_jungle_01_wood_stairs_outer")
	minetest.register_alias("stairs:slab_junglewood", "lib_ecology:tree_jungle_01_wood_slab")

	minetest.register_alias("stairs:stair_acacia_wood", "lib_ecology:tree_acacia_wood_stairs")
	minetest.register_alias("stairs:stair_inner_acacia_wood", "lib_ecology:tree_acacia_wood_stairs_inner")
	minetest.register_alias("stairs:stair_outer_acacia_wood", "lib_ecology:tree_acacia_wood_stairs_outer")
	minetest.register_alias("stairs:slab_acacia_wood", "lib_ecology:tree_acacia_wood_slab")

	minetest.register_alias("stairs:stair_aspen_wood", "lib_ecology:tree_aspen_wood_stairs")
	minetest.register_alias("stairs:stair_inner_aspen_wood", "lib_ecology:tree_aspen_wood_stairs_inner")
	minetest.register_alias("stairs:stair_outer_aspen_wood", "lib_ecology:tree_aspen_wood_stairs_outer")
	minetest.register_alias("stairs:slab_aspen_wood", "lib_ecology:tree_aspen_wood_slab")

	minetest.register_alias("stairs:stair_pine_wood", "lib_ecology:tree_pine_wood_stairs")
	minetest.register_alias("stairs:stair_inner_pine_wood", "lib_ecology:tree_pine_wood_stairs_inner")
	minetest.register_alias("stairs:stair_outer_pine_wood", "lib_ecology:tree_pine_wood_stairs_outer")
	minetest.register_alias("stairs:slab_pine_wood", "lib_ecology:tree_pine_wood_slab")
end







