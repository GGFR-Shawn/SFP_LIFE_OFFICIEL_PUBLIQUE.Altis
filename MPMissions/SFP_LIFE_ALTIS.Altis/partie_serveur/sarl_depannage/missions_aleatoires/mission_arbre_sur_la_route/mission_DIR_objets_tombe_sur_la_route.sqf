// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Dir : Lancement script arbres sur la route 1/2." spawn historique_creation_log_sfp;

_selection_un_random = [10000,-10000] call BIS_fnc_selectRandom;
_selection_deux_random = [10000,-10000] call BIS_fnc_selectRandom;
_pos = [(getPosATL reperepourmarchenoir select 0) + (random _selection_un_random),(getPosATL reperepourmarchenoir select 1) + (random _selection_deux_random),0];
_verifierjoueurautour = _pos nearEntities [["man"], 120];
if (count _verifierjoueurautour > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_arbre_sur_la_route\mission_DIR_objets_tombe_sur_la_route.sqf";};

// ----------------------------------------------------------------- Vérification de l'endroit par surface -------------------------------------------------------- //
_surface = surfaceType _pos;
if (!isOnRoad _pos) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_arbre_sur_la_route\mission_DIR_objets_tombe_sur_la_route.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Demarrage script arbres sur la route."] call saveToDB;
"DIAG SFP : Mission Dir : Lancement script arbres sur la route 2/2." spawn historique_creation_log_sfp;

// ---------------------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quel_objet_prendre_objets_sur_la_route = ["Land_Swing_01_F","Land_GarbageContainer_closed_F","Land_SlideCastle_F","Land_BarrelWater_grey_F","Land_Bench_02_F","Land_LifeguardTower_01_F","Land_TablePlastic_01_F","Land_Sunshade_04_F","Land_GarbageBarrel_01_F","Land_GarbageBin_01_F","Land_Carousel_01_F",
										   "Land_Cages_F","Land_Cargo20_light_green_F","Land_Cargo20_grey_F","Land_Cargo20_cyan_F","Land_Cargo20_blue_F","Land_CargoBox_V1_F","Land_Tank_rust_F","Land_Portable_generator_F","Land_WoodenLog_F","Land_WoodenTable_large_F","Land_WoodenTable_small_F","Land_Pallets_stack_F","Land_TinContainer_F","Land_PhoneBooth_02_F",
										   "Land_FieldToilet_F"
										  ];
										  
// ---------------------------------------------------------------------- Création des objets sur la route --------------------------------------------------------------------
_combien_en_creer = 1 + (round (random 4));
for "_i" from 0 to _combien_en_creer do
{
	_selection_un_random = [10,-10] call BIS_fnc_selectRandom;
	_selection_deux_random = [10,-10] call BIS_fnc_selectRandom;
	_pos = [(_pos select 0) + (random _selection_un_random),(_pos select 1) + (random _selection_deux_random),0];

	_creation_de_l_objet = createvehicle [(_quel_objet_prendre_objets_sur_la_route call BIS_fnc_selectRandom), _pos, [], 0, "CAN_COLLIDE"];
	_creation_de_l_objet allowdamage false;
	_creation_de_l_objet setDir random 360;
	waituntil {sleep 0.5; speed _creation_de_l_objet < 0.1;};
	_creation_de_l_objet setvariable ["objet_dir_sur_la_route",true,true];

// ------------------------------------------------------------------------------- Initialisation --------------------------------------------------------------------
	_inclinaisonchoix = [90,180,270];
	_inclinaison = _inclinaisonchoix call BIS_fnc_selectRandom;
	[_creation_de_l_objet, 0, _inclinaison] call BIS_fnc_setPitchBank;
};

objets_sur_la_route_DIR_en_cours = true; sleep 0.045; publicvariable "objets_sur_la_route_DIR_en_cours";

[[[_pos],"divers\nos_entreprises\sarl_depannage\mission_aleatoire\objets_sur_la_route\creation_objets_sur_la_route.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

createMarker ["spawn_objet_sur_la_route_dir", _pos];
"spawn_objet_sur_la_route_dir" setMarkerShape "ICON";
"spawn_objet_sur_la_route_dir" setMarkerColor "Colorred";
"spawn_objet_sur_la_route_dir" setMarkerSize [1.8,1.8];
"spawn_objet_sur_la_route_dir" setMarkerType "hd_dot";
"spawn_objet_sur_la_route_dir" setMarkerText "Objets sur la route !";	

_detection_fin_mission_dir = false;
while {!_detection_fin_mission_dir} do
{
	sleep 1;
	_compter_les_objets_sur_la_route_dir = 0;
	{
		if (!isnil {_x getvariable "objet_dir_sur_la_route"}) then
		{
			_compter_les_objets_sur_la_route_dir = round (_compter_les_objets_sur_la_route_dir + 1);
		};		
	sleep 0.03;
	} foreach (nearestObjects [_pos, [],70]);
	
	if (_compter_les_objets_sur_la_route_dir < 1) then {_detection_fin_mission_dir = true;};
};
	
objets_sur_la_route_DIR_en_cours = nil; sleep 0.045; publicvariable "objets_sur_la_route_DIR_en_cours";
	
deleteMarker "spawn_objet_sur_la_route_dir";

demarage_d_une_mission_dir_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Fin script arbres sur la route."] call saveToDB;
"DIAG SFP : Mission Dir : Fin script arbres sur la route." spawn historique_creation_log_sfp;
