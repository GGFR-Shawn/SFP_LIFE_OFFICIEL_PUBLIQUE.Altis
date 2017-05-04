// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

"DIAG SFP : Mission Dir : Recherche condition pour le script routes cassés 1/2." spawn historique_creation_log_sfp;

private ["_temps_maximum_pour_la_creation","_continuer_le_script"];
_continuer_le_script = true;
_selection_un_random = [15000,-15000] call BIS_fnc_selectRandom;
_selection_deux_random = [15000,-15000] call BIS_fnc_selectRandom;
_pos = [(getPosATL reperepourmarchenoir select 0) + (random _selection_un_random),(getPosATL reperepourmarchenoir select 1) + (random _selection_deux_random),0];
_verifierjoueurautour = _pos nearEntities [["man"], 120];
if (count _verifierjoueurautour > 0) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_route_casse_dir\mission_DIR_route_casse_dir.sqf";};

// ----------------------------------------------------------------- Vérification de l'endroit par surface -------------------------------------------------------- //
_surface = surfaceType _pos;
_verificationsurface = ["#GdtAsphalt","#GdtSoil"];
if (!isOnRoad _pos && surfaceType _pos in _verificationsurface) exitwith {sleep 0.3; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_route_casse_dir\mission_DIR_route_casse_dir.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Recherche conditions routes cassees."] call saveToDB;
"DIAG SFP : Mission Dir : Recherche condition pour le script routes cassés 2/2." spawn historique_creation_log_sfp;

// ---------------------------------------------------------------------------- Choix des objets --------------------------------------------------------------------
_quel_objet_prendre_objets_sur_la_route = [
											"Crack_Clutter4"
										  ];
										  
_quel_objet_prendre_objets_sur_la_route_choisit = _quel_objet_prendre_objets_sur_la_route call BIS_fnc_selectRandom;
										  
// ---------------------------------------------------------------------- Création des objets sur la route --------------------------------------------------------------------
_combien_en_creer = 3 + (round (random 40));
for "_i" from 0 to _combien_en_creer do
{
	if (_continuer_le_script) then
	{
		_temps_maximum_pour_la_creation = round (60 * 6);
		
		_creation_de_l_objet = createvehicle [_quel_objet_prendre_objets_sur_la_route_choisit, _pos, [], 0, "CAN_COLLIDE"];
		waituntil {sleep 0.5; speed _creation_de_l_objet < 0.1;};
		_creation_de_l_objet setvariable ["route_hs_dir",true,true];
		
		while {_temps_maximum_pour_la_creation > 0 && (count (nearestObjects [_pos, [_quel_objet_prendre_objets_sur_la_route_choisit],1]) > 0 or !isOnRoad _pos or !(surfaceType _pos in _verificationsurface))} do
		{
			sleep 0.01;
			_random_position_un = [random 15,-random 15] call BIS_fnc_selectRandom;
			_random_position_deux = [random 15,-random 15] call BIS_fnc_selectRandom;
			_random_position_trois = [_random_position_un,_random_position_deux] call BIS_fnc_selectRandom;
			_random_position_quatre = [_random_position_un,_random_position_deux] call BIS_fnc_selectRandom;
			
			_pos = [((position _creation_de_l_objet) select 0) + (_random_position_trois),((position _creation_de_l_objet) select 1) + (_random_position_quatre),0];
			_temps_maximum_pour_la_creation = _temps_maximum_pour_la_creation - 1;
		};	
		if (_temps_maximum_pour_la_creation < 1) then {_continuer_le_script = false;};
	};	
};
if (!_continuer_le_script) exitwith {sleep 0.3; {deletevehicle _x} foreach allmissionobjects _quel_objet_prendre_objets_sur_la_route_choisit; execvm "partie_serveur\sarl_depannage\missions_aleatoires\mission_route_casse_dir\mission_DIR_route_casse_dir.sqf";};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Demarrage script routes cassees."] call saveToDB;
"DIAG SFP : Mission Dir : Démarrage script routes cassees." spawn historique_creation_log_sfp;

route_hs_pour_la_DIR_en_cours = true; sleep 0.045; publicvariable "route_hs_pour_la_DIR_en_cours"; sleep 1;

[[[_pos],"divers\nos_entreprises\sarl_depannage\mission_aleatoire\route_dir_hs\creation_fissure_sur_la_route.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

createMarker ["spawn_route_fissure_sur_la_route_dir", _pos];
"spawn_route_fissure_sur_la_route_dir" setMarkerShape "ICON";
"spawn_route_fissure_sur_la_route_dir" setMarkerColor "Colorred";
"spawn_route_fissure_sur_la_route_dir" setMarkerSize [1.8,1.8];
"spawn_route_fissure_sur_la_route_dir" setMarkerType "hd_dot";
"spawn_route_fissure_sur_la_route_dir" setMarkerText "Route fissurée !";	

_detection_fin_mission_dir = false;
while {!_detection_fin_mission_dir} do
{
	// Endommager voiture si roule trop vite
	_voitures = nearestobjects [_pos,["car"], 22];
	if (count _voitures > 0) then
	{
		_voiture = _voitures select 0;
		if (speed _voiture > 50 && isnil {_voiture getvariable "voiture_sur_nid_de_poule"}) then
		{
			[[_voiture],"SFP_Endommager_Pneus_Nid_De_Poules",nil,false] spawn BIS_fnc_MP;
			_voiture setvariable ["voiture_sur_nid_de_poule",true,false];
		};
	};
	
	_compter_les_objets_sur_la_route_dir = 0;
	{
		if (!isnil {_x getvariable "route_hs_dir"}) then
		{
			_compter_les_objets_sur_la_route_dir = round (_compter_les_objets_sur_la_route_dir + 1);
		};		
		sleep 0.01;
	} foreach allMissionObjects "Crack_Clutter4";
	
	if (_compter_les_objets_sur_la_route_dir < 1) then {_detection_fin_mission_dir = true;};
	
	sleep 1;
};
	
route_hs_pour_la_DIR_en_cours = nil; sleep 0.045; publicvariable "route_hs_pour_la_DIR_en_cours";
	
deleteMarker "spawn_route_fissure_sur_la_route_dir";

demarage_d_une_mission_dir_sfp = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Script DIR", "Historique Script DIR", _heure_du_log, "Fin script route cassees."] call saveToDB;
"DIAG SFP : Mission Dir : Fin script routes cassées." spawn historique_creation_log_sfp;
