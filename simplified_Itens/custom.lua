addEventHandler('onClientResourceStart', resourceRoot, 
function() 

-- Tent

    local txd = engineLoadTXD('itens/craigpackage.txd',true)
        engineImportTXD(txd, 1279)

    
    local dff = engineLoadDFF('itens/craigpackage.dff', 0) 
    engineReplaceModel(dff, 1279)
    
--

itemTXD = engineLoadTXD ("itens/tent_mounted.txd");
engineImportTXD (itemTXD, 3243);
itemDFF = engineLoadDFF ("itens/tent_mounted.dff", 3243);
engineReplaceModel (itemDFF, 3243);
col = engineLoadCOL ( "itens/tent_mounted.col" )
engineReplaceCOL ( col, 3243 )
engineSetModelLODDistance(3243, 60)

-- Pneu

    local txd = engineLoadTXD('itens/wheel_sr6.txd',true)
        engineImportTXD(txd, 1073)

    
    local dff = engineLoadDFF('itens/wheel_sr6.dff', 0) 
    engineReplaceModel(dff, 1073)

--

-- Painkiller

    local txd = engineLoadTXD('itens/pain_killers.txd',true)
        engineImportTXD(txd, 2709)

    
    local dff = engineLoadDFF('itens/pain_killers.dff', 0) 
    engineReplaceModel(dff, 2709)

--

-- Wire Fence

    local txd = engineLoadTXD('itens/wirefence.txd',true)
        engineImportTXD(txd, 933)

    
    local dff = engineLoadDFF('itens/wirefence.dff', 0) 
    engineReplaceModel(dff, 933)

--

-- Engine

    local txd = engineLoadTXD('itens/generator.txd',true)
        engineImportTXD(txd, 929)

    
    local dff = engineLoadDFF('itens/generator.dff', 0) 
    engineReplaceModel(dff, 929)

--

-- Gas Patrol

    local txd = engineLoadTXD('itens/petrolcanm.txd',true)
        engineImportTXD(txd, 1650)

    
    local dff = engineLoadDFF('itens/petrolcanm.dff', 0) 
    engineReplaceModel(dff, 1650)

--

-- Toolbox

    local txd = engineLoadTXD('itens/cardboardbox4.txd',true)
        engineImportTXD(txd, 2969)

    
    local dff = engineLoadDFF('itens/cardboardbox4.dff', 0) 
    engineReplaceModel(dff, 2969)

--

-- Toolbox

    local txd = engineLoadTXD('itens/dyn_woodpile2.txd',true)
        engineImportTXD(txd, 1463)

    
    local dff = engineLoadDFF('itens/dyn_woodpile2.dff', 0) 
    engineReplaceModel(dff, 1463)
--

--BANDAGE

 local txd = engineLoadTXD('itens/bandage.txd',true)
        engineImportTXD(txd, 1578)

    
    local dff = engineLoadDFF('itens/bandage.dff', 0) 
    engineReplaceModel(dff, 1578)	
--

-- Morphine
    local txd = engineLoadTXD('itens/morphine.txd',true)
        engineImportTXD(txd, 1579)

    
    local dff = engineLoadDFF('itens/morphine.dff', 1) 
    engineReplaceModel(dff, 1579)

--
-- Watch
    local txd = engineLoadTXD('itens/watch.txd',true)
        engineImportTXD(txd, 2710)

    
    local dff = engineLoadDFF('itens/watch.dff', 1) 
    engineReplaceModel(dff, 2710)

--
-- Map
    local txd = engineLoadTXD('itens/map.txd',true)
        engineImportTXD(txd, 1277)

    
    local dff = engineLoadDFF('itens/map.dff', 1) 
    engineReplaceModel(dff, 1277)

--
-- GPS
    local txd = engineLoadTXD('itens/gps.txd',true)
        engineImportTXD(txd, 2976)

    
    local dff = engineLoadDFF('itens/gps.dff', 1) 
    engineReplaceModel(dff, 2976)

--
-- Box of Machines
    local txd = engineLoadTXD('itens/box.txd',true)
        engineImportTXD(txd, 328)

    
    local dff = engineLoadDFF('itens/box.dff', 1) 
    engineReplaceModel(dff, 328)

--
-- Roadflare
    local txd = engineLoadTXD('itens/rodf.txd',true)
        engineImportTXD(txd, 324)

    
    local dff = engineLoadDFF('itens/rodf.dff', 1) 
    engineReplaceModel(dff, 324)

--
-- Night Vision & Infrared
    local txd = engineLoadTXD('itens/night.txd',true)
        engineImportTXD(txd, 368)

    
    local dff = engineLoadDFF('itens/night.dff', 1)
    engineReplaceModel(dff, 368)
	
    local txd = engineLoadTXD('itens/night.txd',true)
        engineImportTXD(txd, 369)

    
    local dff = engineLoadDFF('itens/night.dff', 1)
    engineReplaceModel(dff, 369)

--
-- Raw meat e Cooked meat
    local txd = engineLoadTXD('itens/raw.txd',true)
        engineImportTXD(txd, 2804)

    
    local dff = engineLoadDFF('itens/raw.dff', 1)
    engineReplaceModel(dff, 2804)
	
    local txd = engineLoadTXD('itens/cook.txd',true)
        engineImportTXD(txd, 2806)

    
    local dff = engineLoadDFF('itens/cook.dff', 1)
    engineReplaceModel(dff, 2806)

--
--
    engineSetModelLODDistance(1578, 500)
    engineSetModelLODDistance(1073, 500)
    engineSetModelLODDistance(2709, 500)        
    engineSetModelLODDistance(1582, 500)
    engineSetModelLODDistance(933, 500)
    engineSetModelLODDistance(929, 500)
    engineSetModelLODDistance(1650, 500)
    engineSetModelLODDistance(2969, 500)
    engineSetModelLODDistance(1463, 500)
end 
)