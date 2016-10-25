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

		-- /build sign_yard
		elseif structureName == "sign_yard" then
			minetest.set_node({x=pos.x    , y=pos.y, z=pos.z }, {name="default:ice"})
			minetest.set_node({x=pos.x + 1, y=pos.y, z=pos.z }, {name="default:ice"})

			minetest.set_node({x=pos.x + 2, y=pos.y, z=pos.z }, {name="signs:sign_yard"})
			local meta = minetest.get_meta({x=pos.x + 2, y=pos.y, z=pos.z })
			meta:set_string("infotext", "My custom text here")
			meta:set_string("text", "My custom text here")
			signs_lib.update_sign({x=pos.x + 2, y=pos.y, z=pos.z })

			minetest.set_node({x=pos.x + 3, y=pos.y, z=pos.z }, {name="default:ice"})
			minetest.set_node({x=pos.x + 4, y=pos.y, z=pos.z }, {name="default:ice"})

		-- /build switch
		elseif structureName == "switch" then
			minetest.set_node({x=pos.x + 2, y=pos.y, z=pos.z }, {name="mesecons_switch:mesecon_switch_off"})
			minetest.chat_send_all("mesecons_switch:mesecon_switch_off; x=" .. pos.x + 2 .. " y=" .. pos.y .. " z=" .. pos.z)

		else
			return false, "No structure builded"
		end

		return true, fmt:format(args, pos.x, pos.y, pos.z)
	end
})


-- Action on punch node

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if node.name == "default:brick" then
		local puncher_name = puncher:get_player_name()
		local mypos = minetest.pos_to_string(pos) -- Sets variable to (X,Y,Z.. where Y is up) 
		minetest.chat_send_all(puncher_name .." is hitting me. I'm located at ".. mypos)		
	end 
	if node.name == "default:desert_stonebrick" then
		local puncher_name = puncher:get_player_name()
		minetest.chat_send_player(puncher_name, "That's got to hurt!!")
	end
	if node.name == "mesecons_switch:mesecon_switch_off" then
		local puncher_name = puncher:get_player_name()
		local mypos = minetest.pos_to_string(pos)
		minetest.chat_send_all(puncher_name .." switch: ".. mypos)
	end
end)

-- Use switch to on/off and use pick wood to change the value
minetest.register_tool("nekromod:pick_wood", {
    	description = "Wooden Pickaxe Weapon",
    	inventory_image = "default_tool_woodpick.png",
    	tool_capabilities = {
    	},

	-- Left button mouse
	on_use = function(itemstack, user, pointed_thing)
		local pos = pointed_thing.under
		if not pos then
			return itemstack
		end

		local meta = minetest.get_meta(pos)

		local nodeName = minetest.get_node(pos).name

		minetest.chat_send_all("on_use; x=" .. pos.x .. " y=" .. pos.y .. " z=" .. pos.z .. " name=" .. nodeName)

		if nodeName  == "mesecons_switch:mesecon_switch_on" then
			minetest.set_node({x=pos.x, y=pos.y, z=pos.z }, {name="mesecons_switch:mesecon_switch_off"})
		else
			minetest.set_node({x=pos.x, y=pos.y, z=pos.z }, {name="mesecons_switch:mesecon_switch_on"})
		end

		return itemstack
	end,
	
	-- Right button mouse
    	on_place = function(itemstack, user, pointed_thing)
		local pos = pointed_thing
		if not pos then
			return itemstack
		end

		 minetest.chat_send_all("on_place;" )

        	return itemstack
    	end,
})

