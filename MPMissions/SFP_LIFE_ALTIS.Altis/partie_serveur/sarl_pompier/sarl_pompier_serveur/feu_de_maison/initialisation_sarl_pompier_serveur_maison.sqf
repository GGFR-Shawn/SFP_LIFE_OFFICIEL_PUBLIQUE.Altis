// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Pompiers : Démarrage script feux de maison 1/2." spawn historique_creation_log_sfp;

_nomdusecteur = [Neochori,Alikampos,Edessa,Dorida,kalithea,Zaros,Chalkeia,poliakko,Kavala,Lakka,Therisa,Neochori,Pyrgos,Agios_dionysios,Charkia,Stravos,Panochori];
_nomdusecteur_valide = _nomdusecteur call BIS_fnc_selectRandom;

// ----------------------------------------------------------------- verifier si pas joueur en ville -------------------------------------------------------- //
_pos = [((getPosATL _nomdusecteur_valide select 0) + (random 300)),((getPosATL _nomdusecteur_valide select 1) + (random 300)),0];
_verifierjoueurautour = _pos nearEntities [["man"], 40];
if ({isPlayer _x} count (_verifierjoueurautour) > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_maison\initialisation_sarl_pompier_serveur_maison.sqf";};

// ----------------------------------------------------------------- verifier si maison -------------------------------------------------------- //
_type_de_maisons = ["Land_House_Big_01_F","Land_GarageShelter_01_F","Land_Shed_04_F","Land_House_Small_05_F","Land_House_Small_01_F","Land_FuelStation_02_workshop_F","Land_PowerLine_01_pole_end_v2_F","Land_Shop_Town_02_F","Land_House_Small_04_F","Land_PowerLine_01_wire_50m_F","Land_PowerLine_01_wire_50m_main_F","Land_Shop_Town_01_F","Land_PowerLine_01_pole_small_F","Land_House_Big_05_F","Land_PowerLine_01_pole_transformer_F","Land_Shed_01_F","Land_Shop_Town_05_F","Land_House_Small_02_F","Land_LampStreet_F","Land_Slum_01_F","Land_Slum_02_F","Land_PowerLine_01_pole_junction_F","Land_House_Big_04_F","Land_Shop_Town_03_F","Land_Addon_03_F","Land_House_Big_03_F","Land_FireEscape_01_short_F","Land_LampShabby_F","Land_WaterTower_01_F","Land_Addon_04_F","Land_Shed_05_F","Land_WindmillPump_01_F","Land_Shop_Town_04_F","Land_Shed_06_F","Land_Shop_City_07_F","Land_House_Small_03_F","Land_Shed_02_F","Land_House_Small_06_F","Land_Shed_03_F","Land_PowerLine_01_pole_tall_F","Land_FireEscape_01_tall_F","Land_Shop_City_04_F","Land_Shop_City_03_F","Land_Shop_City_01_F","Land_PowerLine_01_pole_end_v1_F","Land_FuelStation_02_roof_F","Land_FuelStation_02_pump_F","Land_Shop_City_02_F","Land_Shed_Big_F","Land_House_Big_02_F","Land_Addon_05_F","Land_Slum_03_F","Land_i_Shed_Ind_F","Land_GuardHouse_01_F","Land_Hotel_02_F","Land_Slum_04_F","Land_Supermarket_01_F","Land_SCF_01_warehouse_F","Land_Shed_07_F","Land_PierConcrete_01_4m_ladders_F","Land_Warehouse_03_F","Land_Shed_Small_F","Land_ReservoirTower_F","Land_Church_03_F","Land_FuelStation_01_shop_F","Land_fs_roof_F","Land_FuelStation_01_pump_F","Land_FuelStation_01_workshop_F","Land_TTowerBig_2_F","Land_PierWooden_02_ladder_F","Land_LampHarbour_F","Land_House_Native_01_F","Land_House_Native_02_F","Land_PierWooden_01_ladder_F","Land_PierWooden_01_hut_F","Land_PierWooden_01_dock_F","Land_PierWooden_01_16m_F","Land_PierWooden_01_10m_noRails_F","Land_Mausoleum_01_F","Land_School_01_F","Land_runway_edgelight","Land_LandMark_F","Land_TBox_F","Land_Airport_01_controlTower_F","Land_Airport_01_terminal_F","Land_Addon_01_F","Land_NavigLight_3_F","Land_dp_smallTank_F","Land_Airport_02_hangar_right_F","Land_spp_Transformer_F","Land_Airport_02_hangar_left_F","Land_Airport_01_hangar_F","Land_TTowerSmall_2_F","Land_DPP_01_smallFactory_F","Land_TTowerSmall_1_F","Land_LampAirport_F","Land_Airport_02_terminal_F","Land_Church_02_F","Land_Airport_02_controlTower_F","Land_Track_01_bridge_F","Land_PierWooden_01_platform_F","Land_Temple_Native_01_F","Land_Addon_02_F","Land_Hotel_01_F","Land_TTowerBig_1_F","Land_Shop_City_06_F","Land_Walkover_01_F","Land_Barracks_01_grey_F","Land_DPP_01_mainFactory_F","Land_DPP_01_waterCooler_ladder_F","Land_DPP_01_waterCooler_F","Land_BasaltWall_01_gate_F","Land_Cargo_Patrol_V4_F","Campfire_burning_F","Land_PicnicTable_01_F","Land_Bench_05_F","Land_Bench_03_F","Land_ClothesLine_01_full_F","Land_CrabCages_F","Land_Bench_04_F","MetalBarrel_burning_F","Land_PowLines_Transformer_F","Land_Cargo_Patrol_V2_F","Land_Bench_01_F","Land_i_Addon_03mid_V1_F","Land_i_Garage_V1_F","Land_GarbageBin_01_F","Land_PowerLine_01_pole_lamp_F","Land_Offices_01_V1_F","Land_SCF_01_storageBin_small_F","Land_StorageTank_01_small_F","Land_Shop_City_05_F","Land_ContainerLine_02_F","Land_GantryCrane_01_F","Land_ContainerLine_01_F","Land_ContainerLine_03_F","Land_MultistoryBuilding_01_F","Land_MobileCrane_01_F","Land_Cathedral_01_F","Land_MobileCrane_01_hook_F","Land_MultistoryBuilding_03_F","Land_MultistoryBuilding_04_F","Land_Warehouse_01_F","Batiment_Gendarmerie_SFP","Land_Warehouse_02_F","Land_SCF_01_heap_bagasse_F","Land_SCF_01_feeder_F","Land_SCF_01_washer_F","Land_SCF_01_diffuser_F","Land_SCF_01_condenser_F","Land_SCF_01_clarifier_F","Land_SCF_01_generalBuilding_F","Land_SCF_01_boilerBuilding_F","Land_SCF_01_crystallizer_F","Land_ReservoirTank_Airport_F","Land_SCF_01_crystallizerTowers_F","Land_SCF_01_chimney_F","Land_MilOffices_V1_F","Land_Medevac_house_V1_F","Land_MetalBarrel_empty_F","Land_fs_feed_F","Land_GarbageBin_02_F","Land_Campfire_F","Land_u_Shed_Ind_F","Land_Pier_F","Land_Barracks_01_camo_F","Land_Communication_anchor_F","Land_SM_01_reservoirTower_F","Land_SM_01_shelter_narrow_F","Land_SM_01_shelter_wide_F","Land_Radar_F","Land_SM_01_shed_unfinished_F","Land_Radar_Small_F","Land_Obstacle_Climb_F"];
if (count (nearestObjects [_pos, _type_de_maisons , 4]) < 1) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_maison\initialisation_sarl_pompier_serveur_maison.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Demarrage script feu maisons."] call saveToDB;
"DIAG SFP : Mission Pompiers : Démarrage script feux de maison 2/2." spawn historique_creation_log_sfp;

// -------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quelle_objet_prendre = [ "Land_CashDesk_F","Land_BarrelSand_F","Land_Bench_F","Land_CratesShabby_F","Land_Pallets_F"];
quel_objet_prendre_choisit_maisons_sfp = _quelle_objet_prendre call BIS_fnc_selectRandom;
publicvariable "quel_objet_prendre_choisit_maisons_sfp";

// --------------------------------------------------------------- Création de l'objet --------------------------------------------------------------------
creation_du_feu_maison_sfp = createvehicle [quel_objet_prendre_choisit_maisons_sfp, _pos, [], 0, "CAN_COLLIDE"];
waituntil {sleep 0.5; speed creation_du_feu_maison_sfp < 0.1;};
creation_du_feu_maison_sfp setvariable ["jesuisenfeu",1,true];
sleep 1;
publicvariable "creation_du_feu_maison_sfp";

if (!alive creation_du_feu_maison_sfp) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_maison\initialisation_sarl_pompier_serveur_maison.sqf";};
if (isnil "creation_du_feu_maison_sfp") exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_maison\initialisation_sarl_pompier_serveur_maison.sqf";};

// -------------------------------------------------------------- Initialisation des effets déchets --------------------------------------------------------------------
choix_hauteur_de_flamme_niveau_deux = [0,1] call BIS_fnc_selectRandom;
choix_hauteur_de_flamme_niveau_trois = [2,3] call BIS_fnc_selectRandom;
choix_hauteur_de_flamme_niveau_quatre = [4,5] call BIS_fnc_selectRandom;
choix_hauteur_de_flamme_niveau_cinq = [6,7] call BIS_fnc_selectRandom;
publicvariable "choix_hauteur_de_flamme_niveau_deux";
publicvariable "choix_hauteur_de_flamme_niveau_trois";
publicvariable "choix_hauteur_de_flamme_niveau_quatre";
publicvariable "choix_hauteur_de_flamme_niveau_cinq";


nom_marqueur = "Incendie Maison ! *";
if (choix_hauteur_de_flamme_niveau_deux == 1) then {nom_marqueur = "Incendie Maison ! **";};
if (choix_hauteur_de_flamme_niveau_trois == 3) then {nom_marqueur = "Incendie Maison ! ***";};
if (choix_hauteur_de_flamme_niveau_quatre == 5) then {nom_marqueur = "Incendie Maison ! ****";};
if (choix_hauteur_de_flamme_niveau_cinq == 7) then {nom_marqueur = "Incendie Maison ! *****";};


createMarker ["spawn_du_feu_maison", _pos];
"spawn_du_feu_maison" setMarkerShape "ICON";
"spawn_du_feu_maison" setMarkerColor "Colorred";
"spawn_du_feu_maison" setMarkerSize [1.5,1.5];
"spawn_du_feu_maison" setMarkerType "hd_dot";
"spawn_du_feu_maison" setMarkerText nom_marqueur;

demarrage_incendie_feu_de_maison = 1; publicvariable "demarrage_incendie_feu_de_maison";

if (!isnil "creation_du_feu_maison_sfp") then {waituntil {sleep 1; !alive creation_du_feu_maison_sfp;};};

creation_du_feu_maison_sfp = nil; publicvariable "creation_du_feu_maison_sfp";
quel_objet_prendre_choisit_maisons_sfp = nil; publicvariable "quel_objet_prendre_choisit_maisons_sfp";
choix_hauteur_de_flamme_niveau_deux = nil; publicvariable "choix_hauteur_de_flamme_niveau_deux";
choix_hauteur_de_flamme_niveau_trois = nil; publicvariable "choix_hauteur_de_flamme_niveau_trois";
choix_hauteur_de_flamme_niveau_quatre = nil; publicvariable "choix_hauteur_de_flamme_niveau_quatre";
choix_hauteur_de_flamme_niveau_cinq = nil; publicvariable "choix_hauteur_de_flamme_niveau_cinq";
demarrage_incendie_feu_de_maison = nil; publicvariable "demarrage_incendie_feu_de_maison";

deleteMarker "spawn_du_feu_maison";

demarage_d_une_mission_pompier_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Fin script feu maisons."] call saveToDB;
"DIAG SFP : Mission Pompiers : Fin script feux de maisons." spawn historique_creation_log_sfp;
