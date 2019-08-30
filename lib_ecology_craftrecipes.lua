--
-- Register lib_materials craft recipes
--

for i, cr in ipairs(lib_materials.read_csv("|", lib_materials.path .. "/craftrecipes.csv")) do

	--#Recipe Output|Output Amnt|Recipe Type|Cooktime|Recipe|Replacements
	local cout_name, cout_amnt, rec_type, ctime, crecipe, creplace = unpack(cr)

	local new_cr_def = {}

	if cout_name then
		if cout_name ~= "" then
			if cout_amnt then
				--if cout_amnt ~= "" then
				--	new_cr_def.output = cout_name .. " " .. cout_amnt
				--else
					new_cr_def.output = cout_name
				--end
			end
		end
	end


	if rec_type then
		if rec_type ~= "" then
			new_cr_def.type = rec_type
		end
	end

	if ctime then
		if ctime ~= "" then
			new_cr_def.cooktime = tonumber(ctime)
		end
	end

	if crecipe then
		if crecipe ~= "" then
			new_cr_def.recipe = {}
			local temp_recipe = {}
			if string.find(crecipe, ";") then
				if string.find(crecipe, ",") then
					local recipe_row_idx = 1
					local new_recipe_row = crecipe:split(";", true)
					for _, nrn in pairs(new_recipe_row) do
						local recipe_col_idx = 1
						local recipe_row_list = {}
						local new_recipe_item = nrn:split(",", true)
						for _, nri in pairs(new_recipe_item) do
							recipe_row_list[recipe_col_idx] = nri
							recipe_col_idx = recipe_col_idx + 1
						end
						temp_recipe[recipe_row_idx] = recipe_row_list
						recipe_row_idx = recipe_row_idx + 1
					end
				else
					local recipe_row_idx = 1
					local recipe_row_list = {}
					local new_recipe_item = crecipe:split(";", true)
					for _, nri in pairs(new_recipe_item) do
						recipe_row_list[1] = nri
						temp_recipe[recipe_row_idx] = recipe_row_list
						recipe_row_idx = recipe_row_idx + 1
					end
				end
			else
				if string.find(crecipe, ",") then
					if rec_type == "cooking" then
						local recipe_col_idx = 1
						local recipe_row_list = {}
						local new_recipe_item = crecipe:split(",", true)
						for _, nri in pairs(new_recipe_item) do
							recipe_row_list[recipe_col_idx] = nri
							--recipe_row_list = recipe_row_list .. ", " .. nri
							recipe_col_idx = recipe_col_idx + 1
						end
						temp_recipe[1] = recipe_row_list
					elseif rec_type == "shapeless" then
						local recipe_col_idx = 1
						local recipe_row_list = ""
						local new_recipe_item = crecipe:split(",", true)
						for _, nri in pairs(new_recipe_item) do
							--recipe_row_list[recipe_col_idx] = nri
							recipe_row_list = recipe_row_list .. ", " .. nri
							recipe_col_idx = recipe_col_idx + 1
						end
						temp_recipe[1] = recipe_row_list
					else

					end
				else
					if rec_type == "cooking" then
						temp_recipe = crecipe
					elseif rec_type == "shapeless" then
						temp_recipe[1] = crecipe
					else
						local recipe_row_list = {}
						recipe_row_list[1] = crecipe
						temp_recipe[1] = recipe_row_list
						--temp_recipe[1] = crecipe
					end
				end
			end
			--local mt_recipe = dump(temp_recipe)
			new_cr_def.recipe = temp_recipe
		end
	end

	minetest.register_craft(new_cr_def)

end
