
local S = lib_ecology.intllib

-- Raw Fish (Thanks to Altairas for her Fish image on DeviantArt)
minetest.register_craftitem("lib_ecology:fish_raw", {
	description = S("Raw Fish"),
	inventory_image = "fish_raw.png",
	wield_image = "fish_raw.png",
	on_use = minetest.item_eat(2),
})

-- Cooked Fish
minetest.register_craftitem("lib_ecology:fish_cooked", {
	description = S("Cooked Fish"),
	inventory_image = "fish_cooked.png",
	wield_image = "fish_cooked.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	output = "lib_ecology:fish_cooked",
	recipe = "lib_ecology:fish_raw",
	cooktime = 2,
})

-- Sashimi (Thanks to Natalia Grosner for letting me use the sashimi image)
minetest.register_craftitem("lib_ecology:sashimi", {
	description = S("Sashimi"),
	inventory_image = "sashimi.png",
	wield_image = "sashimi.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = "lib_ecology:sashimi 2",
	recipe = {
		{'lib_ecology:seaweed','lib_ecology:fish_raw','lib_ecology:seaweed'},
	}
})

-- Worm
minetest.register_craftitem("lib_ecology:worm", {
	description = S("Worm"),
	inventory_image = "worm.png",
	wield_image = "worm.png",
})

-- Fishing Rod
minetest.register_craftitem("lib_ecology:fishing_rod", {
	description = S("Fishing Rod"),
	inventory_image = "fishing_rod.png",
	wield_image = "fishing_rod.png",
})

minetest.register_craft({
	output = "lib_ecology:fishing_rod",
	recipe = {
			{"","","default:stick"},
			{"", "default:stick", "farming:string"},
			{"default:stick", "", "farming:string"},
		}
})

-- Sift through 2 Dirt Blocks to find Worm
minetest.register_craft({
	output = "lib_ecology:worm",
	recipe = {
		{"default:dirt","default:dirt"},
	}
})

-- default lib_ecology fish
local fish = {
	{"lib_ecology:fish_raw"},
}

-- xanadu server additional fish
if minetest.get_modpath("xanadu") then
	fish[2] = {"mobs:clownfish_raw"}
	fish[3] = {"mobs:bluefish_raw"}
end

-- Fishing Rod (Baited)
minetest.register_craftitem("lib_ecology:fishing_rod_baited", {
	description = S("Baited Fishing Rod"),
	inventory_image = "fishing_rod_baited.png",
	wield_image = "fishing_rod_wield.png",
	stack_max = 1,
	liquids_pointable = true,

	on_use = function (itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then
			return
		end
		
		local node = minetest.get_node(pointed_thing.under).name

		if (node == "default:water_source"
		or node == "default:river_water_source")
		and math.random(1, 100) < 5 then

			local type = fish[math.random(1, #fish)][1]
			local inv = user:get_inventory()

			if inv:room_for_item("main", {name = type}) then

				inv:add_item("main", {name = type})

				return ItemStack("lib_ecology:fishing_rod")
			else
				minetest.chat_send_player(user:get_player_name(),
					S("Inventory full, Fish Got Away!"))
			end
		end
	end,
})

minetest.register_craft({
	type = "shapeless",
	output = "lib_ecology:fishing_rod_baited",
	recipe = {"lib_ecology:fishing_rod", "lib_ecology:worm"},
})
