
-- Schematics Library

lib_ecology.schematics = {}
lib_ecology.schematics.ver_maj = 0
lib_ecology.schematics.ver_min = 0
lib_ecology.schematics.ver_rev = 1

	--nodes = {},
local schem_list = {
	name = "",
	def = {}
}


lib_ecology.schematics.insert = function(name, def)
	schem_list[name] = def
end

lib_ecology.schematics.select = function(name)
	return schem_list[name]
end


