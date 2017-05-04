// =======================================================================================================================================================================================
											// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
											  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

waituntil {sleep 1; !isnil "sfp_config_activer_patrouille_de_france"};

// =====================================================================================================================================================================================================================
																		// CHOIX SI PATROUILLE DE FRANCE //
// =====================================================================================================================================================================================================================
if (!sfp_config_activer_patrouille_de_france) exitwith {};
if ((round random 10) != 1) exitwith {};

// =====================================================================================================================================================================================================================
																		// TEMPS D'ATTENTE PATROUILLE //
// =====================================================================================================================================================================================================================
sleep (round ((30 * 60) + ((random 60) * 60))); // Minimum 30 minutes

// =====================================================================================================================================================================================================================
																// AVERTIR TOUS LES JOUEURS PATROUILLE DE FRANCE //
// =====================================================================================================================================================================================================================
[{["Patrouille_De_France", ["La patrouille de france débarque sur Altis ! Bon spectacle.", ""]] call bis_fnc_showNotification;},"BIS_fnc_spawn",true,false] spawn BIS_fnc_MP;

// =================================================================================================================================================================
															// ENREGISTRER INIDB HISTORIQUE //
// =================================================================================================================================================================
_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Patrouille De France", "Historique Patrouille De France", _heure_du_log, "Demarrage de la patrouille de france"] call saveToDB;
"DIAG SFP : Patrouille de france lancée." spawn historique_creation_log_sfp;

// =====================================================================================================================================================================================================================
																							// INITIALISATION //
// =====================================================================================================================================================================================================================
player allowdamage false;
avion_patrouille_de_france_principal = nil;


position_attachement_patrouille_de_france = [[0,0,0],[20,-1,0],[-20,-1,0],[0,-20,0]];				   
fumigene_patrouille_de_france = ["SmokeShellAucun","SmokeShellRed","SmokeShellBlue","SmokeShell"];

nombre_de_representation_patrouille_de_france = round (10 + (random 10));
nombre_de_representation_patrouille_de_france_avertir = nombre_de_representation_patrouille_de_france;
publicvariable "nombre_de_representation_patrouille_de_france";


creer_marker_representation_patrouille_de_france = 
{
	if (isnil "position_depart_patrouille_de_france") exitwith {};
	
	_la_position_marker_patrouille_de_france = position_depart_patrouille_de_france;
	
	le_marqueur_patrouille_de_france = createMarker ["marker_patrouille_de_france", _la_position_marker_patrouille_de_france];
	"marker_patrouille_de_france" setMarkerShape "ICON";
	"marker_patrouille_de_france" setMarkerColor "ColorWhite";
	"marker_patrouille_de_france" setMarkerSize [1.2,1.2];
	"marker_patrouille_de_france" setMarkerType "hd_dot";
	"marker_patrouille_de_france" setMarkerText "Représentation Patrouille De France !";
};

