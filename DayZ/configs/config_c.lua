--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]

outputDebugString ( "MTA:DayZ Simplified | config_c loaded" )
-- DayZ Vision
dayzVersion = "MTA:DayZ Simplified v1.1*"



--  \\ Langugage System //


languageTextTable = {}

-- Table
languageTextTable = {
-- English (US)
["en_US"] = {
	["linguagematual"] = "English",
	["zombieskilled"] = "Zombies Killed: ",
	["headshot"] = "HeadShot: ",
	["banditskilled"] = "Bandits Killed: ",
	["murders"] = "Murders: ",
	["blood"] = "Blood: ",
	["zombies"] = "Zombies (Alive/Total): ",
	["temperature"] = "Temperature: ",
	["humanity"] = "Humanity: ",
	["nomedoplay"] = "Nickname: ",
	-- Menu-Client
	["patrolstation"] = "Press '-' or 'middle-mouse' to refill a canister!\n REQUIRED: Empty Gas Canister",
	["wirefence"] = "Press '-' or 'middle-mouse' to remove the fence!\n REQUIRED: Toolbox",
	["fireplace"] = "Press '-' or 'middle-mouse' to cook meat!\n REQUIRED: Raw Meat",
	["deadman"] = "Press J to access the gear-menu the player!",
	["item"] = "Press '-' or 'middle-mouse' to pick this item up!",
	["helicrash"] = "Press J to access the gear-menu the HeliCrash!",
	["hospitalbox"] = "Press J to access the gear-menu the HospitalBox!",
	["vehicle"] = "Press J to access the gear-menu the vehicle!",
	["itemloot"] = "Press J to access the gear-menu the loot!",
    ["tentremove"] = "You really want to remove this tent?",
    ["tentremovebutton"] = "Remove",
	["tentcancelbutton"] = "Cancel",
	["FullGasCanister"] = "You poured a gallon of gasoline!",
	["mensageinventory"] = "Inventory is full!",

   
},


-- Portuguese
["pt_BR"] = {
	["linguagematual"] = "Portugues-BR",
	["zombieskilled"] = "Zumbis Mortos: ",
	["headshot"] = "Tiro na cabeça: ",
	["banditskilled"] = "Bandidos Mortos: ",
	["murders"] = "Assasinatos: ",
	["blood"] = "Sangue: ",
	["zombies"] = "Zumbis (Vivo/Total): ",
	["temperature"] = "Temperatura: ",
	["humanity"] = "Humanidade: ",
	["nomedoplay"] = "Apelido: ",
	-- Menu-Client
	["patrolstation"] = "Pressione '-' ou 'middle-mouse' para encher o galão de gasolina!\n REQUER: Empty Gas Canister",
	["wirefence"] = "Pressione '-' ou 'middle-mouse' para remover o arame farpado\n REQUER: Toolbox",
	["fireplace"] = "Pressione '-' ou 'middle-mouse' para assar carne!\n REQUER: Raw Meat",
	["deadman"] = "Pressione J para abrir o gear do player!",
	["item"] = "Pressione '-' ou 'middle-mouse' para pegar o item do chão!",
	["helicrash"] = "Pressione J para abrir o gear do HeliCrash",
	["hospitalbox"] = "Pressione J para abrir o gear do HospitalBox!",
	["vehicle"] = "Pressione J para abrir o gear do veiculo!",
	["itemloot"] = "Pressione J para abrir o gear-menu do loot!",
	["tentremove"] = "Você realmente quer remover a tenda?",
	["tentremovebutton"] = "Remover",
	["tentcancelbutton"] = "Cancelar",
	["FullGasCanister"] = "Você encheu um galão de gasolina!",
	["mensageinventory"] = "Inventário está cheio!",
	},
	
	
	
--Russian	
["russian"] = {
 ["linguagematual"] = "Русский",
 ["zombieskilled"] = "Убийств зомби: ", 
 ["headshot"] = "Убито в голову: ", 
 ["banditskilled"] = "Убито бандитов: ", 
 ["murders"] = "Убийств: ", 
 ["blood"] = "Кровь: ", 
 ["zombies"] = "Зомби (Живых/Всего): ", 
 ["temperature"] = "Температура: ", 
 ["humanity"] = "Человечность: ", 
 ["nomedoplay"] = "Имя: ",
-- Menu-Client
 ["patrolstation"] = "Нажмите '-' or 'middle-mouse' что бы наполнить канистру!\n REQUIRED: Empty Gas Canister",
 ["wirefence"] = "Нажмите '-' или 'middle-mouse' что бы убрать колючую проволку!\n REQUIRED: Toolbox",
 ["fireplace"] = "Нажмите '-' или 'middle-mouse' что бы пожарить мяса!\n REQUIRED: Raw Meat",
 ["deadman"] = "Нажмите J что бы иследовать труп.",
 ["item"] = "Нажмите '-' или 'middle-mouse' что бы подобрать вещи!",
 ["helicrash"] = "Нажмите J что бы обычкать упавшый вертолёт!",
 ["hospitalbox"] = "Нажмите J что бы обыскать ящик с медикаментами!",
 ["vehicle"] = "Нажмите J что бы обыскать транспорт.",
 ["itemloot"] = "Нажмите J что бы иследовать вещи.",
    ["tentremove"] = "Вы действительно хотите сломать палатку? ",
    ["tentremovebutton"] = "Удалить",
 ["tentcancelbutton"] = "Отменить",
 ["FullGasCanister"] = "Вы наполнили канистру топливом.",
 ["mensageinventory"] = "Инвентарь переполнен!",
	},

}


languageCode = getLocalization()["code"]

function checkTheLanguage()
	if languageCode == "en_US" then
		languageCode = "en_US"
	elseif languageCode == "pt_BR" then
		languageCode = "pt_BR"
	else
		languageCode = "en_US"
	end
end
addEvent( "checkTheLanguage", true )
addEventHandler("onClientResourceStart",root,checkTheLanguage)


local languageTable = {
{"en","en_US"},
{"br","pt_BR"},
{"ru","russian"},
}

function Mudardelinguagem(playerSource,language)
	if language then
		for i, lang in ipairs(languageTable) do
			if language == lang[1] then
				languageCode = lang[2]
				outputChatBox("New language: "..tostring(languageCode),0,255,0)
			end
		end
	else
		outputChatBox("Please specify a language. Possible values: en, ru, br.",255,0,0)
	end
end
addCommandHandler("language",Mudardelinguagem)













gameplayVariables = {}

-- //PING CHECK\\	
	gameplayVariables["ping"] = 600 -- Checks if ping is over the set amount. DEFAULT: 600
-- //ZOMBIE\\ 
	gameplayVariables["zombiedamage"] = math.random(400,900) -- Damage done by zombies - DEFAULT: math.random(400,900), for consistent damage, remove math.random(400,900) and insert value (EXAMPLE: 1000)
	gameplayVariables["enablenight"] = true -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_server.lua too.



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


-- Tabel in clint-side if necessary

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

outputDebugString ( "MTA:DayZ Simplified | config_c end" )