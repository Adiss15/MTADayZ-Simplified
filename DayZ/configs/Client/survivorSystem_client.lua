DayZ/configs/Client/survivorSystem_client.lua--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]


function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end


outputDebugString ( "MTA:DayZ Simplified | ssc loaded" )
-- //Debug Monitor Arma2 by Tiago_DayZ'\\ 

statsLabel = {}

statsWindows = guiCreateStaticImage(0.83, 0.19, 0.15, 0.22, ":DayZ/images/debugmonitor_image.png", true)
guiSetAlpha(statsWindows, 0.8)
--Debug Monitor
statsLabel["debug"] = guiCreateLabel(0.00, 0.01, 1.00, 0.15, "DEBUG MONITOR:", true, statsWindows)
guiSetFont(statsLabel["debug"], "default-bold-small")
guiLabelSetHorizontalAlign(statsLabel["debug"], "center", false)
guiLabelSetVerticalAlign(statsLabel["debug"], "center")
guiLabelSetHorizontalAlign(statsLabel["zombieskilled"], "center")
--Zombies  Killed
statsLabel["zombieskilled"] = guiCreateLabel(0.00, 0.22, 1.00, 0.15, languageTextTable[languageCode]["zombieskilled"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["zombieskilled"], "center")
guiSetFont(statsLabel["zombieskilled"], "default-bold-small")
setElementData(statsLabel["zombieskilled"], "identifikation", "zombieskilled")
--Headshots
statsLabel["headshots"] = guiCreateLabel(0.00, 0.30, 1.00, 0.15, languageTextTable[languageCode]["headshot"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["headshots"], "center")
guiSetFont(statsLabel["headshots"], "default-bold-small")
setElementData(statsLabel["headshots"], "identifikation", "headshots")
--Murders
statsLabel["murders"] = guiCreateLabel(0.00, 0.38, 1.00, 0.15, languageTextTable[languageCode]["murders"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["murders"], "center")
guiSetFont(statsLabel["murders"], "default-bold-small")
setElementData(statsLabel["murders"], "identifikation", "murders")
--Bandits Killed
statsLabel["banditskilled"] = guiCreateLabel(0.00, 0.46, 1.00, 0.15, languageTextTable[languageCode]["banditskilled"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["banditskilled"], "center")
guiSetFont(statsLabel["banditskilled"], "default-bold-small")
setElementData(statsLabel["banditskilled"], "identifikation", "banditskilled")
--Blood
statsLabel["blood"] = guiCreateLabel(0.00, 0.54, 1.00, 0.15, languageTextTable[languageCode]["blood"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["blood"], "center")
guiSetFont(statsLabel["blood"], "default-bold-small")
setElementData(statsLabel["blood"], "identifikation", "blood")
--Zombies
statsLabel["zombies"] = guiCreateLabel(0.00, 0.62, 1.00, 0.15, languageTextTable[languageCode]["zombies"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["zombies"], "center")
guiSetFont(statsLabel["zombies"], "default-bold-small")
setElementData(statsLabel["zombies"], "identifikation", "zombies")
--Temperature
statsLabel["temperature"] = guiCreateLabel(0.00, 0.70, 1.00, 0.15, languageTextTable[languageCode]["temperature"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["temperature"], "center")
guiSetFont(statsLabel["temperature"], "default-bold-small")
setElementData(statsLabel["temperature"], "identifikation", "temperature")
--Humanity
statsLabel["humanity"] = guiCreateLabel(0.00, 0.78, 1.00, 0.15, languageTextTable[languageCode]["humanity"], true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["humanity"], "center")
guiSetFont(statsLabel["humanity"], "default-bold-small")
setElementData(statsLabel["humanity"], "identifikation", "humanity")
--Name
statsLabel["name"] = guiCreateLabel(0.00, 0.86, 1.00, 0.15, languageTextTable[languageCode]["nomedoplay"] .. getPlayerName(getLocalPlayer()), true, statsWindows)
guiLabelSetHorizontalAlign(statsLabel["name"], "center")
guiSetFont(statsLabel["name"], "default-bold-small")
setElementData(statsLabel["name"], "identifikation", "name")


function showDebugMonitor ()
   local visible = guiGetVisible(statsWindows)
   guiSetVisible(statsWindows,not visible)
end
bindKey("F5","down",showDebugMonitor)

function refreshDebugMonitor()
   if getElementData(getLocalPlayer(),"logedin") then
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["zombieskilled"],"identifikation"))
      guiSetText(statsLabel["zombieskilled"],languageTextTable[languageCode]["zombieskilled"]..value)
      
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["headshots"],"identifikation"))
      guiSetText(statsLabel["headshots"],languageTextTable[languageCode]["headshot"]..value)
      
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["banditskilled"],"identifikation"))
      guiSetText(statsLabel["banditskilled"],languageTextTable[languageCode]["banditskilled"]..value)
      
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["murders"],"identifikation"))
      guiSetText(statsLabel["murders"],languageTextTable[languageCode]["murders"]..value)
      
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["blood"],"identifikation"))
      guiSetText(statsLabel["blood"],languageTextTable[languageCode]["blood"]..value)
      
      local value = getElementData(getRootElement(),"zombiesalive") or 0
      local value2 = getElementData(getRootElement(),"zombiestotal") or 0
      guiSetText(statsLabel["zombies"],languageTextTable[languageCode]["zombies"]..value.."/"..value2)
      
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["temperature"],"identifikation"))
      guiSetText(statsLabel["temperature"],languageTextTable[languageCode]["temperature"]..math.round(value,2).."°C")
      
      local value = getElementData(getLocalPlayer(),getElementData(statsLabel["humanity"],"identifikation"))
      guiSetText(statsLabel["humanity"],languageTextTable[languageCode]["humanity"]..math.round(value,2))
      
      guiSetText(statsLabel["name"],languageTextTable[languageCode]["nomedoplay"]..getPlayerName(getLocalPlayer()))
   end         
end
setTimer(refreshDebugMonitor,3000,0)