demarrage_avion_patrouille_de_france =
{
	waituntil {!isnil "avion_patrouille_de_france_principal";};
	waituntil {!isnil "avion_groupe_patrouille_de_france";};
	while {alive avion_patrouille_de_france_principal && nombre_de_representation_patrouille_de_france > 0} do
	{
		_random_un = [10000,-10000] call bis_fnc_selectrandom;
		_random_deux = [10000,-10000] call bis_fnc_selectrandom;
		
		position_depart_patrouille_de_france = [(getPosATL reperepourmarchenoir select 0) + (random _random_un), (getPosATL reperepourmarchenoir select 0) + (random _random_deux),200];
		if (!isnil "position_depart_patrouille_de_france" && !surfaceIsWater position_depart_patrouille_de_france) then 
		{
			_vitesse_du_vol_patrouille_de_france = ["FULL","LIMITED","NORMAL"] call bis_fnc_selectrandom;

			_waypoint = avion_groupe_patrouille_de_france addWaypoint [position_depart_patrouille_de_france, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointCombatMode "BLUE";
			_waypoint setWaypointSpeed _vitesse_du_vol_patrouille_de_france;
			_waypoint setWaypointFormation "DIAMOND";
			
			[] call creer_marker_representation_patrouille_de_france;
			
			while {avion_patrouille_de_france_principal distance position_depart_patrouille_de_france > 750 && alive avion_patrouille_de_france_principal} do
			{
				sleep 7;
				
				avion_patrouille_de_france_principal domove position_depart_patrouille_de_france;
			};
			
			deleteWaypoint _waypoint;
			if (!isnil "le_marqueur_patrouille_de_france") then {deletemarker "marker_patrouille_de_france"; le_marqueur_patrouille_de_france = nil;};
			nombre_de_representation_patrouille_de_france = round (nombre_de_representation_patrouille_de_france - 1);
		};
	};

	// Fin
	_waypoint = avion_groupe_patrouille_de_france addWaypoint [[0,0,0], 0];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "CARELESS";
	_waypoint setWaypointCombatMode "BLUE";
	_waypoint setWaypointSpeed "FULL";
	_waypoint setWaypointFormation "DIAMOND";

	waituntil {sleep 0.2; avion_patrouille_de_france_principal distance [0,0,0] < 1000 or !alive avion_patrouille_de_france_principal};
	
	{
		if (!isnil {_x getvariable "avion_patrouille_de_france"}) then
		{
			{
				deletevehicle _x;
			} foreach (crew _x);
			
			deletevehicle _x;
		};
	sleep 0.5;
	} foreach vehicles;
	
	// =================================================================================================================================================================
																// ENREGISTRER INIDB HISTORIQUE //
	// =================================================================================================================================================================
	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Patrouille De France", "Historique Patrouille De France", _heure_du_log, "Fin de la patrouille de france"] call saveToDB;

	if (!isnil "le_marqueur_patrouille_de_france") then {deletemarker "marker_patrouille_de_france"; le_marqueur_patrouille_de_france = nil;};
	if (isnil "fin_patrouille_de_france") exitwith {};
};

// =====================================================================================================================================================================================================================
																	// CREATION DES AVIONS PATROUILLE DE FRANCE //
// ===================================================================================================================================================================================================================== 
for "_i" from 0 to round (4 - 1) do
{
	private ["_position_fin_patrouille_de_france", "_hauteur_du_vol_patrouille_de_france", "_type_de_vehicule_patrouille_de_france", "_cote_side_vehicule_patrouille_de_france"];

	position_depart_patrouille_de_france = [(getPosATL reperepourmarchenoir select 0) + (random 10000), (getPosATL reperepourmarchenoir select 0) + (random 10000),300];
	_position_fin_patrouille_de_france = [0,0,0];
	_hauteur_du_vol_patrouille_de_france = 400;
	_type_de_vehicule_patrouille_de_france = "O_Plane_CAS_02_F";
	_cote_side_vehicule_patrouille_de_france = CIVILIAN;

	position_depart_patrouille_de_france set [2, _hauteur_du_vol_patrouille_de_france];

	_direction_patrouille_de_france = [position_depart_patrouille_de_france, _position_fin_patrouille_de_france] call BIS_fnc_dirTo;

	_vehicleContainer_patrouille_de_france	= [position_depart_patrouille_de_france, _direction_patrouille_de_france, _type_de_vehicule_patrouille_de_france, _cote_side_vehicule_patrouille_de_france] call BIS_fnc_spawnVehicle;
	_vehicle_patrouille_de_france 		= _vehicleContainer_patrouille_de_france select 0;
	_vehicleGroup_patrouille_de_france		= _vehicleContainer_patrouille_de_france select 2;
	
	if(isnil "avion_groupe_patrouille_de_france") then {avion_groupe_patrouille_de_france = _vehicleGroup_patrouille_de_france;};
	_vehicle_patrouille_de_france disableAi "TARGET";
	_vehicle_patrouille_de_france disableAi "AUTOTARGET";
	_vehicle_patrouille_de_france setCaptive true;
	_vehicleGroup_patrouille_de_france allowFleeing 0;
	_vehicle_patrouille_de_france setvariable ["avion_patrouille_de_france",1,false];
	_vehicle_patrouille_de_france setvariable ["vehicule_info_parvariable",["[SFP] Maxou"],true];

	if (!isnil "avion_patrouille_de_france_principal") then 
	{
		_vehicle_patrouille_de_france attachto [avion_patrouille_de_france_principal, position_attachement_patrouille_de_france select _i];
	};
	
	// Creer Fumigène 
	[_vehicle_patrouille_de_france,_i] spawn 
	{
		if (!isnil "avion_patrouille_de_france_principal") then
		{
			_vehicle_patrouille_de_france = _this select 0;
			_quel_avion_patrouille_de_france = _this select 1;;
			while {alive _vehicle_patrouille_de_france} do
			{				
				sleep 23;
				
				_smoke = (fumigene_patrouille_de_france select _quel_avion_patrouille_de_france) createVehicle [(getPosATL _vehicle_patrouille_de_france select 0),(getPosATL _vehicle_patrouille_de_france select 1) - (1), 10];
				_smoke attachto [_vehicle_patrouille_de_france, position_attachement_patrouille_de_france select _quel_avion_patrouille_de_france];
				
				_vehicle_patrouille_de_france setdamage 0;
				_vehicle_patrouille_de_france setfuel 1;
			};
		};
	};
	
	if (isnil "avion_patrouille_de_france_principal") then 
	{
		avion_patrouille_de_france_principal = _vehicle_patrouille_de_france;
		[_hauteur_du_vol_patrouille_de_france] spawn 
		{
			// for [{_a = 2},{_a > 0},{_a = _a - 1}] do 
			// {
				// sleep 2; 
				// avion_patrouille_de_france_principal setvelocity [-200,0,1600]; 
			// };

			while {alive avion_patrouille_de_france_principal} do
			{
				sleep 3;
				if ((getPosATL avion_patrouille_de_france_principal select 2) > (_this select 0)) then
				{
					avion_patrouille_de_france_principal flyInHeight (_this select 0);
				};
			};
		};
	};
};

// =====================================================================================================================================================================================================================
																			// LANCEMENT PATROUILLE DE FRANCE //
// ===================================================================================================================================================================================================================== 
sleep 2; 
[] call demarrage_avion_patrouille_de_france;
