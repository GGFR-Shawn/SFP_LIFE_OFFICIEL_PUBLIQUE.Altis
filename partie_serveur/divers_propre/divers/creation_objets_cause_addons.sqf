// =======================================================================================================================================================================================
							// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
							  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// =======================================================================================================================================================================================
													// INITIALISATION POSITION
// =======================================================================================================================================================================================
// Cause erreur joueur ne pouvant pas se connecter sans launcher !

"DIAG SFP : Création objets addons : Démarrage du script." spawn historique_creation_log_sfp;

_radars = [];
{
	if (getmarkertype _x == "hd_warning" && (markerColor _x == "ColorRed" or markerColor _x == "ColorYellow")) then
	{
		_radars = _radars + [["SpeedRadar1", "000000", getMarkerPos _x, (markerDir _x) + 10]];
	};
} forEach allMapMarkers;

// =======================================================================================================================================================================================
																// CREATIONS LANCEMENT DU SCRIPT
// =======================================================================================================================================================================================
_listes_a_scanner = [_radars];
{
	for "_i" from 0 to (count _x - 1) do
	{
		_le_type = _x select _i select 0;
		_la_position = _x select _i select 2;
		_la_direction = _x select _i select 3;
		
		_creation = createVehicle [_le_type, _la_position, [], 0, "CAN_COLLIDE"];
		_creation setvariable ["proprietaire_de_la_maison",["Appartenance au serveur sfp"],false];
		_creation setdir _la_direction;
		
		if (_le_type == "SpeedRadar1") then {_creation setVariable ["radar_fixe_vitesse_sfp",true,true];};
		sleep 0.01;
	};		
} foreach _listes_a_scanner;

"DIAG SFP : Création objets addons : Fin du script." spawn historique_creation_log_sfp;