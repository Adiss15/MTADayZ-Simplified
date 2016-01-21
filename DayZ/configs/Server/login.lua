--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]

outputDebugString ( "MTA:DayZ Simplified | login loaded" )

local spawnPositions = {
{-278.6669921875,-2882.1572265625,32.104232788086},
{-958.5595703125,-2887.9912109375,64.82421875},
{-1816.9375,-2748.18359375,1.7327127456665},
{-2816.166015625,-2439.0546875,2.4004096984863},
{-2941.5673828125,-1206.2373046875,2.7848854064941},
{-2911.51171875,-895.22265625,2.4013109207153},
{-2185.6669921875,2957.380859375,11.474840164185},
{272.2265625,2928.505859375,1.3713493347168},
{2803.943359375,595.9365234375,7.7612648010254},
{2883.7509765625,-178.4658203125,3.2714653015137},
{-233.46484375,-1735.8173828125,1.5520644187927},
{-1056.8720703125,2939.068359375,42.311294555664},
}


function playerLogin(username, pass, player)
	local playerID = getAccountData(getPlayerAccount(player),"playerID")
	account = getPlayerAccount(player)
				local x,y,z =  getAccountData(account,"last_x"),getAccountData(account,"last_y"),getAccountData(account,"last_z")
				local skin = getAccountData(account,"skin")
				createZombieTable (player)
				if getAccountData(account,"isDead") then
					spawnDayZPlayer(player)
					return
				end
				spawnPlayer (player, x,y,z, math.random(0,360), skin, 0, 0)
				fadeCamera (player, true)
				setCameraTarget (player, player)
				playerCol = createColSphere(x,y,z,1.5)
				setElementData(player,"playerCol",playerCol)
				attachElements ( playerCol, player, 0, 0, 0 )
				setElementData(playerCol,"parent",player)
				setElementData(playerCol,"player",true)
				for i,data in ipairs(tabelALL) do
					local elementData = getAccountData(account,data[1])
					setElementData(player,data[1],elementData)
				end
				setElementData(player,"logedin",true)
	--Weapons
--Old Weapons
local weapon = getElementData(player,"currentweapon_1")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), true )
end
local weapon = getElementData(player,"currentweapon_2")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), false )
end
local weapon = getElementData(player,"currentweapon_3")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), false )
end
setPedSkin(getElementData(player,"skin"))

setElementData(player,"admin",getAccountData(account,"admin") or false)
setElementData(player,"supporter",getAccountData(account,"supporter") or false)

end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)

function playerRegister(username, pass, player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 73, 0, 0)
	fadeCamera (player, true)
	setCameraTarget (player, player)
		playerCol = createColSphere(x,y,z,1.5)
		attachElements ( playerCol, player, 0, 0, 0 )
		setElementData(playerCol,"parent",player)
		setElementData(playerCol,"player",true)
	----------------------------------
	--Player Items on Start
	for i,data in ipairs(tabelALL) do
		if data[1] =="Bandage" then
			setElementData(player,data[1],2)
		elseif data[1] =="Painkiller" then
			setElementData(player,data[1],1)
		elseif data[1] =="MAX_Slots" then
			setElementData(player,data[1],8)
		elseif data[1] =="skin" then
			setElementData(player,data[1],73)
		elseif data[1] =="blood" then
			setElementData(player,data[1],12000)
		elseif data[1] =="GPS_frequency" then
			setElementData(player,data[1],math.random(1,25000))
		elseif data[1] =="temperature" then
			setElementData(player,data[1],37)
		elseif data[1] =="brokenbone" then
			setElementData(player,data[1],false)	
		elseif data[1] =="pain" then
			setElementData(player,data[1],false)
		elseif data[1] =="cold" then
			setElementData(player,data[1],false)
		elseif data[1] =="infection" then
			setElementData(player,data[1],false)
		elseif data[1] =="food" then
			setElementData(player,data[1],100)
		elseif data[1] =="thirst" then
			setElementData(player,data[1],100)
		elseif data[1] =="currentweapon_1" then
			setElementData(player,data[1],false)
		elseif data[1] =="currentweapon_2" then
			setElementData(player,data[1],false)	
		elseif data[1] =="currentweapon_3" then
			setElementData(player,data[1],false)	
		elseif data[1] =="bandit" then
			setElementData(player,data[1],false)	
		elseif data[1] =="humanity" then
			setElementData(player,data[1],2500)		
		else
			setElementData(player,data[1],0)
		end	
	end
		account = getAccount(username)
		local value = getAccounts()
		local value = #value
		setElementData(player,"playerID",value+1)
		setAccountData(account,"playerID",value+1)
		setElementData(player,"logedin",true)
		createZombieTable (player)
