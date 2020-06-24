

local schem_load = function(schem_name, node_set)

	local sch_name = schem_name

	local sch_file


	if string.find(schem_name, "mushroom") then

		local lookup = dofile(lib_ecology.path.."/lib_ecology_schem_lookup.lua")
		lib_ecology.N = lookup("default", node_set)

		sch_file = "/schems/lib_ecology_schem_" .. schem_name .. ".lua"

	elseif string.find(schem_name, "tree") then

		sch_name = sch_name:gsub("_%d%d", "")
		sch_name = sch_name:gsub("_log", "")

		local lookup = dofile(lib_ecology.path.."/lib_ecology_schem_lookup.lua")
		lib_ecology.N = lookup(sch_name, node_set)

		sch_file = "/schems/lib_ecology_schem_tree_" .. schem_name .. ".lua"

	elseif string.find(schem_name, "plant") then

		local lookup = dofile(lib_ecology.path.."/lib_ecology_schem_lookup.lua")
		lib_ecology.N = lookup("default", node_set)

		sch_file = "/schems/lib_ecology_schem_" .. schem_name .. ".lua"

	else

		sch_name = sch_name:gsub("_%d%d", "")
		sch_name = sch_name:gsub("_log", "")

		local lookup = dofile(lib_ecology.path.."/lib_ecology_schem_lookup.lua")
		lib_ecology.N = lookup(sch_name, node_set)

		sch_file = "/schems/lib_ecology_schem_tree_" .. schem_name .. ".lua"

	end




	return dofile(lib_ecology.path .. sch_file)

end

return schem_load
		
