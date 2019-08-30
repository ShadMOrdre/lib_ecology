--
-- Register lib_ecology craftitems
--

for i, ci in ipairs(lib_ecology.read_csv("|", lib_ecology.path .. "/craftitems.csv")) do

	--#Craft Item|Craft Description|Craft Image|Craft Groups
	local citem, cdesc, cimage, cgrps = unpack(ci)

	local new_ci_def = {}

	if citem then
		if citem ~= "" then

			if cdesc then
				if cdesc ~= "" then
					new_ci_def.description = cdesc
				end
			end
		
			if cimage then
				if cimage ~= "" then
					new_ci_def.inventory_image = cimage
				end
			end
		
			if cgrps then
				if cgrps ~= "" then
					new_ci_def.groups = {}
					local new_node_groups = cgrps:split(",", true)
					for _, nng in pairs(new_node_groups) do
						local g_name, g_val = unpack(nng:split(" ", true))
						new_ci_def.groups[g_name] = tonumber(g_val)
					end
				end
			end

			minetest.register_craftitem("lib_ecology:" .. citem, new_ci_def)
			--minetest.register_craftitem(citem, new_ci_def)

		end
	end
end
