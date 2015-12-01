--[[
#---------------------------------------------------------------#
----*			MTA DayZ Simplified                 		*----
----* 			Nucleo: Marwin
----* 			Owner the version simplified: Adiss15+  
----* 			Skype: adisson.oliveira
----*														*----
#---------------------------------------------------------------#
]]



snipertxd = engineLoadTXD ("mods/sniper.txd");
engineImportTXD (snipertxd, 285);
sniperdff = engineLoadDFF ("mods/sniper.dff", 285);
engineReplaceModel (sniperdff, 285);
--Civilian
snipertxd = engineLoadTXD ("mods/civilian.txd");
engineImportTXD (snipertxd, 179);
sniperdff = engineLoadDFF ("mods/civilian.dff", 179);
engineReplaceModel (sniperdff, 179);
--Bandit1
snipertxd = engineLoadTXD ("mods/bandit3.txd");
engineImportTXD (snipertxd, 180);
sniperdff = engineLoadDFF ("mods/bandit3.dff", 180);
engineReplaceModel (sniperdff, 180);
--Bandit2
snipertxd = engineLoadTXD ("mods/bandit2.txd");
engineImportTXD (snipertxd, 288);
sniperdff = engineLoadDFF ("mods/bandit2.dff", 288);
engineReplaceModel (sniperdff, 288);
--Standard
snipertxd = engineLoadTXD ("mods/standart.txd");
engineImportTXD (snipertxd, 73);
sniperdff = engineLoadDFF ("mods/standart.dff", 73);
engineReplaceModel (sniperdff, 73);
--Hero
snipertxd = engineLoadTXD ("mods/hero.txd");
engineImportTXD (snipertxd, 210);
sniperdff = engineLoadDFF ("mods/hero.dff", 210);
engineReplaceModel (sniperdff, 210);

--Items


itemTXD = engineLoadTXD ("items/scruff.txd");
engineImportTXD (itemTXD, 2675);
itemDFF = engineLoadDFF ("items/scruff.dff", 2675);
engineReplaceModel (itemDFF, 2675);


itemTXD = engineLoadTXD ("items/engine.txd");
engineImportTXD (itemTXD, 929);
itemDFF = engineLoadDFF ("items/engine.dff", 929);
engineReplaceModel (itemDFF, 929);






itemTXD = engineLoadTXD ("items/army_clothes.txd");
engineImportTXD (itemTXD, 1247);
itemDFF = engineLoadDFF ("items/army_clothes.dff", 1247);
engineReplaceModel (itemDFF, 1247);

itemTXD = engineLoadTXD ("items/sniper_clothes.txd");
engineImportTXD (itemTXD, 1213);
itemDFF = engineLoadDFF ("items/sniper_clothes.dff", 1213);
engineReplaceModel (itemDFF, 1213);

itemTXD = engineLoadTXD ("items/civilian_clothes.txd");
engineImportTXD (itemTXD, 1241);
itemDFF = engineLoadDFF ("items/civilian_clothes.dff", 1241);
engineReplaceModel (itemDFF, 1241);

itemTXD = engineLoadTXD ("items/standard_clothes.txd");
engineImportTXD (itemTXD, 1577);
itemDFF = engineLoadDFF ("items/standard_clothes.dff", 1577);
engineReplaceModel (itemDFF, 1577);

itemTXD = engineLoadTXD ("items/beans_can.txd");
engineImportTXD (itemTXD, 2601);
itemDFF = engineLoadDFF ("items/beans_can.dff", 2601);
engineReplaceModel (itemDFF, 2601);

itemTXD = engineLoadTXD ("items/first_aid_kit.txd");
engineImportTXD (itemTXD, 2891);
itemDFF = engineLoadDFF ("items/first_aid_kit.dff", 2891);
engineReplaceModel (itemDFF, 2891);

itemTXD = engineLoadTXD ("items/heat_pack.txd");
engineImportTXD (itemTXD, 1576);
itemDFF = engineLoadDFF ("items/heat_pack.dff", 1576);
engineReplaceModel (itemDFF, 1576);

itemTXD = engineLoadTXD ("items/pain_killers.txd");
engineImportTXD (itemTXD, 2709);
itemDFF = engineLoadDFF ("items/pain_killers.dff", 2709);
engineReplaceModel (itemDFF, 2709);

