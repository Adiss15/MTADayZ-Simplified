--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]
outputDebugString ( "MTA:DayZ Simplified | addons loaded" )

function addAddonInfo ()
		setGameType (GameType)
end


function loadAddons( res )
	for resourceKey, resourceValue in ipairs(getResources()) do
	local name = getResourceName(resourceValue)
	if string.find(name,"simplified_") then
		setTimer(startResource,2000,1,resourceValue)
	end
end
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), loadAddons )

function unloadAddons ( res )
	for resourceKey, resourceValue in ipairs(getResources()) do
	local name = getResourceName(resourceValue)
	if string.find(name,"simplified_") then
		stopResource(resourceValue)
	end
end
end
addEventHandler ( "onResourceStop", getResourceRootElement(getThisResource()), unloadAddons )
outputDebugString ( "MTA:DayZ Simplified | addons end" )