function playerStatsClientSite()
if getElementData(getLocalPlayer(),"logedin") then
toggleControl ("radar",false)
showPlayerHudComponent ("clock",false) 
showPlayerHudComponent ("radar",false)
showPlayerHudComponent ("money",false) 
showPlayerHudComponent ("health",false) 
showPlayerHudComponent ("weapon",false) 
showPlayerHudComponent ("ammo",false) 
showPlayerHudComponent ("breath",false) 
if getElementData(getLocalPlayer(),Item_toolbelt_map) >= 1  then
	toggleControl ("radar",true)
end
if getElementData(getLocalPlayer(),Item_toolbelt_gps) >= 1  then
	showPlayerHudComponent ("radar",true) 
end
if getElementData(getLocalPlayer(),Item_toolbelt_watch) >= 1 then
	showPlayerHudComponent ("clock",true) 
end
end
end
setTimer(playerStatsClientSite,1000,0)

function playerZoom (key,keyState)
	if key == "n" then
		if getElementData(getLocalPlayer(),Item_toolbelt_ng_goggles) > 0 then
			if nightvision then
				nightvision = false
				setCameraGoggleEffect("normal")
				local hour, minutes = getTime()
				if gameplayVariables["enablenight"] then
				end
			else 
				nightvision = true
				setCameraGoggleEffect("nightvision")
			end
		end
	elseif key == "i" then
		if getElementData(getLocalPlayer(),Item_toolbelt_infrared) > 0 then
			if infaredvision then
				infaredvision = false
				setCameraGoggleEffect("normal")
				if gameplayVariables["enablenight"] then
					
				end
			else 
				 infaredvision = true
				setCameraGoggleEffect("thermalvision")
				if gameplayVariables["enablenight"] then
					
				end
			end
		end
	end
end
bindKey("n","down",playerZoom)
bindKey("i","up",playerZoom)



--------------------------------------------------------
--Player Stats										  --
--------------------------------------------------------
function getGroundMaterial(x, y, z)
	local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight(x, y, z, x, y, z-10, true, false, false, true, false, false, false, false, nil)
	return material
end

function isInBuilding(x, y, z)
	local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight(x, y, z, x, y, z+10, true, false, false, true, false, false, false, false, nil)
	if hit then return true end
	return false
end

function isObjectAroundPlayer2 ( thePlayer, distance, height )
material_value = 0
 local x, y, z = getElementPosition( thePlayer )
 for i = math.random(0,360), 360, 1 do
  local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
 local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height,true,false,false,false,false,false,false,false )
	if material == 0 then
		material_value = material_value+1
	end
	if material_value > 40 then
		return 0,hitX, hitY, hitZ
	end
 end
 return false
end

function isObjectAroundPlayer ( thePlayer, distance, height )
 local x, y, z = getElementPosition( thePlayer )
 for i = math.random(0,360), 360, 1 do
  local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
 local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height)
  if material == 0 then
   return material,hitX, hitY, hitZ
  end
 end
 return false
end

function getPointFromDistanceRotation ( x, y, dist, angle )
    local a = math.rad( 90 - angle )
    local dx = math.cos( a ) * dist
    local dy = math.sin( a ) * dist
    return x + dx, y + dy
end


function zombieSpawning()
 local x, y, z = getElementPosition(getLocalPlayer())
local material,hitX, hitY, hitZ = isObjectAroundPlayer2 ( getLocalPlayer(), 30, 3 )
if material == 0 and not isInBuilding(x,y,z) then
	triggerServerEvent("createZomieForPlayer",getLocalPlayer(),hitX, hitY, hitZ)
end
end
setTimer(zombieSpawning,3000,0)

--ALL ZOMBIES STFU
function stopZombieSound()
local zombies = getElementsByType ( "ped" )
for theKey,theZomb in ipairs(zombies) do
	setPedVoice(theZomb, "PED_TYPE_DISABLED")
end
end
setTimer(stopZombieSound,5000,0)

