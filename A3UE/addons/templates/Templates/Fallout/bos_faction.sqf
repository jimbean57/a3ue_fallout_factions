//these variables determine whether specified dlcs are loaded

//Old File name: Vanilla_AI_AAF_New.SQF

private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

#include "..\..\script_component.hpp" // Required for using macros like QPATHTOFOLDER if needed

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AAF custom"] call _fnc_saveToTemplate; 						
["spawnMarkerName", format [localize "STR_supportcorridor", "AAF"]] call _fnc_saveToTemplate; 			

["flag", "Flag_White_F"] call _fnc_saveToTemplate; 						
["flagTexture", "a3\data_f\flags\flag_white_co.paa"] call _fnc_saveToTemplate; 				
["flagMarkerType", "flag_NATO"] call _fnc_saveToTemplate; 			

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "skyrix_chryslusM_355_Ammo"] call _fnc_saveToTemplate; 	
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["smallBunker", "fallout_turret_wall_180"] call _fnc_saveToTemplate;
["sandbag", "fallout_turret_wall"] call _fnc_saveToTemplate;
["sandbagRound", "fallout_turret_wall_90"] call _fnc_saveToTemplate;

["vehiclesBasic", ["AM_Buggy", "AM_HMMWV_01", "B_BBrotherhoodOfSteal_HMMWV_OPEN_01"]] call _fnc_saveToTemplate; 			
["vehiclesLightUnarmed", ["AM_HMMWV_01", "B_BBrotherhoodOfSteal_HMMWV_OPEN_01", "Fallout_corvega", "AM_Fallout_corvega_02", "AM_BTRGAZ"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed", ["B_M66A4_minigun", "B_M66A4_minigun_M", "SC_Ferret_AR", "SC_Ferret_AC", "SC_AR_Mrap", "SC_SE_Mrap"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["SC_Gator_TO_AR", "SC_Gator_TO_SE", "SC_Gator_TO_AC", "SC_Gator_TC_AR", "SC_Gator_TC_SE", "SC_Gator_TC_AC", "AM_zil167"]] call _fnc_saveToTemplate; 			
["vehiclesCargoTrucks", ["SC_Gator_FB_AR", "SC_Gator_FB_SE", "SC_Gator_FB_AC", "AM_Flatbed_Truck", "AM_Transp_Truck"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["skyrix_chryslusM_355_Ammo"]] call _fnc_saveToTemplate; 		
["vehiclesRepairTrucks", ["skyrix_chryslusM_355_Repair"]] call _fnc_saveToTemplate; 		
["vehiclesFuelTrucks", ["skyrix_chryslusM_355_Fuel"]] call _fnc_saveToTemplate;		
["vehiclesMedical", ["skyrix_chryslusM_355"]] call _fnc_saveToTemplate;			
["vehiclesAPCs", ["SC_SaurusAPC_SE", "SC_SaurusAPC_Unarmed_SE", "AM_APC", "B_BBrotherhoodOfSteal_Buffalo_01"]] call _fnc_saveToTemplate; 				
["vehiclesTanks", ["15thNCR_Tank_BOS", "SC_AR_MBT", "SC_SE_MBT", "Max_HK_Tank"]] call _fnc_saveToTemplate; 			
["vehiclesAA", ["SC_SaurusAPC_AA_SE"]] call _fnc_saveToTemplate; 				
["vehiclesLightAPCs", ["SC_Ferret_AA_AR", "SC_Ferret_Autocannon_AR"]] call _fnc_saveToTemplate;			
["vehiclesIFVs", ["SC_AR_IFV", "SC_SE_IFV"]] call _fnc_saveToTemplate;				

["vehiclesTransportBoats", ["AM_zil167"]] call _fnc_saveToTemplate; 	
["vehiclesGunBoats", []] call _fnc_saveToTemplate; 			
["vehiclesAmphibious", ["AM_zil167"]] call _fnc_saveToTemplate; 		

["vehiclesPlanesCAS", ["SC_Fixed_Bomber_01"]] call _fnc_saveToTemplate; 		
["vehiclesPlanesAA", []] call _fnc_saveToTemplate; 			
["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_BoS_F", "XVB_02_infantry_BOS_F", "XVB_02_infantry_BOS_wolves_F"]] call _fnc_saveToTemplate; 	

["vehiclesHelisLight", ["B_BFMRRaiders_Old_World_News_Helicopter_01"]] call _fnc_saveToTemplate; 		
["vehiclesHelisTransport", ["B_BBrotherhoodOfSteal_XVB_02_01"]] call _fnc_saveToTemplate; 	
["vehiclesHelisLightAttack", ["B_BFMRRaiders_Old_World_News_Helicopter_01_Armed_01"]] call _fnc_saveToTemplate;		
["vehiclesHelisAttack", ["B_T_VTOL_01_armed_BoS_F"]] call _fnc_saveToTemplate; 		
["vehiclesAirborne", ["B_BBrotherhoodOfSteal_XVB_02_01", "B_T_VTOL_01_infantry_BoS_F", "B_T_VTOL_01_armed_BoS_F", "B_T_VTOL_01_vehicle_BoS_F", "XVB_02_infantry_BOS_F", "XVB_02_infantry_BOS_wolves_F", "B_BBrotherhoodOfSteal_Eyebot_01", "F_VB_01", "F_VB_02_abc"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["B_BFMRRaiders_Old_World_News_Helicopter_01", "B_BFMRRaiders_Old_World_News_Helicopter_01_Armed_01"]] call _fnc_saveToTemplate;

["vehiclesArtillery", []] call _fnc_saveToTemplate;		
["magazines", createHashMapFromArray []] call _fnc_saveToTemplate;			

["uavsAttack", ["max_HK_A"]] call _fnc_saveToTemplate; 				
["uavsPortable", ["B_BBrotherhoodOfSteal_Eyebot_01"]] call _fnc_saveToTemplate; 				

["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F", "Max_res_Offroad_Arm", "B_BFMRRaiders_LSV_Buggy_01"]] call _fnc_saveToTemplate; 
["vehiclesMilitiaTrucks", ["B_BFMRRaiders_Old_World_Bus_01", "B_BFMRRaiders_Old_World_GMC_Vandura_01", "B_BFMRRaiders_Old_World_Van_01"]] call _fnc_saveToTemplate; 	
["vehiclesMilitiaCars", ["Max_res_Offroad", "B_BFMRRaiders_Old_World_Fusion_Flea_01", "B_BFMRRaiders_Old_World_Pick_Up_01", "B_BFMRRaiders_Old_World_Highwayman_01", "B_BFMRRaiders_Old_World_Corvega_Sedan_01"]] call _fnc_saveToTemplate; 		
["vehiclesMilitiaAPCs", ["SC_Ferret_AR"]] call _fnc_saveToTemplate;						

["vehiclesPolice", ["AM_Fallout_corvega_02_police"]] call _fnc_saveToTemplate; 			

["staticMGs", ["B_BFMRRaiders_M2_01", "B_BFMRRaiders_M2_Low_01", "fallout_turret", "fallout_turret_auto"]] call _fnc_saveToTemplate; 					
["staticAT", ["fallout_turret_wall", "B_static_AT_F"]] call _fnc_saveToTemplate; 					
["staticAA", ["SC_SaurusAPC_AA_SE"]] call _fnc_saveToTemplate; 					
["staticMortars", ["B_Fallout_Minutemen_82mm_Mortar_01", "B_BFMRRaiders_Mk6_Mortar_01"]] call _fnc_saveToTemplate; 				
["staticHowitzers", []] call _fnc_saveToTemplate;							

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;		
["howitzerMagazineHE", ""] call _fnc_saveToTemplate;			

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

["faces", [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros"
]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;

["sfVoices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG"]] call _fnc_saveToTemplate;
["sfFaces", []] call _fnc_saveToTemplate;
["milVoices", []] call _fnc_saveToTemplate;
["milFaces", []] call _fnc_saveToTemplate;
["polVoices", []] call _fnc_saveToTemplate;
["polFaces", []] call _fnc_saveToTemplate;
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
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", ["AM_ServiceRifleMk2", "AM_ServiceRifle_N_MRCO"]];
_loadoutData set ["rifles", ["AM_LaserRifle_Black", "AM_LaserRifleAuto", "AM_LaserRifleAuto_GRA", "AM_LaserRifle_Mk2", "AM_Laser_Musket"]];
_loadoutData set ["carbines", ["AM_AER14", "AM_HoloRifle", "AM_HoloRifle_Nugz"]];
_loadoutData set ["grenadeLaunchers", ["AM_ServiceRifle_GL", "AM_ServiceRifleMk2_GL"]];
_loadoutData set ["designatedGrenadeLaunchers", ["AM_M79", "AM_PumpGL"]];
_loadoutData set ["SMGs", ["AM_10mmSMG", "AM_10mmSMGB", "AM_9mmSMG"]];
_loadoutData set ["machineGuns", ["AM_Minigun_Base", "AM_MinigunHS", "AM_MinigunStable", "AM_Gatling_Laser_Base", "AM_Gatling_Laser_P_Base", "AM_LMG"]];
_loadoutData set ["marksmanRifles", ["AM_HKG28", "AM_rangerCarbine_Veteran", "AM_HuntingRifle_mod_4k"]];
_loadoutData set ["sniperRifles", ["AM_AntiMatRifle", "AM_AntiEverythingRifle", "AM_SniperRifleGobi"]];

_loadoutData set ["lightATLaunchers", ["AM_bazooka"]];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", ["AM_launch_MissileLauncherSight", "AM_m72"]];
_loadoutData set ["missileATLaunchers", ["AM_Hellstorm"]];
_loadoutData set ["AALaunchers", ["AM_launch_MissileLauncherSight_Shark"]];
_loadoutData set ["sidearms", ["AM_10mmPistol", "AM_LaserPistol", "AM_M1911HD", "AM_ThatGun", "AM_LilDevil"]];

_loadoutData set ["ATMines", []]; 
_loadoutData set ["APMines", []]; 
_loadoutData set ["lightExplosives", ["AM_launch_Fatman"]]; 
_loadoutData set ["heavyExplosives", ["AM_launch_Fatman_Tallboy"]]; 

_loadoutData set ["antiInfantryGrenades", []]; 
_loadoutData set ["antiTankGrenades", []]; 
_loadoutData set ["smokeGrenades", []];
_loadoutData set ["signalsmokeGrenades", []];

_loadoutData set ["maps", ["ItemMap"]];				
_loadoutData set ["watches", ["ItemWatch"]];		
_loadoutData set ["compasses", ["ItemCompass"]];	
_loadoutData set ["radios", ["ItemRadio"]];			
_loadoutData set ["gpses", ["ItemGPS"]];			
_loadoutData set ["NVGs", ["am_ulysses_respirator_nv", "am_nvg_anpvs7"]];						
_loadoutData set ["binoculars", ["AM_binoculars", "AM_binoculars_small"]];		
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["AM_Uniform_DesertCoat_S"]];		
_loadoutData set ["traitorVests", []];			
_loadoutData set ["traitorHats", ["am_cowboyHat_Bent_black"]];			

_loadoutData set ["officerUniforms", ["AM_Uniform_FormalSuit_Black_uniform"]];		
_loadoutData set ["officerVests", ["am_swat_black_mp_vest"]];			
_loadoutData set ["officerHats", ["AM_Beret_02_BOS_Blk", "AM_Beret_02_BOS_Blu", "AM_Beret_02_BOS_Gry"]];	

_loadoutData set ["cloakUniforms", ["AM_Uniform_CowboyOutfit_DeepBlack"]];
_loadoutData set ["cloakVests", []];
_loadoutData set ["cloakRifles", ["AM_LaserRifle_Black"]];
_loadoutData set ["cloakCarbines", ["AM_AER14"]];
_loadoutData set ["cloakSidearms", ["AM_10mmPistol"]];
_loadoutData set ["cloakGlasses", ["am_shades_nv", "am_glassesblackrimmed_tinted_nv"]];

_loadoutData set ["uniforms", ["AFO_U_CombatArmor_BOS", "AFO_U_CombatArmor_BOS_Initiate", "AFO_U_CombatArmor_BOS_Knight"]];					
_loadoutData set ["slUniforms", ["AFO_U_CombatArmor_BOS_Knight"]];
_loadoutData set ["vests", ["am_swat_vest", "am_swat_black_vest"]];						
_loadoutData set ["Hvests", ["am_swat_vest"]];
_loadoutData set ["glVests", ["am_swat_vest"]];
_loadoutData set ["sniVests", ["am_swat_black_vest"]];
_loadoutData set ["backpacks", ["AM_AvBagInvis", "AM_BigBagInvis"]];					
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_mtp_F"]];
_loadoutData set ["atBackpacks", ["AM_BigBagInvis"]];
_loadoutData set ["helmets", ["AFO_H_CombatHelmet_BOS", "AFO_H_CombatHelmet_Masked_BOS"]];					
_loadoutData set ["slHat", ["AM_Beret_02_BOS_Blk"]];
_loadoutData set ["sniHats", ["AM_Cap_Grey", "AM_Cap_Green"]];

_loadoutData set ["facewear", ["am_ulysses_respirator_nv", "am_glassesblackrimmed_tinted_nv", "am_shades_nv"]];
_loadoutData set ["glasses", []];	
_loadoutData set ["goggles", []];		

//Item *set* definitions.
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["AFO_U_CombatArmor_BOS"]];
_sfLoadoutData set ["vests", ["am_swat_black_vest"]];
_sfLoadoutData set ["Hvests", ["am_swat_black_vest"]];
_sfLoadoutData set ["glVests", ["am_swat_black_vest"]];
_sfLoadoutData set ["backpacks", ["AM_BigBagInvis"]];
_sfLoadoutData set ["helmets", ["AFO_H_CombatHelmet_Masked_BOS"]];

