
-- clear default mapgen biomes, decorations and ores
--minetest.clear_registered_biomes()
--minetest.clear_registered_decorations()
--minetest.clear_registered_ores()

--local path = minetest.get_modpath("ethereal")

--dofile(path .. "/ores.lua")

--spath = lib_ecology.path .. "/schematics"

local dpath = minetest.get_modpath("default") .. "/schematics/"

-- tree schematics
dofile(lib_ecology.path .. "/schematics/orange_tree.lua")
dofile(lib_ecology.path .. "/schematics/banana_tree.lua")
dofile(lib_ecology.path .. "/schematics/bamboo_tree.lua")
dofile(lib_ecology.path .. "/schematics/birch_tree.lua")
dofile(lib_ecology.path .. "/schematics/bush.lua")
dofile(lib_ecology.path .. "/schematics/waterlily.lua")

--= Biomes (Minetest 0.4.13 and above)

local add_biome = function(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)

	if p ~= 1 then return end

	minetest.register_biome({
		name = a,
		node_dust = b,
		node_top = c,
		depth_top = d,
		node_filler = e,
		depth_filler = f,
		node_stone = g,
		node_water_top = h,
		depth_water_top = i,
		node_water = j,
		node_river_water = k,
		y_min = l,
		y_max = m,
		heat_point = n,
		humidity_point = o,
	})
end

add_biome("underground", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
	-31000, -192, 50, 50, 1)

add_biome("mountain", nil, "default:snow", 1, "default:snowblock", 2,
	nil, nil, nil, nil, nil, 140, 31000, 50, 50, 1)

add_biome("desert", nil, "default:desert_sand", 1, "default:desert_sand", 3,
	"default:desert_stone", nil, nil, nil, nil, 3, 23, 35, 20, lib_ecology.desert)

add_biome("desert_ocean", nil, "default:sand", 1, "default:sand", 2,
	"default:desert_stone", nil, nil, nil, nil, -192, 3, 35, 20, lib_ecology.desert)

if lib_ecology.glacier == 1 then
	minetest.register_biome({
		name = "glacier",
		node_dust = "default:snowblock",
		node_top = "default:snowblock",
		depth_top = 1,
		node_filler = "default:snowblock",
		depth_filler = 3,
		node_stone = "default:ice",
		node_water_top = "default:ice",
		depth_water_top = 10,
		--node_water = "",
		node_river_water = "default:ice",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_min = -8,
		y_max = 31000,
		heat_point = 0,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "glacier_ocean",
		node_dust = "default:snowblock",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = -9,
		heat_point = 0,
		humidity_point = 50,
	})
end

