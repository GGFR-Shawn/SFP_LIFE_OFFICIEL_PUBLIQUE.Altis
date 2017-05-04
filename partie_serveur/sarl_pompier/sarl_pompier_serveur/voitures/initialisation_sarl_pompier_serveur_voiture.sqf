// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Pompiers : Démarrage script feux de véhicule 1/2." spawn historique_creation_log_sfp;

_selection_un_random = [20000,-20000] call BIS_fnc_selectRandom;
_selection_deux_random = [20000,-20000] call BIS_fnc_selectRandom;
_pos = [(getPosATL reperepourmarchenoir select 0) + (random _selection_un_random),(getPosATL reperepourmarchenoir select 1) + (random _selection_deux_random),0];
_verifierjoueurautour = _pos nearEntities [["man"], 120];
if (count _verifierjoueurautour > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\voitures\initialisation_sarl_pompier_serveur_voiture.sqf";};

// ----------------------------------------------------------------- Vérification de l'endroit par surface -------------------------------------------------------- //
_surface = surfaceType _pos;
_verificationsurface = ["#GdtGrassTall","#GdtGrassShort","#GdtSoil","#GdtAsphalt","#GdtGrassDry","#GdtDirt","#GdtGrassGreen"];
if (!(_surface in _verificationsurface) or surfaceIsWater _pos) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\voitures\initialisation_sarl_pompier_serveur_voiture.sqf";sleep 2;};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Demarrage script feu voiture non joueur."] call saveToDB;
"DIAG SFP : Mission Pompiers : Démarrage script feux de véhicule 2/2." spawn historique_creation_log_sfp;

// -------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quelle_objet_prendre = [ "C_SUV_01_F","B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F",
						  "O_MRAP_02_F","O_MRAP_02_gmg_F","I_MRAP_03_F","I_MRAP_03_gmg_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F",
						  "I_G_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","I_G_Van_01_fuel_F","B_G_Van_01_transport_F","O_G_Van_01_transport_F",
						  "B_G_Van_01_fuel_F","O_G_Van_01_fuel_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F",
						  "B_Truck_01_box_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","O_Truck_02_covered_F","O_Truck_02_transport_F",
						  "I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_ammo_F",
						  "I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F","C_Offroad_01_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_F",
						  "O_G_Offroad_01_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","B_Quadbike_01_F","O_Quadbike_01_F","C_Quadbike_01_F",
						  "I_Quadbike_01_F","I_G_Quadbike_01_F","B_G_Quadbike_01_F","O_G_Quadbike_01_F"
						];
quel_objet_prendre_choisit_voiture = _quelle_objet_prendre call BIS_fnc_selectRandom;
publicvariable "quel_objet_prendre_choisit_voiture";

// --------------------------------------------------------------- Création des objets voiture --------------------------------------------------------------------
creation_de_la_voiture_incendie = createvehicle [quel_objet_prendre_choisit_voiture, _pos, [], 0, "CAN_COLLIDE"];
waituntil {sleep 0.5; speed creation_de_la_voiture_incendie < 0.1;};
creation_de_la_voiture_incendie setvariable ["jesuisenfeu",1,true];
publicvariable "creation_de_la_voiture_incendie";

// ------------------------------------------------------------------------ Dommage voiture ---------------------------------------------------------- //
_queldommage = [0.2,0.3,0.4,0.5,0.6,0.7,0.8];
_okdommagechoisit_un = _queldommage call BIS_fnc_selectRandom;

// -------------------------------------------------------------- Initialisation des effets voiture --------------------------------------------------------------------
_inclinaisonchoix = [48,95,140,190,235,275,320,360];
_inclinaison = _inclinaisonchoix call BIS_fnc_selectRandom;

creation_de_la_voiture_incendie setdamage _okdommagechoisit_un;
creation_de_la_voiture_incendie allowdamage false;
creation_de_la_voiture_incendie setDir random 360;
creation_de_la_voiture_incendie setvariable ["jesuisenfeu",1,true];

if (creation_de_la_voiture_incendie iskindof "car") then {[creation_de_la_voiture_incendie, 0, _inclinaison] call BIS_fnc_setPitchBank;};
[creation_de_la_voiture_incendie, false] execvm "divers\achats_divers_et_vehicules\configuration_style_vehicule.sqf";

createMarker ["spawn_du_feu_voiture", _pos];
"spawn_du_feu_voiture" setMarkerShape "ICON";
"spawn_du_feu_voiture" setMarkerColor "Colorred";
"spawn_du_feu_voiture" setMarkerSize [1.5,1.5];
"spawn_du_feu_voiture" setMarkerType "hd_dot";
"spawn_du_feu_voiture" setMarkerText "Incendie Véhicule !";	

if (!isnil "creation_de_la_voiture_incendie") then {waituntil {sleep 1; !alive creation_de_la_voiture_incendie};};

quel_objet_prendre_choisit_voiture = nil; publicvariable "quel_objet_prendre_choisit_voiture";
creation_de_la_voiture_incendie = nil; publicvariable "creation_de_la_voiture_incendie";

deleteMarker "spawn_du_feu_voiture";

demarage_d_une_mission_pompier_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Fin script feu voiture non joueur."] call saveToDB;
"DIAG SFP : Mission Pompiers : Fin script feux de véhicule." spawn historique_creation_log_sfp;
