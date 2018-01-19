
--= Register Biome Decoration Using Plants Mega Pack Lite

--= Desert Biome

-- Cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sandstone"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"desert", "sandstone"},
	decoration = {
		"xanadu:cactus_echinocereus", "xanadu:cactus_matucana",
		"xanadu:cactus_baseball", "xanadu:cactus_golden"
	},
})

-- Desert Plants
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sandstone", "default:sand"},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {"desert", "sandstone"},
	decoration = {
		"xanadu:desert_kangaroo", "xanadu:desert_brittle",
		"xanadu:desert_ocotillo", "xanadu:desert_whitesage"
	},
})

--=  Prairie Biome

-- Grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lib_ecology:prairie_dirt", "lib_ecology:green_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo"},
	decoration = {
		"xanadu:grass_prairie", "xanadu:grass_cord",
		"xanadu:grass_wheatgrass", "xanadu:desert_whitesage"
	},
})

-- Flowers
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:prairie_grass", "lib_ecology:green_dirt",
		"lib_ecology:grove_dirt", "lib_ecology:bamboo_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "bamboo"},
	decoration = {
		"xanadu:flower_jacobsladder", "xanadu:flower_thistle",
		"xanadu:flower_wildcarrot"
	},
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:prairie_grass", "lib_ecology:green_dirt",
		"lib_ecology:grove_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "grove"},
	decoration = {
		"xanadu:flower_delphinium", "xanadu:flower_celosia",
		"xanadu:flower_daisy", "xanadu:flower_bluerose"
	},
})

-- Shrubs
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:prairie_grass", "lib_ecology:green_dirt",
		"lib_ecology:grove_dirt", "lib_ecology:jungle_grass",
		"lib_ecology:gray_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {
		"prairie", "grassy", "grassytwo", "grove", "junglee",
		"grayness", "jumble"
	},
	decoration = {"xanadu:shrub_kerria", "xanadu:shrub_spicebush"},
})

--= Jungle Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lib_ecology:jungle_dirt", "lib_ecology:green_dirt"},
	sidelen = 16,
	fill_ratio = 0.007,
	biomes = {"junglee", "jumble"},
	decoration = {
		"xanadu:rainforest_guzmania", "xanadu:rainforest_devil",
		"xanadu:rainforest_lazarus", "xanadu:rainforest_lollipop",
		"xanadu:mushroom_woolly"
	},
})

--= Cold Biomes

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"default:dirt_with_snow", "lib_ecology:cold_dirt",
		"lib_ecology:gray_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"snowy", "alpine", "grayness"},
	decoration = {
		"xanadu:mountain_edelweiss", "xanadu:mountain_armeria",
		"xanadu:mountain_bellflower", "xanadu:mountain_willowherb",
		"xanadu:mountain_bistort"
	},

})

--= Mushroom Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lib_ecology:mushroom_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"mushroom"},
	decoration = {
		"xanadu:mushroom_powderpuff", "xanadu:mushroom_chanterelle",
		"xanadu:mushroom_parasol"
	},
})

--= Lakeside

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand", "lib_ecology:green_dirt"},
	sidelen = 16,
	fill_ratio = 0.015,
	biomes = {"sandclay", "grassy_ocean", "grassy", "grassytwo", "jumble", "swamp"},
	decoration = {
		"xanadu:wetlands_cattails", "xanadu:wetlands_pickerel",
		"xanadu:wetlands_mannagrass", "xanadu:wetlands_turtle"
	},
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

--= Harsh Biomes

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:mushroom_dirt", "lib_ecology:green_dirt",
		"lib_ecology:gray_dirt", "lib_ecology:cold_dirt",
		"lib_ecology:dirt_with_snow", "lib_ecology:jungle_dirt",
		"lib_ecology:prairie_dirt", "lib_ecology:grove_dirt",
		"lib_ecology:dry_dirt", "lib_ecology:fiery_dirt", "default:sand",
		"default:desert_sand", "xanadu:red", "lib_ecology:bamboo_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {
		"mushroom", "prairie", "grayness", "plains", "desert",
		"junglee", "grassy", "grassytwo", "jumble", "snowy", "alpine",
		"fiery", "mesa", "bamboo"
	},
	decoration = {"xanadu:spooky_thornbush", "xanadu:spooky_baneberry"},
})

--= Poppy's growing in Clearing Biome in memory of RealBadAngel

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:green_dirt",
	},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {"clearing"},
	decoration = {"xanadu:poppy"},
})