end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)


function saveAccounts () -- Save in the database
	local account = getPlayerAccount(source)
	if account then
	for i,data in ipairs(tabelALL) do
		setAccountData(account,data[1],getElementData(source,data[1]))
	end
		local x,y,z =  getElementPosition(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		destroyElement(getElementData(source,"playerCol"))
	end	
	setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2 () -- Save in the database
for i, player in ipairs(getElementsByType("player")) do
	local account = getPlayerAccount(player)
	if account then
	for i,data in ipairs(tabelALL) do
		setAccountData(account,data[1],getElementData(player,data[1]))
	end
		local x,y,z =  getElementPosition(player)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
	end	
	--setElementData(player,"logedin",false)
end	
end
addEventHandler ( "onResourceStop", getRootElement(), saveAccounts2 )


--## Copyright (c) 2015 Grosu `PoWeR` Mihaita.
--## MTA:DayZ Backup System v1.5.

local dbType = "SQLite";  --Here set your db type, "MySQL" or "SQLite" <!>
local dbName = "";        --Your database name <!>
local dbHost = "";		  --Your hostname/IP <!>
local dbUser = "";		  --Username for database <!>
local dbPass = "";		  --Password for database <!>
local dbPort = 1234; 	  --This is an port exemple CHANGE IT <!>

local last_veh_id = 0;	  --Don't edit here <!>
local last_tent_id = 0;   --Don't edit here <!>

local itemsDataTable = { -- If your server have different items be sure you imported your item table here!
{weapon_primary_m4},
{weapon_primary_sniper},
{weapon_primary_shotgun},
{weapon_primary_spaz12},
{weapon_primary_sawnoff},
{weapon_primary_ak47},
{weapon_primary_contryrifle},
{weapon_secondary_pistol},
{weapon_secondary_sdpistol},
{weapon_secondary_uzi},
{weapon_secondary_mp5},
{weapon_secondary_deserteagle},
{weapon_melee_knife},
{weapon_melee_katana},
{weapon_melee_baseball},
{weapon_melee_shovel},
{weapon_melee_golf},
{weapon_specially_parachute},
{weapon_specially_teargas},
{weapon_specially_grenade},
{weapon_specially_binoculares},
{weapon_ammo_pistol},
{weapon_ammo_sdpistol},
{weapon_ammo_deserteagle},
{weapon_ammo_uzi},
{weapon_ammo_mp5},
{weapon_ammo_ak},
{weapon_ammo_m4},
{weapon_ammo_shotgun},
{weapon_ammo_sawnoff},
{weapon_ammo_spaz12},
{weapon_ammo_sniper},
{weapon_ammo_contryrifle},
{Item_food_waterbottle},
{Item_food_pastacan},
{Item_food_beanscan},
{Item_food_burger},
{Item_food_pizza},
{Item_food_Soda},
{Item_food_milk},
{Item_food_coockedmeat},
{Item_woodpile},
{Item_medic_bandage},
{Item_medic_medickit},
{Item_medic_heatpack},
{Item_medic_painkiller},
{Item_medic_morphine},
{Item_medic_bloodbag},
{Item_wirefence},
{Item_emptygascanister},
{Item_fullgascanister},
{Item_roadflare},
{Item_rawmeat},
{Item_car_tire},
{Item_car_engine},
{Item_car_parts},
{Item_tent},
{Item_skin_camo},
{Item_skin_civilian},
{Item_skin_Survivor}, 
{Item_skin_ghilliesuit}, 
{Item_emptywaterbottle}, 
{Item_emptysoda},
{Item_scruffyburgers},
{"Assault Pack (ACU)"},
{"Alice Pack"},
{"Czech Backpack"},
{"Coyote Backpack"},
{Item_toolbelt_ng_goggles},
{Item_toolbelt_infrared},
{Item_toolbelt_map},
{Item_toolbelt_matches}, 
{Item_toolbelt_watch},
{Item_toolbelt_gps},
{Item_toolbelt_toolbox},
{Item_toolbelt_radiodevice}
};

function noteAdmins(theAlert)
	for _,v in ipairs(getElementsByType("player")) do
		if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(v)), aclGetGroup("Admin"))) then
			outputChatBox("#FF0000[Backup]: #FFFFFF"..tostring(theAlert), v, 255, 255, 255,  true);
		end
	end
