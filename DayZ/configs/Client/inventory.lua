--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]


outputDebugString ( "MTA:DayZ Simplified | inventory loaded" )

inventoryItems = {
["Weapons"] = {
["Primary Weapon"] = {
-- [ID:0000016 - New names for weapons] //L
{weapon_primary_m4,3},
{weapon_primary_sniper,3},
{weapon_primary_shotgun,3},
{weapon_primary_spaz12,3},
{weapon_primary_sawnoff,3},
{weapon_primary_ak47,3},
--{"Heat-Seeking RPG",5},
--{"M136 Rocket Launcher",5},
{weapon_primary_contryrifle,3},
},
["Secondary Weapon"] = {
-- [ID:0000016 - New names for weapons] //L
{weapon_secondary_pistol,2},
{weapon_secondary_sdpistol,2},
{weapon_secondary_uzi,2},
--{"TEC-9",2}, -- Removed TEC-9 as part of [ID:0000016 - New names for weapons] //L
{weapon_secondary_mp5,3},
{weapon_secondary_deserteagle,2},
{weapon_melee_knife,1},
{weapon_melee_katana,2},
-- [ID:0000018 - Melee Weapons + decrease spawning rate for ranged weapons] //L
{weapon_melee_baseball,2},
{weapon_melee_shovel,2},
{weapon_melee_golf,2},

},
["Specially Weapon"] = {
{weapon_specially_parachute,1},
{weapon_specially_teargas,1},
{weapon_specially_grenade,1},
{weapon_specially_binoculares,1} -- [ID:0000006 - Binoculars] //L
},
},
["Ammo"] = {

--[ID:0000015 - Clips/magazines for weapons] //L
{weapon_ammo_pistol,0.085},
{weapon_ammo_sdpistol,0.085},
{weapon_ammo_deserteagle,0.085},
{weapon_ammo_uzi,0.025},
{weapon_ammo_mp5,0.025},
{weapon_ammo_ak,0.035},
{weapon_ammo_m4,0.035},
{weapon_ammo_shotgun,0.067},
{weapon_ammo_sawnoff,0.067},
{weapon_ammo_spaz12,0.067},
{weapon_ammo_sniper,0.1},
{weapon_ammo_contryrifle,0.1},
--{"M136 Rocket",2},


--[[
-- Reference Material for future Ammo!
{"Rocket Ammo",2},
{"Sniper Ammo",0.1},
{"Smg Ammo",0.025},
{"Assault Ammo",0.035},
{"Pistol Ammo",0.085},
{"Shotgun Ammo",0.067},

]]--


},
["Food"] = {
{Item_food_waterbottle,1},
{Item_food_pastacan,1},
{Item_food_beanscan,1},
{Item_food_burger,1},
{Item_food_pizza,1},
{Item_food_Soda,1},
{Item_food_milk,1},
{Item_food_coockedmeat,1},
},
["Items"] = {
{Item_woodpile,2}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_medic_bandage,1,"Bandage yourself"},
{Item_medic_medickit,2,"Use"},
{Item_medic_heatpack,1,"Use"},
{Item_medic_painkiller,1,"Use"},
{Item_medic_morphine,1,"Use"},
{Item_medic_bloodbag,1,"Use"},
{Item_wirefence,1,"Build a wire fence"},
{Item_emptygascanister,2}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_fullgascanister,2}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_roadflare,1,"Place"},
{Item_rawmeat,1},
{Item_car_tire,2},
{Item_car_engine,5},
{Item_car_parts,3},
{Item_tent,3,"Pitch a tent"},
{Item_skin_camo,1,"Put clothes on"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_skin_civilian,1,"Put clothes on"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_skin_Survivor,1,"Put clothes on"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_skin_ghilliesuit,1,"Put clothes on"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{Item_emptywaterbottle,1,"Fill bottle up"}, 
{Item_emptysoda,1},
{Item_scruffyburgers,1},
{"Assault Pack (ACU)",1},
{"Alice Pack",1},
{"Czech Backpack",1},
{"Coyote Backpack",1},
},
["Toolbelt"] = {
{Item_toolbelt_ng_goggles,1},
{Item_toolbelt_infrared,1},
{Item_toolbelt_map,1},
{Item_toolbelt_matches,1,"Make a Fire"}, -- [ID:	0000005 - Several grammar + spelling mistakes and typos] //L
{Item_toolbelt_watch,1},
{Item_toolbelt_gps,1,"Set Rate"},
{Item_toolbelt_toolbox,1},
{Item_toolbelt_radiodevice,1},


},
}