--SKIN REPLACEMENTS
	local skin = engineLoadTXD ( "skins/22.txd" ) -- slashed 12 by Wall-E
	engineImportTXD ( skin, 22 )	
	local skin = engineLoadTXD ( "skins/56.txd" ) --young and blue by Slothman
	engineImportTXD ( skin, 56 )
	local skin = engineLoadTXD ( "skins/67.txd" ) -- slit r* employee
	engineImportTXD ( skin, 67 )
	local skin = engineLoadTXD ( "skins/68.txd" ) -- shredded preist by Deixell
	engineImportTXD ( skin, 68 )
	local skin = engineLoadTXD ( "skins/69.txd" ) --bleedin eyes in denim by Capitanazop
	engineImportTXD ( skin, 69 )
	local skin = engineLoadTXD ( "skins/70.txd" ) --ultra gory scientist by 50p
	engineImportTXD ( skin, 70 )
	local skin = engineLoadTXD ( "skins/84.txd" ) --guitar wolf (nonzombie) by Slothman
	engineImportTXD ( skin, 84 )
	local skin = engineLoadTXD ( "skins/92.txd" ) -- peeled flesh by xbost
	engineImportTXD ( skin, 92 )
	local skin = engineLoadTXD ( "skins/97.txd" ) -- easterboy by Slothman
	engineImportTXD ( skin, 97 )
	local skin = engineLoadTXD ( "skins/105.txd" ) --Scarred Grove Gangster by Wall-E
	engineImportTXD ( skin, 105 )
	local skin = engineLoadTXD ( "skins/107.txd" ) --ripped and slashed grove by Wall-E
	engineImportTXD ( skin, 107 )
	local skin = engineLoadTXD ( "skins/108.txd" ) -- skeleton thug by Deixell
	engineImportTXD ( skin, 108 )
	local skin = engineLoadTXD ( "skins/111.txd" ) --Frank West from dead rising (nonzombie) by Slothman
	engineImportTXD ( skin, 111 )
	local skin = engineLoadTXD ( "skins/126.txd" ) -- bullet ridden wiseguy by Slothman
	engineImportTXD ( skin, 126 )
	local skin = engineLoadTXD ( "skins/127.txd" ) --flyboy from dawn of the dead by Slothman
	engineImportTXD ( skin, 127 )
	local skin = engineLoadTXD ( "skins/128.txd" ) --holy native by Slothman
	engineImportTXD ( skin, 128 )
	local skin = engineLoadTXD ( "skins/152.txd" ) --bitten schoolgirl by Slothman
	engineImportTXD ( skin, 152 )
	local skin = engineLoadTXD ( "skins/162.txd" ) --shirtless redneck by Slothman
	engineImportTXD ( skin, 162 )
	local skin = engineLoadTXD ( "skins/167.txd" ) --dead chickenman by 50p
	engineImportTXD ( skin, 167 )
	local skin = engineLoadTXD ( "skins/188.txd" ) --burnt greenshirt by Slothman
	engineImportTXD ( skin, 188 )
	local skin = engineLoadTXD ( "skins/192.txd" ) --Alice from resident evil (nonzombie) by Slothman
	engineImportTXD ( skin, 192 )
	local skin = engineLoadTXD ( "skins/195.txd" ) --bloody ex by Slothman
	engineImportTXD ( skin, 195 )
	local skin = engineLoadTXD ( "skins/206.txd" ) -- faceless zombie by Slothman
	engineImportTXD ( skin, 206 )
	local skin = engineLoadTXD ( "skins/209.txd" ) --Noodle vendor by 50p
	engineImportTXD ( skin, 209 )
	local skin = engineLoadTXD ( "skins/212.txd" ) --brainy hobo by Slothman
	engineImportTXD ( skin, 212 )
	local skin = engineLoadTXD ( "skins/229.txd" ) --infected tourist by Slothman
	engineImportTXD ( skin, 229 )
	local skin = engineLoadTXD ( "skins/230.txd" ) --will work for brains hobo by Slothman
	engineImportTXD ( skin, 230 )
	local skin = engineLoadTXD ( "skins/258.txd" ) --bloody sided suburbanite by Slothman
	engineImportTXD ( skin, 258 )
	local skin = engineLoadTXD ( "skins/264.txd" ) --scary clown by 50p
	engineImportTXD ( skin, 264 )
	local skin = engineLoadTXD ( "skins/274.txd" ) --Ash Williams (nonzombie) by Slothman
	engineImportTXD ( skin, 274 )
	local skin = engineLoadTXD ( "skins/277.txd" ) -- gutted firefighter by Wall-E
	engineImportTXD ( skin, 277 )
	local skin = engineLoadTXD ( "skins/280.txd" ) --infected cop by Lordy
	engineImportTXD ( skin, 280 )

	


weaponAmmoTable = {




[weapon_ammo_pistol] = {
{weapon_secondary_pistol,22},
},

[weapon_ammo_sdpistol] = {
{weapon_secondary_sdpistol,23},
},

[weapon_ammo_deserteagle] = {
{weapon_secondary_deserteagle,24},
},





[weapon_ammo_uzi] = {
{weapon_secondary_uzi,28},
},

[weapon_ammo_mp5] = {
{weapon_secondary_mp5,29},
},





[weapon_ammo_ak] = {
{weapon_primary_ak47,30},
},

[weapon_ammo_m4] = {
{weapon_primary_m4,31},
},




[weapon_ammo_shotgun] = {
{weapon_primary_shotgun,25},
},

[weapon_ammo_sawnoff] = {
{weapon_primary_sawnoff,26},
},

[weapon_ammo_spaz12] = {
{weapon_primary_spaz12,27},
},



[weapon_ammo_sniper] = {
{weapon_primary_sniper,34},
},

[weapon_ammo_contryrifle] = {
{weapon_primary_contryrifle,33},
},






["others"] = {
{weapon_specially_parachute,46},
{weapon_specially_teargas,17},
{weapon_specially_grenade,16},
{weapon_melee_knife,4},
{weapon_melee_katana,8},
{weapon_specially_binoculares,43},
{weapon_melee_baseball,5},
{weapon_melee_shovel,6},
{weapon_melee_golf,2},
{Item_toolbelt_radiodevice,1},

},
}

function getWeaponAmmoType (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[1] then
			return weaponData[1],weaponData[2]
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
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_spaz12]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_spaz12,weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[weapon_ammo_sawnoff]) do
		if weaponName == weaponData[1] then
			return weapon_ammo_sawnoff,weaponData[2]
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
end

-- WEAPON DAMAGE TABLE IS IN editor_client.lua

function getWeaponDamage (weapon)
	for i,weapon2 in ipairs(damageTable) do
		local t,weapon1 = getWeaponAmmoType(weapon2[1])
		if weapon1 == weapon then
			if getElementData(getLocalPlayer(),"humanity") == 5000 then
				if weapon2[1] == weapon_secondary_pistol or weapon2[1] == weapon_secondary_sdpistol or weapon2[1] == weapon_secondary_uzi then
					return weapon2[2]*0.3
				end
			end	
			return weapon2[2]
		end
	end
end


function playRandomHitSound () 
	local number = math.random(1,3)
	local sound = playSound("sounds/hit"..number..".mp3")
end

