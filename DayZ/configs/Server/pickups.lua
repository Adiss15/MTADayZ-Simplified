--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]

outputDebugString ( "MTA:DayZ Simplified | pickups loaded" )

weaponAmmoTable = {


--[[
["Pistol Ammo"] = {
{"Pistol",22},
{"Silenced Pistol",23},
{weapon_secondary_deserteagle,24},
},
]]--


[weapon_ammo_pistol] = {
{weapon_secondary_pistol,22},
},

[weapon_ammo_sdpistol] = {
{weapon_secondary_sdpistol,23},
},

[weapon_ammo_deserteagle] = {
{weapon_secondary_deserteagle,24},
},


--[[
["Smg Ammo"] = {
{"Uzi",28},
{"TEC-9",32},
{"MP5",29},
},
]]--


[weapon_ammo_uzi] = {
{weapon_secondary_uzi,28},
},

[weapon_ammo_mp5] = {
{weapon_secondary_mp5,29},
},


--[[["Assault Ammo"] = {
{weapon_primary_ak47,30},
{weapon_primary_m4,31},
},
]]--


[weapon_ammo_ak] = {
{weapon_primary_ak47,30},
},

[weapon_ammo_m4] = {
{weapon_primary_m4,31},
},


--[[
["Shotgun Ammo"] = {
{"Shotgun",25},
{weapon_primary_sawnoff,26},
{weapon_primary_spaz12,27},
},
]]--

[weapon_ammo_shotgun] = {
{weapon_primary_shotgun,25},
},

[weapon_ammo_sawnoff] = {
{weapon_primary_sawnoff,26},
},

[weapon_ammo_spaz12] = {
{weapon_primary_spaz12,27},
},


--[[
["Sniper Ammo"] = {
{"Country Rifle",33},
{"Sniper Rifle",34},
},
]]--

[weapon_ammo_sniper] = {
{weapon_primary_sniper,34},
},

[weapon_ammo_contryrifle] = {
{weapon_primary_contryrifle,33},
},


--[[
["Rocket Ammo"] = {
{"Heat-Seeking RPG",36},
{"Rocket Launcher",35},
},
]]--


["M136 Rocket"] = {
{"Heat-Seeking RPG",36},
{"M136 Rocket Launcher",35},
},


["others"] = {
{weapon_specially_parachute,46},
{"Satchel",39},
{weapon_specially_teargas,17},
{weapon_specially_grenade,16},
{weapon_melee_knife,4},
{weapon_melee_katana,8},
{weapon_specially_binoculares,43},
{weapon_melee_baseball,5},
{weapon_melee_golf,2},
{weapon_melee_shovel,6},
{Item_toolbelt_radiodevice,1},
--[[
{"Diary, Page 1",1},
{"Diary, Page 2",1},
{"Diary, Page 3",1},
{"Diary, Page 4",1},
{"Diary, Page 5",1},
{"Diary, Page 6",1},
{"Diary, Page 7",1},
{"Diary, Page 8",1},
{"Small Note 1",1},
{"Small Note 2",1},
{"Small Note 3",1},
{"Research Report 1",1},
{"Research Report 2",1},
{"Letter to Mum",1},
]]
},
}

function getWeaponAmmoType (weaponName,notOthers)
if not notOthers then
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[1] then
			return weaponData[1],weaponData[2]
		end
	end
end	
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_pistol]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_pistol,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sdpistol]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_sdpistol,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_deserteagle]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_deserteagle,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_uzi]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_uzi,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_mp5]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_mp5,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_ak]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_ak,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_m4]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_m4,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_shotgun]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_shotgun,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sawnoff]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_sawnoff,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_spaz12]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_spaz12,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sniper]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_sniper,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_contryrifle]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_contryrifle,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M136 Rocket"]) do
		if weaponName == weaponData[1] then
			return "M136 Rocket",weaponData[2]
		end
	end
	return false
end



function createItemPickup(item,x,y,z,tableStringName)
if item and x and y and z then
	local object = createObject(itemTable[tostring(tableStringName)][item][2],x,y,z-0.875,itemTable[tostring(tableStringName)][item][4],0,math.random(0,360))
	setObjectScale(object,itemTable[tostring(tableStringName)][item][3])
	setElementCollisionsEnabled(object, false)
	setElementFrozen (object,true)
	local col = createColSphere(x,y,z,0.75)
	setElementData(col,"item",itemTable[tostring(tableStringName)][item][1])
	setElementData(col,"parent",object)
	setTimer(function()
		if isElement(col) then
			destroyElement(col)
			destroyElement(object)
		end	
	end,900000,1)
	return object
