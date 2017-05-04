// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Pompiers : Démarrage script feux de champs 1/2." spawn historique_creation_log_sfp;

_selection_un_random = [20000,-20000] call BIS_fnc_selectRandom;
_selection_deux_random = [20000,-20000] call BIS_fnc_selectRandom;
_pos = [(getPosATL reperepourmarchenoir select 0) + (random _selection_un_random),(getPosATL reperepourmarchenoir select 1) + (random _selection_deux_random),0];
_verifierjoueurautour = _pos nearEntities [["man"], 120];
if (count _verifierjoueurautour > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_champs\initialisation_sarl_pompier_serveur_feu_de_champs.sqf";};

// --------------------------------------------------------------- Vérification de l'endroit par surface --------------------------------------------------------------------
_surface = surfaceType _pos;
_verificationsurface = ["#GdtGrassTall","#GdtGrassShort","#GdtSoil","#GdtAsphalt","#GdtGrassDry","#GdtDirt","#GdtGrassGreen"];
if (!(_surface in _verificationsurface) or surfaceIsWater _pos) exitwith {sleep 0.3; execvm "partie_serveur\sarl_pompier\sarl_pompier_serveur\feu_de_champs\initialisation_sarl_pompier_serveur_feu_de_champs.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Demarrage script feu de champs."] call saveToDB;
"DIAG SFP : Mission Pompiers : Démarrage script feux de champs 2/2." spawn historique_creation_log_sfp;

// --------------------------------------------------------------- Création des feux de champs --------------------------------------------------------------------
_position_de_depart_feu_de_champs = _pos;
_objet_creation_du_feu_de_champs = "Land_WoodPile_F";
_nombre_d_incendie = round (5 + (random 25));

_echelle_incendie_champs_marker = 0;
if (_nombre_d_incendie > 1) then {_echelle_incendie_champs_marker = 1;};
if (_nombre_d_incendie > 4) then {_echelle_incendie_champs_marker = 2;};
if (_nombre_d_incendie > 7) then {_echelle_incendie_champs_marker = 3;};
if (_nombre_d_incendie > 9) then {_echelle_incendie_champs_marker = 4;};
if (_nombre_d_incendie > 13) then {_echelle_incendie_champs_marker = 5;};
if (_nombre_d_incendie > 15) then {_echelle_incendie_champs_marker = 6;};
if (_nombre_d_incendie > 18) then {_echelle_incendie_champs_marker = 7;};
if (_nombre_d_incendie > 23) then {_echelle_incendie_champs_marker = 8;};
if (_nombre_d_incendie > 27) then {_echelle_incendie_champs_marker = 9;};
if (_nombre_d_incendie >= 30) then {_echelle_incendie_champs_marker = 10;};

while {_nombre_d_incendie > 0} do
{
	_nombre_d_incendie = round (_nombre_d_incendie - 1);
	
	_creation_object_feu_de_champs = createvehicle [_objet_creation_du_feu_de_champs, _pos, [], 0, "CAN_COLLIDE"];
	waituntil {sleep 0.5; speed _creation_object_feu_de_champs < 0.1;};
	_creation_object_feu_de_champs allowdamage false;
	_creation_object_feu_de_champs setDir random 360;
	_creation_object_feu_de_champs setvariable ["jesuisenfeu",1,true];
	
	_choix_de_la_direction_pour_ce_feu = (random 10);
	while {count (nearestObjects [_pos, [_objet_creation_du_feu_de_champs],0.5]) > 0} do
	{
		sleep 0.01;
		_random_position_un = (0.5 + (random _choix_de_la_direction_pour_ce_feu));
		_random_position_deux = (0.5 - (random _choix_de_la_direction_pour_ce_feu));
		_random_position_trois = [_random_position_un,_random_position_deux] call BIS_fnc_selectRandom;
		_random_position_quatre = [_random_position_un,_random_position_deux] call BIS_fnc_selectRandom;
		
		_pos = [(_pos select 0) + (_random_position_trois),(_pos select 1) + (_random_position_quatre),0];
	};
};

createMarker ["spawn_du_feu_de_champs", _position_de_depart_feu_de_champs];
"spawn_du_feu_de_champs" setMarkerShape "ICON";
"spawn_du_feu_de_champs" setMarkerColor "Colorred";
"spawn_du_feu_de_champs" setMarkerSize [1.5,1.5];
"spawn_du_feu_de_champs" setMarkerType "hd_dot";
_nom_du_marker_incendie_de_champs = format ["Incendie Champs Niveau %1/10 !",_echelle_incendie_champs_marker];
"spawn_du_feu_de_champs" setMarkerText _nom_du_marker_incendie_de_champs;	

// Pour avertir joueur incendie et démarré script
creation_des_feux_de_champs = 1; publicvariable "creation_des_feux_de_champs";
position_de_depart_feu_de_champs = _position_de_depart_feu_de_champs; publicvariable "position_de_depart_feu_de_champs";
objet_creation_du_feu_de_champs = _objet_creation_du_feu_de_champs; publicvariable "objet_creation_du_feu_de_champs";

_detection_fin_incendie = false;
while {!_detection_fin_incendie} do
{
	sleep 2;
	
	_compter_les_champs_en_feu = 0;
	{
		if (!isnil {_x getvariable "jesuisenfeu"}) then
		{
			_compter_les_champs_en_feu = round (_compter_les_champs_en_feu + 1);
		};		
	} foreach (nearestObjects [_position_de_depart_feu_de_champs, [_objet_creation_du_feu_de_champs],300]);
	
	if (_compter_les_champs_en_feu < 1) then {_detection_fin_incendie = true;};
};

creation_des_feux_de_champs = nil; publicvariable "creation_des_feux_de_champs";

deleteMarker "spawn_du_feu_de_champs";

demarage_d_une_mission_pompier_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script Pompier", "Historique Script Pompier", _heure_du_log, "Fin script feu de champs."] call saveToDB;
"DIAG SFP : Mission Pompiers : Fin script feux de champs." spawn historique_creation_log_sfp;