--
function playerGetDamageDayZ ( attacker, weapon, bodypart, loss )
	cancelEvent()
	damage = 100
	headshot = false
	if weapon == 37 then
		return
	end
	if getElementData(attacker,"zombie") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-gameplayVariables["zombiedamage"]) -- Damage output - Default: 400,900
		local number = math.random(1,7)
		if number == 4 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end
	if weapon == 49 then
		if loss > 30 then
			setElementData(getLocalPlayer(),"brokenbone",true)
			setControlState ("jump",true)
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.floor(loss*10))
		end
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.floor(loss*5))
	elseif weapon == 63 or weapon == 51 or weapon == 19 then
	setElementData(getLocalPlayer(),"blood",0)
		if getElementData(getLocalPlayer(),"blood") <= 0 then
			if not getElementData(getLocalPlayer(),"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot)
			end
		end
	elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
		local number = math.random(1,8)
		if number >= 6 or number <= 8 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
		local number = math.random(1,7)
		if number == 2 then
			setElementData(getLocalPlayer(),"pain",true)
		end
		damage = getWeaponDamage (weapon)
		if bodypart == 9 then
			damage = damage*1.5
			headshot = true
		end
		if bodypart == 7 or bodypart == 8 then
			setElementData(getLocalPlayer(),"brokenbone",true)
		end
		playRandomHitSound()
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(damage*0.75,damage*1.25))
		if not getElementData(getLocalPlayer(),"bandit") then
			setElementData(attacker,"humanity",getElementData(attacker,"humanity")-math.random(40,200))
			if getElementData(attacker,"humanity") < 0 then
				setElementData(attacker,"bandit",true)
			end
		else
			setElementData(attacker,"humanity",getElementData(attacker,"humanity")+math.random(40,200))
			if getElementData(attacker,"humanity") > 5000 then
				setElementData(attacker,"humanity",5000)
			end
			if getElementData(attacker,"humanity") > 2000 then
				setElementData(attacker,"bandit",false)
			end
		end	
		if getElementData(getLocalPlayer(),"blood") <= 0 then
			if not getElementData(getLocalPlayer(),"isDead") then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot,getWeaponNameFromID (weapon))
				setElementData(getLocalPlayer(),"isDead",true)
			end
		end
	elseif weapon == 54 or weapon == 63 or weapon == 49 or weapon == 51 then
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(100,1000))
		local number = math.random(1,5)
		if loss > 30 then
			setElementData(getLocalPlayer(),"brokenbone",true)
			setControlState ("jump",true)
		end
		if loss >= 100 then
			setElementData(getLocalPlayer(),"blood",49)
			setElementData(getLocalPlayer(),"bleeding",50)
		end
		local number = math.random(1,11)
		if number == 3 then
			setElementData(getLocalPlayer(),"pain",true)
		end
		if getElementData(getLocalPlayer(),"blood") <= 0 then
			if not getElementData(getLocalPlayer(),"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot,getWeaponNameFromID (weapon))
				setElementData(getLocalPlayer(),"isDead",true)
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer (), playerGetDamageDayZ )


function pedGetDamageDayZ(attacker, weapon, bodypart, loss)
  cancelEvent()
  if attacker and attacker == getLocalPlayer() then
    damage = 100
    if weapon == 37 then
      return
    end
    if weapon == 63 or weapon == 51 or weapon == 19 then
      setElementData(source, "blood", 0)
      if 0 >= getElementData(source, "blood") then
        triggerServerEvent("onZombieGetsKilled", source, attacker)
      end
    elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
      damage = getWeaponDamage(weapon)
      if bodypart == 9 then
        damage = damage * 1.5
        headshot = true
      end
      setElementData(source, "blood", getElementData(source, "blood") - math.random(damage * 0.75, damage * 1.25))
      if 0 >= getElementData(source, "blood") then
        triggerServerEvent("onZombieGetsKilled", source, attacker, headshot)
      end
    end
  end
end
addEventHandler("onClientPedDamage", getRootElement(), pedGetDamageDayZ)


function checkStats()
if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"bleeding") > 20 then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-getElementData(getLocalPlayer(),"bleeding"))
	else
		setElementData(getLocalPlayer(),"bleeding",0)
	end
	if getElementData(getLocalPlayer(),"blood") < 0 then
		if not getElementData(getLocalPlayer(),"isDead") then
			triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),false,false)
		end
	end
end	
end
setTimer(checkStats,3000,0)

function createBloodForBleedingPlayers ()
if getElementData(getLocalPlayer(),"logedin") then
local x,y,z = getElementPosition(getLocalPlayer())
	for i,player in ipairs(getElementsByType("player")) do
		local bleeding = getElementData(player,"bleeding") or 0
		if bleeding > 0 then
			local px,py,pz = getPedBonePosition (player,3)
			local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
			if bleeding > 600 then
				number = 5
			elseif bleeding > 300 then
				number = 3
			elseif bleeding > 100 then
				number = 1
			else
				number = 0
			end
			if pdistance <= 120 then
				fxAddBlood ( px,py,pz,0,0,0,number, 1 )
			end
		end	
	end
end	
end
setTimer(createBloodForBleedingPlayers,300,0)

function checkBrokenbone()
if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"brokenbone") then
		if not isPedDucked(getLocalPlayer()) then
			--setControlState ("walk",false)
			--setControlState ("crouch",true)
		end
		toggleControl ( "jump", false )
		toggleControl ( "sprint", false )
	else
		toggleControl ( "jump", true )
		toggleControl ( "sprint", true )
	end
end	
end
setTimer(checkBrokenbone,1400,0)

function setPain()
if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"pain") then
		local x,y,z = getElementPosition(getLocalPlayer())
		createExplosion (x,y,z+15,8,false,1.0,false)
		local x, y, z, lx, ly, lz = getCameraMatrix() -- Get the current location and lookat of camera
		x, lx = x + 1, lx + 1 -- What will be the new x and x lookat values
		setCameraMatrix(x,y,z,lx,ly,lz) -- Set camera to new position
		setCameraTarget (getLocalPlayer())
	end
end	
end
setTimer(setPain,1500,0)

function checkCold()
if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"temperature") <= 31 then
		setElementData(getLocalPlayer(),"cold",true)
	end
end	
end
setTimer(checkCold,3000,0)

function setCold()
if getElementData(getLocalPlayer(),"logedin") then
if getElementData(getLocalPlayer(),"cold") then
	local x,y,z = getElementPosition(getLocalPlayer())
	createExplosion (x,y,z+15,8,false,0.5,false)
	local x, y, z, lx, ly, lz = getCameraMatrix() -- Get the current location and lookat of camera
end	
end	
end
setTimer(setCold,1500,0)