end
end



function math.percentChance (percent,repeatTime)
local hits = 0
	for i = 1, repeatTime do
	local number = math.random(0,200)/2
		if number <= percent then
			hits = hits+1
		end
	end
	return hits
end

function createItemLoot (lootPlace,x,y,z,id)
	col = createColSphere(x,y,z,1.25)
	setElementData(col,"itemloot",true)
	setElementData(col,"parent",lootPlace)
	setElementData(col,"MAX_Slots",12)
	--Items
	for i, item in ipairs(itemTable[lootPlace]) do
		local value =  math.percentChance (item[5],math.random(1,2))
		setElementData(col,item[1],value)
		--weapon Ammo
		local ammoData,weapID = getWeaponAmmoType (item[1],true)
		if ammoData and value > 0 then
			setElementData(col,ammoData,math.random(1,2))
		end
	end
		--itemLoot
		refreshItemLoot (col,lootPlace)
		
		return col
end


function refreshItemLoot (col,place)
	local objects = getElementData(col,"objectsINloot")
		if objects then
			if objects[1] ~= nil then
				destroyElement(objects[1])
			end
			if objects[2] ~= nil then
				destroyElement(objects[2])
			end
			if objects[3] ~= nil then
				destroyElement(objects[3])
			end
		end
			--setting objects
			local counter = 0
			local obejctItem = {}
		--Tables
			for i, item in ipairs(itemTable["other"]) do
				if getElementData(col,item[1]) and getElementData(col,item[1]) > 0 then
					if counter == 3 then
						break
					end	
					counter = counter + 1
					local x,y,z = getElementPosition(col)
					obejctItem[counter] = createObject(item[2],x+math.random(-1,1),y+math.random(-1,1),z-0.875,item[4])
					setObjectScale(obejctItem[counter],item[3])
					setElementCollisionsEnabled(obejctItem[counter], false)
					setElementFrozen (obejctItem[counter],true)
				end
			end
		-------Debug
			if obejctItem[1] == nil then
				local x,y,z = getElementPosition(col)
					obejctItem[1] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
					setObjectScale(obejctItem[1],0)
					setElementCollisionsEnabled(obejctItem[1], false)
					setElementFrozen (obejctItem[1],true)
			end
			if obejctItem[2] == nil then
				local x,y,z = getElementPosition(col)
					obejctItem[2] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
					setObjectScale(obejctItem[2],0)
					setElementCollisionsEnabled(obejctItem[2], false)
					setElementFrozen (obejctItem[2],true)
			end
			if obejctItem[3] == nil then
				local x,y,z = getElementPosition(col)
					obejctItem[3] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
					setObjectScale(obejctItem[3],0)
					setElementCollisionsEnabled(obejctItem[3], false)
					setElementFrozen (obejctItem[3],true)
			end
			setElementData(col,"objectsINloot",{obejctItem[1], obejctItem[2], obejctItem[3]})
end
addEvent( "refreshItemLoot", true )
addEventHandler( "refreshItemLoot", getRootElement(), refreshItemLoot )

function createPickupsOnServerStart()
iPickup = 0
	for i,pos in ipairs(pickupPositions["residential"]) do
		iPickup = iPickup + 1
		createItemLoot("residential",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart2,5000,1)
end

function createPickupsOnServerStart2()
	for i,pos in ipairs(pickupPositions["industrial"]) do
		iPickup = iPickup + 1
		createItemLoot("industrial",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart3,5000,1)
end

function createPickupsOnServerStart3()
	for i,pos in ipairs(pickupPositions["farm"]) do
		iPickup = iPickup + 1
		createItemLoot("farm",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart4,5000,1)
end

function createPickupsOnServerStart4()
	for i,pos in ipairs(pickupPositions["supermarket"]) do
		iPickup = iPickup + 1
		createItemLoot("supermarket",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart5,5000,1)
end

function createPickupsOnServerStart5()
	for i,pos in ipairs(pickupPositions["military"]) do
		iPickup = iPickup + 1
		createItemLoot("military",pos[1],pos[2],pos[3],iPickup)
	end
end


createPickupsOnServerStart()
--OTHER ITEM STUFF
vehicleFuelTable = {
{422,80},
{470,100},
{468,30},
{433,140},
{437,140},
{509,0},
{487,60},
{497,60},
{453,60}
}

