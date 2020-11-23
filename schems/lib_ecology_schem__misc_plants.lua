
--PLANTS

-- Bamboo Stalk with Leaves
	le_temp_schem = {
		size = {x = 1,y = 7,z = 1},
		data = {
			{param2 = 0,name = "lib_ecology:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "lib_ecology:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "lib_ecology:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "lib_ecology:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "lib_ecology:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "lib_ecology:tree_bamboo_small",prob = 254},
			{param2 = 0,name = "lib_ecology:tree_bamboo_small_top",prob = 254}
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254},
			{ypos = 6,prob = 254}
		}
	}
lib_ecology.schematics.insert("tree_bamboo_small_01", le_temp_schem)

--Cactus
	T0 = {name = "lib_ecology:cactus_green_trunk", param2 = 0, prob = 254}
	le_temp_schem = {
		size = {x = 5,y = 6,z = 1},
		data = {
			__, __, T0, __, __,
			__, __, T0, __, __,
			__, __, T0, __, __,
			T0, T0, T0, T0, T0,
			T0, __, T0, __, T0,
			__, __, T0, __, __
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 127},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 127},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254}
		}
	}
lib_ecology.schematics.insert("schem_cactus_01", le_temp_schem)

