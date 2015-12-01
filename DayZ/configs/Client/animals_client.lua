--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]

outputDebugString ( "MTA:DayZ Simplified | animals client loaded" )

snipertxd = engineLoadTXD (":DayZ/mods/bear.txd");
engineImportTXD (snipertxd, 12);
sniperdff = engineLoadDFF (":DayZ/mods/bear.dff", 12);
engineReplaceModel (sniperdff, 12);

snipertxd = engineLoadTXD (":DayZ/mods/fox.txd");
engineImportTXD (snipertxd, 13);
sniperdff = engineLoadDFF (":DayZ/mods/fox.dff", 13);
engineReplaceModel (sniperdff, 13);

snipertxd = engineLoadTXD (":DayZ/mods/wolf.txd");
engineImportTXD (snipertxd, 14);
sniperdff = engineLoadDFF (":DayZ/mods/wolf.dff", 14);
engineReplaceModel (sniperdff, 14);

function animalDamage(attacker,weapon)
if attacker == getLocalPlayer() then
	if getElementData(source,"animal") then
		if weapon and weapon > 1 then
			triggerServerEvent("createDeadAnimal",source)
		end
	end
end	
end
addEventHandler ( "onClientPedDamage",getRootElement(),animalDamage)

outputDebugString ( "MTA:DayZ Simplified | animals client end" )
