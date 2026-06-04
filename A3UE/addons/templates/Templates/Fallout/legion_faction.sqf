// legion_faction.sqf
// Caesar's Legion faction template for Antistasi
// Based on Fallout: New Vegas lore — low-tech, melee-heavy, brutal Roman-themed army.
// Basic troops carry melee weapons and primitive firearms. Only upper ranks (Centurions,
// Praetorians, Legate) carry quality ranged weapons. NO energy weapons ever.
// Old File base: bos_faction.sqf

private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

#include "..\..\script_component.hpp"

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Caesar's Legion"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "Legion"]] call _fnc_saveToTemplate;

["flag", "flag_CL"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_white_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_NATO"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

// Legion doesn't run much mechanized — they on horses and on foot mostly.
// What few vehicles they use are captured or repurposed.
["ammobox", "skyrix_chryslusM_355_Ammo"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_IND_Equip_F"] call _fnc_saveToTemplate;

["smallBunker", "fallout_turret_wall_180"] call _fnc_saveToTemplate;
["sandbag", "fallout_turret_wall"] call _fnc_saveToTemplate;
["sandbagRound", "fallout_turret_wall_90"] call _fnc_saveToTemplate;

// Vehicles are minimal — Legion captures what they can but prefers foot movement
["vehiclesBasic", ["AM_Buggy", "B_BFMRRaiders_Old_World_Pick_Up_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["AM_Buggy", "B_BFMRRaiders_Old_World_Pick_Up_01", "B_BFMRRaiders_Old_World_Highwayman_01"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["B_G_Offroad_01_armed_F", "Max_res_Offroad_Arm"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["B_BFMRRaiders_Old_World_Bus_01", "B_BFMRRaiders_Old_World_GMC_Vandura_01"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_BFMRRaiders_Old_World_Bus_01", "AM_Transp_Truck"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["skyrix_chryslusM_355_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["skyrix_chryslusM_355_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["skyrix_chryslusM_355_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["skyrix_chryslusM_355"]] call _fnc_saveToTemplate;
// Legion has very limited armor — they mostly captured gear
["vehiclesAPCs", ["AM_APC"]] call _fnc_saveToTemplate;
["vehiclesTanks", []] call _fnc_saveToTemplate;
["vehiclesAA", []] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;

["vehiclesTransportBoats", []] call _fnc_saveToTemplate;
["vehiclesGunBoats", []] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

// Legion has no air assets — Caesar rejects pre-war tech
["vehiclesPlanesCAS", []] call _fnc_saveToTemplate;
["vehiclesPlanesAA", []] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;
["vehiclesAirborne", []] call _fnc_saveToTemplate;
["vehiclesAirPatrol", []] call _fnc_saveToTemplate;

["vehiclesArtillery", []] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray []] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

// Militia: captured pre-war civvy vehicles and old trucks
["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["B_BFMRRaiders_Old_World_Bus_01", "B_BFMRRaiders_Old_World_Van_01"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["B_BFMRRaiders_Old_World_Pick_Up_01", "B_BFMRRaiders_Old_World_Highwayman_01", "B_BFMRRaiders_Old_World_Corvega_Sedan_01"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", []] call _fnc_saveToTemplate;

["vehiclesPolice", ["B_BFMRRaiders_Old_World_Pick_Up_01"]] call _fnc_saveToTemplate;

// Legion uses primitive static defenses — they build fortifications but nothing fancy
["staticMGs", ["B_BFMRRaiders_M2_01", "B_BFMRRaiders_M2_Low_01", "fallout_turret"]] call _fnc_saveToTemplate;
["staticAT", ["fallout_turret_wall"]] call _fnc_saveToTemplate;
["staticAA", []] call _fnc_saveToTemplate;
["staticMortars", ["B_Fallout_Minutemen_82mm_Mortar_01"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;
["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

// Legion loves mines — they booby-trap everything
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSTripMine"]] call _fnc_saveToTemplate;

["animations", [
    ["vehClass", ["animsourcefromgarage1", 0.3, "animsourcefromgarage2", 0.25, "animsourcefromgarage3", 0.3, "animsourcefromgarage4", 0.3]],
    ["", []]
]] call _fnc_saveToTemplate;

["variants", [
    ["vehClass", ["paint", 1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

// Legion is drawn from conquered tribes across the Southwest — diverse but brutal
["faces", [
    "WhiteHead_01",
    "WhiteHead_02",
    "WhiteHead_03",
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "AfricanHead_A3_01",
    "AfricanHead_A3_02",
    "AsianHead_A3_01"
]] call _fnc_saveToTemplate;

["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG"]] call _fnc_saveToTemplate;

// Frumentarii (SF) — Caesar's spies. They undercover, they blend in
["sfVoices", ["Male01ENG", "Male02ENG", "Male03ENG"]] call _fnc_saveToTemplate;
["sfFaces", []] call _fnc_saveToTemplate;
["milVoices", []] call _fnc_saveToTemplate;
["milFaces", []] call _fnc_saveToTemplate;
["polVoices", []] call _fnc_saveToTemplate;
["polFaces", []] call _fnc_saveToTemplate;
// Elite: Praetorian Guard voices — the hardest of the hard
["eliteVoices", ["Male01ENG", "Male02ENG", "Male03ENG"]] call _fnc_saveToTemplate;
["eliteFaces", []] call _fnc_saveToTemplate;

["insignia", []] call _fnc_saveToTemplate;
["sfInsignia", []] call _fnc_saveToTemplate;
["milInsignia", []] call _fnc_saveToTemplate;
["polInsignia", []] call _fnc_saveToTemplate;
["eliteInsignia", []] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

// ==================================================================================
// WEAPON ASSIGNMENT PHILOSOPHY (LEGION):
//
// Caesar's Legion is LOW-TECH by DESIGN. Caesar forbids advanced tech — the whole
// ideology is about returning to pre-gunpowder strength through discipline and
// numbers. The hierarchy goes:
//
// RECRUITS/EXPLORERS: Melee only (machetes, spears, knives, sledgehammers)
//                     Plus maybe a sawed-off shotgun or pipe gun as backup
//
// SOLDIERS (Prime): Cowboy Repeaters, hunting rifles, lever-action shotguns,
//                   revolvers. Some carry SMGs but mostly slave to ranged fire.
//
// VETERANS: Better firearms — assault carbines, hunting rifles, tommy guns,
//           marksman-grade weapons. Centurions carry quality pistols + rifles.
//
// CENTURION/PRAETORIAN (Elite/SF): The best non-energy weapons available —
//                                  Anti-Materiel Rifle, Marksman, .357 unique,
//                                  Grenade Rifles, Assault Carbine GRA variants.
//
// LEGATE LANIUS (Officer): carries the best melee + best firearms
//
// FRUMENTARII (Special Forces): These boys operate in plain clothes, carrying
//                                concealable weapons — pistols, pipe guns, SMGs.
//                                They're spies. No heavy weapons. No Fat Man.
//                                NOBODY in the Legion gets the Fat Man — Caesar
//                                despises that level of pre-war tech dependence.
//
// NO ENERGY WEAPONS — EVER. That's Caesar's whole thing.
// NO FAT MAN for Legion under any circumstances.
// ==================================================================================

private _loadoutData = call _fnc_createLoadoutData;

// --- Primary Weapons ---
// Squad leaders: Centurions — carry the better rifles, maybe a GL
_loadoutData set ["slRifles", ["AM_CowboyRepeater", "AM_AssaultCarbine", "AM_G3AssaultRifle"]];
// Standard rifles: Cowboy Repeater and hunting rifles — Legion staples
_loadoutData set ["rifles", ["AM_CowboyRepeater", "AM_CowboyRepeaterB", "AM_HuntingRifle", "AM_HuntingRifle_Mod"]];
// Carbines: basic assault carbine, caravan shotgun, lever shotgun for closer range
_loadoutData set ["carbines", ["AM_CaravanShotgun", "AM_LeverShotgun", "AM_CARifle"]];
// Grenade launchers: M79 for the few Legion soldiers who use them
_loadoutData set ["grenadeLaunchers", ["AM_M79", "AM_M79_Merc"]];
// Designated grenade launchers same — Legion don't have many
_loadoutData set ["designatedGrenadeLaunchers", ["AM_M79"]];
// SMGs: Tommy guns — captured or looted, Legion uses them when found
_loadoutData set ["SMGs", ["AM_Tommygun", "AM_TommygunS", "AM_9mmSMG"]];
// MGs: BAR and M1919 — heavy support for Legion's assault columns
_loadoutData set ["machineGuns", ["AM_BAR", "AM_M1919", "AM_LMG"]];
// Marksman: Hunting Rifle variants and the basic Marksman rifle
_loadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k", "AM_Marksman", "AM_CowboyRepeater4k_Scout"]];
// Snipers: Anti-Mat Rifle and Gobi — only veteran snipers
_loadoutData set ["sniperRifles", ["AM_AntiMatRifle", "AM_SniperRifleGobi"]];

// --- Launchers ---
// Light AT: Bazooka — old school, Legion would use these captured
_loadoutData set ["lightATLaunchers", ["AM_bazooka"]];
_loadoutData set ["lightHELaunchers", []];
// Standard AT: Basic missile launcher — Legion hates this tech but uses captured ones
_loadoutData set ["ATLaunchers", ["AM_bazooka", "AM_m72"]];
// Guided AT: Very rare for Legion
_loadoutData set ["missileATLaunchers", []];
// AA: Also very rare
_loadoutData set ["AALaunchers", ["AM_launch_MissileLauncherSight_Shark"]];

// --- Sidearms ---
// .357 revolver is THE Legion pistol. Also .45 and 12.7mm for higher ranks
_loadoutData set ["sidearms", ["AM_357Rev", "AM_357RevShort", "AM_357Rev_HD", "AM_M1911"]];

// --- Explosives ---
// Legion uses dynamite and planted explosives, not fancy ordnance
// No Fat Man — EVER — for Legion
_loadoutData set ["ATMines", []];
_loadoutData set ["APMines", []];
_loadoutData set ["lightExplosives", []];
_loadoutData set ["heavyExplosives", []]; // NO Fat Man for Legion period

// --- Grenades ---
_loadoutData set ["antiInfantryGrenades", []];
_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["smokeGrenades", []];
_loadoutData set ["signalsmokeGrenades", []];

// --- Gear Items ---
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
// Legion don't trust pre-war tech — very limited NVGs
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["AM_binoculars_small"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

// --- Special Role Gear ---
// Traitor: Marked men / disgraced Legion — wearing rags and scraps
_loadoutData set ["traitorUniforms", ["wastelandclothing01_uniform", "wastelandclothing03_uniform", "legionexplorer_uniform"]];
_loadoutData set ["traitorVests", []];
_loadoutData set ["traitorHats", ["legionbandana", "am_cowboyHat_Bent_brown", "jessupbandana"]];

// Officer: Caesar's officers — Legate-tier, the finest Legion armor
_loadoutData set ["officerUniforms", ["legate_armor_uniform", "centurion_uniform", "caesar_uniform"]];
_loadoutData set ["officerVests", []];
_loadoutData set ["officerHats", ["legate_helm", "centurion_helmet", "legionfeatherhead01"]];

// Cloak: Frumentarii operatives — plain wasteland clothes, blending in
_loadoutData set ["cloakUniforms", ["wasteland_doctor_01_uniform", "wastelandclothing01_uniform", "1950stylecasual01_uniform"]];
_loadoutData set ["cloakVests", []];
// Frumentarii carry concealable weapons only
_loadoutData set ["cloakRifles", ["AM_CARifle"]];
_loadoutData set ["cloakCarbines", ["AM_9mmSMG"]];
_loadoutData set ["cloakSidearms", ["AM_357Rev", "AM_M1911"]];
_loadoutData set ["cloakGlasses", []];

// --- Standard Troop Uniforms ---
// Legion armor variants: Recruit, Prime, Veteran
_loadoutData set ["uniforms", ["legion_recruit_uniform", "legionprime_uniform", "legionveteran_uniform", "legionexplorer_uniform"]];
_loadoutData set ["slUniforms", ["legionveteran_uniform", "centurion_uniform"]];
_loadoutData set ["vests", []]; // Legion armor is the uniform — no separate vests
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["backpacks", ["AM_AvBagInvis", "AM_SmallBagInvis"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_mtp_F"]];
_loadoutData set ["atBackpacks", ["AM_AvBagInvis"]];
// Helmets: Legion wolf head, standard legion helmet, bandana headgear
_loadoutData set ["helmets", ["legionhelmetbase", "legionwhitehelmetbase", "legionbandana", "legionwollfhead"]];
_loadoutData set ["slHat", ["legionfeatherhead01", "legionfeatherhead02", "centurion_helmet"]];
_loadoutData set ["sniHats", ["legionbandana", "legionhood"]];

_loadoutData set ["facewear", []];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

// Item sets
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////
// Frumentarii — Caesar's secret police and intelligence network
// These ain't warriors in the traditional sense — they're spies and assassins
// Operating undercover in wasteland civilian clothes
// They carry concealable, conventional weapons only
// Absolutely NO energy weapons, NO Fat Man, NO heavy ordnance

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
// Plain clothes — they blending in out in the wasteland
_sfLoadoutData set ["uniforms", ["wasteland_doctor_01_uniform", "wastelandclothing01_uniform", "1950stylecasual01_uniform", "wastelandsettler03_uniform"]];
_sfLoadoutData set ["vests", []];
_sfLoadoutData set ["Hvests", []];
_sfLoadoutData set ["glVests", []];
_sfLoadoutData set ["backpacks", ["AM_SmallBagInvis"]];
// No helmets — they undercover
_sfLoadoutData set ["helmets", ["am_cowboyHat_Bent_brown", "am_cowboyHat_Bent_beige", "AM_Cap_Grey", "AM_Cap_Green"]];

// Frumentarii carry reliable conventional firearms — nothing that draws attention
_sfLoadoutData set ["slRifles", ["AM_AssaultCarbine", "AM_CARifle"]];
_sfLoadoutData set ["rifles", ["AM_AssaultCarbine", "AM_G3AssaultRifle", "AM_CARifle"]];
_sfLoadoutData set ["carbines", ["AM_9mmSMG", "AM_10mmSMG", "AM_Tommygun"]];
// Frumentarii marksmen use hunting rifles — concealable, accurate
_sfLoadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k", "AM_Marksman"]];
_sfLoadoutData set ["sniperRifles", ["AM_SniperRifleGobi", "AM_AntiMatRifle"]];
// Machine guns available for ambushes
_sfLoadoutData set ["machineGuns", ["AM_BAR", "AM_M1919"]];
// Frumentarii sidearms: quality pistols, things that can be concealed
_sfLoadoutData set ["sidearms", ["AM_357Rev_Lucky", "AM_357Rev_HD", "AM_M1911HD"]];
// NO explosives for undercover operatives — too conspicuous
_sfLoadoutData set ["lightExplosives", []];
_sfLoadoutData set ["heavyExplosives", []];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////
// Praetorian Guard and Veteran Legionaries
// The most feared fighters in the wastes — hand-picked warriors
// They get the absolute best conventional weapons the Legion has access to

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["legionpretorian_uniform", "legionveteran_uniform", "centurion_uniform"]];
_eliteLoadoutData set ["vests", []];
_eliteLoadoutData set ["Hvests", []];
_eliteLoadoutData set ["glVests", []];
_eliteLoadoutData set ["backpacks", ["AM_AvBagInvis"]];
// Praetorian helmets and veteran headgear
_eliteLoadoutData set ["helmets", ["centurion_helmet", "legionfeatherhead01", "legionfeatherhead02", "legate_helm_open"]];

// Elite get the best non-energy weapons: Assault Carbine GRA, Marksman, etc
_eliteLoadoutData set ["slRifles", ["AM_AssaultCarbine_GRA", "AM_G3AssaultRifle_mod"]];
_eliteLoadoutData set ["rifles", ["AM_AssaultCarbine_GRA", "AM_G3AssaultRifle", "AM_AssaultCarbine"]];
_eliteLoadoutData set ["carbines", ["AM_CARifle_Mod", "AM_Tommygun_Mod"]];
_eliteLoadoutData set ["machineGuns", ["AM_M1919", "AM_BAR_Mod"]];
_eliteLoadoutData set ["marksmanRifles", ["AM_MarksmanAM", "AM_HuntingRifle_mod_4k"]];
_eliteLoadoutData set ["sniperRifles", ["AM_AntiMatRifle", "AM_SniperRifleGobi"]];
// Best Legion sidearms: Lucky .357, Anti-Material for pistol options
_eliteLoadoutData set ["sidearms", ["AM_357Rev_Lucky", "AM_357Rev_HD", "AM_M1911HD"]];
// Still NO Fat Man — that's against everything Caesar stands for
_eliteLoadoutData set ["lightExplosives", []];
_eliteLoadoutData set ["heavyExplosives", []];
// Elite get limited NVGs — captured pre-war tech they use but don't rely on
_eliteLoadoutData set ["NVGs", ["am_nvg_anpvs7"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////
// Prime Legionaries — the backbone of Caesar's army
// Better armed than recruits, disciplined soldiers

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["legionprime_uniform", "legionveteran_uniform"]];
_militaryLoadoutData set ["vests", []];
_militaryLoadoutData set ["backpacks", ["AM_AvBagInvis"]];
_militaryLoadoutData set ["helmets", ["legionhelmetbase", "legionwhitehelmetbase", "legionwollfhead"]];

// Prime Legionaries: Cowboy Repeaters, basic carbines, some captured rifles
_militaryLoadoutData set ["slRifles", ["AM_AssaultCarbine", "AM_CowboyRepeater"]];
_militaryLoadoutData set ["rifles", ["AM_CowboyRepeater", "AM_HuntingRifle_Mod", "AM_G3AssaultRifle"]];
_militaryLoadoutData set ["carbines", ["AM_CARifle", "AM_CaravanShotgun", "AM_LeverShotgun"]];
_militaryLoadoutData set ["machineGuns", ["AM_BAR", "AM_LMG"]];
_militaryLoadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k", "AM_CowboyRepeater4k_Scout"]];
_militaryLoadoutData set ["sniperRifles", ["AM_SniperRifleGobi", "AM_AntiMatRifle"]];
// Standard Legion sidearms
_militaryLoadoutData set ["sidearms", ["AM_357Rev", "AM_357RevShort"]];
// No explosives for standard Legion — they melee charge
_militaryLoadoutData set ["lightExplosives", []];
_militaryLoadoutData set ["heavyExplosives", []];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////
// Legion slavers and camp guards — they maintain order through fear
// They run simpler gear — mostly melee with backup firearms

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
// Slavers wear simpler Legion gear
_policeLoadoutData set ["uniforms", ["legion_recruit_uniform", "legionexplorer_uniform", "legionprime_uniform"]];
_policeLoadoutData set ["vests", []];
_policeLoadoutData set ["helmets", ["legionbandana", "legionhelmetbase", "am_cowboyHat_Bent_brown"]];
// Slavers carry SMGs and basic firearms to control slaves
_policeLoadoutData set ["SMGs", ["AM_9mmSMG", "AM_Tommygun", "AM_CARifle"]];
_policeLoadoutData set ["sidearms", ["AM_357Rev", "AM_357RevShort"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////
// Legion Recruits and Explorer scouts
// The lowest rung — barely armed, mostly melee, proving themselves to the Legion
// They the ones attacking Nipton and running ahead of the main force

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
// Recruits wear rags and stolen armor — they ain't been issued proper Legion gear yet
_militiaLoadoutData set ["uniforms", ["legionexplorer_uniform", "legion_recruit_uniform", "wastelandclothing01_uniform"]];
_militiaLoadoutData set ["vests", []];
_militiaLoadoutData set ["backpacks", ["AM_SmallBagInvis"]];
// Recruits might just have a bandana or nothing
_militiaLoadoutData set ["helmets", ["legionbandana", "am_cowboyHat_Bent_brown", "am_cowboyHat_Bent_beige", "jessupbandana"]];

// Militia/Recruits: Very basic — Cowboy Repeater, pipe guns, sawed-off shotguns
// They running with whatever they could scavenge before Legion took them in
_militiaLoadoutData set ["slRifles", ["AM_CowboyRepeater", "AM_M1"]];
_militiaLoadoutData set ["rifles", ["AM_CowboyRepeater", "AM_CowboyRepeaterB", "AM_M1"]];
// Carbines: Caravan shotgun and pipe gun — low tier
_militiaLoadoutData set ["carbines", ["AM_CaravanShotgun", "AM_Sawedoff", "AM_CARifle"]];
_militiaLoadoutData set ["machineGuns", ["AM_BAR"]];
_militiaLoadoutData set ["marksmanRifles", ["AM_HuntingRifle", "AM_HuntingRifle_Mod"]];
// Recruits might carry a hunting rifle if they got one
_militiaLoadoutData set ["sidearms", ["AM_357RevShort", "AM_357Rev", "AM_10mmPistol"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

// Crew: Legion doesn't really run vehicle crews — but if they do, basic gear
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["legionprime_uniform", "legion_recruit_uniform"]];
_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", ["legionhelmetbase", "legionwhitehelmetbase"]];

// Pilots: Legion has no pilots — using military loadout as fallback
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["legionprime_uniform"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["legionhelmetbase"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
// NOTE ON LEGION RIFLEMAN TEMPLATE:
// In Legion, the "rifleman" role is actually a mixed arms soldier.
// Lower ranks are melee-heavy — but in Antistasi the AI needs firearms to function.
// We represent this by giving recruits/militia the worst firearms
// while veterans and elite get quality weapons. The melee weapons in the weapon list
// exist in the mod but Antistasi's loadout system primarily expects firearms
// for combat roles. Melee weapons should be added as secondary items where possible.

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };

    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    // Legion explosives experts use mines and basic explosives only
    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [], [_prefix]],
    ["LAT", _latTemplate, [], [_prefix]],
    ["AT", _atTemplate, [], [_prefix]],
    ["AA", _aaTemplate, [], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
    ["Marksman", _marksmanTemplate, [], [_prefix]],
    ["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [], [_prefix]],
    ["LAT", _latTemplate, [], [_prefix]],
    ["AT", _atTemplate, [], [_prefix]],
    ["AA", _aaTemplate, [], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
    ["Marksman", _marksmanTemplate, [], [_prefix]],
    ["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate, [], [_prefix]],
    ["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units   //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [], [_prefix]],
    ["LAT", _latTemplate, [], [_prefix]],
    ["AT", _atTemplate, [], [_prefix]],
    ["AA", _aaTemplate, [], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
    ["Marksman", _marksmanTemplate, [], [_prefix]],
    ["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units      //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true]], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
    ["Grenadier", _grenadierTemplate, [], [_prefix]],
    ["LAT", _latTemplate, [], [_prefix]],
    ["AT", _atTemplate, [], [_prefix]],
    ["AA", _aaTemplate, [], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
    ["Marksman", _marksmanTemplate, [], [_prefix]],
    ["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

[\"other\", [[\"Crew\", _crewTemplate, [], [\"other\"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[\"other\", [[\"Pilot\", _crewTemplate, [], [\"other\"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[\"other\", [[\"Official\", _officerTemplate, [], [\"other\"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[\"other\", [[\"Traitor\", _traitorTemplate, [], [\"other\"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[\"other\", [[\"Unarmed\", _unarmedTemplate, [], [\"other\"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
