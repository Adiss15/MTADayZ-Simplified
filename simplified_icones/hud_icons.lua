local screenWidth,screenHeight = guiGetScreenSize()

function createText1 ( )

dxDrawImage(screenWidth * 0.95, screenHeight * 0.410, screenHeight * 0.063, screenHeight * 0.063, "hud_icons/other/sound.png", 0, 0, 0, tocolor(67, 150, 39))
local sound = getElementData(getLocalPlayer(), "volume") / 20
if sound > 1 then
dxDrawImage(screenWidth * 0.91, screenHeight * 0.41, screenHeight * 0.063, screenHeight * 0.063,  "hud_icons/other/level_" .. sound .. ".png", 0, 0, 0, tocolor(67, 150, 39))
end

dxDrawImage(screenWidth * 0.95, screenHeight * 0.475, screenHeight * 0.063, screenHeight * 0.063, "hud_icons/other/eye.png", 0, 0, 0, tocolor(67, 150, 39))
local sound = getElementData(getLocalPlayer(), "visibly") / 20
if sound > 1 then
dxDrawImage(screenWidth * 0.91, screenHeight * 0.475, screenHeight * 0.063, screenHeight * 0.063, "hud_icons/other/level_" .. sound .. ".png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "brokenbone", true) then
dxDrawImage(screenWidth * 0.95, screenHeight * 0.560, screenHeight * 0.063, screenHeight * 0.063, "hud_icons/other/brokenbone.png", 0, 0, 0, tocolor(255, 255, 255))
end

--[[
dxDrawImage(screenWidth * 0.95, screenHeight * 0.660, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/other/fundo.png", 0, 0, 0)
dxDrawImage(screenWidth * 0.95, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/other/fundo.png", 0, 0, 0)
dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/other/fundo.png", 0, 0, 0)
dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/other/fundo.png", 0, 0, 0)
--]]
	-- Temperature

dxDrawImage(screenWidth * 0.95, screenHeight * 0.660, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/temp/border.png", 0, 0, 0, tocolor(67, 150, 39))
   
if getElementData(getLocalPlayer(), "temperature") >= 35 and getElementData(getLocalPlayer(), "temperature") <= 36 then
elementtemp4 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.660, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/temp/35.png", 0, 0, 0, tocolor(133, 5, 7))
end

if getElementData(getLocalPlayer(), "temperature") >= 36 and getElementData(getLocalPlayer(), "temperature") <= 37 then
elementtemp3 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.660, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/temp/36.png", 0, 0, 0, tocolor(133, 5, 7))
end

if getElementData(getLocalPlayer(), "temperature") >= 37 and getElementData(getLocalPlayer(), "temperature") <= 38 then
elementtemp2 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.660, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/temp/37.png", 0, 0, 0, tocolor(133, 5, 7))
end

if getElementData(getLocalPlayer(), "temperature") >= 38 and getElementData(getLocalPlayer(), "temperature") <= 39 then
elementtemp1 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.660, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/temp/38.png", 0, 0, 0, tocolor(133, 5, 7))
end

	-- Thrist

dxDrawImage(screenWidth * 0.950, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/thirst/border.png", 0, 0, 0, tocolor(67, 150, 39))
   
if getElementData(getLocalPlayer(), "thirst") >= 0 and getElementData(getLocalPlayer(), "thirst") <= 20 then
elementdrink1 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/thirst/20.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "thirst") >= 20 and getElementData(getLocalPlayer(), "thirst") <= 40 then
elementdrink2 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/thirst/40.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "thirst") >= 40 and getElementData(getLocalPlayer(), "thirst") <= 60 then
elementdrink3 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/thirst/60.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "thirst") >= 60 and getElementData(getLocalPlayer(), "thirst") <= 80 then
elementdrink4 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/thirst/80.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "thirst") >= 80 then
elementdrink5 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.740, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/thirst/100.png", 0, 0, 0, tocolor(67, 150, 39))
end
	
	-- Blood

dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/blood/border.png", 0, 0, 0, tocolor(67, 150, 39))

if getElementData(getLocalPlayer(), "blood") >= -1616 and getElementData(getLocalPlayer(), "blood") <= 1106 then    
elementblood1 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/blood/20.png", 0, 0, 0, tocolor(67, 150, 39))
end  

if getElementData(getLocalPlayer(), "blood") >= 1106 and getElementData(getLocalPlayer(), "blood") <= 3828 then
elementblood2 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/blood/40.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "blood") >= 3828 and getElementData(getLocalPlayer(), "blood") <= 6550 then   
elementblood3 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/blood/60.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "blood") >= 6550 and getElementData(getLocalPlayer(), "blood") <= 9278 then
elementblood4 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/blood/80.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "blood") >= 9278 and getElementData(getLocalPlayer(), "blood") <= 12000 then    
elementblood5 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.815, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/blood/100.png", 0, 0, 0, tocolor(67, 150, 39))
end

	-- Food

dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/eat/border.png", 0, 0, 0, tocolor(67, 150, 39))

if getElementData(getLocalPlayer(), "food") >= 0 and getElementData(getLocalPlayer(), "food") < 20 then
elementfood1 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/eat/20.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "food") >= 20 and getElementData(getLocalPlayer(), "food") < 40 then
elementfood2 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/eat/40.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "food") >= 40 and getElementData(getLocalPlayer(), "food") < 60 then
elementfood3 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/eat/60.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "food") >= 40 and getElementData(getLocalPlayer(), "food") < 80 then
elementfood4 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/eat/80.png", 0, 0, 0, tocolor(67, 150, 39))
end

if getElementData(getLocalPlayer(), "food") >= 80 then
elementfood5 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.890, screenHeight * 0.070, screenHeight * 0.070, "hud_icons/eat/100.png", 0, 0, 0, tocolor(67, 150, 39))
end
end

function HandleTheRendering ( )
if render then
removeEventHandler ( "onClientRender", root, createText1 )
render = false
else
addEventHandler ( "onClientRender", root, createText1 )
render = true
end
end
addEventHandler ( "onClientResourceStart", resourceRoot, HandleTheRendering )  
 
bindKey( 'F3', 'down', HandleTheRendering )

fileDelete ( "hud_icons.lua" )





	