itemTXD = engineLoadTXD ("items/pasta_can.txd");
engineImportTXD (itemTXD, 2770);
itemDFF = engineLoadDFF ("items/pasta_can.dff", 2770);
engineReplaceModel (itemDFF, 2770);

itemTXD = engineLoadTXD ("items/pistol_ammo.txd");
engineImportTXD (itemTXD, 3013);
itemDFF = engineLoadDFF ("items/pistol_ammo.dff", 3013);
engineReplaceModel (itemDFF, 3013);

itemTXD = engineLoadTXD ("items/shotgun_ammo.txd");
engineImportTXD (itemTXD, 2358);
itemDFF = engineLoadDFF ("items/shotgun_ammo.dff", 2358);
engineReplaceModel (itemDFF, 2358);

itemTXD = engineLoadTXD ("items/backpack_small.txd");
engineImportTXD (itemTXD, 3026);
itemDFF = engineLoadDFF ("items/backpack_small.dff", 3026);
engineReplaceModel (itemDFF, 3026);

itemTXD = engineLoadTXD ("items/smg_ammo.txd");
engineImportTXD (itemTXD, 2041);
itemDFF = engineLoadDFF ("items/smg_ammo.dff", 2041);
engineReplaceModel (itemDFF, 2041);

itemTXD = engineLoadTXD ("items/sniper_ammo.txd");
engineImportTXD (itemTXD, 2358);
itemDFF = engineLoadDFF ("items/sniper_ammo.dff", 2358);
engineReplaceModel (itemDFF, 2358);

itemTXD = engineLoadTXD ("items/soda_can.txd");
engineImportTXD (itemTXD, 2647);
itemDFF = engineLoadDFF ("items/soda_can.dff", 2647);
engineReplaceModel (itemDFF, 2647);

itemTXD = engineLoadTXD ("items/water_bottle.txd");
engineImportTXD (itemTXD, 2683);
itemDFF = engineLoadDFF ("items/water_bottle.dff", 2683);
engineReplaceModel (itemDFF, 2683);

itemTXD = engineLoadTXD ("items/assault_ammo.txd");
engineImportTXD (itemTXD, 1271);
itemDFF = engineLoadDFF ("items/assault_ammo.dff", 1271);
engineReplaceModel (itemDFF, 1271);

itemTXD = engineLoadTXD ("items/backpack_alice.txd");
engineImportTXD (itemTXD, 1248);
itemDFF = engineLoadDFF ("items/backpack_alice.dff", 1248);
engineReplaceModel (itemDFF, 1248);

itemTXD = engineLoadTXD ("items/backpack_coyote.txd");
engineImportTXD (itemTXD, 1252);
itemDFF = engineLoadDFF ("items/backpack_coyote.dff", 1252);
engineReplaceModel (itemDFF, 1252);

itemTXD = engineLoadTXD ("items/backpack_czech.txd");
engineImportTXD (itemTXD, 1575);
itemDFF = engineLoadDFF ("items/backpack_czech.dff", 1575);
engineReplaceModel (itemDFF, 1575);
--[[
itemTXD = engineLoadTXD ("items/tent.txd");
engineImportTXD (itemTXD, 3243);
itemDFF = engineLoadDFF ("items/tent.dff", 3243);
engineReplaceModel (itemDFF, 3243);
]]--
itemTXD = engineLoadTXD ("items/wirefence.txd");
engineImportTXD (itemTXD, 983);
itemDFF = engineLoadDFF ("items/wirefence.dff", 983);
engineReplaceModel (itemDFF, 983);

--Weapons

-- Camera -> Binoculars
weaponTXD = engineLoadTXD ("items/camera.txd");
engineImportTXD (weaponTXD, 367);
weaponDFF = engineLoadDFF ("items/camera.dff", 367);
engineReplaceModel (weaponDFF, 367);

-- Katana -> Hatchet
weaponTXD = engineLoadTXD ("items/katana.txd");
engineImportTXD (weaponTXD, 339);
weaponDFF = engineLoadDFF ("items/katana.dff", 339);
engineReplaceModel (weaponDFF, 339);