function setVolume()
	value = 0
	if getPedMoveState (getLocalPlayer()) == "stand" then
		value = 0
	elseif getPedMoveState (getLocalPlayer()) == "walk" then
		value = 20
	elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
		value = 40
	elseif getPedMoveState (getLocalPlayer()) == "jog" then
		value = 80
	elseif getPedMoveState (getLocalPlayer()) == "sprint" then	
		value = 100
	elseif getPedMoveState (getLocalPlayer()) == "crouch" then	
		value = 0
	elseif not getPedMoveState (getLocalPlayer()) then
		value = 20
	end
	if getElementData(getLocalPlayer(),"shooting") and getElementData(getLocalPlayer(),"shooting") > 0 then
		value = value+getElementData(getLocalPlayer(),"shooting")
	end
	if isPedInVehicle (getLocalPlayer()) then
		value = 100
	end	
	if value > 100 then
		value = 100
	end
	setElementData(getLocalPlayer(),"volume",value)
end
setTimer(setVolume,100,0)

function setVisibility()
	value = 0
	if getPedMoveState (getLocalPlayer()) == "stand" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "walk" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "jog" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "sprint" then	
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "crouch" then	
		value = 20
	elseif not getPedMoveState (getLocalPlayer()) then	
		value = 20
	end
	if getElementData(getLocalPlayer(),"jumping") then
		value = 100
	end
	if isObjectAroundPlayer (getLocalPlayer(),2, 4 ) then
		value = 0
	end
	if isPedInVehicle (getLocalPlayer()) then
		value = 0
	end	
	setElementData(getLocalPlayer(),"visibly",value)
end
setTimer(setVisibility,100,0)

function debugJump()
if getControlState("jump") then
	setElementData(getLocalPlayer(),"jumping",true)
	setTimer(debugJump2,650,1)
end
end
setTimer(debugJump,100,0)

function debugJump2()
	setElementData(getLocalPlayer(),"jumping",false)
end

weaponNoiseTable = {
{22,20},
{23,0},
{24,60},
{28,40},
{32,40},
{29,40},
{30,60},
{31,60},
{25,40},
{26,60},
{27,60},
{33,40},
{34,60},
{36,60},
{35,60},
}
--0 none
--20 low
--40 moderate
--60 high

function getWeaponNoise(weapon)
	for i,weapon2 in ipairs(weaponNoiseTable) do
		if weapon == weapon2[1] then
			return weapon2[2]
		end
	end
	return 0
end

function debugShooting()
if getControlState("fire") then
	local weapon = getPedWeapon(getLocalPlayer())
	local noise = getWeaponNoise(weapon) or 0
	setElementData(getLocalPlayer(),"shooting",noise)
	if shootTimer then
		killTimer(shootTimer)
	end
	shootTimer = setTimer(debugShooting2,100,1)
end
end
setTimer(debugShooting,100,0)

function debugShooting2()
	setElementData(getLocalPlayer(),"shooting",0)
	shootTimer = false
end

function checkZombies()
zombiesalive = 0
zombiestotal = 0
for i,ped in ipairs(getElementsByType("ped")) do
	if getElementData(ped,"zombie") then
		zombiesalive = zombiesalive + 1
	end
	if getElementData(ped,"deadzombie") then
		zombiestotal = zombiestotal + 1
	end
end
setElementData(getRootElement(),"zombiesalive",zombiesalive)
setElementData(getRootElement(),"zombiestotal",zombiestotal+zombiesalive)
end
setTimer(checkZombies,5000,0)

function checkZombies3()
local x,y,z = getElementPosition(getLocalPlayer())
for i,ped in ipairs(getElementsByType("ped")) do
	if getElementData(ped,"zombie") then
		local sound = getElementData(getLocalPlayer(),"volume")/5
		local visibly = getElementData(getLocalPlayer(),"visibly")/5
		local xZ,yZ,zZ = getElementPosition(ped)
		if getDistanceBetweenPoints3D (x,y,z,xZ,yZ,zZ) < sound+visibly then
			if getElementData ( ped, "leader" ) == nil then
				triggerServerEvent("botAttack",getLocalPlayer(),ped)
			end
		else
			if getElementData ( ped, "target" ) == getLocalPlayer() then
				setElementData(ped,"target",nil)
			end
			if getElementData ( ped, "leader" ) == getLocalPlayer() then
				triggerServerEvent("botStopFollow",getLocalPlayer(),ped)
			end
		end
	end
end
end
setTimer(checkZombies3,500,0)



	
	

