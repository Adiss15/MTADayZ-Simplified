--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]

outputDebugString ( "MTA:DayZ Simplified | weather loaded" )

	setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 88,101,105, 88,101,105 )
	setWeather(4)


function checkSetTime()
    local realtime = getRealTime()
    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
	setTrafficLightState(9)
end
setTimer(checkSetTime,60000,0)
checkSetTime()


function Weather (hour,minutes)
	local hour, minutes = getTime()
	if hour == 5 or hour == 6 then    
	setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 20, 60, 87, 72, 86, 92 )
	setWeather(4)
   elseif hour == 7 or hour ==  8 then
 	setFarClipDistance(400)      
	setFogDistance(-10)
	setSkyGradient( 88,101,105, 88,101,105 )
	setWeather(7)
   elseif hour == 9 then    
	setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 88,101,105, 88,101,105 )
	setWeather(7)
	
	elseif hour == 10 or hour ==  11 or hour ==  12 then   
 	setFarClipDistance(400)      
	setFogDistance(-10)
	setSkyGradient( 88,101,105, 88,101,105 )
	setWeather(7)
	
	elseif hour == 13 or hour == 14 or hour == 15 then  
	setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 207,226,230, 189,216,219 )
	setWeather(4)

	elseif hour == 16 or hour == 17 then    
	setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 88,101,105, 88,101,105 )
	setWeather(4)
	elseif hour == 18 then    
	setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 75,84,80,70,79,76 )
	setWeather(0)
elseif hour == 20 then
      setSkyGradient( 18, 18, 15, 18, 18, 15)
      setFarClipDistance(300)
      setFogDistance(-15)
   elseif hour == 22 or hour == 23 then
         setSkyGradient( 25,25,112,0,1,9  )
  --   setSkyGradient( 37,41,35, 35,36,33 )
      setFarClipDistance(300)
	  		setWeather(0)
      setFogDistance(-10)
   elseif hour == 0 then
      setSkyGradient( 0,1,9, 0,1,3 )
      setFarClipDistance(300)
      setFogDistance(-15)
	 elseif hour == 2 then
	setSkyGradient( 0,1,9, 0,1,3 )
      setFarClipDistance(300)
      setFogDistance(-15)
	  elseif hour == 1 then
setSkyGradient( 0,1,9, 0,1,3 )
setFarClipDistance(300)
setFogDistance(-15)
	  elseif hour == 3 then
setSkyGradient( 0,1,9, 0,1,3 )
setFarClipDistance(300)
	setFogDistance(-15)
elseif hour == 4 then
		setSkyGradient( 0,1,9, 0,1,3 )
		setFarClipDistance(300)
		setFogDistance(-15)
else
	 setFarClipDistance(400)        
	setFogDistance(-10)
	setSkyGradient( 207/minutes,226/minutes,230/minutes, 189/minutes,216/minutes,219/minutes )
	setWeather(4)

   end
setTrafficLightState(9)
setSunSize(0)
setMoonSize(0)
end
addCommandHandler ( "unbugtime", Weather )
setTimer(Weather,3500000,0)
Weather()
addEventHandler("onPlayerLogin", getRootElement(), Weather)
addEventHandler("onPlayerJoin", getRootElement(), Weather)

outputDebugString ( "MTA:DayZ Simplified | weather end" )