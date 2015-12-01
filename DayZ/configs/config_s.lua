--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]


outputDebugString ( "MTA:DayZ Simplified | config_s loaded" )
    -- Game Type
	GameType = "DayZ Simplified"

    -- //Info the acctions\\
	shownInfos = {}
	shownInfos["nomag"] = "No magazines left for this weapon!"
	shownInfos["youconsumed"] = "You consumed"
	shownInfos["needwatersource"] = "You have to be inside a body of water!"
	shownInfos["filledup"] = "You filled your Water Bottle up!"
	shownInfos["noradio"] = "You have no Radio Device!"
	
	--//Variables to server-side\\
    gameplayVariables = {}
	gameplayVariables["zombieblood"] = 1 -- Zombie Blood/Health - DEFAULT: 6000
	gameplayVariables["foodrestore"] = math.random(40,100) -- Amount of hunger to be restored when eating - DEFAULT: math.random(40,100) - FOR FULL RESTORE, JUST WRITE 100
	gameplayVariables["thirstrestore"] = math.random(40,100) -- Amount of hunger to be restored when drinking - DEFAULT: math.random(40,100) - FOR FULL RESTORE, JUST WRITE 100
	gameplayVariables["loseHunger"] = -1.5 -- Amount of losing hunger per minute - DEFAULT: -1.5
	gameplayVariables["loseThirst"] = -1.5 -- Amount of losing thirst per minute - DEFAULT: -1.5
	gameplayVariables["playerzombies"] = 6 -- Amount of spawning zombies per player - DEFAULT: 6 - THE HIGHER THIS VALUE, THE MORE LAG CAN OCCUR!
	gameplayVariables["amountzombies"] = 3 -- Amount of zombies - DEFAULT: 3 - THE HIGHER THIS VALUE, THE MORE LAG CAN OCCUR!
	gameplayVariables["temperaturewater"] = -0.01 -- Amount of temperature to be lost when in water - DEFAULT: -0.01
	gameplayVariables["temperaturesprint"] = 0.005 -- Amount of temperature to be gained when sprinting - DEFAULT: 0.005
	gameplayVariables["sprintthirst"] = -0.2 -- Amount of losing thirst when sprinting - DEFAULT: -0.2
	gameplayVariables["enablenight"] = true -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_client.lua too.
	gameplayVariables["itemrespawntimer"] = 14400000 -- Number of milliseconds that should elapse before the items will respawn. Note: You can also just do 14400000/2 to make it the half from the current (division).
    -- //Backup setings\\
	gameplayVariables["backupenabled"] = true -- Whether or not backup should be enabled. Backup = saves all tents, accounts & vehicles. - DEFAULT: true - Set to false to disable backup.
	gameplayVariables["backupinterval"] = 86400000 -- Number of milliseconds that should elapse before backup. Minimum: 50. - 1000 milliseconds = 1 second. - DEFAULT: 86400000 (= 24 hours)


-- List item;

-- Primary Weapon
weapon_primary_m4 = "M4A1"
weapon_primary_sniper = "M107"
weapon_primary_shotgun = "Shotgun"
weapon_primary_spaz12 = "SPAZ-12"
weapon_primary_sawnoff = "Sawn-Off"
weapon_primary_ak47 = "AK-47"
weapon_primary_contryrifle = "Rifle"

-- Secondary Weapon

weapon_secondary_pistol = "Pistol"
weapon_secondary_sdpistol = "Pistol SD"
weapon_secondary_uzi = "Uzi"
weapon_secondary_mp5 = "MP5"
weapon_secondary_deserteagle = "Desert Eagle"

-- Weapon Melee

weapon_melee_knife = "Knife"
weapon_melee_katana = "Katana"
weapon_melee_baseball = "Baseball Bat"
weapon_melee_shovel = "Shovel"
weapon_melee_golf = "Golf Club"



-- Specially Weapon
weapon_specially_parachute = "Parachute"
weapon_specially_teargas = "Tear Gas"
weapon_specially_grenade = "Grenade"
weapon_specially_binoculares = "Binoculars"


-- Weapon ammo 

