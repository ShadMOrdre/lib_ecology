

--Acacia Tree
	local N = lib_ecology.N

	-- N["T0"] = {name = "lib_ecology:tree_acacia_trunk", param2 = 0, prob = 254}
	-- N["L0"] = {name = "lib_ecology:tree_acacia_leaves", param2 = 0, prob = 254}
	-- N["L1"] = {name = "lib_ecology:tree_acacia_leaves", param2 = 0, prob = 222}
	
	return {
		size = {x = 3, y = 2, z = 1},
		data = {{name = "air", prob = 0},
			{name = "air", prob = 0},
			{name = "air", prob = 0},
			{name = "lib_ecology:tree_acacia_trunk", param2 = 12, prob = 191},
			{name = "lib_ecology:tree_acacia_trunk", param2 = 12},
			{name = "lib_ecology:tree_acacia_trunk", param2 = 12, prob = 127},
		},
	}
