


-- The pillars are neat, but a huge fps killer en masse.
--local grid = {}
--local pillars = 5
--for x = 1,pillars do
--	for z = 1,pillars do
--		local d2 = (2 / (pillars + 2)) / (pillars - 1)
--		local d1 = (1 + d2) / pillars
--		local g = {}
--		g[#g + 1] = (x - 1) * d1 - 0.5
--		g[#g + 1] = -0.5 
--		g[#g + 1] = (z - 1) * d1 - 0.5
--		g[#g + 1] = x * d1 - d2 - 0.5
--		g[#g + 1] = 0.5 - (math.random(1,4) + math.random(4)) * 0.1 
--		g[#g + 1] = z * d1 - d2 - 0.5
--		grid[#grid + 1] = g
--	end
--end

minetest.register_node("lib_ecology:pillar_coral", {
	description = "Pillar Coral",
	tiles = {"valc_pillar_coral.png"},
	paramtype = "light",
--	drawtype = "nodebox",
	light_source = 2,
--	node_box = {
--		type = "fixed", 
--		fixed = grid,
--	},
--	selection_box = {
--		type = "fixed", 
--		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
--	},
--	groups = {cracky = 3, stone=1, sea=1},
	groups = {cracky = 3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("lib_ecology:brain_coral", {
	description = "Brain Coral",
	tiles = {"valc_brain_coral.png"},
	light_source = 4,
	groups = {cracky = 3, stone=1,},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("lib_ecology:dragon_eye", {
	description = "Dragon Eye",
	tiles = {"valc_dragon_eye.png"},
	light_source = 4,
	groups = {cracky = 3, stone=1,},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("lib_ecology:staghorn_coral", {
	description = "Staghorn Coral",
	drawtype = "plantlike",
	tiles = {"valc_staghorn_coral.png"},
	waving = false,
	sunlight_propagates = true,
	paramtype = "light",
	light_source = 2,
	walkable = false,
	groups = {cracky = 3, stone=1, attached_node=1, sea=1},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})