weapon_ammo_pistol = "Pistol AMMO"
weapon_ammo_sdpistol = "Pistol SD AMMO"
weapon_ammo_deserteagle = "Desert Eagle AMMO"
weapon_ammo_uzi = "Uzi AMMO"
weapon_ammo_mp5 = "MP5 AMMO"
weapon_ammo_ak = "AK47 AMMO"
weapon_ammo_m4 = "M4A1 AMMO"
weapon_ammo_shotgun = "Shotgun AMMO"
weapon_ammo_sawnoff = "Sawn-off AMMO"
weapon_ammo_spaz12 = "SPAZ-12 AMMO"
weapon_ammo_sniper = "M107 AMMO"
weapon_ammo_contryrifle = "Rifle AMMO"


-- Food

Item_food_waterbottle = "Water Bottle"
Item_food_pastacan = "Pasta"
Item_food_beanscan = "Beans"
Item_food_burger = "Burger"
Item_food_pizza = "Pizza"
Item_food_Soda = "Soda"
Item_food_milk = "Milk"
Item_food_coockedmeat = "Coocked Meat"


-- Medic

Item_medic_bandage = "Bandage"
Item_medic_medickit = "Medic Kit"
Item_medic_heatpack = "Heat-Pack"
Item_medic_painkiller ="Painkiller"
Item_medic_morphine = "Morphine"
Item_medic_bloodbag = "Blood Bag"



Item_woodpile = "Wood Pile" 
Item_wirefence = "Wire Fence"
Item_emptygascanister = "Empty Gas Canister"
Item_fullgascanister = "Full Gas Canister"
Item_roadflare = "RoadFlare"
Item_rawmeat = "Raw Meat"
Item_tent = "Tent"
Item_emptywaterbottle = "Empty Water Bottle"
Item_emptysoda = "Empty Soda"
Item_scruffyburgers = "Scruff Burgers"

-- Car parts
Item_car_tire = "Tire"
Item_car_engine = "Engine"

-- Skins
Item_skin_camo = "Camo Skin"
Item_skin_civilian = "Civilian Skin"
Item_skin_Survivor = "Survivor Skin"
Item_skin_ghilliesuit = "Ghillie Suit Skin"



-- Item Toolbelt

Item_toolbelt_ng_goggles = "Night Vision Goggles"
Item_toolbelt_infrared = "Infrared Goggles"
Item_toolbelt_map = "Map"
Item_toolbelt_matches = "Matches"
Item_toolbelt_watch = "Watch"
Item_toolbelt_gps = "GPS"
Item_toolbelt_toolbox = "Toolbox"
Item_toolbelt_radiodevice = "Radio"

-- End list item;




	
	
	
-- One tabel for save all item in the tent, car, players. :P
	
