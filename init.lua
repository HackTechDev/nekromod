-- Database

sqlite3 = require("lsqlite3")

databaseName = "mt_gandi.sqlite3"

function initDatabase()
    local db = sqlite3.open(databaseName)

    db:exec[[
      CREATE TABLE server (id INTEGER PRIMARY KEY AUTOINCREMENT,  
                         hostname CHAR(32),
                         ipv4 CHAR(32),
                         ipv6 CHAR(32),
			 posx INTEGER,
			 posy INTEGER,
			 posz INTEGER
                        );

      CREATE TABLE switch (id INTEGER PRIMARY KEY AUTOINCREMENT,  

                         hostname CHAR(32),

			 s1x INTEGER,
			 s1y INTEGER,
			 s1z INTEGER,
			 s1  INTEGER,
			 s2x INTEGER,
			 s2y INTEGER,
			 s2z INTEGER,
			 s2  INTEGER,
			 s3x INTEGER,
		 	 s3y INTEGER,
		         s3z INTEGER,
			 s3  INTEGER,
			 s4x INTEGER,
			 s4y INTEGER,
			 s4z INTEGER,
			 s4  INTEGER,
			 s5x INTEGER,
		 	 s5y INTEGER,
			 s5z INTEGER,
			 s5  INTEGER,

			 s6x INTEGER,
			 s6y INTEGER,
			 s6z INTEGER,
			 s6  INTEGER,
			 s7x INTEGER,
			 s7y INTEGER,
			 s7z INTEGER,
			 s7  INTEGER,
			 s8x INTEGER,
			 s8y INTEGER,
			 s8z INTEGER,
			 s8  INTEGER,
			 s9x INTEGER,
			 s9y INTEGER,
			 s9z INTEGER,
			 s9  INTEGER,
			 s10x INTEGER,
			 s10y INTEGER,
			 s10z INTEGER,
			 s10  INTEGER,

		 	 s11x INTEGER,
			 s11y INTEGER,
			 s11z INTEGER,
			 s11  INTEGER,
			 s12x INTEGER,
			 s12y INTEGER,
			 s12z INTEGER,
			 s12  INTEGER,
		 	 s13x INTEGER,
			 s13y INTEGER,
			 s13z INTEGER,
			 s13  INTEGER,
			 s14x INTEGER,
			 s14y INTEGER,
			 s14z INTEGER,
			 s14  INTEGER,
			 s15x INTEGER,
			 s15y INTEGER,
			 s15z INTEGER,
			 s15  INTEGER

                        );

    ]]

    db:close()
end


-- Switch CRUD method
function insertSwitch(hostname, s1x, s1y, s1z, s1,   
				s2x, s2y, s2z, s2,   
				s3x, s3y, s3z, s3,   
				s4x, s4y, s4z, s4,   
				s5x, s5y, s5z, s5)

    local db = sqlite3.open(databaseName)
    local stmt = db:prepare[[ 	
				INSERT INTO switch VALUES (null, :hostname,  	:s1x, :s1y, :s1z, :s1,   
										:s2x, :s2y, :s2z, :s2,   
										:s3x, :s3y, :s3z, :s3, 
										:s4x, :s4y, :s4z, :s4,   
										:s5x, :s5y, :s5z, :s5,
									     	0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,  0, 0, 0, 0,
									     	0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,   0, 0, 0, 0,  0, 0, 0, 0  ) 
			   ]]
   
    stmt:bind_names{ hostname = hostname, s1x = s1x, s1y = s1y, s1z = s1z, s1 = s1, 
					  s2x = s2x, s2y = s2y, s2z = s2z, s2 = s2, 
					  s3x = s3x, s3y = s3y, s3z = s3z, s3 = s3, 
					  s4x = s4x, s4y = s4y, s4z = s4z, s4 = s4, 
					  s5x = s5x, s5y = s5y, s5z = s5z, s5 = s5 }
    stmt:step()
    stmt:finalize()
    db:close()
    