fading = 0
fading2 = "up"
local screenWidth,screenHeight = guiGetScreenSize()
function updateIcons ()
if getElementData(getLocalPlayer(),"logedin") then
--fading
 if fading >= 0 and fading2 == "up" then
 fading = fading + 5
 elseif fading <= 255 and fading2 == "down" then
 fading = fading - 5
 end
 
     local veh = getPedOccupiedVehicle (getLocalPlayer())
    if veh then
        local maxfuel = getElementData(veh,"maxfuel")
        local fuel = getElementData(getElementData(veh,"parent"),"fuel")
        local needengine = getElementData(veh,"needengines")
        local needtires = getElementData(veh,"needtires")
      local needparts = getElementData(veh,"needparts")
        local engine = getElementData(getElementData(veh,"parent"),"Engine_inVehicle") or 0
        local tires = getElementData(getElementData(veh,"parent"),"Tire_inVehicle") or 0
      local parts = getElementData(getElementData(veh,"parent"),"Parts_inVehicle") or 0
        local vehHealth = getElementHealth(getPedOccupiedVehicle(localPlayer))
        local x,y,z = getElementVelocity(getPedOccupiedVehicle(localPlayer))
        local vehSpeed = math.floor(((x^2 + y^2 + z^2)^(0.5))*180)
        --ENGINE
        if engine == needengine then
            dxDrawRectangle(34,226,25,13,tocolor(89,161,58,255))
            dxDrawText("ENG",36,226,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        else
            dxDrawRectangle(34,226,25, 13,tocolor(171,16,3,255))
            dxDrawText("ENG",36,226,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        end
        --TIRE
      if tires == needtires then
            dxDrawRectangle(34,249,25,13,tocolor(89,161,58,255))
            dxDrawText("TIRE",36,250,5,5,tocolor(0,0,0,231),0.9,"default-bold")
      elseif tires >= 4 and tires < 6 then
            dxDrawRectangle(34,249,25,13,tocolor(89,161,58,255))
            dxDrawText("TIRE",36,250,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        elseif tires == 3 then
            dxDrawRectangle(34,249,25,13, tocolor(189,187,37,255))
            dxDrawText("TIRE",36,250,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        elseif tires == 2 then
            dxDrawRectangle(34,249,25,13, tocolor(249,157,11,255))
            dxDrawText("TIRE",36,250,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        elseif tires == 1 then
            dxDrawRectangle(34,249,25,13, tocolor(171,16,3,255))
            dxDrawText("TIRE",36,250,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        elseif tires == 0 then
            dxDrawRectangle(34,249,25,13, tocolor(171,16,3,255))
            dxDrawText("TIRE",36,250,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        end
      --TANK PARTS
        if parts == needparts then
            dxDrawRectangle(34,272,25,13,tocolor(89,161,58,255))
          dxDrawText ("TKP",36,272,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        else
           dxDrawRectangle(34,272,25,13,tocolor(171,15,5,255))
         dxDrawText ("TKP",36,272,5,5,tocolor(0,0,0,231),0.9,"default-bold")
        end
     --   FUEL
        if fuel == maxfuel then
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,214,10,115,tocolor(78,138,51,255),true)
        elseif fuel < maxfuel/10 then
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,315,10,14.5,tocolor(171,15,5,255),true)
        elseif fuel < maxfuel/4 then
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,308,10,19,tocolor(171,55,5,255),true)
        elseif fuel < maxfuel/3 then
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,308,10,19,tocolor(141,161,59,255),true)
        elseif fuel < maxfuel/2 then
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,290,10,39,tocolor(91,161,59,255),true)
        elseif fuel < maxfuel/1.5  then 
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,251,10,76,tocolor(83,150,54,255),true)
        elseif fuel < maxfuel/0 then 
            dxDrawRectangle(15,213,13,115,tocolor(0,0,0,150),true)
            dxDrawRectangle(16,233,10,95,tocolor(78,138,51,255),true)
        end
        --SPD/VEHICLE HEALTH
        if isPedInVehicle(localPlayer) == false then return end
            dxDrawText("SPD",527,12,573,31,tocolor(89,161,58,255),1.30,"sans","left","top",false,false,true,false,false)
            dxDrawText(""..tostring(vehSpeed).."",589,12,635,31,tocolor(89,161,58,255),1.30,"sans","left","top",false,false,true,false,false)
            dxDrawText("V-H:"..tostring(math.floor(vehHealth*0.1)).."%",527,43,555,58,tocolor(89,161,58,255),1.00,"sans","left","top",false,false,true,false,false)
            --FUEL/ENGINE/TIRE/SPD LINES
            dxDrawLine(16,251,26,251,tocolor(42,109,5,210),1,true)
            dxDrawLine(16,290,26,290,tocolor(42,109,5,203),1,true)
            dxDrawLine(14,233,19,233,tocolor(42,179,5,255),1,true)
            dxDrawLine(14,271,19,271,tocolor(42,179,5,255),1,true)
            dxDrawLine(14,307,19,307,tocolor(42,179,5,255),1,true)
            dxDrawLine(26,215,26,327,tocolor(75,137,48,255),2,true)
            dxDrawLine(17,215,16,327,tocolor(75,137,48,255),2,true)
            dxDrawLine(15.5,215,27,215,tocolor(102,179,50,255),2,true)
            dxDrawLine(15.5,327,27,327.3,tocolor(102,179,50,255),2,true)
            dxDrawLine(570,9,624,9,tocolor(89,161,58,255),2,true)
            dxDrawLine(623,8,623,36,tocolor(89,161,58,255),2,true)
            dxDrawLine(622,35,570,35,tocolor(89,161,58,255),2,true)
            dxDrawLine(569,36,569,8,tocolor(89,161,58,255),2,true)
    end
 
 --Nametags
 local x,y,z = getElementPosition(getLocalPlayer())
 for i,player in ipairs(getElementsByType("player")) do
 setPlayerNametagShowing ( player, false )
 if player ~= getLocalPlayer() then
 local vehicle = getPedOccupiedVehicle(player)
                local px,py,pz = getElementPosition (player)
                local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                if pdistance <= 2 then
                    --Get screenposition
                    local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
 if sx and sy then
 --Draw Name
 if getElementData(player,"bandit") then
 text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' ).." (Bandit)"
 else
 text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' )
 end
 local w = dxGetTextWidth(text,1.02,"default-bold")
 dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 200 ), 1.02, "default-bold" )
 end
 end
 end 
 end
 --Vehicletags
 local x,y,z = getElementPosition(getLocalPlayer())
 for i,veh in ipairs(getElementsByType("vehicle")) do
 local px,py,pz = getElementPosition (veh)
 local vehID = getElementModel(veh)
 local vehicle = getPedOccupiedVehicle(getLocalPlayer())
 if veh ~= vehicle then
 if vehID ~= 548 then
                local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                if pdistance <= 6 then
                    --Get screenposition
                    local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
 if sx and sy then
 --Draw Vehicle
 local w = dxGetTextWidth(getVehicleName(veh),1.02,"default-bold")
 dxDrawText ( getVehicleName(veh), sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 200 ), 1.02, "default-bold" ) 
 end
 end
 end
 end
 end
 if not playerTarget then return end
 local x,y,z = getElementPosition(playerTarget)
 local x,y,distance = getScreenFromWorldPosition (x,y,z+0.5)
 distance = 20
 if getElementData(playerTarget,"bandit") then
 text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' ).." (Bandit)"
 else
 text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' )
 end
 local w = dxGetTextWidth(text,distance*0.033,"default-bold")
 dxDrawText (text,x-(w/2),y,x-(w/2), y, tocolor ( 100, 255, 100, 200 ), distance*0.033, "default-bold" )
 
