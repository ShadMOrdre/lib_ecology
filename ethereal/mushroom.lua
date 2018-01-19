
local S = lib_ecology.intllib

-- mushroom soup (Heals 1 heart)
minetest.register_craftitem("lib_ecology:mushroom_soup", {
	description = S("Mushroom Soup"),
	inventory_image = "mushroom_soup.png",
	on_use = minetest.item_eat(5, "lib_ecology:bowl"),
})

minetest.register_craft({
	output = "lib_ecology:mushroom_soup",
	recipe = {
		{"flowers:mushroom_brown"},
		{"flowers:mushroom_brown"},
		{"lib_ecology:bowl"},
	}
})

-- 4x red mushrooms make mushroom block
minetest.register_craft({
	output = "lib_ecology:mushroom",
	recipe = {
		{"flowers:mushroom_red", "flowers:mushroom_red"},
		{"flowers:mushroom_red", "flowers:mushroom_red"},
	}
})