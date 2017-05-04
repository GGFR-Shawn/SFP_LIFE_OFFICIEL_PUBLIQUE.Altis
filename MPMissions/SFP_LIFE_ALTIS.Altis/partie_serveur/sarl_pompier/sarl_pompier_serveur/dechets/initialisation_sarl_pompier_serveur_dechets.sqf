// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Pompiers : Démarrage script déchets 1/2." spawn historique_creation_log_sfp;

_selection_un_random = [20000,-20000] call BIS_fnc_selectRandom;
_selection_deux_random = [20000,-20000] call BIS_fnc_selectRandom;
_pos = [(getPosATL reperepourmarchenoir select 0) + (random _selection_un_random),(getPosATL reperepourmarchenoir select 1) + (random _selection_deux_random),0];
_verifierjoueurautour = _pos nearEntities [["man"], 120];
if (count _verifierjoueurautour > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\dechets\initialisation_sarl_pompier_serveur_dechets.sqf";};

// --------------------------------------------------------------- Vérification de l'endroit par surface --------------------------------------------------------------------
_surface = surfaceType _pos;
_verificationsurface = ["#GdtGrassTall","#GdtGrassShort","#GdtSoil","#GdtAsphalt","#GdtGrassDry","#GdtDirt","#GdtGrassGreen"];
if (!(_surface in _verificationsurface) or surfaceIsWater _pos) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\dechets\initialisation_sarl_pompier_serveur_dechets.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Demarrage script feu dechets."] call saveToDB;
"DIAG SFP : Mission Pompiers : Démarrage script déchets 2/2." spawn historique_creation_log_sfp;

// -------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quelle_objet_prendre = ["Land_GarbageContainer_closed_F","Land_GarbageContainer_open_F","Land_BarrelSand_F","Land_Bench_F","Land_CanisterPlastic_F","Land_CratesShabby_F","Land_GarbageBags_F","Land_Tyres_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_GarbagePallet_F","Land_CratesWooden_F","Land_MetalBarrel_F","Land_Pallets_F"];

quel_objet_prendre_choisit_dechets = _quelle_objet_prendre call BIS_fnc_selectRandom;
publicvariable "quel_objet_prendre_choisit_dechets";
creation_des_dechets = createvehicle [quel_objet_prendre_choisit_dechets, _pos, [], 0, "CAN_COLLIDE"];
waituntil {sleep 0.5; speed creation_des_dechets < 0.1;};
publicvariable "creation_des_dechets";
creation_des_dechets allowdamage false;
creation_des_dechets setDir random 360; 
creation_des_dechets setvariable ["jesuisenfeu",1,true];

_choix_du_spawn_d_incendie = [0,0,1,0] call BIS_fnc_selectRandom;
if (_choix_du_spawn_d_incendie == 1) then
{
	quel_objet_prendre_choisit_deux_dechets = _quelle_objet_prendre call BIS_fnc_selectRandom;
	publicvariable "quel_objet_prendre_choisit_deux_dechets";
	
	decider_si_en_flamme_ou_pas_deux_dechets = [0,1] call BIS_fnc_selectRandom;
	publicvariable "decider_si_en_flamme_ou_pas_deux_dechets"; 
	_posdeux = [(_pos select 0) + ((1) + (random 5)) ,(_pos select 1),(_pos select 2)]; 
	creation_des_dechets_deux = createvehicle [quel_objet_prendre_choisit_deux_dechets, _posdeux, [], 0, "CAN_COLLIDE"];
	waituntil {sleep 0.5; speed creation_des_dechets_deux < 0.1;};
	publicvariable "creation_des_dechets_deux";

	creation_des_dechets_deux allowdamage false;
	creation_des_dechets_deux setDir random 360;
	creation_des_dechets_deux setvariable ["jesuisenfeu",1,true];
};

_choix_du_spawn_d_incendie = [0,0,1,0] call BIS_fnc_selectRandom;
if (_choix_du_spawn_d_incendie == 1) then
{
	quel_objet_prendre_choisit_trois_dechets = _quelle_objet_prendre call BIS_fnc_selectRandom;
	publicvariable "quel_objet_prendre_choisit_trois_dechets";

	decider_si_en_flamme_ou_pas_trois_dechets = [0,1] call BIS_fnc_selectRandom;
	publicvariable "decider_si_en_flamme_ou_pas_trois_dechets"; 
	_posdeux = [(_pos select 0) + ((1) + (random 5)) ,(_pos select 1),(_pos select 2)]; 
	creation_des_dechets_trois = createvehicle [quel_objet_prendre_choisit_trois_dechets, _posdeux, [], 0, "CAN_COLLIDE"];
	waituntil {sleep 0.5; speed creation_des_dechets_trois < 0.1;};
	publicvariable "creation_des_dechets_trois";

	creation_des_dechets_trois allowdamage false;
	creation_des_dechets_trois setDir random 360;
	creation_des_dechets_trois setvariable ["jesuisenfeu",1,true];
};

_choix_du_spawn_d_incendie = [0,0,1,0] call BIS_fnc_selectRandom;
if (_choix_du_spawn_d_incendie == 1) then
{
	quel_objet_prendre_choisit_quatre_dechets = _quelle_objet_prendre call BIS_fnc_selectRandom;
	publicvariable "quel_objet_prendre_choisit_quatre_dechets";
	
	decider_si_en_flamme_ou_pas_quatre_dechets = [0,1] call BIS_fnc_selectRandom;
	publicvariable "decider_si_en_flamme_ou_pas_quatre_dechets"; 
	_posdeux = [(_pos select 0) + ((1) + (random 5)) ,(_pos select 1),(_pos select 2)]; 
	creation_des_dechets_quatre = createvehicle [quel_objet_prendre_choisit_quatre_dechets, _posdeux, [], 0, "CAN_COLLIDE"];
	waituntil {sleep 0.5; speed creation_des_dechets_quatre < 0.1;};
	publicvariable "creation_des_dechets_quatre";

	creation_des_dechets_quatre allowdamage false;
	creation_des_dechets_quatre setDir random 360;
	creation_des_dechets_quatre setvariable ["jesuisenfeu",1,true];
};

// --------------------------------------------------------------- Création des objets déchets --------------------------------------------------------------------
createMarker ["spawn_du_feu_dechet", (getPosATL creation_des_dechets)];
"spawn_du_feu_dechet" setMarkerShape "ICON";
"spawn_du_feu_dechet" setMarkerColor "Colorred";
"spawn_du_feu_dechet" setMarkerSize [1.5,1.5];
"spawn_du_feu_dechet" setMarkerType "hd_dot";
"spawn_du_feu_dechet" setMarkerText "Incendie déchets !";	

"DIAG SFP : Mission Pompiers : script déchets attente pompier sur place." spawn historique_creation_log_sfp;

if (!isnil "creation_des_dechets") then {waituntil {sleep 1; !alive creation_des_dechets;};};
if (!isnil "creation_des_dechets_deux") then {waituntil {sleep 1; !alive creation_des_dechets_deux;};};
if (!isnil "creation_des_dechets_trois") then {waituntil {sleep 1; !alive creation_des_dechets_trois;};};
if (!isnil "creation_des_dechets_quatre") then {waituntil {sleep 1; !alive creation_des_dechets_quatre;};};
sleep 4; // Pour eviter que le client n'est plus la valeur creation_des_dechets, sinon lui indiquera NIL

deleteMarker "spawn_du_feu_dechet";

creation_des_dechets = nil; publicvariable "creation_des_dechets";
creation_des_dechets_deux = nil; publicvariable "creation_des_dechets_deux";
creation_des_dechets_trois = nil; publicvariable "creation_des_dechets_trois";
creation_des_dechets_quatre = nil; publicvariable "creation_des_dechets_quatre";

quel_objet_prendre_choisit_dechets = nil; publicvariable "quel_objet_prendre_choisit_dechets";
quel_objet_prendre_choisit_deux_dechets = nil; publicvariable "quel_objet_prendre_choisit_deux_dechets";
quel_objet_prendre_choisit_trois_dechets = nil; publicvariable "quel_objet_prendre_choisit_trois_dechets";
quel_objet_prendre_choisit_quatre_dechets = nil; publicvariable "quel_objet_prendre_choisit_quatre_dechets";

decider_si_en_flamme_ou_pas_deux_dechets = nil; publicvariable "decider_si_en_flamme_ou_pas_deux_dechets";
decider_si_en_flamme_ou_pas_trois_dechets = nil; publicvariable "decider_si_en_flamme_ou_pas_trois_dechets";
decider_si_en_flamme_ou_pas_quatre_dechets = nil; publicvariable "decider_si_en_flamme_ou_pas_quatre_dechets";

demarage_d_une_mission_pompier_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Fin script feu dechets."] call saveToDB;
"DIAG SFP : Mission Pompiers : Fin script déchets." spawn historique_creation_log_sfp;