------------------------------------------------------------------------------
--INVENTORY
local headline = {}
local gridlistItems = {}
local buttonItems = {}


inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true) 



headline["loot"] = guiCreateLabel(0.06, 0.05, 0.34, 0.09,"GEAR",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["loot"],"center")
guiSetFont (headline["loot"], "default-bold-small" )

headline["inventory"] = guiCreateLabel(0.60, 0.05, 0.34, 0.09,"INVENTORY",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["inventory"],"center")
guiSetFont (headline["inventory"], "default-bold-small" )

gridlistItems["loot"] = guiCreateGridList (0.03, 0.10, 0.39, 0.83,true,inventoryWindows)
gridlistItems["loot_colum"] = guiGridListAddColumn( gridlistItems["loot"], "Loot", 0.7 )
gridlistItems["loot_colum_amount"] = guiGridListAddColumn( gridlistItems["loot"], "", 0.2 )

gridlistItems["inventory"] = guiCreateGridList (0.57, 0.11, 0.39, 0.83,true,inventoryWindows)
gridlistItems["inventory_colum"] = guiGridListAddColumn( gridlistItems["inventory"], "Inventory", 0.7 )
gridlistItems["inventory_colum_amount"] = guiGridListAddColumn( gridlistItems["inventory"], "", 0.2 )

buttonItems["loot"] = guiCreateButton(0.42, 0.17, 0.04, 0.69, "->", true,inventoryWindows)
buttonItems["inventory"] = guiCreateButton(0.53, 0.17, 0.04, 0.69, "<-", true,inventoryWindows)

headline["slots"] = guiCreateLabel(0.62, 0.94, 0.29, 0.04,"SLOTS:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots"],"center")
guiLabelSetVerticalAlign (headline["slots"],"center")
guiSetFont (headline["slots"], "default-bold" )

headline["slots_loot"] = guiCreateLabel(0.07, 0.94, 0.29, 0.04,"SLOTS:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots_loot"],"center")
guiLabelSetVerticalAlign (headline["slots_loot"],"center")
guiSetFont (headline["slots_loot"], "default-bold-small" )

guiSetVisible(inventoryWindows,false)

function showInventory (key,keyState)
if getElementData(getLocalPlayer(),"logedin") then
	if ( keyState == "down" ) then
		guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) == true then
			onClientOpenInventoryStopMenu ()
		else
			hideRightClickInventoryMenu ()
		end
		if isPlayerInLoot() then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = getElementData(getLocalPlayer(),"lootname")
			refreshLoot(col,gearName)
		end
	end
end	
end
bindKey ( "j", "down", showInventory )

function showInventoryManual ()
		guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) == true then
			onClientOpenInventoryStopMenu ()
		end
end

function hideInventoryManual ()
		guiSetVisible(inventoryWindows,false)
		showCursor(false)
		hideRightClickInventoryMenu ()
end
addEvent("hideInventoryManual",true)
addEventHandler("hideInventoryManual",getLocalPlayer(),hideInventoryManual)

function refreshInventoryManual ()
		refreshInventory()
end
addEvent("refreshInventoryManual",true)
addEventHandler("refreshInventoryManual",getLocalPlayer(),refreshInventoryManual)

function refreshLootManual (loot)
		refreshLoot(loot)
end
addEvent("refreshLootManual",true)
addEventHandler("refreshLootManual",getLocalPlayer(),refreshLootManual)