end

if (dbType == "MySQL") then
	db = dbConnect("mysql", "dbname="..dbName..";host="..dbHost..";port="..dbPort, dbUser, dbPass, "share=1");
	dbExec(db, "CREATE TABLE IF NOT EXISTS vehicles(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, id)");
	dbExec(db, "CREATE TABLE IF NOT EXISTS tents(model, x, y, z, rX, rY, rZ, slots, scale, items, id)");
	noteAdmins("Database connected to MySQL!");
elseif (dbType == "SQLite") then
	db = dbConnect("sqlite", "database.db");
	dbExec(db, "CREATE TABLE IF NOT EXISTS vehicles(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, id)");
	dbExec(db, "CREATE TABLE IF NOT EXISTS tents(model, x, y, z, rX, rY, rZ, slots, scale, items, id)");
	noteAdmins("Database connected to SQLite!");
else
	noteAdmins("Error: `dbType` wrong attribute!");
	return false;
end

function backup_vehs()
	dbExec(db, "DELETE FROM vehicles");
	local vehicleCounter = 0;
	for _,veh in ipairs(getElementsByType("vehicle")) do
		if (not getElementData(veh, "helicrash") and not getElementData(veh, "deadVehicle")) then
			local col = getElementData(veh, "parent");
			if (col and getElementType(col) == "colshape") then
				local model = getElementModel(veh);
				local x, y, z = getElementPosition(veh);
				local rX, rY, rZ = getElementRotation(veh);
				local slots = getElementData(col, "MAX_Slots") or 20;
				local fuel = getElementData(col, "fuel") or 0;
				local moving = getElementData(col, "Tire_inVehicle") or 0;
				local engines = getElementData(col, "Engine_inVehicle") or 0;
				local parts = getElementData(col, "Parts_inVehicle") or 0;
				local items = {};
				vehicleCounter = vehicleCounter + 1;
				for _,v in ipairs(itemsDataTable) do
					local quantity = getElementData(col, v[1]) or 0;
					if (quantity > 0) then
						table.insert(items, {v[1], quantity});
					end
				end
				dbExec(db, "INSERT INTO vehicles(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)", model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, toJSON(items), vehicleCounter)
			end
		end
	end
	noteAdmins("Vehicles saved ["..vehicleCounter.."]");
end

function backup_tents()
	dbExec(db, "DELETE FROM tents");
	local tentsCounter = 0;
	for _,col in ipairs(getElementsByType("colshape")) do
		if (getElementData(col, "tent")) then
			local tent = getElementData(col, "parent");
			local x, y, z = getElementPosition(tent);
			local rX, rY, rZ = getElementRotation(tent);
			local model = getElementModel(tent);
			local slots = getElementData(col, "MAX_Slots") or 100;
			local scale = getObjectScale(tent);
			local items = {};
			tentsCounter = tentsCounter + 1;
			for _,v in ipairs(itemsDataTable) do
				local quantity = getElementData(col, v[1]) or 0;
				if (quantity > 0) then
					table.insert(items, {v[1], quantity});
				end
			end
			dbExec(db, "INSERT INTO tents(model, x, y, z, rX, rY, rZ, slots, scale, items, id) VALUES(?,?,?,?,?,?,?,?,?,?,?)", model, x, y, z, rX, rY, rZ, slots, scale, toJSON(items), tentsCounter)
		end
	end
	noteAdmins("Tents saved ["..tentsCounter.."]");