_sfLoadoutData set ["slRifles", ["AM_ServiceRifleMk2_GL"]];
_sfLoadoutData set ["rifles", ["AM_LaserRifle_Black", "AM_LaserRifle_Mk2"]];
_sfLoadoutData set ["carbines", ["AM_AER14", "AM_HoloRifle"]];
_sfLoadoutData set ["machineGuns", ["AM_Gatling_Laser_Base", "AM_MinigunHS"]];
_sfLoadoutData set ["marksmanRifles", ["AM_HKG28"]];
_sfLoadoutData set ["sniperRifles", ["AM_AntiEverythingRifle"]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["AFO_U_CombatArmor_BOS_Knight"]];
_eliteLoadoutData set ["vests", ["am_swat_black_vest", "am_swat_vest"]];
_eliteLoadoutData set ["Hvests", ["am_swat_black_vest"]];
_eliteLoadoutData set ["glVests", ["am_swat_vest"]];
_eliteLoadoutData set ["backpacks", ["AM_BigBagInvis"]];
_eliteLoadoutData set ["helmets", ["AFO_H_CombatHelmet_BOS", "AFO_H_CombatHelmet_Masked_BOS"]];
_eliteLoadoutData set ["rifles", ["AM_LaserRifleAuto", "AM_LaserRifle_Black"]];
_eliteLoadoutData set ["machineGuns", ["AM_Minigun_Base", "AM_Gatling_Laser_P_Base"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["AFO_U_CombatArmor_BOS_Initiate"]];
_militaryLoadoutData set ["vests", ["am_swat_vest"]];
_militaryLoadoutData set ["backpacks", ["AM_AvBagInvis"]];
_militaryLoadoutData set ["helmets", ["AFO_H_CombatHelmet_BOS"]];

_militaryLoadoutData set ["slRifles", ["AM_ServiceRifle_N_MRCO"]];
_militaryLoadoutData set ["rifles", ["AM_LaserRifleAuto_GRA", "AM_Laser_Musket"]];
_militaryLoadoutData set ["carbines", ["AM_HoloRifle_Nugz"]];
_militaryLoadoutData set ["machineGuns", ["AM_LMG"]];
_militaryLoadoutData set ["marksmanRifles", ["AM_rangerCarbine_Veteran", "AM_HuntingRifle_mod_4k"]];
_militaryLoadoutData set ["sniperRifles", ["AM_SniperRifleGobi", "AM_AntiMatRifle"]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["AM_Uniform_FormalSuit_Black_uniform"]];
_policeLoadoutData set ["vests", ["am_swat_black_mp_vest"]];
_policeLoadoutData set ["helmets", ["AM_Beret_02_BOS_Blk", "AM_Beret_02_BOS_Blu", "AM_Beret_02_BOS_Gry"]];
_policeLoadoutData set ["SMGs", ["AM_10mmSMG", "AM_10mmSMGB", "AM_9mmSMG"]];
_policeLoadoutData set ["sidearms", ["AM_10mmPistol", "AM_LaserPistol"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["AM_Uniform_DesertCoat_S", "AM_Uniform_CowboyOutfit_DeepBlack"]];
_militiaLoadoutData set ["vests", []]; 
_militiaLoadoutData set ["backpacks", ["AM_AvBagInvis"]];
_militiaLoadoutData set ["helmets", ["am_cowboyHat_Bent_black", "AM_Cap_Grey", "AM_Cap_Green"]];

_militiaLoadoutData set ["slRifles", ["AM_ServiceRifleMk2"]];
_militiaLoadoutData set ["rifles", ["AM_Laser_Musket"]];
_militiaLoadoutData set ["carbines", ["AM_9mmSMG"]];
_militiaLoadoutData set ["machineGuns", ["AM_LMG"]];
_militiaLoadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k"]];
_militiaLoadoutData set ["sidearms", ["AM_M1911HD", "AM_ThatGun"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["AFO_U_CombatArmor_BOS_Initiate"]];
_crewLoadoutData set ["vests", ["am_swat_vest"]];
_crewLoadoutData set ["helmets", ["AFO_H_CombatHelmet_BOS"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["AFO_U_CombatArmor_BOS_Initiate"]];
_pilotLoadoutData set ["vests", ["am_swat_vest"]];
_pilotLoadoutData set ["helmets", ["AM_Beret_02_BOS_Blk"]];



/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


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

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
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
    //TODO - Add a check if it's disposable.
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

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
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
    //TODO - Add a check if it's disposable.
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

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

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
//    Militia Units    //
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
//  Elite Units   //
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

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;