function refreshInventory()
if ( gridlistItems["inventory_colum"] ) then 
	row1,column1 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
	guiGridListClear(gridlistItems["inventory"])
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			--guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"ITEMS", false, false )
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"PRIMARY WEAPON", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"SECONDARY WEAPON", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"SPECIAL WEAPON", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"AMMO", true, false )
		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"FOOD & DRINKS", true, false )
		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"MISC.", true, false )
		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"TOOLBELT", true, false )
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
		if row1 and column1 then
			guiGridListSetSelectedItem ( gridlistItems["inventory"], row1,column1)
		end
		guiSetText(headline["slots"],"SLOTS: "..getPlayerCurrentSlots().."/"..getPlayerMaxAviableSlots()) -- [ID:0000014 - Remodel Inventory] //L
	end
end

function refreshLoot(loot,gearName)
if loot == false then
	guiGridListClear(gridlistItems["loot"])
	guiSetText(headline["loot"],"Empty")
	return
end
if ( gridlistItems["loot_colum"] ) then
	row2,column2 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
	guiGridListClear(gridlistItems["loot"])
	if gearName then
		guiSetText(headline["loot"],gearName)
	end	
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Weapons", true, false ) -- [ID:0000014 - Remodel Inventory] //L
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"PRIMARY WEAPON", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
				local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"SECONDARY WEAPON", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"SPECIAL WEAPON", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"AMMO", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"FOOD & DRINKS", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"MISC.", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"TOOLBELT", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end

		if row2 and column2 then
			guiGridListSetSelectedItem ( gridlistItems["loot"], row2,column2)
		end
		guiSetText(headline["slots_loot"],"SLOTS: "..getLootCurrentSlots(loot).."/"..(getLootMaxAviableSlots(loot)or 0)) -- [ID:0000014 - Remodel Inventory] //L
	end
end


function getPlayerMaxAviableSlots()
return getElementData(getLocalPlayer(),"MAX_Slots")
end

function getLootMaxAviableSlots(loot)
return getElementData(loot,"MAX_Slots")
end

function getPlayerCurrentSlots()
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	return math.floor(current_SLOTS)
end


function getLootCurrentSlots(loot)
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	return math.floor(current_SLOTS)
end

function getItemSlots(itema)
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if itema == item[1] then 
			return item[2]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if itema == item[1] then 
			return item[2]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if itema == item[1] then 
			return item[2]
		end
	end	
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	return false
end

function isToolbeltItem(itema)
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Toolbelt"]) do
		if itema == item[1] then 
			return true
		end
	end	
	return false
end

vehicleAddonsInfo = {
-- {Model ID, Tires, Engine}
{422,4,1},
{470,4,1},
{468,2,1},
{433,6,1},
{437,6,1},
{509,0,0},
{487,0,1},
{497,0,1},
{453,0,1},
}

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2],veh[3]
		end
	end
end