add_biome("clearing", nil, "lib_ecology:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 71, 45, 65, 1) -- ADDED

add_biome("bamboo", nil, "lib_ecology:bamboo_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 71, 45, 75, lib_ecology.bamboo)

add_biome("bamboo_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 45, 75, lib_ecology.bamboo)

add_biome("mesa", nil, "bakedclay:orange", 1, "bakedclay:orange", 15,
	nil, nil, nil, nil, nil, 1, 71, 25, 28, lib_ecology.mesa)

add_biome("mesa_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 25, 28, lib_ecology.mesa)

add_biome("alpine", nil, "default:dirt_with_snow", 1, "default:dirt", 2,
	nil, nil, nil, nil, nil, 40, 140, 10, 40, lib_ecology.alpine)

add_biome("snowy", nil, "lib_ecology:cold_dirt", 1, "default:dirt", 2,
	nil, nil, nil, nil, nil, 4, 40, 10, 40, lib_ecology.snowy)

add_biome("frost", nil, "lib_ecology:crystal_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 71, 10, 40, lib_ecology.frost)

add_biome("frost_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 10, 40, lib_ecology.frost)

add_biome("grassy", nil, "lib_ecology:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 91, 13, 40, lib_ecology.grassy)

add_biome("grassy_ocean", nil, "defaut:sand", 2, "default:gravel", 1,
	nil, nil, nil, nil, nil, -31000, 3, 13, 40, lib_ecology.grassy)

add_biome("caves", nil, "default:desert_stone", 3, "lib_ecology:red_clay", 8,
	nil, nil, nil, nil, nil, 4, 41, 15, 25, lib_ecology.caves)

add_biome("grayness", nil, "lib_ecology:gray_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 2, 41, 15, 30, lib_ecology.grayness)

add_biome("grayness_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 15, 30, lib_ecology.grayness)

add_biome("grassytwo", nil, "lib_ecology:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 91, 15, 40, lib_ecology.grassytwo)

add_biome("grassytwo_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 15, 40, lib_ecology.grassytwo)

add_biome("prairie", nil, "lib_ecology:prairie_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 26, 20, 40, lib_ecology.prairie)

add_biome("prairie_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 20, 40, lib_ecology.prairie)

add_biome("jumble", nil, "lib_ecology:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 71, 25, 50, lib_ecology.jumble)

add_biome("jumble_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 25, 50, lib_ecology.jumble)

add_biome("junglee", nil, "lib_ecology:jungle_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 71, 30, 60, lib_ecology.junglee)

add_biome("junglee_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 30, 60, lib_ecology.junglee)

add_biome("grove", nil, "lib_ecology:grove_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 23, 45, 35, lib_ecology.grove)

add_biome("grove_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 45, 35, lib_ecology.grove)

add_biome("mushroom", nil, "lib_ecology:mushroom_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 50, 45, 55, lib_ecology.mushroom)

add_biome("mushroom_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 45, 55, lib_ecology.mushroom)

add_biome("sandstone", nil, "default:sandstone", 1, "default:sandstone", 1,
	"default:sandstone", nil, nil, nil, nil, 3, 23, 50, 20, lib_ecology.sandstone)

add_biome("sandstone_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 50, 20, lib_ecology.sandstone)

add_biome("quicksand", nil, "lib_ecology:quicksand2", 3, "default:gravel", 1,
	nil, nil, nil, nil, nil, 1, 1, 50, 38, lib_ecology.quicksand)

add_biome("plains", nil, "lib_ecology:dry_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 25, 65, 25, lib_ecology.plains)

add_biome("plains_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 2, 55, 25, lib_ecology.plains)

add_biome("savannah", nil, "default:dirt_with_dry_grass", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 3, 50, 55, 25, lib_ecology.savannah)

add_biome("savannah_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 1, 55, 25, lib_ecology.savannah)

add_biome("fiery", nil, ":ethereal:fiery_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 5, 20, 75, 10, lib_ecology.fiery)

add_biome("fiery_ocean", nil, "default:sand", 1, "default:sand", 2,
	nil, nil, nil, nil, nil, -192, 4, 75, 10, lib_ecology.fiery)

add_biome("sandclay", nil, "default:sand", 3, "default:clay", 2,
	nil, nil, nil, nil, nil, 1, 11, 65, 2, lib_ecology.sandclay)

add_biome("swamp", nil, "lib_ecology:green_dirt", 1, "default:dirt", 3,
	nil, nil, nil, nil, nil, 1, 7, 80, 90, lib_ecology.swamp)

add_biome("swamp_ocean", nil, "default:sand", 2, "default:clay", 2,
	nil, nil, nil, nil, nil, -192, 1, 80, 90, lib_ecology.swamp)

--= schematic decorations

local add_schem = function(a, b, c, d, e, f, g)

	if g ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		schematic = f,
		flags = "place_center_x, place_center_z",
	})
end

-- redwood tree
add_schem({"bakedclay:orange"}, 0.0025, {"mesa"}, 1, 100, lib_ecology.path .. "/schematics/redwood.mts", lib_ecology.mesa)

-- banana tree
add_schem({"lib_ecology:grove_dirt"}, 0.015, {"grove"}, 1, 100, lib_ecology.bananatree, lib_ecology.grove)

-- healing tree
add_schem({"default:dirt_with_snow"}, 0.01, {"alpine"}, 120, 140, lib_ecology.path .. "/schematics/yellowtree.mts", lib_ecology.alpine)

-- crystal frost tree
add_schem({"lib_ecology:crystal_dirt"}, 0.01, {"frost"}, 1, 100, lib_ecology.path .. "/schematics/frosttrees.mts", lib_ecology.frost)

-- giant mushroom
add_schem({"lib_ecology:mushroom_dirt"}, 0.02, {"mushroom"}, 1, 100, lib_ecology.path .. "/schematics/mushroomone.mts", lib_ecology.mushroom)

-- -- -- small cinder cone
-- -- add_schem({"lib_ecology:fiery_dirt"}, 0.01, {"fiery"}, 1, 100, lib_ecology.path .. "/schematics/volcanom.mts", lib_ecology.fiery)

-- -- -- large lava crater
-- -- add_schem({"lib_ecology:fiery_dirt"}, 0.01, {"fiery"}, 1, 100, lib_ecology.path .. "/schematics/volcanol.mts", lib_ecology.fiery)

-- small lava crater
add_schem({":ethereal:fiery_dirt"}, 0.01, {"fiery"}, 1, 100, lib_ecology.path .. "/schematics/volcanom.mts", lib_ecology.fiery)

-- large lava crater
add_schem({":ethereal:fiery_dirt"}, 0.01, {"fiery"}, 1, 100, lib_ecology.path .. "/schematics/volcanol.mts", lib_ecology.fiery)

-- default jungle tree
add_schem({"lib_ecology:jungle_dirt"}, 0.08, {"junglee"}, 1, 100, lib_ecology.path .. "/schematics/jungle_tree.mts", lib_ecology.junglee)

-- willow tree
add_schem({"lib_ecology:gray_dirt"}, 0.02, {"grayness"}, 1, 100, lib_ecology.path .. "/schematics/willow.mts", lib_ecology.grayness)

-- pine tree (default for lower elevation and lib_ecology for higher)
add_schem({"lib_ecology:cold_dirt"}, 0.025, {"snowy"}, 10, 40, lib_ecology.path .. "/schematics/pine_tree.mts", lib_ecology.snowy)
add_schem({"default:dirt_with_snow"}, 0.025, {"alpine"}, 40, 140, lib_ecology.path .. "/schematics/pinetree.mts", lib_ecology.alpine)

-- default apple tree
add_schem({"lib_ecology:green_dirt"}, 0.02, {"jumble"}, 1, 100, lib_ecology.path .. "/schematics/apple_tree.mts", lib_ecology.grassy)
add_schem({"lib_ecology:green_dirt"}, 0.03, {"grassy"}, 1, 100, lib_ecology.path .. "/schematics/apple_tree.mts", lib_ecology.grassy)

-- big old tree
add_schem({"lib_ecology:green_dirt"}, 0.001, {"jumble"}, 1, 100, lib_ecology.path .. "/schematics/bigtree.mts", lib_ecology.jumble)

-- aspen tree
add_schem({"lib_ecology:green_dirt"}, 0.02, {"grassytwo"}, 1, 50, lib_ecology.path .. "/schematics/aspen_tree.mts", lib_ecology.jumble)

-- birch tree
add_schem({"lib_ecology:green_dirt"}, 0.02, {"grassytwo"}, 50, 100, lib_ecology.birchtree, lib_ecology.grassytwo)

-- orange tree
add_schem({"lib_ecology:prairie_dirt"}, 0.01, {"prairie"}, 1, 100, lib_ecology.orangetree, lib_ecology.prairie)

-- default acacia tree
add_schem({"default:dirt_with_dry_grass"}, 0.004, {"savannah"}, 1, 100, lib_ecology.path .. "/schematics/acacia_tree.mts", lib_ecology.savannah)

-- large cactus (by Paramat)
if lib_ecology.desert == 1 then
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 80,
	noise_params = {
		offset = -0.0005,
		scale = 0.0015,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_min = 5,
	y_max = 31000,
	schematic = dpath.."large_cactus.mts",
	flags = "place_center_x", --, place_center_z",
	rotation = "random",
})
end

-- palm tree
add_schem({"default:sand"}, 0.0025, {"desert_ocean"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.desert)
add_schem({"default:sand"}, 0.0025, {"plains_ocean"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.plains)
add_schem({"default:sand"}, 0.0025, {"sandclay"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.sandclay)
add_schem({"default:sand"}, 0.0025, {"sandstone_ocean"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.sandstone)
add_schem({"default:sand"}, 0.0025, {"mesa_ocean"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.mesa)
add_schem({"default:sand"}, 0.0025, {"grove_ocean"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.grove)
add_schem({"default:sand"}, 0.0025, {"grassy_ocean"}, 1, 1, lib_ecology.path .. "/schematics/palmtree.mts", lib_ecology.grassy)

-- bamboo tree
add_schem({"lib_ecology:bamboo_dirt"}, 0.025, {"bamboo"}, 1, 100, lib_ecology.bambootree, lib_ecology.bamboo)

-- bush
add_schem({"lib_ecology:bamboo_dirt"}, 0.08, {"bamboo"}, 1, 100, lib_ecology.bush, lib_ecology.bamboo)

-- vine tree
add_schem({"lib_ecology:green_dirt"}, 0.02, {"swamp"}, 1, 100, lib_ecology.path .. "/schematics/vinetree.mts", lib_ecology.swamp)

--= simple decorations

local add_node = function(a, b, c, d, e, f, g, h, i, j)

	if j ~= 1 then return end

	minetest.register_decoration({
		deco_type = "simple",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		decoration = f,
		height_max = g,
		spawn_by = h,
		num_spawn_by = i,
	})
end

-- scorched tree
add_node({"lib_ecology:dry_dirt"}, 0.006, {"plains"}, 1, 100, {"lib_ecology:scorched_tree"}, 6, nil, nil, lib_ecology.plains)

-- dry shrub
add_node({"lib_ecology:dry_dirt"}, 0.015, {"plains"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.plains)
add_node({"default:sand"}, 0.015, {"grassy_ocean"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.grassy)
add_node({"default:desert_sand"}, 0.015, {"desert"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.desert)
add_node({"default:sandstone"}, 0.015, {"sandstone"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.sandstone)
add_node({"bakedclay:red", "bakedclay:orange"}, 0.015, {"mesa"}, 1, 100, {"default:dry_shrub"}, nil, nil, nil, lib_ecology.mesa)

-- dry grass
add_node({"default:dirt_with_dry_grass"}, 0.25, {"savannah"}, 1, 100, {"default:dry_grass_2",
	"default:dry_grass_3", "default:dry_grass_4", "default:dry_grass_5"}, nil, nil, nil, lib_ecology.savannah)

-- flowers & strawberry
add_node({"lib_ecology:green_dirt"}, 0.025, {"grassy"}, 1, 100, {"flowers:dandelion_white",
	"flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip",
	"flowers:viola", "lib_ecology:strawberry_7"}, nil, nil, nil, lib_ecology.grassy)
add_node({"lib_ecology:green_dirt"}, 0.025, {"grassytwo"}, 1, 100, {"flowers:dandelion_white",
	"flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip",
	"flowers:viola", "lib_ecology:strawberry_7"}, nil, nil, nil, lib_ecology.grassytwo)

-- prairie flowers & strawberry
add_node({"lib_ecology:prairie_dirt"}, 0.035, {"prairie"}, 1, 100, {"flowers:dandelion_white",
	"flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip",
	"flowers:viola", "lib_ecology:strawberry_7"}, nil, nil, nil, lib_ecology.prairie)

-- crystal spike & crystal grass
add_node({"lib_ecology:crystal_dirt"}, 0.02, {"frost"}, 1, 100, {"lib_ecology:crystal_spike",
	"lib_ecology:crystalgrass"}, nil, nil, nil, lib_ecology.frost)

-- red shrub
add_node({"lib_ecology:fiery_dirt"}, 0.10, {"fiery"}, 1, 100, {"lib_ecology:dry_shrub"}, nil, nil, nil, lib_ecology.fiery)

-- fire flower
--add_node({"lib_ecology:fiery_dirt"}, 0.02, {"fiery"}, 1, 100, {"lib_ecology:fire_flower"}, nil, nil, nil, lib_ecology.fiery)

-- snowy grass
add_node({"lib_ecology:gray_dirt"}, 0.05, {"grayness"}, 1, 100, {"lib_ecology:snowygrass"}, nil, nil, nil, lib_ecology.grayness)
add_node({"lib_ecology:cold_dirt"}, 0.05, {"snowy"}, 1, 100, {"lib_ecology:snowygrass"}, nil, nil, nil, lib_ecology.snowy)

-- cactus
add_node({"default:sandstone"}, 0.0025, {"sandstone"}, 1, 100, {"default:cactus"}, 3, nil, nil, lib_ecology.sandstone)
add_node({"default:desert_sand"}, 0.005, {"desert"}, 1, 100, {"default:cactus"}, 4, nil, nil, lib_ecology.desert)

-- wild red mushroom
add_node({"lib_ecology:mushroom_dirt"}, 0.01, {"mushroom"}, 1, 100, {"flowers:mushroom_fertile_red"}, nil, nil, nil, lib_ecology.mushroom)

local list = {
	{"junglee", "lib_ecology:jungle_dirt", lib_ecology.junglee},
	{"grassy", "lib_ecology:green_dirt", lib_ecology.grassy},
	{"grassytwo", "lib_ecology:green_dirt", lib_ecology.grassytwo},
	{"prairie", "lib_ecology:prairie_dirt", lib_ecology.prairie},
	{"mushroom", "lib_ecology:mushroom_dirt", lib_ecology.mushroom},
	{"swamp", "lib_ecology:green_dirt", lib_ecology.swamp},
}

-- wild red and brown mushrooms
for _, row in pairs(list) do

if row[3] == 1 then
minetest.register_decoration({
	deco_type = "simple",
	place_on = {row[2]},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.009,
		spread = {x = 200, y = 200, z = 200},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {row[1]},
	y_min = 1,
	y_max = 120,
	decoration = {"flowers:mushroom_brown", "flowers:mushroom_red"},
})
end

end

-- jungle grass
add_node({"lib_ecology:jungle_dirt"}, 0.10, {"junglee"}, 1, 100, {"default:junglegrass"}, nil, nil, nil, lib_ecology.junglee)
add_node({"lib_ecology:green_dirt"}, 0.15, {"jumble"}, 1, 100, {"default:junglegrass"}, nil, nil, nil, lib_ecology.jumble)
add_node({"lib_ecology:green_dirt"}, 0.25, {"swamp"}, 1, 100, {"default:junglegrass"}, nil, nil, nil, lib_ecology.swamp)

-- grass
add_node({"lib_ecology:green_dirt"}, 0.35, {"grassy"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.grassy)
add_node({"lib_ecology:green_dirt"}, 0.35, {"grassytwo"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.grassytwo)
add_node({"lib_ecology:green_dirt"}, 0.35, {"jumble"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.jumble)
add_node({"lib_ecology:jungle_dirt"}, 0.35, {"junglee"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.junglee)
add_node({"lib_ecology:prairie_dirt"}, 0.35, {"prairie"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.prairie)
add_node({"lib_ecology:grove_dirt"}, 0.35, {"grove"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.grove)
add_node({"lib_ecology:bamboo_dirt"}, 0.35, {"bamboo"}, 1, 100, {"default:grass_2", "default:grass_3",
	"default:grass_4", "default:grass_5"}, nil, nil, nil, lib_ecology.bamboo)
add_node({"lib_ecology:green_dirt"}, 0.35, {"clearing", "swamp"}, 1, 100, {"default:grass_3",
	"default:grass_4"}, nil, nil, nil, 1)

-- grass on sand
add_node({"default:sand"}, 0.25, {"sandclay"}, 3, 4, {"default:grass_2", "default:grass_3"}, nil, nil, nil, lib_ecology.sandclay)

-- ferns
add_node({"lib_ecology:grove_dirt"}, 0.2, {"grove"}, 1, 100, {"lib_ecology:fern"}, nil, nil, nil, lib_ecology.grove)
add_node({"lib_ecology:green_dirt"}, 0.1, {"swamp"}, 1, 100, {"lib_ecology:fern"}, nil, nil, nil, lib_ecology.swamp)

-- snow
add_node({"lib_ecology:cold_dirt"}, 0.8, {"snowy"}, 4, 40, {"default:snow"}, nil, nil, nil, lib_ecology.snowy)
add_node({"default:dirt_with_snow"}, 0.8, {"alpine"}, 40, 140, {"default:snow"}, nil, nil, nil, lib_ecology.alpine)

-- wild onion
add_node({"lib_ecology:green_dirt"}, 0.25, {"grassy"}, 1, 100, {"lib_ecology:onion_4"}, nil, nil, nil, lib_ecology.grassy)
add_node({"lib_ecology:green_dirt"}, 0.25, {"grassytwo"}, 1, 100, {"lib_ecology:onion_4"}, nil, nil, nil, lib_ecology.grassytwo)
add_node({"lib_ecology:green_dirt"}, 0.25, {"jumble"}, 1, 100, {"lib_ecology:onion_4"}, nil, nil, nil, lib_ecology.jumble)
add_node({"lib_ecology:prairie_dirt"}, 0.25, {"prairie"}, 1, 100, {"lib_ecology:onion_4"}, nil, nil, nil, lib_ecology.prairie)

-- papyrus
add_node({"lib_ecology:green_dirt"}, 0.1, {"grassy"}, 1, 1, {"default:papyrus"}, 4, "default:water_source", 1, lib_ecology.grassy)
add_node({"lib_ecology:jungle_dirt"}, 0.1, {"junglee"}, 1, 1, {"default:papyrus"}, 4, "default:water_source", 1, lib_ecology.junglee)
add_node({"lib_ecology:green_dirt"}, 0.1, {"swamp"}, 1, 1, {"default:papyrus"}, 4, "default:water_source", 1, lib_ecology.swamp)

--= Farming Redo plants

if farming and farming.mod and farming.mod == "redo" then

print ("[MOD] lib_ecology - Farming Redo detected and in use")

-- potato
add_node({"lib_ecology:jungle_dirt"}, 0.035, {"junglee"}, 1, 100, {"farming:potato_3"}, nil, nil, nil, lib_ecology.junglee)

-- carrot, cucumber, potato, tomato, corn, coffee, raspberry, rhubarb
add_node({"lib_ecology:green_dirt"}, 0.05, {"grassytwo"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
	"farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
	"farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.grassytwo)
add_node({"lib_ecology:green_dirt"}, 0.05, {"grassy"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
	"farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
	"farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.grassy)
add_node({"lib_ecology:green_dirt"}, 0.05, {"jumble"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
	"farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
	"farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.jumble)
add_node({"lib_ecology:prairie_dirt"}, 0.05, {"prairie"}, 1, 100, {"farming:carrot_7", "farming:cucumber_4",
	"farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5",
	"farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"}, nil, nil, nil, lib_ecology.prairie)

-- melon and pumpkin
add_node({"lib_ecology:jungle_dirt"}, 0.015, {"junglee"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.junglee)
add_node({"lib_ecology:green_dirt"}, 0.015, {"grassy"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.grassy)
add_node({"lib_ecology:green_dirt"}, 0.015, {"grassytwo"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.grassytwo)
add_node({"lib_ecology:green_dirt"}, 0.015, {"jumble"}, 1, 1, {"farming:melon_8", "farming:pumpkin_8"}, nil, "default:water_source", 1, lib_ecology.jumble)

-- green beans
add_node({"lib_ecology:green_dirt"}, 0.035, {"grassytwo"}, 1, 100, {"farming:beanbush"}, nil, nil, nil, lib_ecology.grassytwo)

-- grape bushel
add_node({"lib_ecology:green_dirt"}, 0.025, {"grassytwo"}, 1, 100, {"farming:grapebush"}, nil, nil, nil, lib_ecology.grassytwo)
add_node({"lib_ecology:green_dirt"}, 0.025, {"grassy"}, 1, 100, {"farming:grapebush"}, nil, nil, nil, lib_ecology.grassy)
add_node({"lib_ecology:prairie_dirt"}, 0.025, {"prairie"}, 1, 100, {"farming:grapebush"}, nil, nil, nil, lib_ecology.prairie)

end

-- place waterlily in beach areas
local list = {
	{"desert_ocean", lib_ecology.desert},
	{"plains_ocean", lib_ecology.plains},
	{"sandclay", lib_ecology.sandclay},
	{"sandstone_ocean", lib_ecology.sandstone},
	{"mesa_ocean", lib_ecology.mesa},
	{"grove_ocean", lib_ecology.grove},
	{"grassy_ocean", lib_ecology.grassy},
	{"swamp_ocean", lib_ecology.swamp},
}

for _, row in pairs(list) do

	if row[2] == 1 then

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {row[1]},
		y_min = 0,
		y_max = 0,
		schematic = lib_ecology.waterlily,
		rotation = "random",
	})

	end

end

-- Generate Illumishroom in caves next to coal
minetest.register_on_generated(function(minp, maxp)

	if minp.y > -30 or maxp.y < -3000 then
		return
	end

	local bpos
	local coal = minetest.find_nodes_in_area_under_air(minp, maxp, "default:stone_with_coal")

	for n = 1, #coal do

		bpos = {x = coal[n].x, y = coal[n].y + 1, z = coal[n].z }

		if math.random(1, 2) == 1 then

			if bpos.y > -3000 and bpos.y < -2000 then
				minetest.swap_node(bpos, {name = "lib_ecology:illumishroom3"})

			elseif bpos.y > -2000 and bpos.y < -1000 then
				minetest.swap_node(bpos, {name = "lib_ecology:illumishroom2"})

			elseif bpos.y > -1000 and bpos.y < -30 then
				minetest.swap_node(bpos, {name = "lib_ecology:illumishroom"})
			end
		end
	end
end)

-- is baked clay mod active? add new flowers if so
if minetest.get_modpath("bakedclay") then

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:prairie_grass", "lib_ecology:green_dirt",
		"lib_ecology:grove_dirt"
	},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.004,
		spread = {x = 100, y = 100, z = 100},
		seed = 7133,
		octaves = 3,
		persist = 0.6
	},
	y_min = 10,
	y_max = 90,
	decoration = "bakedclay:delphinium",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"lib_ecology:prairie_grass", "lib_ecology:green_dirt",
		"lib_ecology:grove_dirt", "lib_ecology:bamboo_dirt"
	},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.004,
		spread = {x = 100, y = 100, z = 100},
		seed = 7134,
		octaves = 3,
		persist = 0.6
	},
	y_min = 15,
	y_max = 90,
	decoration = "bakedclay:thistle",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lib_ecology:jungle_dirt"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 7135,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 90,
	decoration = "bakedclay:lazarus",
	spawn_by = "default:jungletree",
	num_spawn_by = 1,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"lib_ecology:green_dirt", "default:sand"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.009,
		spread = {x = 100, y = 100, z = 100},
		seed = 7136,
		octaves = 3,
		persist = 0.6
	},
	y_min = 1,
	y_max = 15,
	decoration = "bakedclay:mannagrass",
	spawn_by = "group:water",
	num_spawn_by = 1,
})

end
