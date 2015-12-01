--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]
outputDebugString ( "MTA:DayZ Simplified | spawn loaded" )

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




Skins = {}


function spawnDayZPlayer(player)
  local number = math.random(table.size(spawnPositions))
  local x, y, z = spawnPositions[number][1], spawnPositions[number][2], spawnPositions[number][3]
  spawnPlayer(player, x, y, z + 0.5, math.random(0, 360), 73, 0, 0)
  fadeCamera(player, true)
  setCameraTarget(player, player)
  playerCol = createColSphere(x, y, z, 1.5)
  setElementData(player, "playerCol", playerCol)
  attachElements(playerCol, player, 0, 0, 0)
  setElementData(playerCol, "parent", player)
  setElementData(playerCol, "player", true)
  local account = getPlayerAccount(player)
  setAccountData(account, "isDead", false)
  setElementData(player, "isDead", false)
  setElementData(player, "logedin", true)
  setElementData(player, "admin", getAccountData(account, "admin") or false)
  setElementData(player, "supporter", getAccountData(account, "supporter") or false)
  for i, data in ipairs(tabelALL) do
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
		elseif data[1] =="temperature" then
			setElementData(player,data[1],37)
		elseif data[1] =="GPS_frequency" then
			setElementData(player,data[1],math.random(1,25000))			
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
end



function checkBuggedAccount()
  for i, player in ipairs(getElementsByType("player")) do
    local account = getPlayerAccount(player)
    if not account then
      return
    end
    if getElementData(player, "logedin") and getElementModel(player) == 0 then
      spawnDayZPlayer(player)
      outputChatBox("Account from " .. getPlayerName(player) .. ", RESETED.", getRootElement(), 22, 255, 22, true)
    end
  end
end
setTimer(checkBuggedAccount, 3000, 0)



function notifyAboutExplosion2()
  for i, player in pairs(getVehicleOccupants(source)) do
    triggerEvent("kilLDayZPlayer", player)
  end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)



function destroyDeadPlayer(ped, pedCol)
  destroyElement(ped)
  destroyElement(pedCol)
end





function kilLDayZPlayer(killer, headshot, weapon)
	pedCol = false
	local account = getPlayerAccount(source)
	if not account then
		return
	end
	killPed(source)
	triggerClientEvent(source, "hideInventoryManual", source)
	if getElementData(source, "alivetime") > 5 and not isElementInWater(source) then
			local x, y, z = getElementPosition(source)
			if getDistanceBetweenPoints3D(x, y, z, 6000, 6000, 0) > 200 then
			  local x, y, z = getElementPosition(source)
			  local rotX, rotY, rotZ = getElementRotation(source)
			  local skin = getElementModel(source)
			  local ped = createPed(skin, x, y, z, rotZ)
			  pedCol = createColSphere(x, y, z, 1.5)
			  killPed(ped)
			  setTimer(destroyDeadPlayer, 2700000, 1, ped, pedCol)
			  attachElements(pedCol, ped, 0, 0, 0)
			  setElementData(pedCol, "parent", ped)
			  setElementData(pedCol, "playername", getPlayerName(source))
			  setElementData(pedCol, "deadman", true)
			  setElementData(pedCol, "MAX_Slots", getElementData(source, "MAX_Slots"))
			  local time = getRealTime()
			  local hours = time.hour
			  local minutes = time.minute
			  setElementData(pedCol, "deadreason", "#FF6A00" .. getPlayerName(source) .. " #FFFFFFestá morto(a) | Arma utilizada: #FF6A00" .. (weapon or "desconhecida") .. "#FFFFFF | Quando morreu: #FF6A00" .. hours .. ":" .. minutes .. "#FFFFFF.")
			end

	end
	if killer then
		if not getElementData(source, "bandit") then
			addPlayerStats(killer, "humanity", math.random(-2500, -1000))
		else
			addPlayerStats(killer, "humanity", math.random(1000, 2500))
		end
		if getElementData(source, "alivetime") > 2 then
			setElementData(killer, "murders", getElementData(killer, "murders") + 1)
		else
			outputChatBox("Você não ganhou um 'assassinato' pois matou um jogagdor com poucas horas de jogo.", source)
		end
		if 0 > getElementData(killer, "humanity") then
			setElementData(killer, "bandit", true)
		end
		if getElementData(source, "bandit") == true then
			setElementData(killer, "banditskilled", getElementData(killer, "banditskilled") + 1)
		end
		if headshot == true then
			setElementData(killer, "headshots", getElementData(killer, "headshots") + 1)
		end
	end
  if pedCol then
    for i, data in ipairs(tabelALL) do
      local plusData = getElementData(source, data[1])
      if data[1] == Weapon_PistolAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == Weapon_SilencedAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 15)
      elseif data[1] == Weapon_DesertAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == Weapon_UziAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 30)
      elseif data[1] == Weapon_MP5Ammo then
        plusData = math.floor(getElementData(source, data[1]) / 20)
      elseif data[1] == Weapon_AKAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 30)
      elseif data[1] == Weapon_M4Ammo then
        plusData = math.floor(getElementData(source, data[1]) / 20)
      elseif data[1] == Weapon_SniperAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 5)
      elseif data[1] == Weapon_CountryAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 10)
      elseif data[1] == Weapon_ShotgunAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == Weapon_SpasAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == Weapon_SawnOffAmmo then
        plusData = math.floor(getElementData(source, data[1]) / 2)
      end
      setElementData(pedCol, data[1], plusData)
    end
    local skinID = getElementData(source, "skin")
    local skin = getSkinNameFromID(skinID)
    setElementData(pedCol, skin, 1)
    local backpackSlots = getElementData(source, "MAX_Slots")
    if backpackSlots == 12 then
      setElementData(pedCol, "Assault Pack (ACU)", 1)
    elseif backpackSlots == 16 then
      setElementData(pedCol, "Alice Pack", 1)
    elseif backpackSlots == 26 then
      setElementData(pedCol, "Czech Backpack", 1)
    elseif backpackSlots == 36 then
      setElementData(pedCol, "Coyote Backpack", 1)
    end
  end
  setTimer(setElementPosition, 500, 1, source, 6000, 6000, 0)
  triggerClientEvent(source, "onClientPlayerDeathInfo", source)
  setAccountData(account, "isDead", true)
  setElementData(source, "isDead", true)
  setAccountData(account, "armor", false)
  setElementData(source, "armor", false)
  triggerClientEvent("onRollMessageStart", getRootElement(), "#FFFFFF" .. getPlayerName(source) .. " #FFFFFFmorreu.", 0, 22, 255, "died")
  destroyElement(getElementData(source, "playerCol"))
  setTimer(spawnDayZPlayer, 5000, 1, source)
end
addEvent("kilLDayZPlayer", true)
addEventHandler("kilLDayZPlayer", getRootElement(), kilLDayZPlayer)



outputDebugString ( "MTA:DayZ Simplified | pickups end" )