--OTHER ITEM STUFF
vehicleFuelTable = {
-- {Model ID, Max Fuel}
{422,80},
{470,100},
{468,30},
{433,140},
{437,140},
{509,0},
{487,60},
{497,60},
{453,60},
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





function onPlayerMoveItemOutOfInventory ()
if playerMovedInInventory then startRollMessage2("Inventory", "Abusing exploits will result in a ban!", 255, 22, 0 ) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
	if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
		if isPlayerInLoot() then
			local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
			local isTent = getElementData(isPlayerInLoot(),"tent")
			if isVehicle and not isTent then
				local veh = getElementData(isPlayerInLoot(),"parent")
				local tires,engine = getVehicleAddonInfos (getElementModel(veh))
				if itemName == Item_car_tire and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or
				   itemName == Item_car_engine and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or
				   itemName == Item_car_parts and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0)  < engine then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName.."_inVehicle",isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				elseif isToolbeltItem(itemName) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				else
					startRollMessage2("Inventory", languageTextTable[languageCode]["mensageinventory"], 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
					return
				end
			elseif isToolbeltItem(itemName) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())	
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
			elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
				triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
				playerMovedInInventory = true
					setTimer(function()
					playerMovedInInventory = false
				end,700,1)
			else
				startRollMessage2("Inventory", languageTextTable[languageCode]["mensageinventory"], 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
				return
			end	
		else
			triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
			playerMovedInInventory = true
			setTimer(function()
				playerMovedInInventory = false
			end,700,1)
		end	
	end
	local gearName = guiGetText(headline["loot"])
	local col = getElementData(getLocalPlayer(),"currentCol")
	setTimer(refreshInventory,200,2)
	if isPlayerInLoot() then
		setTimer(refreshLoot,200,2,col,gearName)
	end
end
addEventHandler ( "onClientGUIClick", buttonItems["inventory"], onPlayerMoveItemOutOfInventory )










--[ID:0000015 - Clips/magazines for weapons] //L
function onPlayerMoveItemOutOFInventory (itemName,loot)
local itemPlus = 1
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
elseif itemName == "M136 Rocket" then
	itemPlus = 0
elseif itemName == weapon_primary_m4 or itemName == weapon_primary_ak47 or itemName == weapon_primary_sniper or itemName == weapon_primary_shotgun or itemName == weapon_primary_spaz12 or itemName == weapon_primary_sawnoff or itemName == "Heat-Seeking RPG" or itemName == "M136 Rocket Launcher" or itemName == weapon_primary_contryrifle then
	triggerServerEvent("removeBackWeaponOnDrop",getLocalPlayer())
end
if loot then 
if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
	if itemName == Item_fullgascanister then 
		if getElementData(loot,"fuel")+20 < getVehicleMaxFuel(loot) then
			addingfuel = 20
		elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuel(loot)+15 then
			triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","The tank is full!",255,22,0) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
			return
		else
			addingfuel = getVehicleMaxFuel(loot)-getElementData(loot,"fuel")
		end
		setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
		setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
		setElementData(getLocalPlayer(),Item_emptygascanister,(getElementData(getLocalPlayer(),Item_emptygascanister) or 0)+itemPlus) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Filled gas into vehicle!",22,255,0) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		return
	end
end
end
itemName2 = itemName
if itemName == "Tire_inVehicle" then 
   itemName2 = Item_car_tire
 end
 
if itemName == "Engine_inVehicle" then
   itemName2 = Item_car_engine
end

if itemName == "Parts_inVehicle" then
   itemName2 = Item_car_parts
end

if (getElementData(getLocalPlayer(),itemName2) or 0)/itemPlus < 1 then
	triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Can't drop this!",255,22,0) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
return
end
	if loot then
		setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+1)
		local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
			end	
		if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
		end
	else
		triggerServerEvent("playerDropAItem",getLocalPlayer(),itemName)
	end
	if itemName == "Tire_inVehicle" then itemName = Item_car_tire end
	if itemName == "Engine_inVehicle" then itemName = Item_car_engine end
	if itemName == "Parts_inVehicle" then itemName = Item_car_parts end
	setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
	if loot and getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )

function onPlayerMoveItemInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["loot"], guiGridListGetSelectedItem ( gridlistItems["loot"] ), 1 )
if isPlayerInLoot() then
	if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
		if not isToolbeltItem(itemName) then
			if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
				if not playerMovedInInventory then
					triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				else
					startRollMessage2("Inventory", "Abusing exploits will result in a ban!", 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
					return
				end	
			else
				startRollMessage2("Inventory", languageTextTable[languageCode]["mensageinventory"], 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
				return
			end
		else
			playerMovedInInventory = true
			setTimer(function()
				playerMovedInInventory = false
			end,700,1)
			triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
		end
	end
	if isPlayerInLoot() then
		local gearName = guiGetText(headline["loot"])
		local col = getElementData(getLocalPlayer(),"currentCol")
		setTimer(refreshInventory,200,2)
		setTimer(refreshLoot,200,2,col,gearName)
	end
end	
end
addEventHandler ( "onClientGUIClick", buttonItems["loot"], onPlayerMoveItemInInventory )


--[ID:0000015 - Clips/magazines for weapons] //L
function onPlayerMoveItemInInventory (itemName,loot)
local itemPlus = 1
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
elseif itemName == "M136 Rocket" then
	itemPlus = 0
elseif itemName == "Assault Pack (ACU)" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 12 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 12 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",12)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Alice Pack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 16 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 16 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",16)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Czech Backpack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 26 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 26 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",26)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
elseif itemName == "Coyote Backpack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 36 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You already have the best backpack!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",36)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
end
	if loot then
		--if itemPlus > (getElementData(loot,itemName) or 0) then
			--itemPlus = getElementData(loot,itemName) 
		--end
			setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)+itemPlus) 
			if itemPlus == 0 then
				setElementData(loot,itemName,getElementData(loot,itemName)-0)
			else
				setElementData(loot,itemName,getElementData(loot,itemName)-1)
			end
			local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
			end
	end
	if getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemInInventory", true )
addEventHandler( "onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory )

function onClientOpenInventoryStopMenu ()
triggerEvent("disableMenu",getLocalPlayer())
end

function isPlayerInLoot()
if getElementData(getLocalPlayer(),"loot") then
	return getElementData(getLocalPlayer(),"currentCol")
end
return false
end


------------------------------------------------------------------------------
--right-click menu
function onPlayerPressRightKeyInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName)
	if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
		if itemName == Item_toolbelt_matches then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
			if getElementData(getLocalPlayer(),Item_woodpile) == 0 then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
				return
			end
		end
		if itemName == Item_medic_bandage then
			if getElementData(getLocalPlayer(),"bleeding") == 0 then
				return
			end
		end	
		if itemName == Item_medic_medickit then
			if getElementData(getLocalPlayer(),"blood") > 10500 then
				return
			end
		end	
		if itemName == Item_medic_heatpack then
			if getElementData(getLocalPlayer(),"temperature") > 35 then
				return
			end
		end	
		if itemName == Item_medic_painkiller then
			if not getElementData(getLocalPlayer(),"pain") then
				return
			end
		end	
		if itemName == Item_medic_morphine then
			if not getElementData(getLocalPlayer(),"brokenbone") then
				return
			end
		end	
		if itemName == Item_medic_bloodbag then
			--if getElementData(getLocalPlayer(),"blood") < 1150 then
				return
			--end
		end	
		showRightClickInventoryMenu (itemName,itemInfo)
	end
end
bindKey("mouse2","down",onPlayerPressRightKeyInInventory)

function getInventoryInfosForRightClickMenu(itemName)
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Equip Primary Weapon"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Equip Secondary Weapon"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Equip Special Weapon"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
	if itemName == itemInfo[1] then
		return itemName,false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Food"]) do
	if itemName == itemInfo[1] then
		if itemInfo[1] == Item_food_waterbottle or itemInfo[1] == Item_food_milk or itemInfo[1] == Item_food_Soda then
			info = "Drink"
		else
			info = "Eat"
		end
		return itemName,info
	end	
end
for i,itemInfo in ipairs(inventoryItems["Items"]) do
	if itemName == itemInfo[1] then
		return itemName,itemInfo[3] or false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Toolbelt"]) do
	if itemName == itemInfo[1] then
		return itemName,itemInfo[3] or false
	end
end
end

rightclickWindow = guiCreateStaticImage(0,0,0.05,0.0215,":DayZ/images/scrollmenu_1.png",true)
headline["rightclickmenu"] = guiCreateLabel(0,0,1,1,"",true,rightclickWindow)
guiLabelSetHorizontalAlign (headline["rightclickmenu"],"center")
guiLabelSetVerticalAlign (headline["rightclickmenu"],"center")
guiSetFont (headline["rightclickmenu"], "default-bold-small" )
guiSetVisible(rightclickWindow,false)