end

function create_veh(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, id)
	local veh = createVehicle(model, x, y, z);
	local vehCol = createColSphere(x + 5, y, z, 4);
	setElementRotation(veh, rX, rY, rZ);
	attachElements(vehCol, veh, 0, 0, 0);
	setElementData(vehCol, "parent", veh);
	setElementData(veh, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(vehCol, "MAX_Slots", tonumber(slots));
	setElementData(vehCol, "Tire_inVehicle", tonumber(moving));
	setElementData(vehCol, "Engine_inVehicle", tonumber(engines));
	setElementData(vehCol, "Parts_inVehicle", tonumber(parts));
	setElementData(vehCol, "spawn", {model, x, y, z});
	setElementData(vehCol, "fuel", tonumber(fuel));
	for _,v in ipairs(fromJSON(items)) do
		setElementData(vehCol, v[1], v[2]);
	end
end

function create_tent(model, x, y, z, rX, rY, rZ, slots, scale, items, id)
	local tent = createObject(model, x, y, z);
	local tentCol = createColSphere(x, y, z,  3);
	setElementRotation(tent, rX, rY, rZ);
	setObjectScale(tent, scale);
	attachElements(tentCol, tent, 0, 0, 0);
	setElementData(tentCol, "parent", tent);
	setElementData(tent, "parent", tentCol);
	setElementData(tentCol, "tent", true);
	setElementData(tentCol, "vehicle", true);
	setElementData(tentCol, "MAX_Slots", slots);
	for _,v in ipairs(fromJSON(items)) do
		setElementData(tentCol, v[1], v[2]);
	end
end

function load_vehs(q)
	if (q) then
		local p = dbPoll(q, 0);
		if (#p > 0) then
			for _,d in pairs(p) do
				last_veh_id = d["id"];
				create_veh(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["fuel"], d["engines"], d["moving"], d["parts"], d["items"], d["id"]);
			end
		end
	end
	noteAdmins("Vehicles loaded!");
end

function load_tents(q)
	if (q) then
		local p = dbPoll(q, 0);
		if (#p > 0) then
			for _,d in pairs(p) do
				last_tent_id = d["id"];
				create_tent(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["scale"], d["items"], d["id"]);
			end
		end
	end 
	noteAdmins("Tents loaded!");
end

addEventHandler("onPlayerCommand", root, function(cmd)
	if (isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup("Admin"))) then
		if (cmd == "loadtents") then
			dbQuery(load_tents, {}, db, "SELECT * FROM `tents`");
		elseif (cmd == "loadvehs") then
			dbQuery(load_vehs, {}, db, "SELECT * FROM `vehicles`");
		elseif (cmd == "vehbk") then
			backup_vehs();
		elseif (cmd == "tentbk") then
			backup_tents();
		elseif (cmd == "togbk") then
			if (isTimer(vehbkTimer) and isTimer(tentbkTimer)) then
				killTimer(vehbkTimer);
				killTimer(tentbkTimer);
				noteAdmins(getPlayerName(source).."#FFFFFF stopped automatic backup!");
			else
				vehbkTimer = setTimer(backup_vehs, 30*60000, 0);
				tentbkTimer = setTimer(backup_tents, 30*60000, 0);
				noteAdmins(getPlayerName(source).."#FFFFFF started automatic backup!");
			end
		end
	end
end);

outputDebugString ( "MTA:DayZ Simplified | login end" )



