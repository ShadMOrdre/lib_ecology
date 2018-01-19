
-- orange tree

local ai = {name = "air", param1 = 000}
local lp = {name = "lib_ecology:orange_leaves", param1 = 255}
local lr = {name = "lib_ecology:orange_leaves", param1 = 200}
local tr = {name = "default:tree", param1 = 255}
local of = {name = "lib_ecology:orange", param1 = 100}

lib_ecology.orangetree = {

	size = {x = 3, y = 6, z = 3},

	data = {

		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		lr, lr, of,
		lp, lp, lp,
		lr, of, lr,

		ai, tr, ai,
		ai, tr, ai,
		ai, tr, ai,
		lr, tr, lr,
		lp, tr, lp,
		lr, lp, lr,

		ai, ai, ai,
		ai, ai, ai,
		ai, ai, ai,
		of, lr, lr,
		lp, lp, lp,
		lr, lr, lr,

	},

	yslice_prob = {
		{ypos = 1, prob = 127},
	},
}
