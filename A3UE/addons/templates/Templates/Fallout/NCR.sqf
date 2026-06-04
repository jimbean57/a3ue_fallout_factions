// ncr_faction.sqf
// New California Republic faction template for Antistasi
// Based on Fallout: New Vegas lore — organized military force, conventional firearms,
// NCR Rangers as special forces, Veteran Rangers as elite units.
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

["name", "New California Republic"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "NCR"]] call _fnc_saveToTemplate;

["flag", "Flag_White_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_white_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_NATO"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "skyrix_chryslusM_355_Ammo"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["smallBunker", "fallout_turret_wall_180"] call _fnc_saveToTemplate;
["sandbag", "fallout_turret_wall"] call _fnc_saveToTemplate;
["sandbagRound", "fallout_turret_wall_90"] call _fnc_saveToTemplate;

["vehiclesBasic", ["AM_HMMWV_01", "AM_Buggy", "B_BFMRRaiders_Old_World_Pick_Up_01"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["AM_HMMWV_01", "Fallout_corvega", "AM_Fallout_corvega_02", "AM_BTRGAZ"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["B_M66A4_minigun", "B_M66A4_minigun_M", "SC_AR_Mrap", "SC_SE_Mrap"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SC_Gator_TO_AR", "SC_Gator_TO_SE", "SC_Gator_TC_AR", "SC_Gator_TC_SE", "AM_zil167"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SC_Gator_FB_AR", "SC_Gator_FB_SE", "AM_Flatbed_Truck", "AM_Transp_Truck"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["skyrix_chryslusM_355_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["skyrix_chryslusM_355_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["skyrix_chryslusM_355_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["skyrix_chryslusM_355"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SC_SaurusAPC_SE", "SC_SaurusAPC_Unarmed_SE", "AM_APC"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["15thNCR_Tank_BOS", "SC_AR_MBT", "SC_SE_MBT"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SC_SaurusAPC_AA_SE"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["SC_Ferret_AR", "SC_Ferret_AC"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["SC_AR_IFV", "SC_SE_IFV"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["AM_zil167"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", []] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["AM_zil167"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SC_Fixed_Bomber_01"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", []] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["B_BFMRRaiders_Old_World_News_Helicopter_01"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["B_BFMRRaiders_Old_World_News_Helicopter_01"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["B_BFMRRaiders_Old_World_News_Helicopter_01_Armed_01"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["B_BFMRRaiders_Old_World_News_Helicopter_01_Armed_01"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["B_BFMRRaiders_Old_World_News_Helicopter_01", "B_BFMRRaiders_Old_World_News_Helicopter_01_Armed_01"]] call _fnc_saveToTemplate;
["vehiclesAirPatrol", ["B_BFMRRaiders_Old_World_News_Helicopter_01", "B_BFMRRaiders_Old_World_News_Helicopter_01_Armed_01"]] call _fnc_saveToTemplate;

["vehiclesArtillery", []] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray []] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

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

// NCR pulls from across California — diverse mix of faces
["faces", [
    "WhiteHead_01",
    "WhiteHead_02",
    "WhiteHead_03",
    "WhiteHead_04",
    "WhiteHead_05",
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_06",
    "AsianHead_A3_01",
    "AsianHead_A3_02",
    "AfricanHead_A3_01",
    "AfricanHead_A3_02",
    "AfricanHead_A3_03"
]] call _fnc_saveToTemplate;

["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;

// Rangers and special forces — more selective group
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

// ==================================================================================
// WEAPON ASSIGNMENT PHILOSOPHY (NCR):
//
// The NCR is a conventional military force. Their grunts run the Service Rifle
// (AM_serviceRifle / AM_ServiceRifleMk2) as their standard issue — that's the
// AR-15 pattern rifle straight outta the game. Carbines are the Assault Carbine
// (AM_AssaultCarbine) for closer-range roles. Marksmen get the Hunting Rifle or
// Marksman Rifle. Rangers — the real ones, Desert Rangers — run the Ranger Carbine
// (AM_rangerCarbine_Veteran). Snipers use the Gobi Campaign Scout Rifle
// (AM_SniperRifleGobi). Anti-materiel is the AM Rifle (AM_AntiMatRifle).
//
// Pistols are the standard .45 (AM_M1911HD) and .357 revolver (AM_357Rev).
// SMGs go to police/support roles (AM_9mmSMG, AM_10mmSMG).
// Machine guns: BAR (AM_BAR) and M60 (AM_M60) for regular troops,
//               Minigun (AM_Minigun_Base) limited to vehicle crews / SF only.
// Launchers: Bazooka (AM_bazooka) for LAT, Missile Launcher (AM_launch_MissileLauncherSight)
//            for full AT. Fat Man (AM_launch_Fatman) is STRICTLY special forces only.
// Grenade launchers: Service Rifle GL (AM_ServiceRifle_GL) as standard UGL.
//
// No energy weapons for regular NCR — that's faction identity.
// ==================================================================================

private _loadoutData = call _fnc_createLoadoutData;

// --- Primary Weapons ---
// Squad leaders carry the Mk2 Service Rifle with optic — they got the good loadout
_loadoutData set ["slRifles", ["AM_ServiceRifleMk2", "AM_serviceRifle_N_MRCO"]];
// Standard rifle pool: Service Rifle variants — what every NCR trooper carries
_loadoutData set ["rifles", ["AM_serviceRifle", "AM_serviceRifleN", "AM_ServiceRifleMk2", "AM_serviceRifleB"]];
// Carbines: Assault Carbine and Trail Carbine for CQB/scout roles
_loadoutData set ["carbines", ["AM_AssaultCarbine", "AM_AssaultCarbineOlive", "AM_TrailCarbine", "AM_TrailCarbineW"]];
// Underbarrel GL on Service Rifle — standard grenadier load
_loadoutData set ["grenadeLaunchers", ["AM_ServiceRifle_GL", "AM_ServiceRifleMk2_GL"]];
// Standalone grenade launchers: M79 for designated grenadiers
_loadoutData set ["designatedGrenadeLaunchers", ["AM_M79", "AM_M79_Merc"]];
// SMGs: 9mm and 10mm for support/police
_loadoutData set ["SMGs", ["AM_9mmSMG", "AM_10mmSMG", "AM_10mmSMGB"]];
// MGs: BAR and M60 are the NCR's standard belt-fed support weapons
_loadoutData set ["machineGuns", ["AM_BAR", "AM_M60", "AM_LMG"]];
// Marksman: Hunting Rifle (modded) and the Marksman Rifle
_loadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k", "AM_Marksman", "AM_rangerCarbine_New"]];
// Snipers: Gobi Scout and Anti-Materiel Rifle for heavy sniper
_loadoutData set ["sniperRifles", ["AM_SniperRifleGobi", "AM_AntiMatRifle"]];

// --- Launchers ---
// Light AT: Bazooka — old school but NCR makes do
_loadoutData set ["lightATLaunchers", ["AM_bazooka"]];
_loadoutData set ["lightHELaunchers", []];
// Standard AT: Missile Launcher with sight
_loadoutData set ["ATLaunchers", ["AM_launch_MissileLauncherSight", "AM_m72"]];
// Guided/missile AT: Reserved for experienced AT soldiers
_loadoutData set ["missileATLaunchers", ["AM_Hellstorm"]];
// AA: Missile Launcher with AA tracking sight
_loadoutData set ["AALaunchers", ["AM_launch_MissileLauncherSight_Shark"]];

// --- Sidearms ---
// M1911 .45 and .357 revolver — classic NCR pistols
_loadoutData set ["sidearms", ["AM_M1911HD", "AM_357Rev", "AM_357Rev_HD", "AM_M1911"]];

// --- Explosives ---
// No AT mines standard — NCR uses them but sparingly
_loadoutData set ["ATMines", []];
_loadoutData set ["APMines", []];
// Light explosives: standard demo charges
_loadoutData set ["lightExplosives", []];
// Heavy explosives: nothing this extreme in standard loadout
_loadoutData set ["heavyExplosives", []];

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
// NCR troopers use NVGs but not standard issue — officers and scouts carry them
_loadoutData set ["NVGs", ["am_nvg_anpvs7"]];
_loadoutData set ["binoculars", ["AM_binoculars", "AM_binoculars_small"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

// --- Special Role Gear ---
// Traitor: plain wasteland clothes — they blending in
_loadoutData set ["traitorUniforms", ["armor_ncr_trooper_clothes_green_medic_uniform", "wastelandclothing01_uniform"]];
_loadoutData set ["traitorVests", []];
_loadoutData set ["traitorHats", ["am_cowboyHat_Bent_brown", "am_cowboyHat_Bent_beige", "rangerhat"]];

// Officer: dress uniform, formal — NCR officers run a tighter look
_loadoutData set ["officerUniforms", ["ncr_officer_coat_uniform", "generaloliver_uniform"]];
_loadoutData set ["officerVests", ["am_swat_black_mp_vest"]];
_loadoutData set ["officerHats", ["AM_Beret_02_NCR_Bear_Olv", "AM_Beret_02_NCR_Bear_Blk", "AM_Beret_02_NCRAF"]];

// Cloak: undercover NCR operative — plain clothes
_loadoutData set ["cloakUniforms", ["1950stylecasual01_uniform", "wasteland_doctor_01_uniform"]];
_loadoutData set ["cloakVests", []];
_loadoutData set ["cloakRifles", ["AM_AssaultCarbine"]];
_loadoutData set ["cloakCarbines", ["AM_TrailCarbine"]];
_loadoutData set ["cloakSidearms", ["AM_M1911HD"]];
_loadoutData set ["cloakGlasses", ["am_shades_nv", "am_glassesblackrimmed_tinted_nv"]];

// --- Standard Troop Uniforms ---
// NCR trooper armor variants — the khaki and tan look of the Republic
_loadoutData set ["uniforms", ["armor_ncr_trooper_01_uniform", "armor_ncr_trooper_grey_uniform", "armor_ncr_trooper_02_uniform", "armor_ncr_trooper_Woodland_uniform"]];
_loadoutData set ["slUniforms", ["armor_ncr_trooper_02_uniform", "armor_ncr_trooper_01_uniform"]];
_loadoutData set ["vests", ["ncr_excalibur_vest_01", "ncr_excalibur_vest_02", "V_TacVest_khk", "V_TacVest_brn"]];
_loadoutData set ["Hvests", ["ncr_excalibur_vest_02", "V_PlateCarrier1_rgr"]];
_loadoutData set ["glVests", ["ncr_excalibur_vest_01"]];
_loadoutData set ["sniVests", ["ncr_excalibur_vest_black_01", "V_PlateCarrierSpec_rgr"]];
_loadoutData set ["backpacks", ["AM_AvBagInvis", "AM_BigBagInvis"]];
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_mtp_F"]];
_loadoutData set ["atBackpacks", ["AM_BigBagInvis"]];
// Trooper helmets: M1 helmet variants — THE NCR signature look
_loadoutData set ["helmets", ["m1_helmet_grn", "m1_helmet_snd", "m1_helmet_sage", "armor_ncr_trooper_helm", "armor_ncr_trooper_helm_02"]];
_loadoutData set ["slHat", ["AM_Beret_02_NCR_Bear_Olv", "AM_Beret_02_NCR_Bear_Blk"]];
_loadoutData set ["sniHats", ["combat_ranger_helmet02", "rangerhat", "rangerhat_black"]];

_loadoutData set ["facewear", ["am_glassesblackrimmed_tinted_nv", "am_shades_nv"]];
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
// NCR Rangers — Desert Rangers / Veteran Rangers
// These boys are THE apex predators of the wasteland. Ranger Carbine, Gobi,
// and the Fat Man is EXCLUSIVE to SF only — no regular trooper touching that nuke

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["nv_ranger_uniform", "nv_ranger_black_uniform", "combat_ranger_uniform"]];
_sfLoadoutData set ["vests", ["ncr_excalibur_vest_black_01", "ncr_excalibur_vest_black_02", "V_PlateCarrierSpec_rgr"]];
_sfLoadoutData set ["Hvests", ["ncr_excalibur_vest_black_02", "V_PlateCarrierSpec_rgr"]];
_sfLoadoutData set ["glVests", ["ncr_excalibur_vest_black_01"]];
_sfLoadoutData set ["backpacks", ["AM_BigBagInvis"]];
// Ranger helmet — that iconic look
_sfLoadoutData set ["helmets", ["combat_ranger_helmet", "combat_ranger_helmet02", "combat_ranger_helmet03"]];

// Rangers run the Ranger Carbine (Veteran) — this the real deal
_sfLoadoutData set ["slRifles", ["AM_rangerCarbine_Veteran", "AM_ServiceRifleMk2_GL"]];
_sfLoadoutData set ["rifles", ["AM_rangerCarbine_Veteran", "AM_rangerCarbine_New", "AM_ServiceRifleMk2"]];
_sfLoadoutData set ["carbines", ["AM_AssaultCarbine", "AM_AssaultCarbine_GRA", "AM_TrailCarbine4k_Scout"]];
_sfLoadoutData set ["machineGuns", ["AM_M60", "AM_BAR", "AM_LMG"]];
_sfLoadoutData set ["marksmanRifles", ["AM_MarksmanAM", "AM_rangerCarbine_Veteran"]];
_sfLoadoutData set ["sniperRifles", ["AM_SniperRifleGobi", "AM_AntiMatRifle", "AM_AntiEverythingRifle"]];
// Fat Man: SPECIAL FORCES ONLY — only Rangers get mini nukes
_sfLoadoutData set ["lightExplosives", ["AM_launch_Fatman"]];
_sfLoadoutData set ["heavyExplosives", ["AM_launch_Fatman_Tallboy"]];
// NVGs standard for Rangers
_sfLoadoutData set ["NVGs", ["am_nvg_anpvs7", "am_ulysses_respirator_nv"]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////
// NCR Veteran Rangers and NCR Power Armor troops
// These the absolute best NCR has to offer — full kit, heavy armor

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["ncr_powerarmor_uniform", "ncr_powerarmor_Tricentennial_uniform", "nv_ranger_uniform"]];
_eliteLoadoutData set ["vests", ["ncr_excalibur_vest_black_02", "V_PlateCarrierSpec_rgr"]];
_eliteLoadoutData set ["Hvests", ["ncr_excalibur_vest_black_02"]];
_eliteLoadoutData set ["glVests", ["ncr_excalibur_vest_black_01"]];
_eliteLoadoutData set ["backpacks", ["AM_BigBagInvis"]];
_eliteLoadoutData set ["helmets", ["ncr_powerarmor_Patron_helm", "combat_ranger_helmet", "power_armor_helmet_t45d"]];
_eliteLoadoutData set ["rifles", ["AM_rangerCarbine_Veteran", "AM_ServiceRifleMk2"]];
_eliteLoadoutData set ["machineGuns", ["AM_M60", "AM_BAR"]];
_eliteLoadoutData set ["NVGs", ["am_nvg_anpvs7", "am_ulysses_respirator_nv"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////
// Standard NCR Army — regular troopers, the backbone of the Republic

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["armor_ncr_trooper_01_uniform", "armor_ncr_trooper_grey_uniform", "armor_ncr_trooper_02_uniform"]];
_militaryLoadoutData set ["vests", ["ncr_excalibur_vest_01", "V_TacVest_khk", "V_TacVest_brn"]];
_militaryLoadoutData set ["backpacks", ["AM_AvBagInvis"]];
_militaryLoadoutData set ["helmets", ["m1_helmet_grn", "m1_helmet_snd", "m1_helmet_sage", "armor_ncr_trooper_helm"]];

// Standard military gets base service rifles — no fancy optics
_militaryLoadoutData set ["slRifles", ["AM_ServiceRifleMk2", "AM_serviceRifle_N_MRCO"]];
_militaryLoadoutData set ["rifles", ["AM_serviceRifle", "AM_serviceRifleN", "AM_ServiceRifleMk2"]];
_militaryLoadoutData set ["carbines", ["AM_AssaultCarbine", "AM_TrailCarbine"]];
_militaryLoadoutData set ["machineGuns", ["AM_BAR", "AM_LMG"]];
_militaryLoadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k", "AM_Marksman"]];
_militaryLoadoutData set ["sniperRifles", ["AM_SniperRifleGobi", "AM_AntiMatRifle"]];
// Standard military does NOT get Fat Man — that's Rangers only
_militaryLoadoutData set ["lightExplosives", []];
_militaryLoadoutData set ["heavyExplosives", []];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////
// NCR Military Police and Correctional Officers
// Running the NCRCF and checkpoints — more law enforcement than combat

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["armornvncrtrooper_mp_uniform", "armornvncrtrooper_plain_uniform", "riot_gear_police_uniform"]];
_policeLoadoutData set ["vests", ["am_swat_black_mp_vest", "am_swat_brown_mp_vest"]];
_policeLoadoutData set ["helmets", ["armor_ncr_trooper_helm_mp", "AM_Beret_02_NCR_Bear_Olv", "NCR_MP_Riot_Helmet"]];
// Police carry SMGs and pistols — not assault rifles
_policeLoadoutData set ["SMGs", ["AM_9mmSMG", "AM_10mmSMG", "AM_10mmSMGB"]];
_policeLoadoutData set ["sidearms", ["AM_M1911HD", "AM_357Rev"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////
// NCR-aligned settlers, auxiliaries, and militia
// They ain't proper soldiers — they carrying whatever they could find
// but they ride with the NCR

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["wastelandclothing01_uniform", "wastelandclothing03_uniform", "wasteland_doctor_01_uniform", "armor_ncr_trooper_01_uniform"]];
_militiaLoadoutData set ["vests", []];
_militiaLoadoutData set ["backpacks", ["AM_AvBagInvis"]];
_militiaLoadoutData set ["helmets", ["rangerhat", "am_cowboyHat_Bent_brown", "am_cowboyHat_Bent_beige", "AM_Cap_Khaki", "AM_Cap_Green"]];

// Militia got older or worn-down weapons — Cowboy Repeater, hunting rifles, etc
_militiaLoadoutData set ["slRifles", ["AM_ServiceRifleMk2", "AM_CowboyRepeater"]];
_militiaLoadoutData set ["rifles", ["AM_serviceRifle", "AM_CowboyRepeater", "AM_M1"]];
_militiaLoadoutData set ["carbines", ["AM_TrailCarbine", "AM_CARifle"]];
_militiaLoadoutData set ["machineGuns", ["AM_BAR", "AM_LMG"]];
_militiaLoadoutData set ["marksmanRifles", ["AM_HuntingRifle_mod_4k", "AM_HuntingRifle"]];
_militiaLoadoutData set ["sidearms", ["AM_M1911", "AM_357Rev", "AM_357RevShort"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["armor_ncr_trooper_01_uniform", "armor_ncr_trooper_grey_uniform"]];
_crewLoadoutData set ["vests", ["ncr_excalibur_vest_01", "V_TacVest_khk"]];
_crewLoadoutData set ["helmets", ["NCR_Tanker_Helmet_AFO", "m1_helmet_grn"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["Armor_ncr_Trooper_Aviation_Grey_uniform", "Armor_ncr_Trooper_Aviation_Green_uniform"]];
_pilotLoadoutData set ["vests", ["ncr_excalibur_vest_01"]];
_pilotLoadoutData set ["helmets", ["helmet_heli_closed", "AM_Beret_02_NCRAF"]];

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

["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Unarmed", _unarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