function showRightClickInventoryMenu (itemName,itemInfo)
	if itemInfo then
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		guiSetVisible(rightclickWindow,true)
		guiSetText(headline["rightclickmenu"],itemInfo)
		local whith = guiLabelGetTextExtent (headline["rightclickmenu"])
		guiSetPosition(rightclickWindow,screenx,screeny,true)
		local x,y = guiGetSize(rightclickWindow,false)
		guiSetSize(rightclickWindow,whith,y,false)
		guiBringToFront(rightclickWindow)
		setElementData(rightclickWindow,"iteminfo",{itemName,itemInfo})
	end
end

function hideRightClickInventoryMenu ()
	guiSetVisible(rightclickWindow,false)
end


function onPlayerClickOnRightClickMenu (button,state)
    if button == "left" then
        local itemName,itemInfo = getElementData(rightclickWindow,"iteminfo")[1],getElementData(rightclickWindow,"iteminfo")[2]
		hideRightClickInventoryMenu ()
		playerUseItem(itemName,itemInfo)
    end
end
addEventHandler("onClientGUIClick",headline["rightclickmenu"],onPlayerClickOnRightClickMenu,false)

local playerFire = {}
local fireCounter = 0
function playerUseItem(itemName,itemInfo)
	if itemInfo == "Drink" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"thirst")
	elseif itemInfo == "Eat" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"food")	
	elseif itemInfo == "Put clothes on" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerChangeSkin",getLocalPlayer(),itemName)
	elseif itemName == Item_emptywaterbottle then
		triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)		
	elseif itemName == Item_tent then
		triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
	hideInventoryManual()
	elseif itemInfo == "Build a wire fence"	then
		triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
	elseif itemName == Item_roadflare then
		triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)	
	elseif itemInfo == "Make a Fire" then
		triggerServerEvent("onPlayerMakeAFire",getLocalPlayer(),itemName)	
	elseif itemInfo == "Use" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == Item_medic_bandage then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == Item_toolbelt_gps then
	adiss15gostoso()
	elseif itemInfo == "Use Googles" then
		triggerServerEvent("onPlayerChangeView",getLocalPlayer(),itemName)	
	elseif itemInfo == "Equip Primary Weapon" then 
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1)
	elseif itemInfo == "Equip Secondary Weapon" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2)
	elseif itemInfo == "Equip Special Weapon" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3)
	--[[elseif itemInfo == "Read" then
		triggerServerEvent ("onPlayerReadMessage2",getLocalPlayer(),itemName)]]
	end

end

--[ID:0000015 - Clips/magazines for weapons] //L
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
]]


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
]]


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
]]

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
]]

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
]]


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
{weapon_specially_binoculares,43}, -- [ID:0000006 - Binoculars] //L
-- [ID:0000018 - Melee Weapons + decrease spawning rate for ranged weapons] //L
{weapon_melee_baseball,5},
{weapon_melee_shovel,6},
{weapon_melee_golf,2},
},
}

--[ID:0000015 - Clips/magazines for weapons] //L
function getWeaponAmmoType2 (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[2] then
			return weaponData[1],weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_pistol]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_pistol,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sdpistol]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_sdpistol,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_deserteagle]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_deserteagle,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_uzi]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_uzi,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_mp5]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_mp5,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_ak]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_ak,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_m4]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_m4,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_shotgun]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_shotgun,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_spaz12]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_spaz12,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sawnoff]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_sawnoff,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sniper]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_sniper,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_contryrifle]) do
		if weaponName == weaponData[2] then
			return weapon_ammo_contryrifle,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M136 Rocket"]) do
		if weaponName == weaponData[2] then
			return "M136 Rocket",weaponData[2]
		end
	end
end


function weaponSwitch (weapon)
	if source == getLocalPlayer() then
		local ammoName,_ = getWeaponAmmoType2 (weapon)
		if getElementData(getLocalPlayer(),ammoName) > 0 then
			setElementData(getLocalPlayer(),ammoName,getElementData(getLocalPlayer(),ammoName)-1)
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), weaponSwitch )