end

function selectSwitch(hostname)
    local db = sqlite3.open(databaseName)
    for row in db:nrows("SELECT * FROM switch WHERE hostname = '".. hostname .. "'") do
      print(row.id, row.hostname, row.s1x, row.s1y, row.s1z, row.s1, 
				  row.s2x, row.s2y, row.s2z, row.s2, 
                                  row.s3x, row.s3y, row.s3z, row.s3, 
                                  row.s4x, row.s4y, row.s4z, row.s4, 
				  row.s5x, row.s5y, row.s5z, row.s5)
    end 
    db:close()
end


function updateSwitch(sx, sy, sz, sv)
    print(sx .. " " .. sy .. " " ..  sz .. " " .. sv)
    local db = sqlite3.open(databaseName)

    local stmt = db:prepare[[ 	UPDATE switch SET s1 = :sv WHERE s1x = :sx AND s1y = :sy AND s1z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s2 = :sv WHERE s2x = :sx AND s2y = :sy AND s2z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()


    local stmt = db:prepare[[ 	UPDATE switch SET s3 = :sv WHERE s3x = :sx AND s3y = :sy AND s3z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s4 = :sv WHERE s4x = :sx AND s4y = :sy AND s4z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s5 = :sv WHERE s5x = :sx AND s5y = :sy AND s5z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()


    local stmt = db:prepare[[ 	UPDATE switch SET s6 = :sv WHERE s6x = :sx AND s6y = :sy AND s6z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s7 = :sv WHERE s7x = :sx AND s7y = :sy AND s7z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()


    local stmt = db:prepare[[ 	UPDATE switch SET s8 = :sv WHERE s8x = :sx AND s8y = :sy AND s8z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s9 = :sv WHERE s9x = :sx AND s9y = :sy AND s9z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s10 = :sv WHERE s10x = :sx AND s10y = :sy AND s10z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s11 = :sv WHERE s11x = :sx AND s11y = :sy AND s11z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s12 = :sv WHERE s12x = :sx AND s12y = :sy AND s12z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()


    local stmt = db:prepare[[ 	UPDATE switch SET s13 = :sv WHERE s13x = :sx AND s13y = :sy AND s13z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s14 = :sv WHERE s14x = :sx AND s14y = :sy AND s14z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    local stmt = db:prepare[[ 	UPDATE switch SET s15 = :sv WHERE s15x = :sx AND s15y = :sy AND s15z = :sz ]]
    stmt:bind_names{ sx= sx, sy = sy, sz = sz, sv = sv }
    stmt:step()
    stmt:finalize()

    db:close()
end






-- Server CRUD method
function insertServer(hostname, ipv4, ipv6, posx, posy, posz)
    local db = sqlite3.open(databaseName)
    local stmt = db:prepare[[ INSERT INTO server VALUES (null, :hostname, :ipv4, :ipv6, :posx, :posy, :posz) ]]
    stmt:bind_names{ hostname = hostname, ipv4 = ipv4, ipv6 = ipv6, posx = posx, posy = posy, posz = posz  }
    stmt:step()
    stmt:finalize()
    db:close()
end

function selectServer(hostname)
    local db = sqlite3.open(databaseName)
    for row in db:nrows("SELECT * FROM server WHERE hostname = '" .. hostname .. "'") do
      print(row.id, row.hostname, row.ipv4, row.ipv6, row.posx, row.posy, row.posz)
    end 
    db:close()
end


function updateServer(id, field, value)
    local db = sqlite3.open(databaseName)
    if field == "ipv6" then
        local stmt = db:prepare[[ UPDATE server SET  ipv6 = :value WHERE id = :id ]]
        stmt:bind_names{  id = id,  value = value  }
        stmt:step()
        stmt:finalize()
    end
    db:close()
end


function deleteServer(id)
    local db = sqlite3.open(databaseName)
    local stmt = db:prepare[[ DELETE FROM server WHERE id = :id ]]
    stmt:bind_names{  id = id }
    stmt:step()
    stmt:finalize()
    db:close()
end


function separator()
    print("-----------------------")
end

------------------------------------------------------------------
------------------------------------------------------------------


-- Init database
initDatabase()





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



-- /installServer <server name> <operating system>
-- 

buildServer = false
installServer = false

installServerName = "ServerNameDefault"

minetest.register_chatcommand("server", {
	params = "<build|install|info> <server name>",
	description = "Build a server name",
	func = function(user, args)

		if args == "" then
			return false, "<build|install|info> <server name> parameters required"
		end

		local serverAction, serverName = args:match("^(%S+)%s(%S+)$")


		if not serverName then
			return false, "server name required"
		end

		local player = minetest.get_player_by_name(user)
		if not player then
			return false, "Player not found"
		end

		local fmt = "Server %s at: (%.2f,%.2f,%.2f)"
		
		local pos = player:getpos()



		-- /build server hostname
		if serverAction == "build" then
			minetest.chat_send_player(user, "Build server: " .. serverName)
			-- Ice node
			for i = 0, 4 do
				for j = 0, 4 do
					for k = 0, 2 do
						minetest.set_node({x = pos.x + 2 + i, y = pos.y + k, z = pos.z + j}, {name="default:ice"})
					end
				end
			end
			-- Switch node
			for i = 0, 4 do
				for j = 0, 2 do
					minetest.set_node({x = pos.x + 2 + i , y = pos.y + j, z = pos.z }, {name="mesecons_switch:mesecon_switch_off"})
				end
			end

			installServerName = serverName
			buildServer = true

		elseif serverAction == "install" then
			installServerName = serverName
			installServer = true

			print("Server installation: '" .. installServerName .. "'")
			minetest.chat_send_player(user, "Server installation: '" .. installServerName .. "'")

		elseif serverAction == "info" then
			print("------ SERVER ------")
			selectServer(serverName)
			print("------ SWITCH ------")
			selectSwitch(serverName)
		end	


		return true, fmt:format(args, pos.x, pos.y, pos.z)
	end
})




-- build <player> <structure>
-- Build a structure

minetest.register_chatcommand("buildStructure", {
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

		local fmt = "Build a %s at: (%.2f,%.2f,%.2f)"

		local pos = player:getpos()
		
		-- /build pillar 5
		if structureName == "pillar" then
			minetest.chat_send_player(user, "Build pillar " .. structureParam)
			local heightPillar = tonumber(structureParam)
			for i = 0, heightPillar do
				minetest.set_node({x=pos.x + 2, y=pos.y + i, z=pos.z }, {name="default:ice"})
			end
			
		-- /build sign_yard
		elseif structureName == "sign_yard" then
			minetest.chat_send_player(user, "Build sign yard")
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
			minetest.chat_send_player(user, "Build switch")
			minetest.set_node({x=pos.x + 2, y=pos.y, z=pos.z }, {name="mesecons_switch:mesecon_switch_off"})
			minetest.chat_send_player(user, "mesecons_switch:mesecon_switch_off; x=" .. pos.x + 2 .. " y=" .. pos.y .. " z=" .. pos.z)

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
		minetest.chat_send_player(puncher_man, puncher_name .." is hitting me. I'm located at ".. mypos)		
	end 
	if node.name == "default:desert_stonebrick" then
		local puncher_name = puncher:get_player_name()
		minetest.chat_send_player(puncher_name, "That's got to hurt!!")
	end
	if node.name == "mesecons_switch:mesecon_switch_off" then
		local puncher_name = puncher:get_player_name()
		local mypos = minetest.pos_to_string(pos)
		minetest.chat_send_player(puncher_name, puncher_name .." switch: ".. mypos)
	end
end)

-- Use switch to on/off and use pick wood weapon to change the value
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

		-- Player
                --local player = minetest.get_player_by_name(user)
                local playerPos = user:getpos()
		local playerName = user:get_player_name()

		minetest.chat_send_player(playerName, "player; x=" .. playerPos.x .. " y=" .. playerPos.y .. " z=" .. playerPos.z)

		-- Node
		local meta = minetest.get_meta(pos)
		local nodeName = minetest.get_node(pos).name
		minetest.chat_send_player(playerName, "on_use; x=" .. pos.x .. " y=" .. pos.y .. " z=" .. pos.z .. " name=" .. nodeName)

		-- Check distance between player and node
		if (playerPos.x > pos.x - 3  and playerPos.x < pos.x + 3) and
		   (playerPos.y > pos.y - 3  and playerPos.y < pos.y + 3) and
		   (playerPos.z > pos.z - 3  and playerPos.z < pos.z + 3) then
			
			print("on_use; x=" .. pos.x .. " y=" .. pos.y .. " z=" .. pos.z .. " name=" .. nodeName)
			if nodeName  == "mesecons_switch:mesecon_switch_on" then
				minetest.set_node({x = pos.x, y = pos.y, z = pos.z }, {name = "mesecons_switch:mesecon_switch_off"})
			else
				minetest.set_node({x = pos.x, y = pos.y, z = pos.z }, {name = "mesecons_switch:mesecon_switch_on"})
			end


			-- Server installation
			-- Select the first node : bottom left node
			print("Debug: " .. tostring(buildServer) .. " " .. tostring(installServer) .. " " .. installServerName)
			if buildServer == true and installServer == true and installServerName ~= "ServerNameDefault" then

				-- Insert a server
				insertServer(installServerName, "ipv4", "Ipv6", pos.x , pos.y, pos.z)

				-- Insert switches server
				local s1x = pos.x 
				local s1y = pos.y 
				local s1z = pos.z 
				local s1  = 0

				local s2x = pos.x + 1
				local s2y = pos.y 
				local s2z = pos.z 
				local s2  = 0

				local s3x = pos.x + 2
				local s3y = pos.y 
				local s3z = pos.z 
				local s3  = 0

				local s4x = pos.x + 3
				local s4y = pos.y 
				local s4z = pos.z 
				local s4  = 0

				local s5x = pos.x + 4
				local s5y = pos.y 
				local s5z = pos.z 
				local s5  = 0

				insertSwitch(installServerName,	s1x, s1y, s1z, s1, 
						       		s2x, s2y, s2z, s2, 
								s3x, s3y, s3z, s3, 
								s4x, s4y, s4z, s4, 
								s5x, s5y, s5z, s5)

				print("------ SERVER ------")
				selectServer(installServerName)
				print("------ SWITCH ------")
				selectSwitch(installServerName)


				buildServer = false
				installServer = false
				installServerName = "ServerNameDefault"
			
			else
				local s = 123
				print("updateSwitch: x=" .. pos.x .. " y=" .. pos.y .. " z=" .. pos.z .. " s=" .. s)
			 	updateSwitch(pos.x, pos.y, pos.z, s)
			end


		end

		return itemstack
	end,
	
	-- Right button mouse
    	on_place = function(itemstack, user, pointed_thing)
		local pos = pointed_thing
		if not pos then
			return itemstack
		end
		
		local playerName = user:get_player_name()
		minetest.chat_send_player(playerName, "on_place;" )

        	return itemstack
    	end,
})


-- Who's online

minetest.register_chatcommand("whosonline", {
    params = "",
    description = "List all connected players.",
    func = function(name)
        connected_players_string = 'Players online: '
 
        for _,player in ipairs(minetest.get_connected_players()) do
            connected_players_string  =  connected_players_string .. 
                                         player:get_player_name() .. 
                                         ' '
        end
 
        minetest.chat_send_player(name, connected_players_string)
 
        return true
    end
})
