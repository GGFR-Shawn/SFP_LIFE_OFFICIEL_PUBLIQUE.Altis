// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


waituntil {sleep 1; !isnil "sfp_config_activer_simulation_grue_maison_construction"};
if (!sfp_config_activer_simulation_grue_maison_construction) exitwith {};

sleep 5;

// Temps pour terminer ce script pour eviter boucle interminable
[] spawn
{
	_temps_max_pour_faire = 30; // Secondes
	for "_i" from 0 to _temps_max_pour_faire do {sleep 1;};
	fin_destruction_des_maisons = true;

	_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
	["Historique Destruction Maison", "Historique Destruction Maison", _heure_du_log, "Script arrete automatiquement."] call saveToDB;
	"DIAG SFP : Destruction maisons : Script arrete automatiquement." spawn historique_creation_log_sfp;
};

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Destruction Maison", "Historique Destruction Maison", _heure_du_log, "Démarrage du script."] call saveToDB;
"DIAG SFP : Destruction maisons : Démarrage du script." spawn historique_creation_log_sfp;

private ["_pos","_autorisation_destruction"];
_listes_des_markers = [];
{_listes_des_markers pushback (markerPos _x)} foreach allMapMarkers;

_maison_a_supprimer = round (random 300);
_rayon_max = 1500;

while {_maison_a_supprimer > 0 && isnil "fin_destruction_des_maisons"} do
{
	_selection_un_random = [_rayon_max,-_rayon_max] call BIS_fnc_selectRandom;
	_selection_deux_random = [_rayon_max,-_rayon_max] call BIS_fnc_selectRandom;
	_selection_endroit_a_scanner = [Alikampos, Kavala, Neochori, Charkia, Tanouka] call bis_fnc_selectrandom;
	_pos = [(getPosATL _selection_endroit_a_scanner select 0) + (random _selection_un_random),(getPosATL _selection_endroit_a_scanner select 1) + (random _selection_deux_random),0];
	
	_listes_des_maison = nearestObjects [_pos, ["House"], 40];
	for "_i" from 0 to (count _listes_des_maison - 1) do
	{
		if (round random 12 == 3) then // Pour savoir si la détruire ou pas
		{
			_autorisation_destruction = true;
			{
				if ((_listes_des_maison select _i) distance _x < 10 && isnil {(_listes_des_maison select _i) getvariable "proprietaire_de_la_maison"}) then
				{
					_autorisation_destruction = false;
				};
			} foreach _listes_des_markers;
				
			if (typeof (_listes_des_maison select _i) == "Batiment_Gendarmerie_SFP") then
			{
				_autorisation_destruction = false;
			};
			
			if (_autorisation_destruction) then
			{
				_position = getpos (_listes_des_maison select _i);
				
				(_listes_des_maison select _i) setdamage 1;
				
				{deleteVehicle _x; sleep 0.1;} foreach (allMissionObjects "Ruins");
				
				if (count (nearestObjects [_pos, ["House"], 28]) < 1 && round (random 1) == 1) then
				{
					_grue = createVehicle ["Land_Crane_F", [_position select 0, _position select 1, 0], [], 0, "CAN_COLLIDE"];
					_grue enableSimulationGlobal false;
					[_grue, 0, 0] call BIS_fnc_setPitchBank;
				};
				
				_maison_a_supprimer = round (_maison_a_supprimer - 1);
			};
		};
	};
};

fin_destruction_des_maisons = nil;

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
["Historique Destruction Maison", "Historique Destruction Maison", _heure_du_log, "Fin du script."] call saveToDB;
"DIAG SFP : Destruction maisons : Fin du script." spawn historique_creation_log_sfp;
