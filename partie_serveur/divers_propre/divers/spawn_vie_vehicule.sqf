// ===================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// ===================================================================================================================================================================================================================

// =====================================================================================================================================================================================================================
																					// CHOIX SI VEHICULE DE VIE //
// =====================================================================================================================================================================================================================
waituntil {sleep 1; !isnil "sfp_config_activer_vehicules_de_vie"};

_choix_si_vehicule_de_vie = ["1","2","3","4","5"] call bis_fnc_selectrandom;
if (_choix_si_vehicule_de_vie != "1") exitwith {};
if (!sfp_config_activer_vehicules_de_vie) exitwith {};

"DIAG SFP : Spawn avion de vie : Démarrage du script." spawn historique_creation_log_sfp;

// =====================================================================================================================================================================================================================
																				// TEMPS D'ATTENTE VEHICULE DE VIE //
// =====================================================================================================================================================================================================================
_temps_attente_vehicule_de_vie = round ((30 * 60) + ((random 60) * 60)); // Minimum 30 minutes
for "_i" from 0 to (_temps_attente_vehicule_de_vie) do
{
	sleep 1;
};

// =====================================================================================================================================================================================================================
																						// INITIALISATION //
// =====================================================================================================================================================================================================================
private ["_liste_de_vehicule"];

_liste_de_vehicule = ["I_Heli_light_03_unarmed_F","I_Heli_light_03_F","I_Heli_Transport_02_F","I_Heli_light_03_F","B_Heli_Transport_01_camo_F","I_Heli_Transport_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"];

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Avion De Vie", "Historique Avion De Vie", _heure_du_log, "Lancement avion."] call saveToDB;
"DIAG SFP : Spawn avion de vie : Lancement avion." spawn historique_creation_log_sfp;
// =================================================================================================================================================================

_nombre_de_vehicule = round (1 + (random 10));	
_hauteur_du_vol = 300;
_vitesse = ["NORMAL","FULL"] call bis_fnc_selectrandom;

_position_vehicule_de_vie = false;
while {!(_position_vehicule_de_vie)} do
{
	_pos_un = [10000,-10000] call bis_fnc_selectrandom;
	_pos_deux = [10000,-10000] call bis_fnc_selectrandom;
	
	position_vehicule_de_vie_un = [(getPosATL reperepourmarchenoir select 0) + (random _pos_un),(getPosATL reperepourmarchenoir select 1) + (random _pos_deux),0];

	if (surfaceIsWater position_vehicule_de_vie_un) then 
	{
		_position_vehicule_de_vie = true;
	}; 		
	sleep 0.2;
};

_position_vehicule_de_vie = false;
while {!(_position_vehicule_de_vie)} do
{
	_pos_un = [10000,-10000] call bis_fnc_selectrandom;
	_pos_deux = [10000,-10000] call bis_fnc_selectrandom;
	
	position_vehicule_de_vie_deux = [(getPosATL reperepourmarchenoir select 0) + (random _pos_un),(getPosATL reperepourmarchenoir select 1) + (random _pos_deux),0];

	if (surfaceIsWater position_vehicule_de_vie_deux) then 
	{
		_position_vehicule_de_vie = true;
	}; 		
	sleep 0.2;
};

for "_i" from 0 to _nombre_de_vehicule do
{
	_type_de_vehicule = _liste_de_vehicule call bis_fnc_selectrandom;
	position_vehicule_de_vie_un set [2, _hauteur_du_vol];

	_direction = [position_vehicule_de_vie_un, position_vehicule_de_vie_deux] call BIS_fnc_dirTo;

	_creation_vehicule_de_vie	= [position_vehicule_de_vie_un, _direction, _type_de_vehicule, WEST] call BIS_fnc_spawnVehicle;
	_vehicule 					= _creation_vehicule_de_vie select 0;
	_vehicule_groupe			= _creation_vehicule_de_vie select 2;

	_vehicule disableAi "TARGET";
	_vehicule disableAi "AUTOTARGET";
	_vehicule setCaptive true;
	_vehicule_groupe allowFleeing 0;

	_vehicule flyInHeight _hauteur_du_vol;
	
	_vehicule setvariable ["vehicule_info_parvariable",["Vehicule_de_vie"],true];

	_waypoint = _vehicule_groupe addWaypoint [position_vehicule_de_vie_deux, 0];

	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "CARELESS";
	_waypoint setWaypointCombatMode "BLUE";
	_waypoint setWaypointSpeed _vitesse;

	_waypoint setWaypointStatements 
	[
		"true",
		"private ['_group', '_vehicule']; _group = group this; _vehicule = vehicle this; { deleteVehicle _x } forEach units _group; deleteVehicle _vehicule; deleteGroup _group;"
	];
	
	[_vehicule] spawn
	{
		_vehicule = _this select 0;
		_distance_attente = position_vehicule_de_vie_deux;
		
		waituntil {sleep 1; _vehicule distance _distance_attente < 100 or !alive _vehicule};
		
		deletevehicle _vehicule;
	};
					
	"DIAG SFP : Spawn avion de vie : Avion créé." spawn historique_creation_log_sfp;
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	_format_du_log = format ["Vehicule de type %1 crée de %2 à %3 pour hauteur %4 et vitesse %5",_type_de_vehicule, position_vehicule_de_vie_un, position_vehicule_de_vie_deux, _hauteur_du_vol, _vitesse];
	["Historique Avion De Vie", "Historique Avion De Vie", _heure_du_log, _format_du_log] call saveToDB;
	
	waituntil {sleep 1; _vehicule distance position_vehicule_de_vie_un > 100 or !alive _vehicule};
};