end 
end
addEventHandler ( "onClientRender", getRootElement(), updateIcons )



playerTarget = false
function targetingActivated ( target )
	if ( target ) and getElementType(target) == "player" then
		playerTarget = target
	else
		playerTarget = false
	end
end
addEventHandler ( "onClientPlayerTarget", getRootElement(), targetingActivated )

function dayZDeathInfo ()
	fadeCamera (false, 1.0, 0, 0, 0 ) 
	setTimer(showDayZDeathScreen,2000,1)
end
addEvent("onClientPlayerDeathInfo",true)
addEventHandler("onClientPlayerDeathInfo",getRootElement(),dayZDeathInfo)

function showDayZDeathScreen()
	setTimer ( fadeCamera, 1000, 1, true, 1.5 )
	deadBackground = guiCreateStaticImage(0,0,1,1,":DayZ/images/dead.jpg",true)
	deathText = guiCreateLabel(0,0.8,1,0.2,"You died! \n You will respawn in 5 seconds.",true)
	guiLabelSetHorizontalAlign (deathText,"center")
	setTimer(guiSetVisible,5000,1,false)
	setTimer(guiSetVisible,5000,1,false)
	setTimer(destroyElement,5000,1,deathText)
	setTimer(destroyElement,5000,1,deadBackground)
end

--OnClientPlayerHit
whiteWindow = guiCreateStaticImage(0,0,1,1,":DayZ/images/white.png",true)
guiSetVisible(whiteWindow,false)


function showPlayerDamageScreen (visibly2,stateControle2)
	guiSetVisible(whiteWindow,true)
	visibly = visibly2 or visibly
	stateControle = stateControle2 or stateControle
	if visibly >= 6*0.025 and stateControle == "up" then
		stateControle = "down"
	end
	if visibly < 0 then
		guiSetVisible(whiteWindow,false)
		return
	end
	if stateControle == "up" then
		visibly = visibly + 0.025
	elseif stateControle == "down" then
		visibly = visibly - 0.025
	end
	guiSetAlpha(whiteWindow,visibly)
	setTimer(showPlayerDamageScreen,50,1)
end

function showWhiteScreen ( attacker, weapon, bodypart )
	--if weapon then
		showPlayerDamageScreen (0,"up")
	--end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), showWhiteScreen )

--[[
function destroyBlipGPS ()
local blips = getElementsByType("blip")
	for index, blip in ipairs(blips) do
		destroyElement(blip)
	end
local players = getElementsByType("player")
	for index, player in ipairs(players) do
		local blip = createBlipAttachedTo(player,0,2,255,255,255,180)
		setElementData(blip,"player",player)
		setBlipVisibleDistance(blip,0)
	end	
end		
setTimer(destroyBlipGPS,5000,0)

function showBlipGPS ()
local blips = getElementsByType("player")
if getElementData(getLocalPlayer(),"Thermal GPS") >= 1 then
	for index, blip in ipairs(blips) do
		local player = getElementData(blip,"player")
		setBlipVisibleDistance(blip,0)
		if getElementData(player,"temperature") >= 40 then
			if getElementData(player,"GPS Jammer") >= 1 then
				setBlipVisibleDistance(blip,0)
			else
				setBlipVisibleDistance(blip,180)
			end
		end	
	end
end	
end		
setTimer(showBlipGPS,500,0)
--addEventHandler ( "onClientHUDRender", getRootElement(), showBlipGPS )
]]

--Support Chat
supportWindow = guiCreateStaticImage(0.05,0.25,0.9,0.5,":DayZ/images/scrollmenu_1.png",true)
guiSetVisible(supportWindow,false)
supportGridlist = guiCreateGridList ( 0.05,0.1,0.9,0.7,true,supportWindow)
nameColumn = guiGridListAddColumn( supportGridlist, "Name", 0.2 )
messageColumn = guiGridListAddColumn( supportGridlist, "Message", 0.8 )
messageInput = guiCreateEdit( 0.05, 0.825, 0.9, 0.075, "", true,supportWindow )
closeButton = guiCreateButton( 0.9, 0.015, 0.09, 0.05, "Close", true, supportWindow )

--Supporter Panel

supporterWindow = guiCreateStaticImage(0.05,0.75,0.9,0.15,"images/scrollmenu_1.png",true)
guiSetVisible(supporterWindow,false)
playerNameGridlist = guiCreateGridList ( 0.05,0.05,0.25,0.9,true,supporterWindow)
playerNameColumn = guiGridListAddColumn( playerGridlist, "Player", 0.95 )
kickPlayerButton = guiCreateButton( 0.35, 0.15, 0.1, 0.3, "KICK!", true, supporterWindow )
banPlayerButton = guiCreateButton( 0.35, 0.65, 0.1, 0.3, "BAN!", true, supporterWindow )
spectateButton = guiCreateButton( 0.5, 0.15, 0.1, 0.3, "SPECTATE!", true, supporterWindow )
viewmeButton = guiCreateButton( 0.5, 0.65, 0.1, 0.3, "VIEW ME!", true, supporterWindow )
accountnameInput = guiCreateEdit( 0.65, 0.15, 0.1, 0.175, "Accountname", true,supporterWindow )
addAdminButton = guiCreateButton( 0.65, 0.4, 0.1, 0.15, "ADD ADMIN!", true, supporterWindow )
addSupporterButton = guiCreateButton( 0.65, 0.6, 0.1, 0.15, "ADD SUPPORTER!", true, supporterWindow )
removeSupporterButton = guiCreateButton( 0.65, 0.8, 0.1, 0.15, "REMOVE MEMBER!", true, supporterWindow )
goSupportmodeButton = guiCreateButton( 0.8, 0.65, 0.1, 0.3, "GO SUPPORTMODE!", true, supporterWindow )