-- 	[ID:0000011 - Turn all Radio Stations off] //L
function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)




local createGUI = false

GUIEditor = {
    button = {},
    window = {},
    label = {},
    edit = {}
}


function VG_RadioChannel ()
   if getElementData(getLocalPlayer(),"logedin") then
      if getElementData(getLocalPlayer(),Item_toolbelt_gps) >= 1 then
         if render then
            guiSetVisible(GUIEditor.window[1],false)
            showCursor(false)
            render = false
         else
            guiSetVisible(GUIEditor.window[1],true)
            showCursor(true)
            render = true
         end   
      else
         outputChatBox("You do not have GPS!",getLocalPlayer(), 255, 255, 0,true)
      end   
   end   
end
function CheckClickOnGUI()
   if getElementData(getLocalPlayer(),"logedin") then
      if tonumber(guiGetText(GUIEditor.edit[1])) < 0 or tonumber(guiGetText(GUIEditor.edit[1])) > 25000 then
         outputChatBox("The frequency should be in the range from 0 to 25000",255, 255, 0,true)
         return 
      end
      setElementData(getLocalPlayer(),"GPS_frequency",guiGetText(GUIEditor.edit[1]))
      outputChatBox("GPS Frequency is set to" .. guiGetText(GUIEditor.edit[1]) .. "",255, 255, 0,true)
      guiSetVisible(GUIEditor.window[1],false)
      showCursor(false)
      render = false
end  
 end   




--GPS
playerBlibs1 = {}
amouunt1 = 0

function updateGPS2 ()
    if not getElementData(getLocalPlayer(),"logedin") then return end    
    amouunt1 = 0
    for i, blip in ipairs(playerBlibs1) do
        if isElement(blip) then
            destroyElement(blip)
        end
    end
    playerBlibs1 = {}  
   local gangname = getElementData(getLocalPlayer(),"gang")
    for i, player in ipairs(getElementsByType("player")) do
        if getElementData(localPlayer,"GPS_frequency") == getElementData(player,"GPS_frequency") and getElementData(player,"GPS_frequency") ~= 0 and getElementData(player,Item_toolbelt_gps) >= 1 and player ~= localPlayer and gangname ~= getElementData(player,"gang") then
            amouunt1 = amouunt1+1
         if getElementData(getLocalPlayer(),"logedin") then 
            playerBlibs1[amouunt1] = createBlipAttachedTo(player,0,2,255,0,0)
         end   
            setBlipVisibleDistance(playerBlibs1[amouunt1],300)
        end
    end
end
setTimer(updateGPS2,1000,0)




function adiss15gostoso()
         if createGUI == false then
            GUIEditor.window[1] = guiCreateWindow(604, 566, 155, 117, "The frequency of GPS", false)
            guiWindowSetSizable(GUIEditor.window[1], false)
            guiSetAlpha(GUIEditor.window[1], 0.98)
            GUIEditor.edit[1] = guiCreateEdit(10, 26, 134, 25, "".. getElementData(getLocalPlayer(),"GPS_frequency") or 0 .."", false, GUIEditor.window[1])
            GUIEditor.label[1] = guiCreateLabel(24, 56, 135, 17, "<From 1 to 25000> ", false, GUIEditor.window[1])
            GUIEditor.button[1] = guiCreateButton(10, 83, 136, 22, "accept", false, GUIEditor.window[1])   
            addEventHandler("onClientGUIClick", GUIEditor.button[1],CheckClickOnGUI,false)
            guiSetVisible(GUIEditor.window[1],false)
            createGUI = true
            guiSetVisible(GUIEditor.window[1],false)
         end   
         VG_RadioChannel()
         hideInventoryManual()
         showCursor(true)
		 end
		 
		 outputDebugString ( "MTA:DayZ Simplified | inventory end" )

