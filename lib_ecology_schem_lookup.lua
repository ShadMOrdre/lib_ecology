
local lookup = function(schem_name, node_set)

	local NS = {}
	local N = lib_ecology.N or {}
	local sch_name = schem_name
	
	--sch_name = sch_name:gsub("_%d%d", "")
	--sch_name = sch_name:gsub("_log", "")

	if node_set then
		if node_set ~= "" then
			local p_nodes = node_set:split(",", true)
			for i, p_n in ipairs(p_nodes) do
				local mat, node = unpack(p_n:split("=", true))
				if mat ~= "" then
					if node ~= "" then
						--minetest.log("mat = " .. mat .. ";   node = " .. node)
						NS[mat] = node					--m = material
					end
				end
			end
		end
	end

	local ttrunk = NS["T"] or "lib_ecology:tree_" .. sch_name .. "_trunk"
	local tleaves = NS["L"] or "lib_ecology:tree_" .. sch_name .. "_leaves"

	local x1vine, x2vine, x3vine
	if minetest.registered_nodes["lib_ecology:plant_vine_" .. sch_name] then
		x1vine = "lib_ecology:plant_vine_" .. sch_name
	else
		x1vine = "lib_ecology:plant_vine_01"
	end
	if minetest.registered_nodes["lib_ecology:plant_vine_" .. sch_name .. "_liana"] then
		x2vine = "lib_ecology:plant_vine_" .. sch_name .. "_liana"
	end
	if minetest.registered_nodes["lib_ecology:plant_vine_" .. sch_name .. "_flowers"] then
		x3vine = "lib_ecology:plant_vine_" .. sch_name .. "_flowers"
	end
	local tvine = NS["I"] or x1vine
	local tvine2 = x2vine or "air"
	local tvine3 = x3vine or "air"
	
	local xfruit
	if minetest.registered_nodes["lib_ecology:fruit_" .. sch_name] then
		xfruit = "lib_ecology:fruit_" .. sch_name
	elseif minetest.registered_nodes["lib_ecology:fruit_" .. sch_name .. "_cone"] then
		xfruit = "lib_ecology:fruit_" .. sch_name .. "_cone"
	elseif minetest.registered_nodes["lib_ecology:fruit_" .. sch_name:gsub("palm_", "") .. "_coconut"] then
		xfruit = "lib_ecology:fruit_coconut"
	elseif minetest.registered_nodes["lib_ecology:fruit_" .. sch_name:gsub("palm_", "") .. "_dates"] then
		xfruit = "lib_ecology:fruit_dates"
	elseif string.find(sch_name, "oak") then
		xfruit = "lib_ecology:fruit_acorn"
	else
		xfruit = "air"
	end
	local tfruit = NS["F"] or xfruit

	local tcap = NS["B"] or "lib_ecology:mushroom_cap_red_spotted"
	local tstem = NS["H"] or "lib_ecology:mushroom_01_trunk"

	local tplant = NS["P"]

	N["_____"] = {name = "air",param2 = 0,prob = 0}
	N["__a__"] = {name = "air", param2 = 0, prob = 0}
	N["ddddd"] = {name = "lib_materials:dirt", param2 = 0, prob = 254}
	N["S0m00"] = {name = "lib_materials:stone", param2 = 0, prob = 254}
	N["__mb_"] = {name = "lib_ecology:mushroom_brown",param2 = 0,prob = 127}
	N["__mr_"] = {name = "lib_ecology:mushroom_red",param2 = 0,prob = 127}
	N["__mp_"] = {name = "lib_ecology:mushroom_purple",param2 = 0,prob = 127}

	N["LL"] = {name = tleaves,param2 = 0,prob = 254, force_place = true}
	N["L0m00"] = {name = tleaves,param2 = 0,prob = 254}
	N["L0m01"] = {name = tleaves,param2 = 0,prob = 222}
	N["L0m02"] = {name = tleaves,param2 = 0,prob = 190}
	N["L0m03"] = {name = tleaves,param2 = 0,prob = 126}
	N["L0m04"] = {name = tleaves,param2 = 0,prob = 96}
	N["L0m05"] = {name = tleaves,param2 = 0,prob = 64}
	N["L0m06"] = {name = tleaves,param2 = 0,prob = 32}
	N["L0mN0"] = {name = tleaves,param2 = 0,prob = 254}
	N["L0mE0"] = {name = tleaves,param2 = 1,prob = 254}
	N["L0mS0"] = {name = tleaves,param2 = 2,prob = 254}
	N["L0mW0"] = {name = tleaves,param2 = 3,prob = 254}

	N["TT"] = {name = ttrunk,param2 = 0,prob = 254, force_place = true}
	N["T0m00"] = {name = ttrunk,param2 = 0,prob = 254}
	N["T0m01"] = {name = ttrunk,param2 = 0,prob = 254}
	N["T0m02"] = {name = ttrunk,param2 = 0,prob = 160}
	N["T0m03"] = {name = ttrunk,param2 = 0,prob = 127}
	N["T0mN0"] = {name = ttrunk,param2 = 4,prob = 254}
	N["T0mS0"] = {name = ttrunk,param2 = 8,prob = 254}
	N["T0mE0"] = {name = ttrunk,param2 = 12,prob = 254}
	N["T0mE1"] = {name = ttrunk,param2 = 12,prob = 191}
	N["T0mE2"] = {name = ttrunk,param2 = 12,prob = 127}
	N["T0mW0"] = {name = ttrunk,param2 = 16,prob = 254}

	N["I0m00"] = {name = tvine,param2 = 0,prob = 254}
	N["I0m01"] = {name = tvine,param2 = 1,prob = 254}
	N["I0m02"] = {name = tvine,param2 = 2,prob = 254}
	N["I0m03"] = {name = tvine,param2 = 3,prob = 254}
	N["I0mN0"] = {name = tvine,param2 = 0,prob = 254}
	N["I0mE0"] = {name = tvine,param2 = 1,prob = 254}
	N["I0mS0"] = {name = tvine,param2 = 2,prob = 254}
	N["I0mW0"] = {name = tvine,param2 = 3,prob = 254}

	N["I1m00"] = {name = tvine2,param2 = 0,prob = 254}
	N["I1m01"] = {name = tvine2,param2 = 1,prob = 254}
	N["I1m02"] = {name = tvine2,param2 = 2,prob = 254}
	N["I1m03"] = {name = tvine2,param2 = 3,prob = 254}
	N["I1mN0"] = {name = tvine2,param2 = 0,prob = 254}
	N["I1mE0"] = {name = tvine2,param2 = 1,prob = 254}
	N["I1mS0"] = {name = tvine2,param2 = 2,prob = 254}
	N["I1mW0"] = {name = tvine2,param2 = 3,prob = 254}

	N["I2m00"] = {name = tvine3,param2 = 0,prob = 254}
	N["I2m01"] = {name = tvine3,param2 = 1,prob = 254}
	N["I2m02"] = {name = tvine3,param2 = 2,prob = 254}
	N["I2m03"] = {name = tvine3,param2 = 3,prob = 254}
	N["I2mN0"] = {name = tvine3,param2 = 0,prob = 254}
	N["I2mE0"] = {name = tvine3,param2 = 1,prob = 254}
	N["I2mS0"] = {name = tvine3,param2 = 2,prob = 254}
	N["I2mW0"] = {name = tvine3,param2 = 3,prob = 254}

	N["F0m00"] = {name = tfruit,param2 = 0,prob = 254}
	N["F0m01"] = {name = tfruit,param2 = 0,prob = 222}
	N["F0m02"] = {name = tfruit,param2 = 0,prob = 190}
	N["F0m03"] = {name = tfruit,param2 = 0,prob = 127}
	N["F0m04"] = {name = tfruit,param2 = 0,prob = 62}
	N["F0mN0"] = {name = tfruit,param2 = 0,prob = 254}
	N["F0mE0"] = {name = tfruit,param2 = 1,prob = 254}
	N["F0mS0"] = {name = tfruit,param2 = 2,prob = 254}
	N["F0mW0"] = {name = tfruit,param2 = 3,prob = 254}

	N["CN"] = {name = tfruit,param2 = 0,prob = 254}
	N["CE"] = {name = tfruit,param2 = 1,prob = 254}
	N["CS"] = {name = tfruit,param2 = 2,prob = 254}
	N["CW"] = {name = tfruit,param2 = 3,prob = 254}

	N["B0m00"] = {name = tcap,param2 = 0,prob = 254}

	N["H0m00"] = {name = tstem,param2 = 0,prob = 254}

	N["P0m00"] = {name = tplant,param2 = 0,prob = 254}
	N["P0m01"] = {name = tplant,param2 = 0,prob = 222}
	N["P0m02"] = {name = tplant,param2 = 0,prob = 190}
	N["P0m03"] = {name = tplant,param2 = 0,prob = 126}
	N["P0m04"] = {name = tplant,param2 = 0,prob = 96}
	N["P0m05"] = {name = tplant,param2 = 0,prob = 64}
	N["P0m06"] = {name = tplant,param2 = 0,prob = 32}
	N["P0mN0"] = {name = tplant,param2 = 0,prob = 254}
	N["P0mE0"] = {name = tplant,param2 = 1,prob = 254}
	N["P0mS0"] = {name = tplant,param2 = 2,prob = 254}
	N["P0mW0"] = {name = tplant,param2 = 3,prob = 254}

	return N

end

return lookup