tabelALL = {
-- VALUE THE PLAYERS (Cars end tents no save the value)
{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"food"},
{"thirst"},
{"temperature"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
{"cold"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
-- END VALUE
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
{Item_toolbelt_radiodevice},
	
	
}
	
	
	
	
	-- Pickups List

itemTable = {
----------------------
["farm"] = {
{Item_woodpile,1463,0.4,0,13},
{Item_medic_bandage,1578,0.5,0,4},
{Item_food_waterbottle,2683,1,0,6},
{Item_food_pastacan,2770,1,0,6},
{Item_food_beanscan,2601,1,0,6},
{Item_food_burger,2768,1,0,6},
{Item_emptysoda,2673,0.5,0,12},
{Item_scruffyburgers,2675,0.5,0,12},
{Item_food_Soda,2647,1,0,9},
{Item_emptygascanister,1650,1,0,10},
{weapon_melee_knife,335,1,90,4},
{Item_toolbelt_matches,328,0.4,90,8},
{weapon_secondary_deserteagle,348,1,90,0.2},
{Item_medic_morphine,1579,1,0,4},
{Item_tent,1279,1,0,0.5},
{weapon_secondary_pistol,346,1,90,4},
{Item_medic_painkiller,2709,3,0,3.5},
{weapon_primary_contryrifle,357,1,90,0.3},
{weapon_primary_shotgun,349,1,90,0.3},
{Item_car_tire,1073,1,0,2},
{Item_skin_civilian,1241,2,0,2.5},
{Item_toolbelt_map,1277,0.8,90,6},
{Item_toolbelt_gps,2976,0.15,0,2},
},
----------------------
["residential"] = {
{Item_toolbelt_matches,328,0.4,90,5},
{Item_woodpile,1463,0.4,0,5},
{weapon_secondary_pistol,346,1,90,1.5},
{weapon_secondary_sdpistol,347,1,90,1.9},
{weapon_primary_shotgun,349,1,90,0.1},
{weapon_secondary_uzi,352,1,90,1},
{weapon_melee_knife,335,1,90,3},
{weapon_melee_katana,339,1,90,1},
{Item_food_pizza,1582,1,0,7},
{Item_food_Soda,2647,1,0,7},
{Item_emptygascanister,1650,1,0,9},
{Item_roadflare,324,1,90,9},
{Item_food_milk,2856,1,0,7},
{"Assault Pack (ACU)",3026,1,0,6},
{Item_medic_painkiller,2709,3,0,7},
{Item_emptysoda,2673,0.5,0,12},
{Item_scruffyburgers,2675,0.5,0,12},
{weapon_specially_grenade,342,1,0,0.01},
{weapon_secondary_deserteagle,348,1,90,0.4},
{weapon_primary_sawnoff,350,1,90,0.3},
{weapon_primary_spaz12,351,1,90,0.4},
{weapon_secondary_mp5,353,1,90,0.4},
{Item_toolbelt_watch,2710,1,0,3},
{Item_medic_heatpack,1576,5,0,6},
{Item_wirefence,933,0.25,0,1},
{weapon_primary_contryrifle,357,1,90,0.3},
{"Alice Pack",1248,1,0,1.5},
{Item_car_tire,1073,1,0,1},
{Item_medic_morphine,1579,1,0,2},
{Item_skin_civilian,1241,2,0,9},
{Item_toolbelt_map,1277,0.8,90,10},
{Item_toolbelt_gps,2976,0.15,0,3},
{Item_food_pastacan,2770,1,0,7},
{Item_food_beanscan,2601,1,0,7},
--{"TEC-9",372,1,90,0},
{Item_food_burger,2768,1,0,7},
{weapon_melee_golf,333,1,90,3},
{weapon_melee_baseball,336,1,90,3},
{weapon_melee_shovel,337,1,90,3},
},
----------------------
["military"] = {
{Item_toolbelt_matches,328,0.4,90,2},
{weapon_secondary_pistol,346,1,90,5},
{weapon_secondary_sdpistol,347,1,90,4},
{weapon_primary_shotgun,349,1,90,3},
{weapon_secondary_uzi,352,1,90,4},
{weapon_melee_knife,335,1,90,2.4},
{weapon_melee_katana,339,1,90,2.1},
{Item_food_pizza,1582,1,0,2},
{Item_food_Soda,2647,1,0,2},
{Item_emptygascanister,1650,1,0,4},
{Item_roadflare,324,1,90,4},
{Item_food_milk,2856,1,0,1},
{Item_medic_painkiller,2709,3,0,4},
{Item_emptysoda,2673,0.5,0,12},
{Item_scruffyburgers,2675,0.5,0,12},
{weapon_specially_grenade,342,1,0,0.5},
{weapon_primary_sawnoff,350,1,90,2.3},
{weapon_primary_spaz12,351,1,90,2.3},
{weapon_secondary_mp5,353,1,90,2.8},
{Item_toolbelt_watch,2710,1,0,4},
{Item_medic_heatpack,1576,5,0,3},
{Item_wirefence,933,0.25,0,1},
{weapon_primary_contryrifle,357,1,90,3.5},
{"Alice Pack",1248,1,0,4},
{Item_toolbelt_ng_goggles,368,1,90,4},
{weapon_specially_binoculares,369,1,0,4},
{Item_car_tire,1073,1,0,2},
{Item_medic_morphine,1579,1,0,4},
{Item_skin_camo,1247,2,0,4.5},
{Item_skin_civilian,1241,2,0,3},
--{"TEC-9",372,1,90,3},
{weapon_primary_ak47,355,1,90,3.8},
{Item_toolbelt_gps,2976,0.15,0,3},
{Item_toolbelt_map,1277,0.8,90,7},
{Item_toolbelt_toolbox,2969,0.5,0,1},
{Item_car_engine,929,0.3,0,2},
{Item_tent,1279,1,0,4.5},
{Item_skin_ghilliesuit,1213,2,0,0.3},
{weapon_primary_m4,356,1,90,2.4},
{weapon_primary_sniper,358,1,90,0.4},
{Item_toolbelt_infrared,369,1,90,3},
{"Assault Pack (ACU)",3026,1,0,5},
{"Czech Backpack",1239,1,0,2}, 
{Item_toolbelt_radiodevice,330,1,0,6},
{"Coyote Backpack",1252,1,0,0.9},
--{"Thermal GPS",2976,0.2,0,4},
--{"GPS Jammer",2976,0.2,0,3},
{weapon_melee_shovel,337,1,90,1},
},
----------------------
["industrial"] = {
{Item_wirefence,933,0.25,0,7},
{Item_toolbelt_toolbox,2969,0.5,0,3},
{Item_car_tire,1073,1,0,4},
{Item_car_engine,929,0.3,0,3.5},
{weapon_primary_shotgun,349,1,90,3},
{Item_food_waterbottle,2683,1,0,4},
{Item_food_pastacan,2770,1,0,4},
{Item_food_beanscan,2601,1,0,4},
{Item_food_burger,2768,1,0,4},
{Item_emptysoda,2673,0.5,0,12},
{Item_scruffyburgers,2675,0.5,0,10},
{Item_food_Soda,2647,1,0,4},
{Item_emptygascanister,1650,1,0,6},
{Item_fullgascanister,1650,1,0,1.5},
{Item_toolbelt_map,1277,0.8,90,3},
{Item_toolbelt_watch,2710,1,0,2},
{Item_toolbelt_matches,328,0.4,90,5},
{Item_woodpile,1463,0.4,0,2},
{weapon_secondary_pistol,346,1,90,1.5},
{weapon_secondary_uzi,352,1,90,2},
{weapon_melee_knife,335,1,90,2},
{weapon_melee_katana,339,1,90,1.5},
{Item_food_pizza,1582,1,0,4},
{Item_roadflare,324,1,90,5},
{Item_food_milk,2856,1,0,4},
{"Assault Pack (ACU)",3026,1,0,6},
{"Coyote Backpack",1252,1,0,0.5},
{Item_toolbelt_radiodevice,330,1,0,6},
--{"Thermal GPS",2976,0.2,0,1},
--{"GPS Jammer",2976,0.2,0,1},
{weapon_melee_golf,333,1,90,1.5},
{weapon_melee_baseball,336,1,90,1.5},
{weapon_melee_shovel,337,1,90,1.5},
{Item_toolbelt_ng_goggles,368,1,90,1.5},
},
----------------------
["supermarket"] = {
{Item_rawmeat,2804,0.5,90,8},
{Item_toolbelt_matches,328,0.4,90,5},
{Item_woodpile,1463,0.4,0,5},
{weapon_secondary_pistol,346,1,90,3.5},
{weapon_secondary_uzi,352,1,90,2},
{weapon_melee_knife,335,1,90,3},
{weapon_melee_katana,339,1,90,2.1},
{Item_food_pizza,1582,1,0,7},
{Item_food_Soda,2647,1,0,7},
{Item_emptygascanister,1650,1,0,5},
{Item_roadflare,324,1,90,6},
{Item_food_milk,2856,1,0,7},
{"Assault Pack (ACU)",3026,1,0,6},
{Item_food_pastacan,2770,1,0,7},
{Item_food_beanscan,2601,1,0,7},
{Item_food_burger,2768,1,0,7},
{Item_medic_painkiller,2709,3,0,7},
{Item_emptysoda,2673,0.5,0,12},
{Item_scruffyburgers,2675,0.5,0,12},
{weapon_secondary_mp5,353,1,90,0.5},
{Item_toolbelt_watch,2710,1,0,3},
{Item_medic_heatpack,1576,5,0,6},
{Item_wirefence,933,0.25,0,1},
{weapon_primary_contryrifle,357,1,90,0.2},
{"Alice Pack",1248,1,0,0.5},
{Item_car_tire,1073,1,0,1},
{Item_medic_morphine,1579,1,0,2},
{Item_skin_civilian,1241,2,0,3.5},
{Item_toolbelt_map,1277,0.8,90,4},
{Item_toolbelt_gps,2976,0.15,0,1},
{Item_toolbelt_radiodevice,330,1,0,6},
{weapon_melee_golf,333,1,90,1.9},
{weapon_melee_baseball,336,1,90,1.4},
{weapon_melee_shovel,337,1,90,0.3},
},
["other"] = {
{Item_rawmeat,2804,0.5,90},
{Item_food_coockedmeat,2806,0.5,90},
{Item_fullgascanister,1650,1,0},
{Item_emptywaterbottle,2683,1,0},
{Item_skin_Survivor,1577,2,0},
{Item_toolbelt_ng_goggles,368,1,90},
{Item_toolbelt_infrared,369,1,90},
{weapon_ammo_shotgun,2358,2,0},
{weapon_ammo_sawnoff,2358,2,0},
{weapon_ammo_spaz12,2358,2,0},
{weapon_ammo_mp5,2358,2,0},
{weapon_ammo_ak,1271,2,0},
{weapon_ammo_m4,1271,2,0},
{weapon_ammo_pistol,3013,2,0},
{weapon_ammo_sdpistol,3013,2,0},
{weapon_ammo_deserteagle,3013,2,0},
--{"M136 Rocket",3082,0.7,90},
{weapon_ammo_sniper,2358,2,0},
{weapon_ammo_contryrifle,2358,2,0},
{weapon_ammo_uzi,2041,2,0},
{weapon_ammo_mp5,2041,2,0},
{Item_toolbelt_matches,328,0.4,90,5},
{Item_woodpile,1463,0.4,0,5},
{weapon_secondary_pistol,346,1,90,3.5},
{weapon_secondary_uzi,352,1,90,2},
{weapon_melee_knife,335,1,90,2.5},
{weapon_melee_katana,339,1,90,1.8},
{Item_food_pizza,1582,1,0,7},
{Item_food_Soda,2647,1,0,7},
{Item_emptygascanister,1650,1,0,5},
{Item_roadflare,324,1,90,6},
{Item_food_milk,2856,1,0,5},
{"Assault Pack (ACU)",3026,1,0,6},
{Item_medic_painkiller,2709,3,0,7},
{Item_emptysoda,2673,0.5,0,12},
{Item_scruffyburgers,2675,0.5,0,12},
{weapon_secondary_mp5,353,1,90,1.5},
{Item_toolbelt_watch,2710,1,0,3},
{Item_medic_heatpack,1576,5,0,6},
{Item_wirefence,933,0.25,0,1},
{weapon_primary_contryrifle,357,1,90,1.5},
{"Alice Pack",1248,1,0,1.5},
{"Coyote Backpack",1252,1,0,0.7},
{Item_car_tire,1073,1,0,1},
{Item_medic_morphine,1579,1,0,2},
{Item_skin_civilian,1241,2,0,3.5},
{Item_toolbelt_map,1277,0.8,90,4},
{Item_toolbelt_toolbox,2969,0.5,0,3},
{Item_car_engine,929,0.3,0,3.5},
{weapon_primary_shotgun,349,1,90,2},
{Item_food_waterbottle,2683,1,0,4},
{weapon_secondary_sdpistol,347,1,90,5},
{weapon_specially_grenade,342,1,0,0.5},
{weapon_primary_sawnoff,350,1,90,2},
{weapon_primary_spaz12,351,1,90,1.9},
{weapon_specially_binoculares,369,1,0,4},
{Item_skin_camo,1247,2,0,4.5},
--{"TEC-9",372,1,90,4},
{weapon_primary_ak47,355,1,90,0.9},
{"M136 Rocket Launcher",359,1,90,0},
{Item_skin_ghilliesuit,1213,2,0,0.01},
{weapon_primary_m4,356,1,90,0.9},
{weapon_primary_sniper,358,1,90,0.3},
{"Heat-Seeking RPG",360,1,90,0},
{Item_medic_bandage,1578,0.5,0,4},
{Item_food_pastacan,2770,1,0,5},
{Item_food_beanscan,2601,1,0,6},
{Item_food_burger,2768,1,0,2},
{Item_tent,1279,1,0,0.5},
{weapon_secondary_pistol,346,1,90,3},
{weapon_secondary_deserteagle,348,1,90,3},
{Item_toolbelt_gps,2976,0.15,0,1},
{Item_medic_medickit,2891,2.2,0},
{Item_medic_bloodbag,1580,1,0},
{Item_toolbelt_radiodevice,2966,0.5,0,5},
--{"Radio Amplifier",330,1,0,6},
--{"Thermal GPS",2976,0.2,0,1},
--{"GPS Jammer",2976,0.2,0,2},
{weapon_melee_golf,333,1,90,1.9},
{weapon_melee_baseball,336,1,90,1.4},
{weapon_melee_shovel,337,1,90,1.5},
},
}	
	
	
	outputDebugString ( "MTA:DayZ Simplified | config_s end" )
	
	
	
	
	
	
	
	
	
	
	
	
	