function openSupportChat ()
	local showing = guiGetVisible(supportWindow)
	guiSetInputMode("no_binds_when_editing") -- [0000012] Block/Close Fix //DarkIrata
	guiSetVisible(supportWindow,not showing)
	if getElementData(getLocalPlayer(),"supporter") or getElementData(getLocalPlayer(),"admin") then
		guiSetVisible(supporterWindow,not showing)
	end
	if showing then
		guiSetVisible(supporterWindow,false)
	end
	showCursor(not showing)
	toggleControl ("chatbox",showing)
	if showing == false then
		--unbindKey("o","down",openSupportChat)
		unbindKey("j","down",showInventory)
	else
	--	bindKey("o","down",openSupportChat)
		bindKey ("j","down",showInventory)
	end
end
bindKey("o","down",openSupportChat)

function outputEditBox ()
      local showing = guiGetVisible(supportWindow)
	guiSetVisible(supportWindow,false)
	showCursor(false)
	toggleControl ("chatbox",true) 
--	bindKey("o","down",openSupportChat)
	bindKey ("j","down",showInventory)
end
addEventHandler ( "onClientGUIClick", closeButton, outputEditBox, false )
--bindKey("o","down",outputEditBox) -- [0000012] Block/Close Fix //DarkIrata

addEventHandler( "onClientGUIAccepted", messageInput,
    function( theElement ) 
		if not isSpamTimer() then
			local text = guiGetText( theElement )
			triggerServerEvent ( "onServerSupportChatMessage", getLocalPlayer(),getLocalPlayer(),text)
		end
		setAntiSpamActive()
		guiSetText(messageInput,"")
    end
)

function outputSupportChat(sourcePlayer,text)
		local row = guiGridListAddRow ( supportGridlist )
		if sourcePlayer == "Sandra" or sourcePlayer == "James" or sourcePlayer == "Paul" then
			name =  sourcePlayer.." (Bot)"
		elseif not getElementData(sourcePlayer,"logedin") then
			name = string.gsub(getPlayerName ( sourcePlayer ), '#%x%x%x%x%x%x', '').." (Guest)"
		else
			if getElementData(sourcePlayer,"admin") then
				name = string.gsub(getPlayerName ( sourcePlayer ), '#%x%x%x%x%x%x', '').." (Admin)"
			elseif getElementData(sourcePlayer,"supporter") then
				name = string.gsub(getPlayerName ( sourcePlayer ), '#%x%x%x%x%x%x', '').." (Supporter)"
			else
				name = string.gsub(getPlayerName ( sourcePlayer ), '#%x%x%x%x%x%x', '').." (Player)"
			end
		end
		guiGridListSetItemText ( supportGridlist, row, nameColumn, name, false, false )
		guiGridListSetItemText ( supportGridlist, row, messageColumn,text , false, false )
		if sourcePlayer == "Sandra" then 
			r,g,b = 255,30,120
		elseif sourcePlayer == "James" or sourcePlayer == "Paul" then
			r,g,b = 255,255,22
		elseif getElementData(sourcePlayer,"admin") then
			r,g,b = 255,22,0
		elseif getElementData(sourcePlayer,"supporter") then
			r,g,b = 22,255,0
		else
			r,g,b = 255,255,255
		end
		guiGridListSetItemColor ( supportGridlist, row, nameColumn, r, g, b )
end
addEvent("onSupportChatMessage",true)
addEventHandler("onSupportChatMessage", getRootElement(),outputSupportChat,true)

--[[
--------------------------------------------------------------------
--Create the AntiSpam Support Chat
--------------------------------------------------------------------
]]


local antiSpamTimer = {}
function setAntiSpamActive()
	if not isTimer(antiSpamTimer) then
		antiSpamTimer = setTimer(killAntiSpamTimer,1000,1)
	else
		killTimer(antiSpamTimer)
		antiSpamTimer = setTimer(killAntiSpamTimer,2500,1)
	end
end

function isSpamTimer()
	if isTimer(antiSpamTimer) then 
		outputChatBox("Please do not spam the support chat!", 255, 255, 0,true)
		return true
	else
		return false
	end
end

function killAntiSpamTimer ()
killTimer(antiSpamTimer)
end



--Vehicles In Water
function checkVehicleInWaterClient ()
vehiclesInWater = {}
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if isElementInWater(veh) then
				table.insert(vehiclesInWater,veh)
		end
	end
	triggerServerEvent("respawnVehiclesInWater",getLocalPlayer(),vehiclesInWater)
end
addEvent("checkVehicleInWaterClient",true)
addEventHandler("checkVehicleInWaterClient",getRootElement(),checkVehicleInWaterClient)


function updatePlayTime()
		--for i,player in ipairs(getElementsByType("player")) do
		--	local account = getPlayerAccount(player)
			--if not isGuestAccount(account) then
			if getElementData(getLocalPlayer(),"logedin") then
				local playtime = getElementData(getLocalPlayer(),"alivetime")
				setElementData(getLocalPlayer(),"alivetime",playtime+1)	
			end	
			--end
		--end
end
setTimer(updatePlayTime, 60000, 0)

--bindKey("z", "down", "chatbox", "radiochat" )


local pingFails = 0
function playerPingCheck ()
	if getPlayerPing(getLocalPlayer()) > gameplayVariables["ping"] then
		pingFails = pingFails +1
		if pingFails == 5 then
			triggerServerEvent("kickPlayerOnHighPing",getLocalPlayer())
			return
		end
			startRollMessage2("Ping", "Your ping is over "..gameplayVariables["ping"].."! ("..pingFails.."/5)", 255, 22, 0 )
		if isTimer(pingTimer) then return end
		pingTimer = setTimer(function()
			pingFails = 0
		end,30000,1)
	end
end	
setTimer(playerPingCheck,4000,0)


-- Version DayZ

versionLabel  = guiCreateLabel(1,1,0.3,0.3,dayzVersion,true)
guiSetSize ( versionLabel, guiLabelGetTextExtent ( versionLabel ), guiLabelGetFontHeight ( versionLabel ), false )
x,y = guiGetSize(versionLabel,true)
guiSetPosition( versionLabel, 1-x, 1-y*2, true )
guiSetAlpha(versionLabel,0.5)

outputDebugString ( "MTA:DayZ Simplified | ssc end" )