function getVehicleMaxFuel(loot)
	local modelID = getElementModel(getElementData(loot,"parent"))
	for i,vehicle in ipairs(vehicleFuelTable) do
		if modelID == vehicle[1] then
			 return vehicle[2]
		end
	end
	return false
end

function onPlayerTakeItemFromGround (itemName,col)
itemPlus = 1
if itemName == weapon_ammo_pistol then
	itemPlus = 7
elseif itemName == weapon_ammo_sdpistol then
	itemPlus = 15
elseif itemName == weapon_ammo_deserteagle then
	itemPlus = 7
elseif itemName == weapon_ammo_uzi then
	itemPlus = 30
elseif itemName == weapon_ammo_mp5 then
	itemPlus = 20
elseif itemName == weapon_ammo_ak then
	itemPlus = 30
elseif itemName == weapon_ammo_m4 then
	itemPlus = 20
elseif itemName == weapon_ammo_shotgun then
	itemPlus = 7
elseif itemName == weapon_ammo_sawnoff then
	itemPlus = 2
elseif itemName == weapon_ammo_spaz12 then
	itemPlus = 7
elseif itemName == weapon_ammo_sniper then
	itemPlus = 5
elseif itemName == weapon_ammo_contryrifle then
	itemPlus = 10
elseif itemName == weapon_primary_m4 or itemName == weapon_primary_ak47 or itemName == weapon_primary_sniper or itemName == weapon_primary_shotgun or itemName == weapon_primary_spaz12 or itemName == weapon_primary_sawnoff or itemName == "Heat-Seeking RPG" or itemName == "M136 Rocket Launcher" or itemName == weapon_primary_contryrifle then
	removeBackWeaponOnDrop()	
end
	local x,y,z = getElementPosition(source)
	local id,ItemType = getItemTablePosition (itemName)
	setElementData(source,itemName,(getElementData(source,itemName) or 0)+itemPlus)
	destroyElement(getElementData(col,"parent"))
	destroyElement(col)
end
addEvent( "onPlayerTakeItemFromGround", true )
addEventHandler( "onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround )

function onPlayerChangeLoot(loot)
local players = getElementsWithinColShape (loot,"player")
	for theKey,player in ipairs(players) do 
		triggerClientEvent(player,"refreshLootManual",player,loot)
	end	
end
addEvent( "onPlayerChangeLoot", true )
addEventHandler( "onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot )

function playerDropAItem(itemName)
		local x,y,z = getElementPosition(source)
		local item,itemString = getItemTablePosition(itemName)
		local itemPickup = createItemPickup(item,x+math.random(-1.25,1.25),y+math.random(-1.25,1.25),z,itemString)
end
addEvent( "playerDropAItem", true )
addEventHandler( "playerDropAItem", getRootElement(), playerDropAItem )

function getItemTablePosition (itema)
for id, item in ipairs(itemTable[tostring("other")]) do
if itema == item[1] then
	return id,"other"
end
end

return item,itemString
end

function refreshItemLoots ()
	outputChatBox("#ffaa00WARNING! #ffffff - SPAWNPOINTS FOR ITEMS ARE BEING REFRESHED! BEWARE OF MASSIVE LAG!",getRootElement(),255,255,255,true)
	for i, loots in ipairs(getElementsByType("colshape")) do
		local itemloot = getElementData(loots,"itemloot")
		if itemloot then
		local objects = getElementData(loots,"objectsINloot")
		if objects then
			if objects[1] ~= nil then
				destroyElement(objects[1])
			end
			if objects[2] ~= nil then
				destroyElement(objects[2])
			end
			if objects[3] ~= nil then
				destroyElement(objects[3])
			end
		end
			destroyElement(loots)
		end	
	end
	createPickupsOnServerStart()
	setTimer(refreshItemLootPoints,gameplayVariables["itemrespawntimer"] ,1)
end


--Refresh items
function refreshItemLootPoints ()
local time = getRealTime()
local hour = time.hour
		outputChatBox("#ff2200WARNING! #ffffff - SPAWNPOINTS FOR ITEMS WILL BE REFRESHED IN 1 MINUTE! BEWARE OF MASSIVE LAG!",getRootElement(),255,255,255,true)
		setTimer(refreshItemLoots,60000,1)
end
setTimer(refreshItemLootPoints,gameplayVariables["itemrespawntimer"] ,1)

outputDebugString ( "MTA:DayZ Simplified | pickups end" )