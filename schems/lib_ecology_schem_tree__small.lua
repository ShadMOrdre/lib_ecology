
--Small Tree Model
	L0 = {name = "lib_ecology:tree_leaves_red",param2 = 0,prob = 254}
	T0 = {name = "lib_ecology:tree_generic_green_trunk",param2 = 0,prob = 254}
	--minetest.log(S("TREES - tree_schem_small_tree"))
	le_temp_schem = {
		size = {x = 3,y = 11,z = 3},
		data = {
			__, __, __,
			__, __, __,
			__, __, __,
			__, __, __,
			L0, L0, L0,
			L0, L0, L0,
			__, L0, __,
			__, __, __,
			__, L0, __,
			__, L0, __,
			__, __, __,

			__, T0, __,
			__, T0, __,
			__, T0, __,
			__, T0, __,
			L0, T0, L0,
			L0, T0, L0,
			L0, T0, L0,
			__, T0, __,
			L0, L0, L0,
			L0, L0, L0,
			__, L0, __,

			__, __, __,
			__, __, __,
			__, __, __,
			__, __, __,
			L0, L0, L0,
			L0, L0, L0,
			__, L0, __,
			__, __, __,
			__, L0, __,
			__, L0, __,
			__, __, __
		},
		yslice_prob = {
			{ypos = 0,prob = 254},
			{ypos = 1,prob = 254},
			{ypos = 2,prob = 254},
			{ypos = 3,prob = 254},
			{ypos = 4,prob = 254},
			{ypos = 5,prob = 254},
			{ypos = 6,prob = 254},
			{ypos = 7,prob = 254},
			{ypos = 8,prob = 254},
			{ypos = 9,prob = 254},
			{ypos = 10,prob = 254}
		}
	}
	lib_ecology.schematics.insert("tree_schem_small_tree", le_temp_schem)

