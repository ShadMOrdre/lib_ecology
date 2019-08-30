local function read_csv(separator, path)
	local file = io.open(path, "r")
	local t = {}
	for line in file:lines() do
		if line:sub(1,1) ~= "#" and line:find("[^%"..separator.."% ]") then
			table.insert(t, line:split(separator, true))
		end
	end
	return t
end

return read_csv
