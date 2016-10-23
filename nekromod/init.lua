-- whereis <player name>
-- Display player location

minetest.register_chatcommand("whereis", {
	params = "<player name>",
	description = "Tell the location of <player>",
	func = function(user, args)
		if args == "" then
			return false, "Player name required."
		end
		local player = minetest.get_player_by_name(args)
		if not player then
			return false, "There is no player named '"..args.."'"
		end
		local fmt = "Player %s is at (%.2f,%.2f,%.2f)"
		
		local pos = player:getpos()
		return true, fmt:format(args, pos.x, pos.y, pos.z)
	end
})


-- myinfo
-- Display all player informations 

minetest.register_chatcommand("myinfo", {
	params = "",
	description = "Display my informations",
	func = function(user, param)
		local player = minetest.get_player_by_name(user)
		if not player then
			return false, "Player not found"
		end

		return true, "My information: " .. user
	end
})


-- build <player> <structure>
-- Build a structure

minetest.register_chatcommand("build", {
	params = "<structure name> <structure param>",
	description = "Build a structure with parameters",
	func = function(user, args)

		if args == "" then
			return false, "Parameters required."
		end

		local structureName, structureParam = args:match("^(%S+)%s(%S+)$")

		if not structureParam then
			return false, "Structure parameters required"
		end

		local player = minetest.get_player_by_name(user)
		if not player then
			return false, "Player not found"
		end

		local fmt = "Player %s is at (%.2f,%.2f,%.2f)"

		local pos = player:getpos()
		
		-- /build pillar 5
		if structureName == "pillar" then
			local heightPillar = tonumber(structureParam)
			for i=0,heightPillar do
				minetest.set_node({x=pos.x + 2, y=pos.y + i, z=pos.z }, {name="default:ice"})
			end
		else
			return false, "No structure builded"
		end

		return true, fmt:format(args, pos.x, pos.y, pos.z)
	end
})